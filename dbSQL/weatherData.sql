--
-- PostgreSQL database dump
--

-- Dumped from database version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    region character varying(255),
    country character varying(255) NOT NULL,
    lat numeric(14,2),
    lon numeric(14,2),
    tz_id character varying(255),
    localtime_epoch bigint,
    "localtime" timestamp with time zone,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_id_seq OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- Name: current_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.current_status (
    id integer NOT NULL,
    city_id integer NOT NULL,
    last_updated_epoch bigint,
    last_updated timestamp with time zone,
    temp_c numeric(15,2),
    temp_f numeric(14,2),
    is_day bigint,
    condition jsonb,
    wind_mph numeric(14,2),
    wind_kph numeric(8,2),
    wind_degree numeric(8,2),
    wind_dir character varying(255),
    pressure_mb numeric(8,2),
    pressure_in numeric(14,2),
    precip_mm numeric(14,2),
    precip_in numeric(14,2),
    humidity numeric(8,2),
    cloud numeric(8,2),
    feelslike_c numeric(14,2),
    feelslike_f numeric(14,2),
    vis_km numeric(14,2),
    vis_miles numeric(8,2),
    uv numeric(8,2),
    gust_mph numeric(14,2),
    gust_kph numeric(14,2),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.current_status OWNER TO postgres;

--
-- Name: current_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.current_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.current_status_id_seq OWNER TO postgres;

--
-- Name: current_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.current_status_id_seq OWNED BY public.current_status.id;


--
-- Name: knex_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.knex_migrations (
    id integer NOT NULL,
    name character varying(255),
    batch integer,
    migration_time timestamp with time zone
);


ALTER TABLE public.knex_migrations OWNER TO postgres;

--
-- Name: knex_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.knex_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.knex_migrations_id_seq OWNER TO postgres;

--
-- Name: knex_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.knex_migrations_id_seq OWNED BY public.knex_migrations.id;


--
-- Name: knex_migrations_lock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.knex_migrations_lock (
    index integer NOT NULL,
    is_locked integer
);


ALTER TABLE public.knex_migrations_lock OWNER TO postgres;

--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.knex_migrations_lock_index_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.knex_migrations_lock_index_seq OWNER TO postgres;

--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.knex_migrations_lock_index_seq OWNED BY public.knex_migrations_lock.index;


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: current_status id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_status ALTER COLUMN id SET DEFAULT nextval('public.current_status_id_seq'::regclass);


--
-- Name: knex_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.knex_migrations ALTER COLUMN id SET DEFAULT nextval('public.knex_migrations_id_seq'::regclass);


--
-- Name: knex_migrations_lock index; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.knex_migrations_lock ALTER COLUMN index SET DEFAULT nextval('public.knex_migrations_lock_index_seq'::regclass);


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (id, name, region, country, lat, lon, tz_id, localtime_epoch, "localtime", created_at) FROM stdin;
7	Delhi	Delhi	India	28.67	77.22	Asia/Kolkata	1657045374	2022-07-05 23:52:00+05:30	2022-07-05 23:52:54.749+05:30
8	Kolkata	West Bengal	India	22.57	88.37	Asia/Kolkata	1657045379	2022-07-05 23:52:00+05:30	2022-07-05 23:53:00.052+05:30
9	Gurgaon	Haryana	India	28.47	77.03	Asia/Kolkata	1657045384	2022-07-05 23:53:00+05:30	2022-07-05 23:53:05.432+05:30
10	Lucknow	Uttar Pradesh	India	26.85	80.92	Asia/Kolkata	1657045390	2022-07-05 23:53:00+05:30	2022-07-05 23:53:10.446+05:30
11	Jaipur	Rajasthan	India	26.92	75.82	Asia/Kolkata	1657048687	2022-07-06 00:48:00+05:30	2022-07-05 23:53:19.434+05:30
6	Mumbai	Maharashtra	India	18.98	72.83	Asia/Kolkata	1657048712	2022-07-06 00:48:00+05:30	2022-07-05 23:52:26.263+05:30
12	Jaunpur	Uttar Pradesh	India	25.73	82.68	Asia/Kolkata	1657048795	2022-07-06 00:49:00+05:30	2022-07-06 00:50:49.445+05:30
13	Ayodhya	Uttar Pradesh	India	26.80	82.20	Asia/Kolkata	1657048944	2022-07-06 00:52:00+05:30	2022-07-06 00:52:24.632+05:30
14	Gujrat	Punjab	Pakistan	32.57	74.08	Asia/Karachi	1657048953	2022-07-06 00:22:00+05:30	2022-07-06 00:52:33.438+05:30
15	Rajkot	Gujarat	India	22.30	70.78	Asia/Kolkata	1657048966	2022-07-06 00:52:00+05:30	2022-07-06 00:52:47.062+05:30
\.


--
-- Data for Name: current_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.current_status (id, city_id, last_updated_epoch, last_updated, temp_c, temp_f, is_day, condition, wind_mph, wind_kph, wind_degree, wind_dir, pressure_mb, pressure_in, precip_mm, precip_in, humidity, cloud, feelslike_c, feelslike_f, vis_km, vis_miles, uv, gust_mph, gust_kph, created_at) FROM stdin;
7	7	1657044900	2022-07-05 23:45:00+05:30	33.00	91.40	0	{"code": 1030, "icon": "//cdn.weatherapi.com/weather/64x64/night/143.png", "text": "Mist"}	6.90	11.20	90.00	E	1001.00	29.56	0.00	0.00	71.00	50.00	33.30	91.90	3.50	2.00	1.00	11.20	18.00	2022-07-05 23:52:54.76+05:30
8	8	1657044900	2022-07-05 23:45:00+05:30	29.00	84.20	0	{"code": 1030, "icon": "//cdn.weatherapi.com/weather/64x64/night/143.png", "text": "Mist"}	8.10	13.00	130.00	SE	1000.00	29.53	0.00	0.00	84.00	50.00	33.90	93.10	3.50	2.00	1.00	13.20	21.20	2022-07-05 23:53:00.062+05:30
9	9	1657044900	2022-07-05 23:45:00+05:30	33.00	91.40	0	{"code": 1030, "icon": "//cdn.weatherapi.com/weather/64x64/night/143.png", "text": "Mist"}	6.90	11.20	90.00	E	1001.00	29.56	0.00	0.00	71.00	50.00	33.50	92.40	3.50	2.00	1.00	11.90	19.10	2022-07-05 23:53:05.44+05:30
10	10	1657044900	2022-07-05 23:45:00+05:30	33.00	91.40	0	{"code": 1030, "icon": "//cdn.weatherapi.com/weather/64x64/night/143.png", "text": "Mist"}	5.60	9.00	80.00	E	999.00	29.50	0.00	0.00	80.00	0.00	34.40	94.00	4.00	2.00	1.00	13.90	22.30	2022-07-05 23:53:10.461+05:30
11	11	1657048500	2022-07-06 00:45:00+05:30	32.00	89.60	0	{"code": 1030, "icon": "//cdn.weatherapi.com/weather/64x64/night/143.png", "text": "Mist"}	6.90	11.20	70.00	ENE	1000.00	29.53	0.00	0.00	75.00	75.00	35.70	96.20	3.00	1.00	1.00	11.60	18.70	2022-07-05 23:53:19.442+05:30
6	6	1657048500	2022-07-06 00:45:00+05:30	27.00	80.60	0	{"code": 1243, "icon": "//cdn.weatherapi.com/weather/64x64/night/356.png", "text": "Moderate or heavy rain shower"}	9.40	15.10	220.00	SW	1000.00	29.53	2.80	0.11	100.00	75.00	31.20	88.10	2.50	1.00	1.00	31.30	50.40	2022-07-05 23:52:26.296+05:30
12	12	1657048500	2022-07-06 00:45:00+05:30	33.80	92.80	0	{"code": 1000, "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png", "text": "Clear"}	7.60	12.20	105.00	ESE	999.00	29.49	0.00	0.00	50.00	24.00	38.50	101.30	10.00	6.00	1.00	12.50	20.20	2022-07-06 00:50:49.458+05:30
13	13	1657048500	2022-07-06 00:45:00+05:30	35.00	95.00	0	{"code": 1000, "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png", "text": "Clear"}	8.90	14.40	101.00	ESE	999.00	29.50	0.00	0.00	46.00	16.00	39.80	103.60	10.00	6.00	1.00	13.20	21.20	2022-07-06 00:52:24.645+05:30
14	14	1657048500	2022-07-06 00:15:00+05:30	36.90	98.40	0	{"code": 1240, "icon": "//cdn.weatherapi.com/weather/64x64/night/353.png", "text": "Light rain shower"}	6.30	10.10	118.00	ESE	997.00	29.43	0.30	0.01	42.00	50.00	42.40	108.30	10.00	6.00	1.00	9.80	15.80	2022-07-06 00:52:33.446+05:30
15	15	1657048500	2022-07-06 00:45:00+05:30	26.00	78.80	0	{"code": 1003, "icon": "//cdn.weatherapi.com/weather/64x64/night/116.png", "text": "Partly cloudy"}	6.90	11.20	230.00	SW	997.00	29.44	2.70	0.11	94.00	75.00	29.60	85.30	6.00	3.00	1.00	15.00	24.10	2022-07-06 00:52:47.072+05:30
\.


--
-- Data for Name: knex_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.knex_migrations (id, name, batch, migration_time) FROM stdin;
8	20220703061307_cities.js	1	2022-07-03 13:41:24.477+05:30
9	20220703065129_cityStatus.js	1	2022-07-03 13:41:24.496+05:30
\.


--
-- Data for Name: knex_migrations_lock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.knex_migrations_lock (index, is_locked) FROM stdin;
1	0
\.


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_id_seq', 15, true);


--
-- Name: current_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.current_status_id_seq', 15, true);


--
-- Name: knex_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.knex_migrations_id_seq', 9, true);


--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.knex_migrations_lock_index_seq', 1, true);


--
-- Name: cities cities_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_name_unique UNIQUE (name);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: current_status current_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_status
    ADD CONSTRAINT current_status_pkey PRIMARY KEY (id);


--
-- Name: knex_migrations_lock knex_migrations_lock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.knex_migrations_lock
    ADD CONSTRAINT knex_migrations_lock_pkey PRIMARY KEY (index);


--
-- Name: knex_migrations knex_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.knex_migrations
    ADD CONSTRAINT knex_migrations_pkey PRIMARY KEY (id);


--
-- Name: current_status current_status_city_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_status
    ADD CONSTRAINT current_status_city_id_foreign FOREIGN KEY (city_id) REFERENCES public.cities(id);


--
-- PostgreSQL database dump complete
--

