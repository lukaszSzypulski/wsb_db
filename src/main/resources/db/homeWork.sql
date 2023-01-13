CREATE OR REPLACE FUNCTION get_room_label(room_number VARCHAR,
                                          building VARCHAR)
    RETURNS VARCHAR AS
$$
BEGIN
    RETURN room_number || ' (' || building || ')';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_room_label_hard(room_number VARCHAR,
                                               building VARCHAR,
                                               is_lab BOOLEAN)
    RETURNS VARCHAR AS
$$
BEGIN
    CASE
        WHEN is_lab = TRUE THEN RETURN room_number || ' (' || building || ')' || ' LAB';
        ELSE
            RETURN room_number || ' (' || building || ')';
        END CASE;
END
$$
    LANGUAGE plpgsql;

SELECT get_room_label(room_number, building)              AS label,
       get_room_label_hard(room_number, building,  is_lab) AS label_hard
FROM room;