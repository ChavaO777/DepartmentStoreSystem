--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
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


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: appointment_types; Type: TABLE; Schema: public; Owner: salvador
--

CREATE TABLE public.appointment_types (
    id integer NOT NULL,
    description character varying(100)
);


ALTER TABLE public.appointment_types OWNER TO salvador;

--
-- Name: appointment_types_id_seq; Type: SEQUENCE; Schema: public; Owner: salvador
--

CREATE SEQUENCE public.appointment_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appointment_types_id_seq OWNER TO salvador;

--
-- Name: appointment_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: salvador
--

ALTER SEQUENCE public.appointment_types_id_seq OWNED BY public.appointment_types.id;


--
-- Name: appointments; Type: TABLE; Schema: public; Owner: salvador
--

CREATE TABLE public.appointments (
    id integer NOT NULL,
    patient_id integer,
    must_be_rescheduled boolean,
    date_time timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    appointment_type_id integer,
    dentist_id integer
);


ALTER TABLE public.appointments OWNER TO salvador;

--
-- Name: appointments_id_seq; Type: SEQUENCE; Schema: public; Owner: salvador
--

CREATE SEQUENCE public.appointments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appointments_id_seq OWNER TO salvador;

--
-- Name: appointments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: salvador
--

ALTER SEQUENCE public.appointments_id_seq OWNED BY public.appointments.id;


--
-- Name: dentists; Type: TABLE; Schema: public; Owner: salvador
--

CREATE TABLE public.dentists (
    id integer NOT NULL,
    first_name character varying(30),
    last_name character varying(30),
    cellphone integer,
    birthdate date,
    start_date date,
    status boolean
);


ALTER TABLE public.dentists OWNER TO salvador;

--
-- Name: dentists_id_seq; Type: SEQUENCE; Schema: public; Owner: salvador
--

CREATE SEQUENCE public.dentists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dentists_id_seq OWNER TO salvador;

--
-- Name: dentists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: salvador
--

ALTER SEQUENCE public.dentists_id_seq OWNED BY public.dentists.id;


--
-- Name: patients; Type: TABLE; Schema: public; Owner: salvador
--

CREATE TABLE public.patients (
    id integer NOT NULL,
    first_name character varying(30),
    last_name character varying(30),
    birthdate date,
    created_at timestamp without time zone,
    email character varying(30),
    cellphone integer
);


ALTER TABLE public.patients OWNER TO salvador;

--
-- Name: patients_id_seq; Type: SEQUENCE; Schema: public; Owner: salvador
--

CREATE SEQUENCE public.patients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patients_id_seq OWNER TO salvador;

--
-- Name: patients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: salvador
--

ALTER SEQUENCE public.patients_id_seq OWNED BY public.patients.id;


--
-- Name: product_appointment; Type: TABLE; Schema: public; Owner: salvador
--

CREATE TABLE public.product_appointment (
    id integer NOT NULL,
    product_id integer,
    appointment_id integer,
    quantity integer
);


ALTER TABLE public.product_appointment OWNER TO salvador;

--
-- Name: product_appointment_id_seq; Type: SEQUENCE; Schema: public; Owner: salvador
--

CREATE SEQUENCE public.product_appointment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_appointment_id_seq OWNER TO salvador;

--
-- Name: product_appointment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: salvador
--

ALTER SEQUENCE public.product_appointment_id_seq OWNED BY public.product_appointment.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: salvador
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(30),
    brand character varying(30),
    description character varying(100),
    min_req_sku integer,
    sku integer,
    price real
);


ALTER TABLE public.products OWNER TO salvador;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: salvador
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO salvador;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: salvador
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: purchase_orders; Type: TABLE; Schema: public; Owner: salvador
--

CREATE TABLE public.purchase_orders (
    id integer NOT NULL,
    product_id integer,
    date_time timestamp without time zone,
    quantity integer
);


ALTER TABLE public.purchase_orders OWNER TO salvador;

--
-- Name: purchase_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: salvador
--

CREATE SEQUENCE public.purchase_orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.purchase_orders_id_seq OWNER TO salvador;

--
-- Name: purchase_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: salvador
--

ALTER SEQUENCE public.purchase_orders_id_seq OWNED BY public.purchase_orders.id;


--
-- Name: appointment_types id; Type: DEFAULT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public.appointment_types ALTER COLUMN id SET DEFAULT nextval('public.appointment_types_id_seq'::regclass);


