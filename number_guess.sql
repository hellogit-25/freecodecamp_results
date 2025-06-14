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

DROP DATABASE games;
--
-- Name: games; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE games WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE games OWNER TO freecodecamp;

\connect games

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
    name_id integer,
    num_guesses integer NOT NULL
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
-- Name: names; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.names (
    name character varying(22) NOT NULL,
    name_id integer NOT NULL
);


ALTER TABLE public.names OWNER TO freecodecamp;

--
-- Name: names_name_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.names_name_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.names_name_id_seq OWNER TO freecodecamp;

--
-- Name: names_name_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.names_name_id_seq OWNED BY public.names.name_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: names name_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.names ALTER COLUMN name_id SET DEFAULT nextval('public.names_name_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 8);
INSERT INTO public.games VALUES (2, 1, 3);
INSERT INTO public.games VALUES (3, 1, 11);
INSERT INTO public.games VALUES (4, 2, 11);
INSERT INTO public.games VALUES (5, 3, 957);
INSERT INTO public.games VALUES (6, 3, 45);
INSERT INTO public.games VALUES (7, 4, 976);
INSERT INTO public.games VALUES (8, 4, 800);
INSERT INTO public.games VALUES (9, 3, 505);
INSERT INTO public.games VALUES (10, 3, 272);
INSERT INTO public.games VALUES (11, 3, 660);
INSERT INTO public.games VALUES (12, 5, 538);
INSERT INTO public.games VALUES (13, 5, 603);
INSERT INTO public.games VALUES (14, 6, 144);
INSERT INTO public.games VALUES (15, 6, 121);
INSERT INTO public.games VALUES (16, 5, 690);
INSERT INTO public.games VALUES (17, 5, 628);
INSERT INTO public.games VALUES (18, 5, 361);


--
-- Data for Name: names; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.names VALUES ('test', 1);
INSERT INTO public.names VALUES ('test2', 2);
INSERT INTO public.names VALUES ('user_1749940334369', 3);
INSERT INTO public.names VALUES ('user_1749940334368', 4);
INSERT INTO public.names VALUES ('user_1749940403699', 5);
INSERT INTO public.names VALUES ('user_1749940403698', 6);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 18, true);


--
-- Name: names_name_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.names_name_id_seq', 6, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: names name_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.names
    ADD CONSTRAINT name_id_unique UNIQUE (name_id);


--
-- Name: names names_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.names
    ADD CONSTRAINT names_pkey PRIMARY KEY (name);


--
-- Name: games games_name_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_name_id_fkey FOREIGN KEY (name_id) REFERENCES public.names(name_id);


--
-- PostgreSQL database dump complete
--

