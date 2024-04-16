--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE user_data;
--
-- Name: user_data; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE user_data WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE user_data OWNER TO freecodecamp;

\connect user_data

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    guesses integer NOT NULL,
    user_id integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (2, 577, 2);
INSERT INTO public.games VALUES (3, 309, 2);
INSERT INTO public.games VALUES (4, 116, 3);
INSERT INTO public.games VALUES (5, 268, 3);
INSERT INTO public.games VALUES (6, 952, 2);
INSERT INTO public.games VALUES (7, 11, 2);
INSERT INTO public.games VALUES (8, 44, 2);
INSERT INTO public.games VALUES (9, 3, 2);
INSERT INTO public.games VALUES (10, 2, 4);
INSERT INTO public.games VALUES (11, 2, 5);
INSERT INTO public.games VALUES (12, 513, 6);
INSERT INTO public.games VALUES (13, 294, 6);
INSERT INTO public.games VALUES (14, 510, 7);
INSERT INTO public.games VALUES (15, 882, 7);
INSERT INTO public.games VALUES (16, 707, 6);
INSERT INTO public.games VALUES (17, 997, 6);
INSERT INTO public.games VALUES (18, 333, 6);
INSERT INTO public.games VALUES (19, 2, 2);
INSERT INTO public.games VALUES (20, 242, 8);
INSERT INTO public.games VALUES (21, 536, 8);
INSERT INTO public.games VALUES (22, 816, 9);
INSERT INTO public.games VALUES (23, 756, 9);
INSERT INTO public.games VALUES (24, 389, 8);
INSERT INTO public.games VALUES (25, 1000, 8);
INSERT INTO public.games VALUES (26, 960, 8);
INSERT INTO public.games VALUES (27, 709, 10);
INSERT INTO public.games VALUES (28, 768, 10);
INSERT INTO public.games VALUES (29, 372, 11);
INSERT INTO public.games VALUES (30, 203, 11);
INSERT INTO public.games VALUES (31, 470, 10);
INSERT INTO public.games VALUES (32, 719, 10);
INSERT INTO public.games VALUES (33, 795, 10);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (2, 'user_1713275022317');
INSERT INTO public.users VALUES (3, 'user_1713275022316');
INSERT INTO public.users VALUES (4, 'user');
INSERT INTO public.users VALUES (5, 'user2');
INSERT INTO public.users VALUES (6, 'user_1713275338396');
INSERT INTO public.users VALUES (7, 'user_1713275338395');
INSERT INTO public.users VALUES (8, 'user_1713275545485');
INSERT INTO public.users VALUES (9, 'user_1713275545484');
INSERT INTO public.users VALUES (10, 'user_1713275567035');
INSERT INTO public.users VALUES (11, 'user_1713275567034');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 33, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 11, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

