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
    age integer,
    description text,
    name character varying(200) NOT NULL,
    is_existent character varying(200) DEFAULT 'Exists'::character varying NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: COLUMN galaxy.age; Type: COMMENT; Schema: public; Owner: freecodecamp
--

COMMENT ON COLUMN public.galaxy.age IS 'Age of galaxy is in billion years';


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
    name character varying(200) NOT NULL,
    moon_code character varying(200) NOT NULL,
    has_water boolean,
    planet_id integer NOT NULL
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
    haslife boolean,
    star_id integer NOT NULL,
    temp_unit character varying(20) DEFAULT 'C'::character varying NOT NULL,
    name character varying(200),
    temp_star integer
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
-- Name: solar_belts; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.solar_belts (
    solar_belts_id integer NOT NULL,
    name character varying(200) NOT NULL,
    star_id integer,
    distance numeric(20,2),
    size character varying(200) NOT NULL,
    distance_unit character varying(200) DEFAULT 'AU'::character varying
);


ALTER TABLE public.solar_belts OWNER TO freecodecamp;

--
-- Name: solar_belts_solar_belts_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.solar_belts_solar_belts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_belts_solar_belts_id_seq OWNER TO freecodecamp;

--
-- Name: solar_belts_solar_belts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.solar_belts_solar_belts_id_seq OWNED BY public.solar_belts.solar_belts_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(200),
    radius integer NOT NULL,
    color character varying(200),
    galaxy_id integer NOT NULL
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
-- Name: solar_belts solar_belts_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_belts ALTER COLUMN solar_belts_id SET DEFAULT nextval('public.solar_belts_solar_belts_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 14, 'Our spiral galaxy containing the Solar System and billions of stars.', 'Milky Way', 'Exists');
INSERT INTO public.galaxy VALUES (3, 10, 'The nearest spiral galaxy to the Milky Way, on a collision course with it.', 'Andromeda', 'Exists');
INSERT INTO public.galaxy VALUES (4, 13, 'A bright, unbarred spiral galaxy with a distinctive dust lane, resembling a sombrero hat.', 'Sombrero', 'Exists');
INSERT INTO public.galaxy VALUES (5, 16, 'A giant elliptical galaxy in the Virgo Cluster, famous for its supermassive black hole and plasma jet.', 'Messier 87', 'Exists');
INSERT INTO public.galaxy VALUES (6, 17, 'A classic spiral galaxy known for its interaction with a companion galaxy, NGC 5195.', 'Whirlpool', 'Exists');
INSERT INTO public.galaxy VALUES (7, 13, 'A satellite galaxy of the Milky Way, rich in star-forming regions like the Tarantula Nebula.', 'LMC', 'Exists');
INSERT INTO public.galaxy VALUES (8, 12, 'Another dwarf irregular galaxy orbiting the Milky Way, notable for its interactions with the LMC.', 'SMC', 'Exists');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'I', true, 1);
INSERT INTO public.moon VALUES (3, 'Phobos', 'I', false, 4);
INSERT INTO public.moon VALUES (4, 'Deimos', 'II', false, 4);
INSERT INTO public.moon VALUES (5, 'Ganymede', 'III', true, 8);
INSERT INTO public.moon VALUES (6, 'Callisto', 'IV', true, 8);
INSERT INTO public.moon VALUES (7, 'Lo', 'I', true, 8);
INSERT INTO public.moon VALUES (8, 'Europa', 'II', true, 8);
INSERT INTO public.moon VALUES (9, 'Amalthea', 'V', false, 8);
INSERT INTO public.moon VALUES (10, 'Himalia', 'VI', false, 8);
INSERT INTO public.moon VALUES (11, 'Titan', 'VI', true, 5);
INSERT INTO public.moon VALUES (12, 'Enceladus', 'II', true, 5);
INSERT INTO public.moon VALUES (13, 'Rhea', 'V', true, 5);
INSERT INTO public.moon VALUES (14, 'Iapetus', 'VIII', true, 5);
INSERT INTO public.moon VALUES (15, 'Dione', 'IV', true, 5);
INSERT INTO public.moon VALUES (16, 'Tethys', 'III', true, 5);
INSERT INTO public.moon VALUES (17, 'Mimas', 'I', true, 5);
INSERT INTO public.moon VALUES (18, 'Hyperion', 'VII', true, 5);
INSERT INTO public.moon VALUES (19, 'Phoebe', 'IX', true, 5);
INSERT INTO public.moon VALUES (20, 'Miranda', 'V', true, 6);
INSERT INTO public.moon VALUES (21, 'Ariel', 'I', true, 6);
INSERT INTO public.moon VALUES (22, 'Umbriel', 'II', true, 6);
INSERT INTO public.moon VALUES (23, 'Titania', 'III', true, 6);
INSERT INTO public.moon VALUES (24, 'Oberon', 'IV', true, 6);
INSERT INTO public.moon VALUES (25, 'Triton', 'I', true, 7);
INSERT INTO public.moon VALUES (26, 'Nereid', 'II', false, 7);
INSERT INTO public.moon VALUES (27, 'Proteus', 'VIII', false, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, true, 1, 'C', 'Earth', 5500);
INSERT INTO public.planet VALUES (2, false, 1, 'C', 'Mercury', 5500);
INSERT INTO public.planet VALUES (3, false, 1, 'C', 'Venus', 5500);
INSERT INTO public.planet VALUES (4, false, 1, 'C', 'Mars', 5500);
INSERT INTO public.planet VALUES (5, false, 1, 'C', 'Saturn', 5500);
INSERT INTO public.planet VALUES (6, false, 1, 'C', 'Uranus', 5500);
INSERT INTO public.planet VALUES (7, false, 1, 'C', 'Neptune', 5500);
INSERT INTO public.planet VALUES (8, false, 1, 'C', 'Jupiter', 5500);
INSERT INTO public.planet VALUES (9, false, 2, 'C', NULL, 5800);
INSERT INTO public.planet VALUES (10, false, 5, 'C', 'NA->Black hole', 1000000);
INSERT INTO public.planet VALUES (11, false, 6, 'C', NULL, NULL);
INSERT INTO public.planet VALUES (12, false, 3, 'C', 'NA->Black hole', 3400203);


