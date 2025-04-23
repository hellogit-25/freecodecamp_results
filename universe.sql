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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    has_life boolean,
    description text,
    age_in_millions_of_years integer NOT NULL,
    distance_to_earth integer,
    live_prob numeric(3,1)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    planet_id integer NOT NULL,
    filler1 integer,
    filler2 integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    has_life boolean,
    description text,
    is_spherical boolean,
    age_in_millions_of_years integer NOT NULL,
    distance_to_earth integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    has_life boolean,
    description text,
    is_spherical boolean,
    age_in_millions_of_years integer NOT NULL,
    distance_to_earth integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: what; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.what (
    number integer NOT NULL,
    name character varying(30),
    what_id integer NOT NULL
);


ALTER TABLE public.what OWNER TO freecodecamp;

--
-- Name: what_what_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.what_what_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.what_what_id_seq OWNER TO freecodecamp;

--
-- Name: what_what_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.what_what_id_seq OWNED BY public.what.what_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: what what_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.what ALTER COLUMN what_id SET DEFAULT nextval('public.what_what_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky way', true, 'classic milky way', 13600, 0, 0.0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', false, 'will collide with milky way', 10000, 2, 10.2);
INSERT INTO public.galaxy VALUES (3, 'Backward', false, 'appears to turn in other direction', 8000, 5, 5.4);
INSERT INTO public.galaxy VALUES (4, 'Cigar', false, 'looks like a cigar', 11000, 8, 30.3);
INSERT INTO public.galaxy VALUES (5, 'Eye of Sauron', false, 'like Saurons eye', 9000, 10, 60.6);
INSERT INTO public.galaxy VALUES (6, 'Random', true, 'random entry', 1000, 1, 99.9);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'THE MOON', 1, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'A MOON', 2, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'A MOON', 2, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'D', 3, 2, 3);
INSERT INTO public.moon VALUES (5, 'FS', 7, 3, 5);
INSERT INTO public.moon VALUES (6, 'SD', 5, 3, 4);
INSERT INTO public.moon VALUES (7, 'WDF', 6, 2, 3);
INSERT INTO public.moon VALUES (8, 'SDF', 3, 5, 4);
INSERT INTO public.moon VALUES (9, 'FGDFG', 6, 4, 5);
INSERT INTO public.moon VALUES (10, 'DGF', 9, 23, 44);
INSERT INTO public.moon VALUES (11, 'SDFS', 11, 2, 3);
INSERT INTO public.moon VALUES (12, 'FDC', 12, 9, 5);
INSERT INTO public.moon VALUES (13, 'DDFS', 8, 4, 5);
INSERT INTO public.moon VALUES (14, 'SDF', 2, 4, 7);
INSERT INTO public.moon VALUES (15, 'SDFX', 2, 7, 6);
INSERT INTO public.moon VALUES (16, 'SDQ', 7, 9, 0);
INSERT INTO public.moon VALUES (17, 'LOI', 2, 4, 5);
INSERT INTO public.moon VALUES (18, 'ZRT', 10, 4, 10);
INSERT INTO public.moon VALUES (19, 'SDFE', 6, 6, 6);
INSERT INTO public.moon VALUES (20, 'OKK', 7, 7, 7);
INSERT INTO public.moon VALUES (21, 'OMKM', 8, 8, 8);
INSERT INTO public.moon VALUES (22, 'ZCXV', 9, 9, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'earth', true, 'CLASSIC', true, 4000, 0, 1);
INSERT INTO public.planet VALUES (2, 'MERKUR', false, 'HOT', true, 3900, 0, 1);
INSERT INTO public.planet VALUES (3, 'VENUS', false, 'LOVE', true, 4000, 0, 1);
INSERT INTO public.planet VALUES (4, 'MARS', true, 'HYPER', true, 4000, 0, 1);
INSERT INTO public.planet VALUES (5, 'JUPYTER', false, 'BAR', true, 4000, 0, 1);
INSERT INTO public.planet VALUES (6, 'SATURN', false, 'MARKE', false, 4000, 0, 1);
INSERT INTO public.planet VALUES (7, 'URANUS', false, 'NO MINE', true, 4001, 0, 1);
INSERT INTO public.planet VALUES (8, 'PLUTO', false, 'JOKE', true, 3800, 0, 1);
INSERT INTO public.planet VALUES (9, 'RND1', false, 'FAKE', false, 42, 24, 2);
INSERT INTO public.planet VALUES (10, 'RND2', false, 'NO FAKE', true, 24, 42, 4);
INSERT INTO public.planet VALUES (11, 'RND3', true, 'SOMETHING', true, 2000, 2000, 3);
INSERT INTO public.planet VALUES (12, 'LAST', false, 'REAL', true, 3984, 7952, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', false, 'classic sun', true, 4600, 0, 1);
INSERT INTO public.star VALUES (2, 'Alpheratz', false, 'funny name', true, 5000, 9500, 2);
INSERT INTO public.star VALUES (3, 'Sirius', false, 'very bright', true, 3500, 9, 1);
INSERT INTO public.star VALUES (4, 'random1', false, 'first random sun', true, 6000, 50, 3);
INSERT INTO public.star VALUES (5, 'RND2', false, '2ND RND', true, 4934, 2000, 4);
INSERT INTO public.star VALUES (6, 'RND3', false, '1ST REAL FAKE', false, 1, 2, 5);


--
-- Data for Name: what; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.what VALUES (1, 'one', 1);
INSERT INTO public.what VALUES (2, 'two', 2);
INSERT INTO public.what VALUES (3, 'three', 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: what_what_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.what_what_id_seq', 3, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: what what_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.what
    ADD CONSTRAINT what_pkey PRIMARY KEY (what_id);


--
-- Name: what what_what_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.what
    ADD CONSTRAINT what_what_id_key UNIQUE (what_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

