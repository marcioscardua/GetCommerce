const {updateTrigger} = require('../../../knexfile')

const FUNC_UP = `
CREATE OR REPLACE FUNCTION on_update_timestamp()
RETURNS trigger AS $$
BEGIN 
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ language 'plpgsql';
`
const FUNC_DROP = `DROP FUNCTION on_update_timestamp()`

exports.up = async knex => knex.raw(FUNC_UP)

exports.down = async knex => knex.raw(FUNC_DROP)