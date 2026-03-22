using System;                 

namespace lavaCloneWF
{
    // ---- MEMBRES (UTILISATEURS) ----
    public class Member
    {
        public int Id { get; set; }

        public string Username { get; set; }

        //stockage du mot de passe en clair, soit en hashé,
        // mais on garde le même nom que dans la DB (Password)
        public string PasswordHash { get; set; }

        public string Sex { get; set; }          // M / F / Autre
        public string AgeGroup { get; set; }     // "18-25", etc.
        public string GroupName { get; set; }    // Groupe ethnique
        public string Reason { get; set; }       // Amour, Amitié, etc.
        public string Interests { get; set; }    // Description libre
        public string City { get; set; }         // Ville

        
        public DateTime CreatedAt { get; set; }  // Date de création du profil
    }

    // ---- MESSAGES ----
    public class MessageModel
    {
        public int Id { get; set; }
        public int FromId { get; set; }
        public int ToId { get; set; }
        public string Body { get; set; }
        public DateTime SentAt { get; set; }
        public bool IsRead { get; set; }
        public string SenderName { get; set; }

    }
}
