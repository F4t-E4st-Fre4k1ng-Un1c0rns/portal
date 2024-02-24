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
-- Name: article; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.article (
    id uuid NOT NULL,
    event_id uuid NOT NULL,
    title character varying NOT NULL,
    text character varying NOT NULL
);


ALTER TABLE public.article OWNER TO postgres;

--
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.country (
    id uuid NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.country OWNER TO postgres;

--
-- Name: document; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.document (
    id uuid NOT NULL,
    event_id uuid NOT NULL,
    file character varying,
    name character varying NOT NULL
);


ALTER TABLE public.document OWNER TO postgres;

--
-- Name: event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event (
    id uuid NOT NULL,
    title character varying NOT NULL,
    about character varying NOT NULL,
    banner character varying,
    registration_start timestamp with time zone NOT NULL,
    registration_end timestamp with time zone NOT NULL,
    participation_start timestamp with time zone NOT NULL,
    participation_end timestamp with time zone NOT NULL,
    place_id uuid NOT NULL,
    target_group_id uuid NOT NULL,
    author_id uuid NOT NULL,
    sport_type_id uuid NOT NULL
);


ALTER TABLE public.event OWNER TO postgres;

--
-- Name: place; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.place (
    id uuid NOT NULL,
    country_id uuid NOT NULL,
    address character varying NOT NULL
);


ALTER TABLE public.place OWNER TO postgres;

--
-- Name: social_link; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_link (
    id uuid NOT NULL,
    event_id uuid NOT NULL,
    link character varying NOT NULL
);


ALTER TABLE public.social_link OWNER TO postgres;

--
-- Name: sport_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sport_type (
    id uuid NOT NULL,
    name character varying NOT NULL,
    description character varying NOT NULL
);


ALTER TABLE public.sport_type OWNER TO postgres;

--
-- Name: starter_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.starter_item (
    id uuid NOT NULL,
    event_id uuid NOT NULL,
    starter_item character varying NOT NULL
);


ALTER TABLE public.starter_item OWNER TO postgres;

--
-- Name: target_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.target_group (
    id uuid NOT NULL,
    gender character varying NOT NULL,
    minimal_age integer NOT NULL
);


ALTER TABLE public.target_group OWNER TO postgres;

--
-- Name: ticket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ticket (
    id uuid NOT NULL,
    event_id uuid NOT NULL,
    title character varying NOT NULL,
    extra_title character varying NOT NULL,
    price integer,
    max_places integer NOT NULL,
    sport_type_id uuid NOT NULL
);


ALTER TABLE public.ticket OWNER TO postgres;

--
-- Name: ticket_registation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ticket_registation (
    id uuid NOT NULL,
    ticket_id uuid NOT NULL,
    user_id uuid NOT NULL,
    serial_number integer NOT NULL
);


ALTER TABLE public.ticket_registation OWNER TO postgres;

--
-- Data for Name: article; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.article (id, event_id, title, text) FROM stdin;
d2d53cdb-604d-4d4e-aa86-d7ec5fdfe4e2	b37d9fff-680c-4285-a2bf-740c8b8c54b4	Программа	есть
49d80742-0a9e-4bae-98a9-68ba282cf684	b37d9fff-680c-4285-a2bf-740c8b8c54b4	Дистанции	1км, 2км, 3 км
d9ba4da1-cba7-4732-a54f-0b1f0a0f351c	b37d9fff-680c-4285-a2bf-740c8b8c54b4	Этапы	завтрак, обед, борьба за золото
0345cc34-5f65-44f0-9147-288429fbbdfe	b37d9fff-680c-4285-a2bf-740c8b8c54b4	Награждение	наградим
c28306c1-acb1-4f1e-a2a6-d92cdee72374	d8464695-1458-48e8-900d-199c3b2ce510	Программа	ТНТ
8ac8df68-ad35-46a3-b73e-4be203ba768d	d8464695-1458-48e8-900d-199c3b2ce510	Дистанции	1 гора, 2 горы, 3 горы
ece73f9d-5216-4b49-aa82-c22472e715bb	d8464695-1458-48e8-900d-199c3b2ce510	Этапы	только одно восхождение
7c07537f-8797-41a9-ab6d-13567bca79ab	d8464695-1458-48e8-900d-199c3b2ce510	Награждение	если кто-то придёт к финишу, то будет
bca1ef93-ae59-4beb-968f-3c1c05c9c4cd	60f83852-df72-4110-b27e-d1d3b65dcca2	Программа	экскурсия по Уссурийску, потом соревнования
4a93d707-a7ef-457b-b8cc-a54bfa911ae2	60f83852-df72-4110-b27e-d1d3b65dcca2	Дистанции	половина Уссурийска, вокруг Уссурийска
a5cd4645-98e6-463f-bfa8-d604e47f471a	60f83852-df72-4110-b27e-d1d3b65dcca2	Этапы	на этапы поделили
45086fce-6d1e-4c61-b67f-8074210c5790	60f83852-df72-4110-b27e-d1d3b65dcca2	Награждение	обязательно будет
fbfa5c52-3da2-4262-9f0e-bfce856a0876	49a5d35a-e782-4a57-897e-fd8e52bf2ea8	Дистанции	<ul>\n<li>\nЭтап кубка России по триатлону Средняя дистанция – 1,9 км плавание, 90 км велогонка, 21,1 км бег\n</li>\n<li>\nЧемпионат Любителей по триатлону Средняя дистанция – 1,9 км плавание, 90 км велогонка, 21,1 км бег\n</li>\n</ul>
feec0c82-b252-45c2-b711-ed5d87417e1f	49a5d35a-e782-4a57-897e-fd8e52bf2ea8	Программа	<p>09:00 \tОткрытие стартово-финишного городка, начало выдачи стартовых пакетов</p>\n<p>10:00 \tТоржественное открытие "Тутаевского полумарафона "Май.Мир.Молодость."</p>\n<p>10:05 \tСтарт детского забега на 300 м</p>\n<p>10:08 \tСтарт забега безграничных возможностей на 600 м</p>\n<p>10:16 \tСтарт детского забега на 600 м</p>\n<p>10:28 \tРазминка для участников дистанции 3 км</p>\n<p>10:40 \tСтарт дистанции 3 км</p>\n<p>10:43 \tНаграждение победителей забегов на 300м, 600 м, забега безграничных возможностей</p>\n<p>11:05 \tНаграждение победителей дистанции 3 км</p>\n<p>11:17 \tРазминка для участников дистанций 10 км и 21,1 км</p>\n<p>11:30 \tСтарт дистанции 10 км</p>\n<p>11:35 \tСтарт дистанции 21,1 км</p>\n<p>12:20 \tНаграждение победителей дистанции 10 км в абсолютном зачете</p>\n<p>13:10 \tНаграждение победителей дистанции 10 км по категориям</p>\n<p>13:20 \tНаграждение победителей дистанции 21,1 км в абсолютном зачете</p>\n<p>14:15 \tНаграждение победителей дистанции 21,1 км по категориям</p>\n<p>14:45 \tОкончание бегового события</p>
cc118d35-a39c-4aaa-8432-5b39b1c67559	49a5d35a-e782-4a57-897e-fd8e52bf2ea8	Награждение	Атлеты награждаются денежными призами, подарками организаторов и партнеров в соответствии с регламентом соревнований.
5500632c-b80b-40e9-abbf-22711824d88e	bac8e7df-88f5-4da0-bf3e-f26850c132c1	Дистанции	<p>Определяются колличеством кругов по следующему маршруту</p>\n<img src="https://orgeo.ru/files/event/banner_top/32530_o.jpg?t=" alt="No image(" max-width="100%" loading="lazy">
f653679e-ee98-4da9-9d1b-9b30797ea632	49a5d35a-e782-4a57-897e-fd8e52bf2ea8	Схемы дистанции	 <img src="https://rrweb.russiarunning.com/-x-/generalimages/06892590-27e6-495d-ab3a-a125261fb4ef.jpg" loading="lazy" max-width="100%" alt="No image(" >
22051f2e-78bf-4c30-9499-4785790fd7c2	49a5d35a-e782-4a57-897e-fd8e52bf2ea8	Этапы	<h4>Плавательный этап:</h4>\n<p>\nПлавательный этап гонки будет проводиться в акватории Амурского залива. Атлетам необходимо будет преодолеть выбранную дистанцию в чистой морской воде Японского моря.\nГидрокостюмы разрешены.\n</p>\n\n<h4>Велосипедный этап:</h4>\n<p>\nВелоэтап гонки пройдёт по Федеральной трассе от полуострова Де-Фриз в сторону поселка Шмидтовка, с качественным дорожным покрытием и незначительным перепадом высот.\nРазделочные велосипеды разрешены, драфтинг - запрещен.\n</p>\n\n<h4>Беговой этап:</h4>\n<p>\nБеговой этап соревнований пройдет по уникальному низководному мосту, соединяющему полуостров Де-Фриз с районом города Владивостока – Седанка. Впервые этот мост будет открыт для проведения соревнований. Участники средней дистанции преодолеют три круга, протяжённостью 21,1 км. над морской гладью Амурского залива. Перепад высот отсутствует.\n</p>
ac9f1b86-15fb-442c-9ce3-82a61389213e	bac8e7df-88f5-4da0-bf3e-f26850c132c1	Место проведения	<div style="position:relative;overflow:hidden;"><a href="https://yandex.ru/maps/org/russkaya_lyzhnya/44216590496/?utm_medium=mapframe&utm_source=maps" style="color:#eee;font-size:12px;position:absolute;top:0px;">Русская лыжня</a><a href="https://yandex.ru/maps/11409/primorsky-krai/category/sports_base/184107295/?utm_medium=mapframe&utm_source=maps" style="color:#eee;font-size:12px;position:absolute;top:14px;">Спортивная база в Приморском крае</a><iframe src="https://yandex.ru/map-widget/v1/?ll=131.853927%2C43.058075&mode=poi&poi%5Bpoint%5D=131.854937%2C43.057646&poi%5Buri%5D=ymapsbm1%3A%2F%2Forg%3Foid%3D44216590496&z=16.63" width="99%" height="400" loading="lazy" frameborder="1" allowfullscreen="true" style="position:relative;"></iframe></div>
bf68a4b2-22bc-4eab-ad06-4901911214e6	49a5d35a-e782-4a57-897e-fd8e52bf2ea8	Место проведения	<div style="position:relative;overflow:hidden;"><a href="https://yandex.ru/maps/11409/primorsky-krai/?utm_medium=mapframe&utm_source=maps" style="color:#eee;font-size:12px;position:absolute;top:0px;">Приморский край</a><a href="https://yandex.ru/maps/11409/primorsky-krai/house/posyolok_de_friz_32/ZUoHaA5oTkMGWEJuYGJzdnhhbQs=/?ll=131.991428%2C43.274450&utm_medium=mapframe&utm_source=maps&z=15.8" style="color:#eee;font-size:12px;position:absolute;top:14px;">Яндекс Карты</a><iframe src="https://yandex.ru/map-widget/v1/?ll=131.991428%2C43.274450&mode=whatshere&whatshere%5Bpoint%5D=131.987614%2C43.274293&whatshere%5Bzoom%5D=17&z=15.8" width="99%" height="400" frameborder="1" loading="lazy" allowfullscreen="true" style="position:relative;"></iframe></div>
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country (id, name) FROM stdin;
cdac8660-86e0-49c0-9588-d7e63691d93f	Владивосток
913842fe-39a3-4496-be47-270236bdc30a	Russia
\.


--
-- Data for Name: document; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.document (id, event_id, file, name) FROM stdin;
ef6d0467-aa45-4662-a06c-1a40b136e1d3	49a5d35a-e782-4a57-897e-fd8e52bf2ea8	https://russiarunning.com/file/a6f3abbb-6045-468e-a9cc-be3484c1cee2/%D0%9F%D0%BE%D0%BB%D0%BE%D0%B6%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%A7%D0%9F%D0%9A%20%E2%84%96%20767%20%D0%94%D0%B5-%D0%A4%D1%80%D0%B8%D0%B7%202023%20%D0%BF%D0%BE%D0%B4%D0%BF%D0%B8%D1%81%D0%B0%D0%BD.pdf/download	Положение о соревновании
\.


--
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event (id, title, about, banner, registration_start, registration_end, participation_start, participation_end, place_id, target_group_id, author_id, sport_type_id) FROM stdin;
b37d9fff-680c-4285-a2bf-740c8b8c54b4	Зимний рогейн. Первый этап Кубка "Рогейн-ДВ"	это прекрасное мероприятие, в котором ты захочешь поучавстовать	/src/assets/images/tempory-assets/rogey_banner.jpg	2023-05-31 14:00:00+00	2023-06-14 14:00:00+00	2023-06-30 14:00:00+00	2023-07-01 14:00:00+00	dab97643-665e-476b-93be-221b829b4dc1	39515764-58c0-401f-881d-46e976fb141d	8327c2db-770d-4c0a-8cc1-5bcfe9613ac4	2b029a3c-a3f8-4450-afbe-d05194a59ecd
49a5d35a-e782-4a57-897e-fd8e52bf2ea8	Триатлон «Де-Фриз 113». Соревнования среди любителей и профессионалов.	Главное событие по триатлону состоится во Владивостоке, в историческом месте, на полуострове Де-Фриз.\n\nГонка «Де-Фриз 113» уже во второй раз пройдёт по живописным местам пригорода Владивостока. Беговой участок будет проходить по Низководному мосту, который соединяет полуостров Де-Фриз с городом Владивосток.\n\nСпортивное событие проходит при поддержке Министерства физической культуры и спорта, Администрации Приморского края, Федераций триатлона России и Федераций триатлона Приморского края.\n	/src/assets/images/tempory-assets/defize_banner.jpg	2023-05-31 14:00:00+00	2023-06-14 14:00:00+00	2023-06-30 14:00:00+00	2023-07-01 14:00:00+00	7915f50d-f387-4c85-bc7f-279967b93f35	39515764-58c0-401f-881d-46e976fb141d	76edff08-7def-402d-bca8-0ec70ab6d80b	2b029a3c-a3f8-4450-afbe-d05194a59ecd
bac8e7df-88f5-4da0-bf3e-f26850c132c1	Традиционный веломарафон MTB XCM "Проба сил - 2024"	Третьи официальные соревнования по маунтинбайку на кубок Владивостока «Проба сил» стартуют в ближайшее воскресенье, 20 мая, на Русском острове. Традиционно в них примут участие велосипедисты из разных городов Приморья и Дальнего Востока – приедут спортсмены из Хабаровска, Благовещенска, Биробиджана. Всего организаторы ожидают более 100 участников	/src/assets/images/tempory-assets/velik.jpg	2023-08-09 14:00:00+00	2023-08-19 14:00:00+00	2023-09-09 14:00:00+00	2023-09-09 14:00:00+00	5f364b0f-82a4-4e5e-b6ab-dd84b496d180	39515764-58c0-401f-881d-46e976fb141d	e6fc866f-c371-49d3-a11e-2dac2fa4a231	2b029a3c-a3f8-4450-afbe-b15194a59ecd
d8464695-1458-48e8-900d-199c3b2ce510	Falaza Trail 2024	Однодневка или двухдневка на выбор. Двухдневка пройдет в двух зачетах: Лайт (11+11) и Про (19+18)	/src/assets/images/tempory-assets/1_banner.jpg	2023-05-31 14:00:00+00	2023-06-14 14:00:00+00	2023-06-30 14:00:00+00	2023-07-01 14:00:00+00	7dc9372c-dacc-4f21-b86c-7613e1bcea56	39515764-58c0-401f-881d-46e976fb141d	8327c2db-770d-4c0a-8cc1-5bcfe9613ac4	2b029a3c-a3f8-4450-afbe-d05194a59ecd
60f83852-df72-4110-b27e-d1d3b65dcca2	Уссури-трейл.Осень	Третья из четырех трейловых гонок серии "Уссури-трейл.Времена года-2023". Красивые виды на дистанции осенней дикой приморской тайги еще надолго останутся в вашем сердце!\nБег, трэйл, скайраннинг, атлетика, ходьба Межрегиональные (зональные)	/src/assets/images/tempory-assets/2_banner.jpg	2023-09-03 14:00:00+00	2023-10-03 14:00:00+00	2023-10-14 14:00:00+00	2023-10-16 14:00:00+00	698db308-6ac9-430e-8ec7-40f7747473de	39515764-58c0-401f-881d-46e976fb141d	76edff08-7def-402d-bca8-0ec70ab6d80b	b4917eef-8246-4feb-8eb5-b9eb818557d2
\.


--
-- Data for Name: place; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.place (id, country_id, address) FROM stdin;
7915f50d-f387-4c85-bc7f-279967b93f35	913842fe-39a3-4496-be47-270236bdc30a	г. Владивосток
5f364b0f-82a4-4e5e-b6ab-dd84b496d180	913842fe-39a3-4496-be47-270236bdc30a	г. Большой Камень
dab97643-665e-476b-93be-221b829b4dc1	913842fe-39a3-4496-be47-270236bdc30a	г. Уссурийск
7dc9372c-dacc-4f21-b86c-7613e1bcea56	913842fe-39a3-4496-be47-270236bdc30a	г. Находка
698db308-6ac9-430e-8ec7-40f7747473de	913842fe-39a3-4496-be47-270236bdc30a	г. Арсеньев
\.


--
-- Data for Name: social_link; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_link (id, event_id, link) FROM stdin;
c9170ff6-cea3-4a29-bee2-1f1c2b6783a5	49a5d35a-e782-4a57-897e-fd8e52bf2ea8	https://vk.com
293e4d6d-3085-4cd4-9590-63f6ad5457df	bac8e7df-88f5-4da0-bf3e-f26850c132c1	https://vk.com
\.


--
-- Data for Name: sport_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sport_type (id, name, description) FROM stdin;
9d38f723-3e75-45ae-bd5b-205ebf24906d	Бег	foo
2b029a3c-a3f8-4450-afbe-d05194a59ecd	Триатлон	foo
09665761-6ead-4c40-b820-27ef4d4defb3	Лыжные гонки	foo
667dbad2-d2b6-4d52-b62c-5999837aa5e0	Плавание	foo
2b029a3c-a3f8-4450-afbe-b15194a59ecd	MTB марафон	foo
b4917eef-8246-4feb-8eb5-b9eb818557d2	Трейлраннинг	foo
\.


--
-- Data for Name: starter_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.starter_item (id, event_id, starter_item) FROM stdin;
a4334582-a896-4171-a0bc-511891dad45d	49a5d35a-e782-4a57-897e-fd8e52bf2ea8	Плавательная шапочка
e353a57c-5ff9-452e-b81b-c48096182a44	49a5d35a-e782-4a57-897e-fd8e52bf2ea8	Стартовые Номера
1c13b4ff-5828-4629-ab88-e96d70e64889	49a5d35a-e782-4a57-897e-fd8e52bf2ea8	Чип для Индивидуального хронометража
023fc81d-3c69-441b-8c1a-74b9e9f7f390	49a5d35a-e782-4a57-897e-fd8e52bf2ea8	Наклейка для гардероба
0cf83550-a041-40af-a062-d4441e2ebeaf	49a5d35a-e782-4a57-897e-fd8e52bf2ea8	Вложения от партнеров
690a9a75-d026-4b38-923d-ee84544a9d41	bac8e7df-88f5-4da0-bf3e-f26850c132c1	Велосипед, подходящий для езды на пересеченной местности
\.


--
-- Data for Name: target_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.target_group (id, gender, minimal_age) FROM stdin;
39515764-58c0-401f-881d-46e976fb141d	Любой	18
\.


--
-- Data for Name: ticket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ticket (id, event_id, title, extra_title, price, max_places, sport_type_id) FROM stdin;
84da98e9-1c91-464d-8775-4bb0f9e6dc8b	49a5d35a-e782-4a57-897e-fd8e52bf2ea8	Этап Кубка России	113\nкм	50000	14	2b029a3c-a3f8-4450-afbe-d05194a59ecd
15fdef20-820b-4324-81a4-61c429ff7542	49a5d35a-e782-4a57-897e-fd8e52bf2ea8	Чемпионат Любителей	113\nкм	5000	30	2b029a3c-a3f8-4450-afbe-d05194a59ecd
2fd831e5-c79e-4e90-b75e-22aafef38588	bac8e7df-88f5-4da0-bf3e-f26850c132c1	Марафон	60\nкм	500	50	2b029a3c-a3f8-4450-afbe-b15194a59ecd
25fdef20-820b-4324-81a4-61c429ff7542	49a5d35a-e782-4a57-897e-fd8e52bf2ea8	Зритель	Зрите\nли	500	100	09665761-6ead-4c40-b820-27ef4d4defb3
2af6256c-01db-4567-abe9-155c8971b2ba	bac8e7df-88f5-4da0-bf3e-f26850c132c1	Зритель	Зрите\nли	0	100	2b029a3c-a3f8-4450-afbe-b15194a59ecd
98683d61-91b5-47a5-a0e4-5502af49d9fd	bac8e7df-88f5-4da0-bf3e-f26850c132c1	Полумарафон	30\nкм	500	50	2b029a3c-a3f8-4450-afbe-b15194a59ecd
a1f425d7-3d12-41fd-ad67-ecd9075aa4b1	60f83852-df72-4110-b27e-d1d3b65dcca2	BACKYARD20	20\nкм	0	100	b4917eef-8246-4feb-8eb5-b9eb818557d2
72d8da7c-7780-487f-b2f4-2194603a2335	60f83852-df72-4110-b27e-d1d3b65dcca2	BACKYARD13	13\nкм	0	100	b4917eef-8246-4feb-8eb5-b9eb818557d2
606c2ef2-d1f6-4e8b-973e-8f9789c26b2b	60f83852-df72-4110-b27e-d1d3b65dcca2	BACKYARD6	6\nкм	0	100	b4917eef-8246-4feb-8eb5-b9eb818557d2
7efe81d7-7d2f-4d6c-a2bc-d893226f7e99	60f83852-df72-4110-b27e-d1d3b65dcca2	Зритель	Зрите\nли	0	100	b4917eef-8246-4feb-8eb5-b9eb818557d2
\.


--
-- Data for Name: ticket_registation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ticket_registation (id, ticket_id, user_id, serial_number) FROM stdin;
3e15345d-6c9b-493d-8d39-02232f52161b	84da98e9-1c91-464d-8775-4bb0f9e6dc8b	96e78bbd-1b7c-49d6-80a6-4b307d8b692b	23
8af6a817-ad69-4c0f-8505-b3cd6320a1f2	84da98e9-1c91-464d-8775-4bb0f9e6dc8b	13bebca6-f67d-464c-99f2-f747e86ad8e6	2
fc4e8048-89f9-406c-93d1-172a9e82a489	98683d61-91b5-47a5-a0e4-5502af49d9fd	13bebca6-f67d-464c-99f2-f747e86ad8e6	1
\.


--
-- Name: article articles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: country country_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_name_key UNIQUE (name);


--
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);


