CREATE OR REPLACE TRIGGER DISABLED_ON_TEMP
BEFORE INSERT OR UPDATE ON TEMP
DISABLE
DECLARE
BEGIN
  NULL;
END;