--
-- Data for Name: solar_belts; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.solar_belts VALUES (1, 'Asteroid Belt', 1, 2.10, 'Large', 'AU');
INSERT INTO public.solar_belts VALUES (2, 'Kuiper Belt', 1, 30.00, 'Large', 'AU');
INSERT INTO public.solar_belts VALUES (3, 'Oort Cloud', 1, 2000.00, 'Very Large', 'AU');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 696340, 'Yellow', 2);
INSERT INTO public.star VALUES (2, 'Rigel Kentaurus', 1240000, 'Yellow-orange', 3);
INSERT INTO public.star VALUES (3, 'GSC 03344-01472', 1000000, NULL, 4);
INSERT INTO public.star VALUES (5, 'M87', 502040500, 'Blue', 7);
INSERT INTO public.star VALUES (6, 'HV 11417', 1200302, 'Green', 8);
INSERT INTO public.star VALUES (7, 'S Doradus', 125302, NULL, 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 27, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: solar_belts_solar_belts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.solar_belts_solar_belts_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: galaxy name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name_unique UNIQUE (name);


--
-- Name: moon name_unique_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT name_unique_moon UNIQUE (name);


--
-- Name: star name_unique_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT name_unique_star UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique UNIQUE (planet_id);


--
-- Name: solar_belts solar_belts_distance_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_belts
    ADD CONSTRAINT solar_belts_distance_key UNIQUE (distance);


--
-- Name: solar_belts solar_belts_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_belts
    ADD CONSTRAINT solar_belts_pkey PRIMARY KEY (solar_belts_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