--
-- Name: appointments id; Type: DEFAULT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public.appointments ALTER COLUMN id SET DEFAULT nextval('public.appointments_id_seq'::regclass);


--
-- Name: dentists id; Type: DEFAULT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public.dentists ALTER COLUMN id SET DEFAULT nextval('public.dentists_id_seq'::regclass);


--
-- Name: patients id; Type: DEFAULT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public.patients ALTER COLUMN id SET DEFAULT nextval('public.patients_id_seq'::regclass);


--
-- Name: product_appointment id; Type: DEFAULT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public.product_appointment ALTER COLUMN id SET DEFAULT nextval('public.product_appointment_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: purchase_orders id; Type: DEFAULT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public.purchase_orders ALTER COLUMN id SET DEFAULT nextval('public.purchase_orders_id_seq'::regclass);


--
-- Data for Name: appointment_types; Type: TABLE DATA; Schema: public; Owner: salvador
--

COPY public.appointment_types (id, description) FROM stdin;
\.


--
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: salvador
--

COPY public.appointments (id, patient_id, must_be_rescheduled, date_time, created_at, updated_at, appointment_type_id, dentist_id) FROM stdin;
\.


--
-- Data for Name: dentists; Type: TABLE DATA; Schema: public; Owner: salvador
--

COPY public.dentists (id, first_name, last_name, cellphone, birthdate, start_date, status) FROM stdin;
\.


--
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: salvador
--

COPY public.patients (id, first_name, last_name, birthdate, created_at, email, cellphone) FROM stdin;
\.


--
-- Data for Name: product_appointment; Type: TABLE DATA; Schema: public; Owner: salvador
--

COPY public.product_appointment (id, product_id, appointment_id, quantity) FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: salvador
--

COPY public.products (id, name, brand, description, min_req_sku, sku, price) FROM stdin;
\.


--
-- Data for Name: purchase_orders; Type: TABLE DATA; Schema: public; Owner: salvador
--

COPY public.purchase_orders (id, product_id, date_time, quantity) FROM stdin;
\.


--
-- Name: appointment_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: salvador
--

SELECT pg_catalog.setval('public.appointment_types_id_seq', 1, false);


--
-- Name: appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: salvador
--

SELECT pg_catalog.setval('public.appointments_id_seq', 1, false);


--
-- Name: dentists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: salvador
--

SELECT pg_catalog.setval('public.dentists_id_seq', 1, false);


--
-- Name: patients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: salvador
--

SELECT pg_catalog.setval('public.patients_id_seq', 1, false);


--
-- Name: product_appointment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: salvador
--

SELECT pg_catalog.setval('public.product_appointment_id_seq', 1, false);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: salvador
--

SELECT pg_catalog.setval('public.products_id_seq', 1, false);


--
-- Name: purchase_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: salvador
--

SELECT pg_catalog.setval('public.purchase_orders_id_seq', 1, false);


--
-- Name: appointment_types appointment_types_pkey; Type: CONSTRAINT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public.appointment_types
    ADD CONSTRAINT appointment_types_pkey PRIMARY KEY (id);


--
-- Name: appointments appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (id);


--
-- Name: dentists dentists_pkey; Type: CONSTRAINT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public.dentists
    ADD CONSTRAINT dentists_pkey PRIMARY KEY (id);


--
-- Name: patients patients_pkey; Type: CONSTRAINT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (id);


--
-- Name: product_appointment product_appointment_pkey; Type: CONSTRAINT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public.product_appointment
    ADD CONSTRAINT product_appointment_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: purchase_orders purchase_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public.purchase_orders
    ADD CONSTRAINT purchase_orders_pkey PRIMARY KEY (id);


--
-- Name: appointments appointments_appointment_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_appointment_type_id_fkey FOREIGN KEY (appointment_type_id) REFERENCES public.appointment_types(id);


--
-- Name: appointments appointments_dentist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_dentist_id_fkey FOREIGN KEY (dentist_id) REFERENCES public.dentists(id);


--
-- Name: appointments appointments_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patients(id);


--
-- Name: product_appointment product_appointment_appointment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public.product_appointment
    ADD CONSTRAINT product_appointment_appointment_id_fkey FOREIGN KEY (appointment_id) REFERENCES public.appointments(id);


--
-- Name: product_appointment product_appointment_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public.product_appointment
    ADD CONSTRAINT product_appointment_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: purchase_orders purchase_orders_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: salvador
--

ALTER TABLE ONLY public.purchase_orders
    ADD CONSTRAINT purchase_orders_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- PostgreSQL database dump complete
--

