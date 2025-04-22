CREATE OR REPLACE FUNCTION set_updated_time() 
RETURNS trigger AS $set_updated_time$
    BEGIN
        NEW.updated_time := current_timestamp::timestamp(0);
        RETURN NEW;
    END;
$set_updated_time$ LANGUAGE plpgsql;
