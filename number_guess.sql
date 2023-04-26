--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
    games_id integer NOT NULL,
    games_played integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_games_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_games_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_games_id_seq OWNER TO freecodecamp;

--
-- Name: games_games_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_games_id_seq OWNED BY public.games.games_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(25) NOT NULL
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
-- Name: games games_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN games_id SET DEFAULT nextval('public.games_games_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (46, 174, 169);
INSERT INTO public.games VALUES (47, 499, 169);
INSERT INTO public.games VALUES (48, 125, 170);
INSERT INTO public.games VALUES (49, 627, 170);
INSERT INTO public.games VALUES (50, 280, 169);
INSERT INTO public.games VALUES (51, 315, 169);
INSERT INTO public.games VALUES (52, 433, 169);
INSERT INTO public.games VALUES (53, 12, 171);
INSERT INTO public.games VALUES (54, 239, 172);
INSERT INTO public.games VALUES (55, 788, 172);
INSERT INTO public.games VALUES (56, 860, 173);
INSERT INTO public.games VALUES (57, 884, 173);
INSERT INTO public.games VALUES (58, 486, 172);
INSERT INTO public.games VALUES (59, 307, 172);
INSERT INTO public.games VALUES (60, 198, 172);
INSERT INTO public.games VALUES (61, 638, 174);
INSERT INTO public.games VALUES (62, 877, 175);
INSERT INTO public.games VALUES (63, 706, 175);
INSERT INTO public.games VALUES (64, 650, 174);
INSERT INTO public.games VALUES (65, 776, 174);
INSERT INTO public.games VALUES (66, 370, 174);
INSERT INTO public.games VALUES (67, 769, 176);
INSERT INTO public.games VALUES (68, 556, 176);
INSERT INTO public.games VALUES (69, 993, 177);
INSERT INTO public.games VALUES (70, 670, 177);
INSERT INTO public.games VALUES (71, 713, 176);
INSERT INTO public.games VALUES (72, 428, 176);
INSERT INTO public.games VALUES (73, 408, 176);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (169, 'user_1682519775410');
INSERT INTO public.users VALUES (170, 'user_1682519775409');
INSERT INTO public.users VALUES (171, 'fauza');
INSERT INTO public.users VALUES (172, 'user_1682520050659');
INSERT INTO public.users VALUES (173, 'user_1682520050658');
INSERT INTO public.users VALUES (174, 'user_1682520058608');
INSERT INTO public.users VALUES (175, 'user_1682520058607');
INSERT INTO public.users VALUES (176, 'user_1682520070732');
INSERT INTO public.users VALUES (177, 'user_1682520070731');


--
-- Name: games_games_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_games_id_seq', 73, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 177, true);


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

