-- SQL import file generated by CFEngine using mustache template
-- add user to connection group within guacamole_db using CFE vars from manage/guacamole/database.cf

INSERT INTO guacamole_connection_group_permission
SELECT user_id, connection_group_id, permission
FROM (
         SELECT '{{{vars.guac_add_user_to_connection_group.username}}}' AS username, '{{{vars.guac_add_user_to_connection_group.groupname}}}' AS connection_group_name, 'READ' AS permission
    -- UNION SELECT '{{{vars.guac_add_user_to_connection_group.username}}}' AS username, '{{{vars.guac_add_user_to_connection_group.groupname}}}' AS connection_group_name, 'UPDATE' AS permission
    -- UNION SELECT '{{{vars.guac_add_user_to_connection_group.username}}}' AS username, '{{{vars.guac_add_user_to_connection_group.groupname}}}' AS connection_group_name, 'ADMINISTER' AS permission
    -- UNION SELECT '{{{vars.guac_add_user_to_connection_group.username}}}' AS username, '{{{vars.guac_add_user_to_connection_group.groupname}}}' AS connection_group_name, 'DELETE' AS permission
) permissions
JOIN guacamole_user ON permissions.username = guacamole_user.username
JOIN guacamole_connection_group ON permissions.connection_group_name = guacamole_connection_group.connection_group_name;
