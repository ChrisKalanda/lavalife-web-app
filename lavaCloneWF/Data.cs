using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;

namespace lavaCloneWF
{
    /// <summary>
    /// Couche d'accès aux données pour le site Lavalife clone.
    /// Utilise les classes Member et MessageModel définies dans Models.cs
    /// </summary>
    public static class Data
    {
        // Connexion à partir de Web.config (FriendbookDb)
        private static SqlConnection GetConnection()
        {
            string cs = ConfigurationManager
                .ConnectionStrings["FriendbookDb"]
                .ConnectionString;

            return new SqlConnection(cs);
        }

        //======================
        //  MEMBERS (UTILISATEURS)
        //======================

        /// <summary>
        /// Crée un nouveau membre et retourne son Id.
        /// </summary>
        public static int CreateMember(Member m)
        {
            using (SqlConnection con = GetConnection())
            using (SqlCommand cmd = new SqlCommand(@"
        INSERT INTO Members
            (Username, PasswordHash, Sex, AgeGroup, GroupName, Reason, Interests, City, CreatedAt)
        VALUES
            (@Username, @Password, @Sex, @AgeGroup, @GroupName, @Reason, @Interests, @City, GETDATE());

        SELECT CAST(SCOPE_IDENTITY() AS INT);", con))
            {
                cmd.Parameters.AddWithValue("@Username", m.Username);
                cmd.Parameters.AddWithValue("@Password", m.PasswordHash);

                cmd.Parameters.AddWithValue("@Sex", (object)m.Sex ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@AgeGroup", (object)m.AgeGroup ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@GroupName", (object)m.GroupName ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@Reason", (object)m.Reason ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@Interests", (object)m.Interests ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@City", (object)m.City ?? DBNull.Value);

                con.Open();
                object result = cmd.ExecuteScalar();
                return Convert.ToInt32(result);
            }
        }



        /// <summary>
        /// Retourne un membre par Id.
        /// </summary>
        public static Member GetMemberById(int id)
        {
            using (SqlConnection con = GetConnection())
            {
                string sql = "SELECT * FROM Members WHERE Id = @id";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@id", id);

                con.Open();
                using (SqlDataReader r = cmd.ExecuteReader())
                {
                    if (r.Read())
                        return MapMember(r);
                }
            }
            return null;
        }

        /// <summary>
        /// Retourne un membre par Username.
        /// </summary>
        public static Member GetMemberByUsername(string username)
        {
            using (SqlConnection con = GetConnection())
            {
                string sql = "SELECT * FROM Members WHERE Username = @u";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@u", username);

                con.Open();
                using (SqlDataReader r = cmd.ExecuteReader())
                {
                    if (r.Read())
                        return MapMember(r);
                }
            }
            return null;
        }

        /// <summary>
        /// Vérifie le login (username + password) et retourne le Member si valide.
        /// </summary>
        public static Member GetMemberByCredentials(string username, string password)
        {
            using (SqlConnection con = GetConnection())
            {
                string sql = @"SELECT * FROM Members
                               WHERE Username=@u AND PasswordHash=@p";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@u", username);
                cmd.Parameters.AddWithValue("@p", password);

                con.Open();
                using (SqlDataReader r = cmd.ExecuteReader())
                {
                    if (r.Read())
                        return MapMember(r);
                }
            }
            return null;
        }

        /// <summary>
        /// Recherche Lavalife : Sex, AgeGroup, GroupName, Reason, City.
        /// </summary>
        public static List<Member> SearchMembers(string sex, string ageGroup, string groupName, string reason, string city)
        {
            List<Member> list = new List<Member>();

            using (SqlConnection con = GetConnection())
            {
                string sql = "SELECT * FROM Members WHERE 1=1";
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;

                if (!string.IsNullOrEmpty(sex))
                {
                    sql += " AND Sex = @s";
                    cmd.Parameters.AddWithValue("@s", sex);
                }

                if (!string.IsNullOrEmpty(ageGroup))
                {
                    sql += " AND AgeGroup = @ag";
                    cmd.Parameters.AddWithValue("@ag", ageGroup);
                }

                if (!string.IsNullOrEmpty(groupName))
                {
                    sql += " AND GroupName = @gn";
                    cmd.Parameters.AddWithValue("@gn", groupName);
                }

                if (!string.IsNullOrEmpty(reason))
                {
                    sql += " AND Reason = @r";
                    cmd.Parameters.AddWithValue("@r", reason);
                }

                if (!string.IsNullOrEmpty(city))
                {
                    // recherche partielle (Montreal, Montréal, etc.)
                    sql += " AND City LIKE '%' + @c + '%'";
                    cmd.Parameters.AddWithValue("@c", city);
                }

                sql += " ORDER BY Username";
                cmd.CommandText = sql;

                con.Open();
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        Member m = new Member();
                        m.Id = (int)dr["Id"];
                        m.Username = dr["Username"] as string;
                        m.Sex = dr["Sex"] as string;
                        m.AgeGroup = dr["AgeGroup"] as string;
                        m.GroupName = dr["GroupName"] as string;
                        m.Reason = dr["Reason"] as string;
                        m.Interests = dr["Interests"] as string;
                        m.City = dr["City"] as string;

                      
                        if (dr.GetSchemaTable().Select("ColumnName = 'CreatedAt'").Length > 0 && dr["CreatedAt"] != DBNull.Value)
                            m.CreatedAt = (DateTime)dr["CreatedAt"];

                        list.Add(m);
                    }
                }
            }

            return list;
        }