--
-- Name: document document_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.document
    ADD CONSTRAINT document_pkey PRIMARY KEY (id);


--
-- Name: event event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_pkey PRIMARY KEY (id);


--
-- Name: place place_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.place
    ADD CONSTRAINT place_pkey PRIMARY KEY (id);


--
-- Name: social_link social_link_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_link
    ADD CONSTRAINT social_link_pkey PRIMARY KEY (id);


--
-- Name: sport_type sport_type_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sport_type
    ADD CONSTRAINT sport_type_name_key UNIQUE (name);


--
-- Name: sport_type sport_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sport_type
    ADD CONSTRAINT sport_type_pkey PRIMARY KEY (id);


--
-- Name: starter_item starter_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.starter_item
    ADD CONSTRAINT starter_items_pkey PRIMARY KEY (id);


--
-- Name: target_group target_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.target_group
    ADD CONSTRAINT target_group_pkey PRIMARY KEY (id);


--
-- Name: ticket ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_pkey PRIMARY KEY (id);


--
-- Name: ticket_registation ticket_registation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket_registation
    ADD CONSTRAINT ticket_registation_pkey PRIMARY KEY (id);


--
-- Name: article articles_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article
    ADD CONSTRAINT articles_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(id);


--
-- Name: document document_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.document
    ADD CONSTRAINT document_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(id);


--
-- Name: event event_place_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_place_id_fkey FOREIGN KEY (place_id) REFERENCES public.place(id);


--
-- Name: event event_sport_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_sport_type_id_fkey FOREIGN KEY (sport_type_id) REFERENCES public.sport_type(id);


--
-- Name: event event_target_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_target_group_id_fkey FOREIGN KEY (target_group_id) REFERENCES public.target_group(id);


--
-- Name: place place_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.place
    ADD CONSTRAINT place_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.country(id);


--
-- Name: social_link social_link_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_link
    ADD CONSTRAINT social_link_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(id);


--
-- Name: starter_item starter_items_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.starter_item
    ADD CONSTRAINT starter_items_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(id);


--
-- Name: ticket ticket_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.event(id);


--
-- Name: ticket_registation ticket_registation_ticket_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket_registation
    ADD CONSTRAINT ticket_registation_ticket_id_fkey FOREIGN KEY (ticket_id) REFERENCES public.ticket(id);


--
-- Name: ticket ticket_sport_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_sport_type_id_fkey FOREIGN KEY (sport_type_id) REFERENCES public.sport_type(id);


--
-- PostgreSQL database dump complete
--

