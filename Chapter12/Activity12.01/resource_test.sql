CREATE TABLE test_data
(
    random_value NUMERIC NOT NULL,
    row1         NUMERIC NOT NULL,
    row2         NUMERIC NOT NULL
);

INSERT INTO test_data
    SELECT random_value.*,
    gen.* ,
    CEIL(RANDOM()*100)
    FROM GENERATE_SERIES(1, 300) random_value,
    GENERATE_SERIES(1, 900000) gen
    WHERE gen <= random_value * 300;