        private static Member MapMember(System.Data.SqlClient.SqlDataReader dr)
        {
            Member m = new Member();
            m.Id = (int)dr["Id"];
            m.Username = dr["Username"] as string;
            m.PasswordHash = dr["PasswordHash"] as string;
            m.Sex = dr["Sex"] as string;
            m.AgeGroup = dr["AgeGroup"] as string;
            m.GroupName = dr["GroupName"] as string;
            m.Reason = dr["Reason"] as string;
            m.Interests = dr["Interests"] as string;
            m.City = dr["City"] as string;

            // CreatedAt NON NULL dans la BD → cast direct
            m.CreatedAt = (DateTime)dr["CreatedAt"];

            return m;
        }


        //======================
        //  MESSAGES
        //======================

        public static void SendMessage(int fromId, int toId, string body)
        {
            using (SqlConnection con = GetConnection())
            {
                string sql = @"
INSERT INTO Messages (FromId, ToId, Body, SentAt, IsRead)
VALUES (@f, @t, @b, @date, 0);";

                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@f", fromId);
                cmd.Parameters.AddWithValue("@t", toId);
                cmd.Parameters.AddWithValue("@b", body);
                cmd.Parameters.AddWithValue("@date", DateTime.Now);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public static List<MessageModel> GetInbox(int userId)
        {
            List<MessageModel> list = new List<MessageModel>();

            using (SqlConnection con = GetConnection())
            {
                string sql = @"SELECT * FROM Messages
                               WHERE ToId=@id
                               ORDER BY SentAt DESC";

                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@id", userId);

                con.Open();
                using (SqlDataReader r = cmd.ExecuteReader())
                {
                    while (r.Read())
                        list.Add(MapMessage(r));
                }
            }

            return list;
        }

        public static List<MessageModel> GetOutbox(int userId)
        {
            List<MessageModel> list = new List<MessageModel>();

            using (SqlConnection con = GetConnection())
            {
                string sql = @"SELECT * FROM Messages
                               WHERE FromId=@id
                               ORDER BY SentAt DESC";

                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@id", userId);

                con.Open();
                using (SqlDataReader r = cmd.ExecuteReader())
                {
                    while (r.Read())
                        list.Add(MapMessage(r));
                }
            }

            return list;
        }

        public static void MarkMessageRead(int messageId)
        {
            using (SqlConnection con = GetConnection())
            {
                string sql = @"UPDATE Messages
                               SET IsRead = 1
                               WHERE Id = @id";

                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@id", messageId);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        private static MessageModel MapMessage(SqlDataReader r)
        {
            return new MessageModel
            {
                Id = (int)r["Id"],
                FromId = (int)r["FromId"],
                ToId = (int)r["ToId"],
                Body = r["Body"].ToString(),
                SentAt = (DateTime)r["SentAt"],
                IsRead = (bool)r["IsRead"]
            };
        }

        public static bool UpdateMember(Member m)
        {
            using (SqlConnection con = GetConnection())
            using (SqlCommand cmd = new SqlCommand(@"
        UPDATE Members
        SET
            Sex        = @Sex,
            AgeGroup   = @AgeGroup,
            GroupName  = @GroupName,
            Reason     = @Reason,
            Interests  = @Interests,
            City       = @City
        WHERE Id = @Id;
    ", con))
            {
                cmd.Parameters.AddWithValue("@Sex", (object)m.Sex ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@AgeGroup", (object)m.AgeGroup ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@GroupName", (object)m.GroupName ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@Reason", (object)m.Reason ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@Interests", (object)m.Interests ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@City", (object)m.City ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@Id", m.Id);

                con.Open();
                int rows = cmd.ExecuteNonQuery();
                return rows > 0;   // true si au moins 1 ligne modifiée
            }
        }

        public static void DeleteMessage(int msgId, int userId)
        {
            using (SqlConnection cn = GetConnection())
            using (SqlCommand cmd = new SqlCommand(
                "DELETE FROM Messages WHERE Id = @id AND ToId = @uid", cn))
            {
                cmd.Parameters.AddWithValue("@id", msgId);
                cmd.Parameters.AddWithValue("@uid", userId);

                cn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public static MessageModel GetMessageByIdForUser(int msgId, int userId)
        {
            using (var cn = GetConnection())
            using (var cmd = new System.Data.SqlClient.SqlCommand(@"
        SELECT m.Id, m.FromId, m.ToId, m.Body, m.SentAt, m.IsRead,
               ISNULL(f.Username,'(inconnu)') AS SenderName
        FROM Messages m
        LEFT JOIN Members f ON f.Id = m.FromId
        WHERE m.Id = @id AND m.ToId = @uid
    ", cn))
            {
                cmd.Parameters.AddWithValue("@id", msgId);
                cmd.Parameters.AddWithValue("@uid", userId);

                cn.Open();
                using (var r = cmd.ExecuteReader())
                {
                    if (!r.Read()) return null;

                    return new MessageModel
                    {
                        Id = (int)r["Id"],
                        FromId = (int)r["FromId"],
                        ToId = (int)r["ToId"],
                        Body = r["Body"] as string,
                        SentAt = (DateTime)r["SentAt"],
                        IsRead = r["IsRead"] != DBNull.Value && (bool)r["IsRead"],
                        SenderName = r["SenderName"] as string
                    };
                }
            }
        }


    }

}
    
    
