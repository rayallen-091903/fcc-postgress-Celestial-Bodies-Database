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
    name character varying(100) NOT NULL,
    distance_from_earth numeric(10,2),
    description text,
    is_visible boolean NOT NULL
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
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    diameter_in_km integer,
    is_habitable boolean NOT NULL
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    mass numeric(12,4),
    has_rings boolean NOT NULL
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
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_million_years integer,
    is_visible boolean NOT NULL
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
-- Name: supportlife; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.supportlife (
    supportlife_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    is_habitable boolean NOT NULL
);


ALTER TABLE public.supportlife OWNER TO freecodecamp;

--
-- Name: supportlife_supportlife_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.supportlife_supportlife_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supportlife_supportlife_id_seq OWNER TO freecodecamp;

--
-- Name: supportlife_supportlife_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.supportlife_supportlife_id_seq OWNED BY public.supportlife.supportlife_id;


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
-- Name: supportlife supportlife_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.supportlife ALTER COLUMN supportlife_id SET DEFAULT nextval('public.supportlife_supportlife_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0.00, 'Our home galaxy', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2500000.00, 'Nearest major galaxy', true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 3000000.00, 'Small galaxy in Local Group', true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 23000000.00, 'Spiral galaxy', true);
INSERT INTO public.galaxy VALUES (5, 'Cartwheel', 500000.00, 'Ring-shaped galaxy', false);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 29000000.00, 'Galaxy with a bright core', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3474, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, false);
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643, false);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3121, false);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268, false);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821, false);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 5150, false);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 504, false);
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 396, false);
INSERT INTO public.moon VALUES (11, 'Triton', 8, 2707, false);
INSERT INTO public.moon VALUES (12, 'Charon', 8, 1207, false);
INSERT INTO public.moon VALUES (13, 'Oberon', 7, 1523, false);
INSERT INTO public.moon VALUES (14, 'Miranda', 7, 472, false);
INSERT INTO public.moon VALUES (15, 'Ariel', 7, 1158, false);
INSERT INTO public.moon VALUES (16, 'Proxima c', 9, 1000, false);
INSERT INTO public.moon VALUES (17, 'Kepler Moon 1', 11, 2000, false);
INSERT INTO public.moon VALUES (18, 'Kepler Moon 2', 11, 1500, false);
INSERT INTO public.moon VALUES (19, 'Sirius Moon 1', 10, 1800, false);
INSERT INTO public.moon VALUES (20, 'Gliese Moon 1', 12, 2200, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 0.3300, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 4.8700, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 5.9700, false);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 0.6420, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 1898.0000, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 568.0000, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 86.8000, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 102.0000, true);
INSERT INTO public.planet VALUES (9, 'Proxima b', 5, 1.2700, false);
INSERT INTO public.planet VALUES (10, 'Sirius b', 3, 1.5000, false);
INSERT INTO public.planet VALUES (11, 'Kepler-22b', 4, 5.0000, false);
INSERT INTO public.planet VALUES (12, 'Gliese 581g', 6, 4.0000, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, true);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 1, 8000, true);
INSERT INTO public.star VALUES (3, 'Sirius', 2, 300, true);
INSERT INTO public.star VALUES (4, 'Rigel', 2, 8000, true);
INSERT INTO public.star VALUES (5, 'Alpha Centauri', 1, 5000, true);
INSERT INTO public.star VALUES (6, 'Vega', 3, 400, true);


--
-- Data for Name: supportlife; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.supportlife VALUES (1, 'Earth', 'Planet that supports life', true);
INSERT INTO public.supportlife VALUES (2, 'Europa', 'Moon that may support life', true);
INSERT INTO public.supportlife VALUES (3, 'Mars', 'Planet with potential for supporting life', false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: supportlife_supportlife_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.supportlife_supportlife_id_seq', 3, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: supportlife supportlife_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.supportlife
    ADD CONSTRAINT supportlife_name_key UNIQUE (name);


--
-- Name: supportlife supportlife_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.supportlife
    ADD CONSTRAINT supportlife_pkey PRIMARY KEY (supportlife_id);


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


