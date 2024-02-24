--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Debian 16.2-1.pgdg120+2)
-- Dumped by pg_dump version 16.2 (Debian 16.2-1.pgdg120+2)

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
-- Name: event_publication; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.event_publication (
    id uuid NOT NULL,
    completion_date timestamp(6) with time zone,
    event_type character varying(255),
    listener_id character varying(255),
    publication_date timestamp(6) with time zone,
    serialized_event character varying(255)
);


ALTER TABLE public.event_publication OWNER TO myuser;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.roles OWNER TO myuser;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO myuser;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myuser
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.users (
    id uuid NOT NULL,
    city character varying(255),
    club character varying(255),
    date_of_birth timestamp(6) without time zone,
    email character varying(255),
    father_name character varying(255),
    inn character varying(255),
    is_sponsor boolean,
    name character varying(255),
    ogrn character varying(255),
    password character varying(255),
    second_name character varying(255),
    sponsor_adress character varying(255),
    username character varying(255),
    role_id bigint
);


ALTER TABLE public.users OWNER TO myuser;

--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Data for Name: event_publication; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.event_publication (id, completion_date, event_type, listener_id, publication_date, serialized_event) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.roles (id, name) FROM stdin;
1	User
2	Admin
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.users (id, city, club, date_of_birth, email, father_name, inn, is_sponsor, name, ogrn, password, second_name, sponsor_adress, username, role_id) FROM stdin;
96e78bbd-1b7c-49d6-80a6-4b307d8b692b	Владивосток	admin_club	1970-01-01 00:00:00	good@gmail.com	Админович	\N	f	Админ	\N	$2a$10$xLBDkLf4m.GhN72nUkUkCea0e5TjHV8.zlxmPjKBRRhoJ0hrVt60u	Админов	\N	admin	2
490048ec-8181-4c44-ac2a-e30d03c3c4c3	Уссурийск	man_club	2000-01-01 00:00:00	good@gmail.com	Святославович	4567890	t	Ярополк	345678	$2a$10$xLBDkLf4m.GhN72nUkUkCea0e5TjHV8.zlxmPjKBRRhoJ0hrVt60u	Рюрикович	g000d_adress	man_1	1
460f602b-cd8a-419e-9281-7f1d77f92824	Артём	man_club	1999-01-01 00:00:00	good@gmail.com	Олегович	\N	f	Денис	\N	$2a$10$xLBDkLf4m.GhN72nUkUkCea0e5TjHV8.zlxmPjKBRRhoJ0hrVt60u	Кириенко	\N	man_4	1
3b7fda1d-5c62-4903-b529-3e0ebbc62a78	Новоникольск	woman_club	1979-01-01 00:00:00	good@gmail.com	Родионовна	456789	t	Маргарита	456789	$2a$10$xLBDkLf4m.GhN72nUkUkCea0e5TjHV8.zlxmPjKBRRhoJ0hrVt60u	Власова	g000d_adress	woman_1	1
10b5b03d-4956-4724-8e76-23f885ffa166	Спасск-Дальний	woman_club	1998-01-01 00:00:00	good@gmail.com	Олеговна	\N	\N	Эвита	\N	$2a$10$xLBDkLf4m.GhN72nUkUkCea0e5TjHV8.zlxmPjKBRRhoJ0hrVt60u	Воронкова	\N	woman_3	1
c1bcf7fa-4c1c-40a8-9c25-44b9690b513b	Михайловка	woman_club	1998-01-01 00:00:00	good@gmail.com	Евгеньевна	\N	f	Валентина	\N	$2a$10$xLBDkLf4m.GhN72nUkUkCea0e5TjHV8.zlxmPjKBRRhoJ0hrVt60u	Турейская	\N	woman_2	1
5951b8cc-3827-41bd-8394-a205001e4ca4	Новошахтинск	man_club	1987-01-01 00:00:00	good@gmail.com	Валерьевич	\N	f	Ярослав	\N	$2a$10$xLBDkLf4m.GhN72nUkUkCea0e5TjHV8.zlxmPjKBRRhoJ0hrVt60u	Винницкий	\N	man_5	1
284d13e9-0aed-4510-b39a-dd3ae0dff8bc	Большой Камень	man_club	1990-01-01 00:00:00	good@gmail.com	Максимович	\N	f	Иван	\N	$2a$10$xLBDkLf4m.GhN72nUkUkCea0e5TjHV8.zlxmPjKBRRhoJ0hrVt60u	Губанов	\N	man_2	1
344efecd-6466-4ccc-84fd-994b84c79a9e	Арсеньев	man_club	2006-01-01 00:00:00	good@gmail.com	Олегович	\N	f	Матвей	\N	$2a$10$xLBDkLf4m.GhN72nUkUkCea0e5TjHV8.zlxmPjKBRRhoJ0hrVt60u	Иванов	\N	man_3	1
\.


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.roles_id_seq', 2, true);


--
-- Name: event_publication event_publication_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.event_publication
    ADD CONSTRAINT event_publication_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users fkp56c1712k691lhsyewcssf40f; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fkp56c1712k691lhsyewcssf40f FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- PostgreSQL database dump complete
--

