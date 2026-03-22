SELECT name, type_desc
FROM sys.indexes
WHERE object_id = OBJECT_ID('Members');

SELECT name, type_desc
FROM sys.indexes
WHERE object_id = OBJECT_ID('Messages');

