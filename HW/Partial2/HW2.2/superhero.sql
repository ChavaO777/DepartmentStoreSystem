--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.11
-- Dumped by pg_dump version 9.5.11

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: creators; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE creators (
    id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE creators OWNER TO postgres;

--
-- Name: creators_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE creators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE creators_id_seq OWNER TO postgres;

--
-- Name: creators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE creators_id_seq OWNED BY creators.id;


--
-- Name: superheroes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE superheroes (
    id integer NOT NULL,
    name character varying(30),
    real_name character varying(30),
    editorial character varying(30),
    first_appearance integer
);


ALTER TABLE superheroes OWNER TO postgres;

--
-- Name: superheroes_creators; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE superheroes_creators (
    id integer NOT NULL,
    id_creator integer,
    id_superheroes integer
);


ALTER TABLE superheroes_creators OWNER TO postgres;

--
-- Name: superheroes_creators_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE superheroes_creators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE superheroes_creators_id_seq OWNER TO postgres;

--
-- Name: superheroes_creators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE superheroes_creators_id_seq OWNED BY superheroes_creators.id;


--
-- Name: superheroes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE superheroes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE superheroes_id_seq OWNER TO postgres;

--
-- Name: superheroes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE superheroes_id_seq OWNED BY superheroes.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY creators ALTER COLUMN id SET DEFAULT nextval('creators_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY superheroes ALTER COLUMN id SET DEFAULT nextval('superheroes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY superheroes_creators ALTER COLUMN id SET DEFAULT nextval('superheroes_creators_id_seq'::regclass);


--
-- Data for Name: creators; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY creators (id, name) FROM stdin;
1	Bob Kane
2	Bill Finger
3	Jerry Siegel
4	Joe Shuster
5	Stan Lee
6	Steve Ditko
7	Larry Lieber
8	Don Heck
9	Jack Kirby
10	Joe Simon
11	Gardner Fox
12	Harry Lampert
13	William Moulton Marston
14	Sadie Holloway Marston
15	Martin Nodell
16	Paul Norris
17	Mort Weisinger
18	George Papp
19	Edmond Hamilton
20	Curt Swan
21	Don Rico
22	Len Wein
23	John Romita Sr
24	Herb Trimpe
25	Dave Cockrum
\.


--
-- Name: creators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('creators_id_seq', 25, true);


--
-- Data for Name: superheroes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY superheroes (id, name, real_name, editorial, first_appearance) FROM stdin;
2	Superman	Clark Joseph Kent	DC Comics	1938
1	Batman	Bruce Wayne	DC Comics	1939
3	Spiderman	Peter Benjamin Parker	Marvel Comics	1962
4	Ironman	Anthony Edward Stark	Marvel Comics	1963
5	Captain America	Steven Grant Rogers	Marvel Comics	1941
6	Hulk	Robert Bruce Banner	Marvel Comics	1962
7	Flash	Jay Garrick	DC Comics	1940
8	Wonder woman	Princesa Diana	DC Comics	1941
9	Green lantern	Harold Jordan	DC Comics	1940
10	Thor	Thor Odinson	Marvel Comics	1962
11	Aquaman	Arthur Curry	DC Comics	1941
12	Green arrow	Oliver Jonas	DC Comics	1941
13	Nightwing	Richard John Grayson	DC Comics	1963
14	Black widow	Natasha Romanoff	Marvel Comics	1964
15	Wolverine	James Howlett	Marvel Comics	1974
16	Black panther	T Challa	Marvel Comics	1966
17	Antman	Scott Lang	Marvel Comics	1962
18	Storm	Ororo Iqadi Munroe	Marvel Comics	1975
19	Cyclops	Scott Summers	Marvel Comics	1963
20	Atom	Raymond Palmer	DC Comics	1961
\.


--
-- Data for Name: superheroes_creators; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY superheroes_creators (id, id_creator, id_superheroes) FROM stdin;
1	1	1
2	2	1
3	3	2
4	4	2
5	5	3
6	6	3
7	5	4
8	7	4
9	8	4
10	9	4
11	10	5
12	9	5
13	5	6
14	9	6
15	11	7
16	12	7
17	13	8
18	14	8
19	2	9
20	15	9
21	5	10
22	7	10
23	9	10
24	16	11
25	17	11
26	17	12
27	18	12
28	19	13
29	20	13
30	5	14
31	21	14
32	8	14
33	22	15
34	23	15
35	24	15
36	5	16
37	9	16
38	5	17
39	9	17
40	22	18
41	25	18
42	5	19
43	9	19
44	11	20
\.


--
-- Name: superheroes_creators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('superheroes_creators_id_seq', 44, true);


--
-- Name: superheroes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('superheroes_id_seq', 20, true);


--
-- Name: creators_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY creators
    ADD CONSTRAINT creators_pkey PRIMARY KEY (id);


--
-- Name: superheroes_creators_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY superheroes_creators
    ADD CONSTRAINT superheroes_creators_pkey PRIMARY KEY (id);


--
-- Name: superheroes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY superheroes
    ADD CONSTRAINT superheroes_pkey PRIMARY KEY (id);


--
-- Name: superheroes_creators_id_creator_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY superheroes_creators
    ADD CONSTRAINT superheroes_creators_id_creator_fkey FOREIGN KEY (id_creator) REFERENCES creators(id);


--
-- Name: superheroes_creators_id_superheroes_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY superheroes_creators
    ADD CONSTRAINT superheroes_creators_id_superheroes_fkey FOREIGN KEY (id_superheroes) REFERENCES superheroes(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

