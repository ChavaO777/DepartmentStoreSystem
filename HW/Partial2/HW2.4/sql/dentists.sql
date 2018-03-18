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


--
-- Name: get_end_time(timestamp without time zone, integer); Type: FUNCTION; Schema: public; Owner: salvador
--

CREATE FUNCTION public.get_end_time(starting_time timestamp without time zone, appt_param integer) RETURNS TABLE(end_time timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
RETURN query
SELECT starting_time + (INTERVAL '1 min' * appt.minutes) AS end_time FROM appointment_types appt WHERE appt.id = appt_param;
END;
$$;


ALTER FUNCTION public.get_end_time(starting_time timestamp without time zone, appt_param integer) OWNER TO salvador;

--
-- Name: get_end_time_dentist(timestamp without time zone, integer); Type: FUNCTION; Schema: public; Owner: salvador
--

CREATE FUNCTION public.get_end_time_dentist(starting_time timestamp without time zone, dentist_param integer) RETURNS TABLE(end_time timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
RETURN query
SELECT app.date_time + (INTERVAL '1 min' * appt.minutes) AS end_time FROM appointments app, appointment_types appt WHERE app.dentist_id = dentist_param AND app.date_time::date = starting_time::date AND app.appointment_type_id = appt.id;

END;
$$;


ALTER FUNCTION public.get_end_time_dentist(starting_time timestamp without time zone, dentist_param integer) OWNER TO salvador;

--
-- Name: get_end_time_patients(timestamp without time zone, integer); Type: FUNCTION; Schema: public; Owner: salvador
--

CREATE FUNCTION public.get_end_time_patients(starting_time timestamp without time zone, patient_param integer) RETURNS TABLE(end_time timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
RETURN query
SELECT app.date_time + (INTERVAL '1 min' * appt.minutes) AS end_time FROM appointments app, appointment_types appt WHERE app.patient_id = patient_param AND app.date_time::date = starting_time::date AND app.appointment_type_id = appt.id;

END;
$$;


ALTER FUNCTION public.get_end_time_patients(starting_time timestamp without time zone, patient_param integer) OWNER TO salvador;

--
-- Name: get_future_appointments(); Type: FUNCTION; Schema: public; Owner: salvador
--

CREATE FUNCTION public.get_future_appointments() RETURNS TABLE(date_time timestamp without time zone, p_firstname character varying, p_lastname character varying, appt_description character varying, d_firstname character varying, d_lastname character varying, app_rescheduled boolean)
    LANGUAGE plpgsql
    AS $$
BEGIN
RETURN query
SELECT app.date_time, p.first_name, p.last_name, appt.description, d.first_name, d.last_name, app.must_be_rescheduled
FROM appointments app, patients p, appointment_types appt, dentists d
WHERE app.date_time::date > NOW()::date AND app.patient_id = p.id AND app.dentist_id = d.id AND app.appointment_type_id = appt.id;
END;
$$;


ALTER FUNCTION public.get_future_appointments() OWNER TO salvador;

--
-- Name: get_past_appointments(); Type: FUNCTION; Schema: public; Owner: salvador
--

CREATE FUNCTION public.get_past_appointments() RETURNS TABLE(date_time timestamp without time zone, p_firstname character varying, p_lastname character varying, appt_description character varying, d_firstname character varying, d_lastname character varying, app_rescheduled boolean)
    LANGUAGE plpgsql
    AS $$
BEGIN
RETURN query
SELECT app.date_time, p.first_name, p.last_name, appt.description, d.first_name, d.last_name, app.must_be_rescheduled
FROM appointments app, patients p, appointment_types appt, dentists d
WHERE app.date_time::date < NOW()::date AND app.patient_id = p.id AND app.dentist_id = d.id AND app.appointment_type_id = appt.id;
END;
$$;


ALTER FUNCTION public.get_past_appointments() OWNER TO salvador;

--
-- Name: get_start_time(timestamp without time zone); Type: FUNCTION; Schema: public; Owner: salvador
--

CREATE FUNCTION public.get_start_time(datetime_param timestamp without time zone) RETURNS TABLE(start_time timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
RETURN query
SELECT app.date_time FROM appointments app WHERE app.date_time::date = datetime_param::date;
END;
$$;


ALTER FUNCTION public.get_start_time(datetime_param timestamp without time zone) OWNER TO salvador;

--
-- Name: get_start_time_dentist(timestamp without time zone, integer); Type: FUNCTION; Schema: public; Owner: salvador
--

CREATE FUNCTION public.get_start_time_dentist(datetime_param timestamp without time zone, dentist_param integer) RETURNS TABLE(start_time timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
RETURN query
SELECT app.date_time FROM appointments app WHERE app.date_time::date = datetime_param::date AND app.dentist_id = dentist_param;
END;
$$;


ALTER FUNCTION public.get_start_time_dentist(datetime_param timestamp without time zone, dentist_param integer) OWNER TO salvador;

--
-- Name: get_start_time_patient(timestamp without time zone, integer); Type: FUNCTION; Schema: public; Owner: salvador
--

CREATE FUNCTION public.get_start_time_patient(datetime_param timestamp without time zone, patient_param integer) RETURNS TABLE(start_time timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
RETURN query
SELECT app.date_time FROM appointments app WHERE app.date_time::date = datetime_param::date AND app.patient_id = patient_param;
END;
$$;


ALTER FUNCTION public.get_start_time_patient(datetime_param timestamp without time zone, patient_param integer) OWNER TO salvador;

--
-- Name: get_todays_appointments(); Type: FUNCTION; Schema: public; Owner: salvador
--

CREATE FUNCTION public.get_todays_appointments() RETURNS TABLE(date_time timestamp without time zone, p_firstname character varying, p_lastname character varying, appt_description character varying, d_firstname character varying, d_lastname character varying, app_rescheduled boolean)
    LANGUAGE plpgsql
    AS $$
BEGIN
RETURN query
SELECT app.date_time, p.first_name, p.last_name, appt.description, d.first_name, d.last_name, app.must_be_rescheduled
FROM appointments app, patients p, appointment_types appt, dentists d
WHERE app.date_time::date = NOW()::date AND app.patient_id = p.id AND app.dentist_id = d.id AND app.appointment_type_id = appt.id;
END;
$$;


ALTER FUNCTION public.get_todays_appointments() OWNER TO salvador;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: appointment_types; Type: TABLE; Schema: public; Owner: salvador
--

CREATE TABLE public.appointment_types (
    id integer NOT NULL,
    description character varying(30),
    minutes integer,
    price real
);


ALTER TABLE public.appointment_types OWNER TO salvador;

--
-- Name: appointment_types_id_seq; Type: SEQUENCE; Schema: public; Owner: salvador
--

CREATE SEQUENCE public.appointment_types_id_seq
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
    cellphone bigint,
    email character varying(30),
    birthdate date,
    start_date date,
    status boolean
);


ALTER TABLE public.dentists OWNER TO salvador;

--
-- Name: dentists_id_seq; Type: SEQUENCE; Schema: public; Owner: salvador
--

CREATE SEQUENCE public.dentists_id_seq
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
    cellphone bigint
);


ALTER TABLE public.patients OWNER TO salvador;

--
-- Name: patients_id_seq; Type: SEQUENCE; Schema: public; Owner: salvador
--

CREATE SEQUENCE public.patients_id_seq
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

COPY public.appointment_types (id, description, minutes, price) FROM stdin;
1	Operación	130	1600
2	Revisión general	50	900
\.


--
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: salvador
--

COPY public.appointments (id, patient_id, must_be_rescheduled, date_time, created_at, updated_at, appointment_type_id, dentist_id) FROM stdin;
55	6	t	2018-03-17 12:30:00	2018-03-17 00:20:36	2018-03-17 00:20:36	1	1
54	5	t	2018-04-02 13:00:00	\N	2018-03-17 00:29:51	2	0
82	6	f	2018-04-02 12:40:00	2018-03-18 17:34:30	2018-03-18 17:34:30	2	2
\.


--
-- Data for Name: dentists; Type: TABLE DATA; Schema: public; Owner: salvador
--

COPY public.dentists (id, first_name, last_name, cellphone, email, birthdate, start_date, status) FROM stdin;
0	Isabel	Fonz	2225474181	rfonz@dentists.com	1986-08-19	2002-02-03	t
2	Joel	Alvizar	2225733595	jalvizar@dentists.com	1983-06-19	2005-01-30	t
1	Miguel	Ochoa	2225477191	mochoa@dentists.com	1960-12-03	2003-09-16	t
\.


--
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: salvador
--

COPY public.patients (id, first_name, last_name, birthdate, created_at, email, cellphone) FROM stdin;
6	Salvador	Orozco	1994-10-07	2018-03-14 17:45:42	savador@orozco.in	2229104839
5	Aranzza	Abascal	1996-10-12	2018-03-14 17:45:01	salvador@gmail.com	2225618742
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
2	Espejo	Tirden	Espejo redondo para ver el interior de las partes ocultas de la boca y los dientes	70	48	359
1	Equipo de succión	Tirden	Elimina el exceso de saliva producida por el paciente	240	20	128
\.


--
-- Data for Name: purchase_orders; Type: TABLE DATA; Schema: public; Owner: salvador
--

COPY public.purchase_orders (id, product_id, date_time, quantity) FROM stdin;
1	1	2018-03-08 17:05:26.889887	120
2	2	2018-03-08 17:05:34.678023	70
\.


--
-- Name: appointment_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: salvador
--

SELECT pg_catalog.setval('public.appointment_types_id_seq', 2, true);


--
-- Name: appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: salvador
--

SELECT pg_catalog.setval('public.appointments_id_seq', 82, true);


--
-- Name: dentists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: salvador
--

SELECT pg_catalog.setval('public.dentists_id_seq', 1, true);


--
-- Name: patients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: salvador
--

SELECT pg_catalog.setval('public.patients_id_seq', 6, true);


--
-- Name: product_appointment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: salvador
--

SELECT pg_catalog.setval('public.product_appointment_id_seq', 3, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: salvador
--

SELECT pg_catalog.setval('public.products_id_seq', 2, true);


--
-- Name: purchase_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: salvador
--

SELECT pg_catalog.setval('public.purchase_orders_id_seq', 2, true);


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

