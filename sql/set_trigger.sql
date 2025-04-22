SELECT
    'CREATE TRIGGER before_update BEFORE UPDATE ON '
    || tablename || ' '
    || 'FOR EACH ROW EXECUTE FUNCTION set_updated_time();'
FROM (
    SELECT
        table_name AS tablename
    FROM
        information_schema.tables
    WHERE column_name = 'updated_time'
        AND table_schema = 'public'
    GROUP BY table_name;
) AS tables;

-- ex)
-- CREATE TRIGGER before_update BEFORE UPDATE ON users FOR EACH ROW EXECUTE FUNCTION set_updated_time();
