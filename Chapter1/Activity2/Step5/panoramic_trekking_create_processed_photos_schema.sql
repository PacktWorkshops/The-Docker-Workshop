-- ######################################################################## --
-- PostgreSQL Panoramic Trekking (PT) web-app 'panoramic_trekking' database --
-- 'pt_processed_photos' schema object's creation (i.e. DDL) script.        --
-- ######################################################################## --

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

CREATE SCHEMA pt_photos_processed;


ALTER SCHEMA pt_photos_processed OWNER TO postgres;


CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;



COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;


CREATE TABLE pt_photos_processed.photos (
 id bigint NOT NULL,
 date_photo_was_taken date NOT NULL,
 image_original bytea NOT NULL,
 description character varying(2000) NOT NULL,
    owner_user_id bigint NOT NULL,
    photo_type character varying(10) NOT NULL,
    image_cropped_standard bytea NOT NULL,
    image_cropped_thumbnail bytea NOT NULL,
    date_time_created timestamp without time zone NOT NULL,
    date_time_updated timestamp without time zone
);


ALTER TABLE pt_photos_processed.photos OWNER TO postgres;


CREATE SEQUENCE pt_photos_processed.photos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pt_photos_processed.photos_id_seq OWNER TO postgres;


ALTER SEQUENCE pt_photos_processed.photos_id_seq OWNED BY pt_photos_processed.photos.id;


CREATE TABLE pt_photos_processed.photos_tag (
    id bigint NOT NULL,
    photo_id bigint NOT NULL,
    tag_id bigint NOT NULL,
    date_time_created timestamp without time zone NOT NULL,
    date_time_updated timestamp without time zone NOT NULL
);


ALTER TABLE pt_photos_processed.photos_tag OWNER TO postgres;

CREATE SEQUENCE pt_photos_processed.photos_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pt_photos_processed.photos_tag_id_seq OWNER TO postgres;

ALTER SEQUENCE pt_photos_processed.photos_tag_id_seq OWNED BY pt_photos_processed.photos_tag.id;


CREATE TABLE pt_photos_processed.tag (
    id bigint NOT NULL,
    owner_user_id bigint NOT NULL,
    tag_word character varying(45) NOT NULL,
    date_time_created timestamp without time zone NOT NULL,
    date_time_updated timestamp without time zone NOT NULL
);


ALTER TABLE pt_photos_processed.tag OWNER TO postgres;


CREATE SEQUENCE pt_photos_processed.tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pt_photos_processed.tag_id_seq OWNER TO postgres;


ALTER SEQUENCE pt_photos_processed.tag_id_seq OWNED BY pt_photos_processed.tag.id;


ALTER TABLE ONLY pt_photos_processed.photos ALTER COLUMN id SET DEFAULT nextval('pt_photos_processed.photos_id_seq'::regclass);


ALTER TABLE ONLY pt_photos_processed.photos_tag ALTER COLUMN id SET DEFAULT nextval('pt_photos_processed.photos_tag_id_seq'::regclass);


ALTER TABLE ONLY pt_photos_processed.tag ALTER COLUMN id SET DEFAULT nextval('pt_photos_processed.tag_id_seq'::regclass);


COPY pt_photos_processed.photos (id, date_photo_was_taken, image_original, description, owner_user_id, photo_type, image_cropped_standard, image_cropped_thumbnail, date_time_created, date_time_updated) FROM stdin;
\.


COPY pt_photos_processed.photos_tag (id, photo_id, tag_id, date_time_created, date_time_updated) FROM stdin;
\.


COPY pt_photos_processed.tag (id, owner_user_id, tag_word, date_time_created, date_time_updated) FROM stdin;
\.


SELECT pg_catalog.setval('pt_photos_processed.photos_id_seq', 1, false);


SELECT pg_catalog.setval('pt_photos_processed.photos_tag_id_seq', 1, false);


SELECT pg_catalog.setval('pt_photos_processed.tag_id_seq', 1, false);


ALTER TABLE ONLY pt_photos_processed.photos
    ADD CONSTRAINT photos_pkey PRIMARY KEY (id);


ALTER TABLE ONLY pt_photos_processed.photos_tag
    ADD CONSTRAINT photos_tag_pkey PRIMARY KEY (id);



ALTER TABLE ONLY pt_photos_processed.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (id);


ALTER TABLE pt_photos_processed.photos_tag ADD CONSTRAINT photos_fk FOREIGN KEY (photo_id) pt_photos_processed.REFERENCES photos(id);

ALTER TABLE pt_photos_processed.photos_tag ADD CONSTRAINT tag_fk FOREIGN KEY (tag_id) pt_photos_processed.REFERENCES tag(id);

