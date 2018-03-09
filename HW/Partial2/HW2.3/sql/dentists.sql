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
-- Name: appointment_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE appointment_types (
    id integer NOT NULL,
    description character varying(30),
    minutes integer,
    price real
);


ALTER TABLE appointment_types OWNER TO postgres;

--
-- Name: appointment_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE appointment_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE appointment_types_id_seq OWNER TO postgres;

--
-- Name: appointment_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE appointment_types_id_seq OWNED BY appointment_types.id;


--
-- Name: appointments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE appointments (
    id integer NOT NULL,
    patient_id integer,
    must_be_rescheduled boolean,
    date_time timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    appointment_type_id integer,
    dentist_id integer
);


ALTER TABLE appointments OWNER TO postgres;

--
-- Name: appointments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE appointments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE appointments_id_seq OWNER TO postgres;

--
-- Name: appointments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE appointments_id_seq OWNED BY appointments.id;


--
-- Name: dentists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE dentists (
    id integer NOT NULL,
    first_name character varying(30),
    last_name character varying(30),
    cellphone bigint,
    email character varying(30),
    birthdate date,
    start_date date,
    status boolean
);


ALTER TABLE dentists OWNER TO postgres;

--
-- Name: dentists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE dentists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dentists_id_seq OWNER TO postgres;

--
-- Name: dentists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE dentists_id_seq OWNED BY dentists.id;


--
-- Name: patients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE patients (
    id integer NOT NULL,
    first_name character varying(30),
    last_name character varying(30),
    birthdate date,
    created_at timestamp without time zone,
    email character varying(30),
    cellphone bigint
);


ALTER TABLE patients OWNER TO postgres;

--
-- Name: patients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE patients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE patients_id_seq OWNER TO postgres;

--
-- Name: patients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE patients_id_seq OWNED BY patients.id;


--
-- Name: product_appointment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE product_appointment (
    id integer NOT NULL,
    product_id integer,
    appointment_id integer,
    quantity integer
);


ALTER TABLE product_appointment OWNER TO postgres;

--
-- Name: product_appointment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE product_appointment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE product_appointment_id_seq OWNER TO postgres;

--
-- Name: product_appointment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE product_appointment_id_seq OWNED BY product_appointment.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE products (
    id integer NOT NULL,
    name character varying(30),
    brand character varying(30),
    description character varying(100),
    min_req_sku integer,
    sku integer,
    price real
);


ALTER TABLE products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE products_id_seq OWNED BY products.id;


--
-- Name: purchase_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE purchase_orders (
    id integer NOT NULL,
    product_id integer,
    date_time timestamp without time zone,
    quantity integer
);


ALTER TABLE purchase_orders OWNER TO postgres;

--
-- Name: purchase_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE purchase_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE purchase_orders_id_seq OWNER TO postgres;

--
-- Name: purchase_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE purchase_orders_id_seq OWNED BY purchase_orders.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY appointment_types ALTER COLUMN id SET DEFAULT nextval('appointment_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY appointments ALTER COLUMN id SET DEFAULT nextval('appointments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dentists ALTER COLUMN id SET DEFAULT nextval('dentists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY patients ALTER COLUMN id SET DEFAULT nextval('patients_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_appointment ALTER COLUMN id SET DEFAULT nextval('product_appointment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products ALTER COLUMN id SET DEFAULT nextval('products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY purchase_orders ALTER COLUMN id SET DEFAULT nextval('purchase_orders_id_seq'::regclass);


--
-- Data for Name: appointment_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY appointment_types (id, description, minutes, price) FROM stdin;
1	Operación	130	1600
2	Revisión general	50	900
\.


--
-- Name: appointment_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('appointment_types_id_seq', 2, true);


--
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY appointments (id, patient_id, must_be_rescheduled, date_time, created_at, updated_at, appointment_type_id, dentist_id) FROM stdin;
1	1	f	2018-03-21 10:00:00	2018-03-08 16:59:44.547047	\N	1	1
2	2	t	2018-03-10 16:30:00	2018-01-30 13:24:09	2018-03-08 17:01:17.188306	2	2
\.


--
-- Name: appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('appointments_id_seq', 2, true);


--
-- Data for Name: dentists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY dentists (id, first_name, last_name, cellphone, email, birthdate, start_date, status) FROM stdin;
0	Isabel	Fonz	2225474181	rfonz@dentists.com	1986-08-19	2002-02-03	t
2	Joel	Alvizar	2225733595	jalvizar@dentists.com	1983-06-19	2005-01-30	t
1	Miguel	Ochoa	2225477191	mochoa@dentists.com	1960-12-03	2003-09-16	t
\.


--
-- Name: dentists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('dentists_id_seq', 1, true);


--
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY patients (id, first_name, last_name, birthdate, created_at, email, cellphone) FROM stdin;
1	Aranzza	Abascal	1996-10-12	2018-03-08 16:34:52.374792	arabascalf@gmail.com	2225474191
2	Arianna	Abascal	1994-12-09	2018-03-08 16:35:35.499822	ariabascal@gmail.com	2225474797
\.


--
-- Name: patients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('patients_id_seq', 2, true);


--
-- Data for Name: product_appointment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY product_appointment (id, product_id, appointment_id, quantity) FROM stdin;
1	1	2	2
2	2	2	1
3	1	1	2
\.


--
-- Name: product_appointment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('product_appointment_id_seq', 3, true);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY products (id, name, brand, description, min_req_sku, sku, price) FROM stdin;
2	Espejo	Tirden	Espejo redondo para ver el interior de las partes ocultas de la boca y los dientes	70	48	359
1	Equipo de succión	Tirden	Elimina el exceso de saliva producida por el paciente	240	20	128
\.


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('products_id_seq', 2, true);


--
-- Data for Name: purchase_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY purchase_orders (id, product_id, date_time, quantity) FROM stdin;
1	1	2018-03-08 17:05:26.889887	120
2	2	2018-03-08 17:05:34.678023	70
\.


--
-- Name: purchase_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('purchase_orders_id_seq', 2, true);


--
-- Name: appointment_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY appointment_types
    ADD CONSTRAINT appointment_types_pkey PRIMARY KEY (id);


--
-- Name: appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (id);


--
-- Name: dentists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dentists
    ADD CONSTRAINT dentists_pkey PRIMARY KEY (id);


--
-- Name: patients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (id);


--
-- Name: product_appointment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_appointment
    ADD CONSTRAINT product_appointment_pkey PRIMARY KEY (id);


--
-- Name: products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: purchase_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY purchase_orders
    ADD CONSTRAINT purchase_orders_pkey PRIMARY KEY (id);


--
-- Name: appointments_appointment_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY appointments
    ADD CONSTRAINT appointments_appointment_type_id_fkey FOREIGN KEY (appointment_type_id) REFERENCES appointment_types(id);


--
-- Name: appointments_dentist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY appointments
    ADD CONSTRAINT appointments_dentist_id_fkey FOREIGN KEY (dentist_id) REFERENCES dentists(id);


--
-- Name: appointments_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY appointments
    ADD CONSTRAINT appointments_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES patients(id);


--
-- Name: product_appointment_appointment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_appointment
    ADD CONSTRAINT product_appointment_appointment_id_fkey FOREIGN KEY (appointment_id) REFERENCES appointments(id);


--
-- Name: product_appointment_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_appointment
    ADD CONSTRAINT product_appointment_product_id_fkey FOREIGN KEY (product_id) REFERENCES products(id);


--
-- Name: purchase_orders_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY purchase_orders
    ADD CONSTRAINT purchase_orders_product_id_fkey FOREIGN KEY (product_id) REFERENCES products(id);


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

