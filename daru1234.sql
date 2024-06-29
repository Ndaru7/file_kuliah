--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

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
-- Name: groups; Type: TABLE; Schema: public; Owner: u0_a236
--

CREATE TABLE public.groups (
    id integer NOT NULL,
    name character varying(30),
    descr text
);


ALTER TABLE public.groups OWNER TO u0_a236;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: u0_a236
--

CREATE SEQUENCE public.groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.groups_id_seq OWNER TO u0_a236;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: u0_a236
--

ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;


--
-- Name: pages; Type: TABLE; Schema: public; Owner: u0_a236
--

CREATE TABLE public.pages (
    id integer NOT NULL,
    name character varying(50),
    descr text,
    url character varying(255),
    group_id integer
);


ALTER TABLE public.pages OWNER TO u0_a236;

--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: u0_a236
--

CREATE SEQUENCE public.pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pages_id_seq OWNER TO u0_a236;

--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: u0_a236
--

ALTER SEQUENCE public.pages_id_seq OWNED BY public.pages.id;


--
-- Name: user_group_link; Type: TABLE; Schema: public; Owner: u0_a236
--

CREATE TABLE public.user_group_link (
    id integer NOT NULL,
    group_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.user_group_link OWNER TO u0_a236;

--
-- Name: user_group_link_id_seq; Type: SEQUENCE; Schema: public; Owner: u0_a236
--

CREATE SEQUENCE public.user_group_link_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_group_link_id_seq OWNER TO u0_a236;

--
-- Name: user_group_link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: u0_a236
--

ALTER SEQUENCE public.user_group_link_id_seq OWNED BY public.user_group_link.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: u0_a236
--

CREATE TABLE public.users (
    id integer NOT NULL,
    firstname character varying(25),
    lastname character varying(25),
    username character varying(25),
    password character varying(255),
    validationcode character varying(255),
    email character varying(100),
    comments text,
    joined date,
    last_login date,
    active integer
);


ALTER TABLE public.users OWNER TO u0_a236;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: u0_a236
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO u0_a236;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: u0_a236
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: u0_a236
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- Name: pages id; Type: DEFAULT; Schema: public; Owner: u0_a236
--

ALTER TABLE ONLY public.pages ALTER COLUMN id SET DEFAULT nextval('public.pages_id_seq'::regclass);


--
-- Name: user_group_link id; Type: DEFAULT; Schema: public; Owner: u0_a236
--

ALTER TABLE ONLY public.user_group_link ALTER COLUMN id SET DEFAULT nextval('public.user_group_link_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: u0_a236
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: u0_a236
--

COPY public.groups (id, name, descr) FROM stdin;
1	Admin	Mengelola user, group dan page
2	Web GIS Mobile	Mobile Application
3	Web GIS Client	Client mengakses data web GIS
4	Web GIS Editor	Dapat mengedit data web GIS
5	Web GIS Viewer	Melihat dan melakukan pencarian pada data web GIS
\.


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: u0_a236
--

COPY public.pages (id, name, descr, url, group_id) FROM stdin;
1	Administration of CMS	Menambahkan group dan halaman, meng-approve user, menghapus user, group dan halaman	admin.php	1
2	Web GIS Sinfola	Gabungan beberapa tematik pada peta Kesehatan, Sekolah, Infrastruktur, dll	sinfola_client.php	3
3	Rumah Tidak Layak Huni (RTLH)	Pemetaan rumah tidak layak huni	rtlh.php	3
4	Web GIS SMP	Web GIS pemetaan sekolah SMP dan sederajat (tugas MK SIG)	smp.php	3
5	Web GIS Edit	Allows users to edit project constraint and survey data	djbasin_edit.php	4
6	Mobile GIS	Aplikasi mobile untuk survey dan pemetaan (belum siap)	mobile_lecture_57.php	3
7	Web GIS Kesehatan	Skripsi Amelia Wijayanti Informatika Angkatan 2018	medical_client.php	3
8	Web GIS Sekolah	Skripsi Funi Dyah Informatika Angkatan 2018	school_client.php	3
9	Web GIS Kesesuaian Lahan	Web GIS tentang kesesuaian lahan pertanian (belum siap)	agriculture_client.php	3
10	Web GIS UMKM	Belum tersedia	umkm_client.php	3
11	Web GIS Infrastruktur	Web GIS tentang informasi infrastruktur seperti jaringan jalan, jembatan, dll	infrastuktur_client.php	3
12	Dashboard Pendidikan	CRUD Data Pendidikan	pendidikan/pendidikan.php	1
13	Web GIS Sekolah (search by name)	Web GIS sekolah dengan pencarian menggunakan kata kunci nama	school_client_search.php	3
14	Dashboard UMKM	Editor data UMKM	umkm/umkm.php	1
\.


--
-- Data for Name: user_group_link; Type: TABLE DATA; Schema: public; Owner: u0_a236
--

COPY public.user_group_link (id, group_id, user_id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: u0_a236
--

COPY public.users (id, firstname, lastname, username, password, validationcode, email, comments, joined, last_login, active) FROM stdin;
1	daru	prasetiyo	daru1234	12345678	\N	\N	\N	\N	\N	1
\.


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: u0_a236
--

SELECT pg_catalog.setval('public.groups_id_seq', 5, true);


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: u0_a236
--

SELECT pg_catalog.setval('public.pages_id_seq', 14, true);


--
-- Name: user_group_link_id_seq; Type: SEQUENCE SET; Schema: public; Owner: u0_a236
--

SELECT pg_catalog.setval('public.user_group_link_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: u0_a236
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: u0_a236
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: u0_a236
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: user_group_link user_group_link_pkey; Type: CONSTRAINT; Schema: public; Owner: u0_a236
--

ALTER TABLE ONLY public.user_group_link
    ADD CONSTRAINT user_group_link_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

