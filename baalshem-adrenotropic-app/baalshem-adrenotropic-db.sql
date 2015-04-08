--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Articles; Type: TABLE; Schema: public; Owner: mark; Tablespace: 
--

CREATE TABLE "Articles" (
    id integer NOT NULL,
    title character varying(255),
    content text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "AuthorId" integer
);


ALTER TABLE "Articles" OWNER TO mark;

--
-- Name: Articles_id_seq; Type: SEQUENCE; Schema: public; Owner: mark
--

CREATE SEQUENCE "Articles_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Articles_id_seq" OWNER TO mark;

--
-- Name: Articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mark
--

ALTER SEQUENCE "Articles_id_seq" OWNED BY "Articles".id;


--
-- Name: Authors; Type: TABLE; Schema: public; Owner: mark; Tablespace: 
--

CREATE TABLE "Authors" (
    id integer NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE "Authors" OWNER TO mark;

--
-- Name: Authors_id_seq; Type: SEQUENCE; Schema: public; Owner: mark
--

CREATE SEQUENCE "Authors_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Authors_id_seq" OWNER TO mark;

--
-- Name: Authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mark
--

ALTER SEQUENCE "Authors_id_seq" OWNED BY "Authors".id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mark
--

ALTER TABLE ONLY "Articles" ALTER COLUMN id SET DEFAULT nextval('"Articles_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mark
--

ALTER TABLE ONLY "Authors" ALTER COLUMN id SET DEFAULT nextval('"Authors_id_seq"'::regclass);


--
-- Data for Name: Articles; Type: TABLE DATA; Schema: public; Owner: mark
--

COPY "Articles" (id, title, content, "createdAt", "updatedAt", "AuthorId") FROM stdin;
1   A brief history of EJS  EJS makes life so much easier.  2015-04-06 15:06:11.771-07  2015-04-06 15:06:11.771-07  1
2   Sequelize Structure Sequelize, an ORM, is supposed to make life easier, but doesn't really. 2015-04-06 15:16:20.891-07  2015-04-06 15:16:20.891-07  2
\.
--
-- Name: Articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mark
--
SELECT pg_catalog.setval('"Articles_id_seq"', 2, true);
--
-- Data for Name: Authors; Type: TABLE DATA; Schema: public; Owner: mark
--
COPY "Authors" (id, first_name, last_name, "createdAt", "updatedAt") FROM stdin;
1   mark   Levenson    2015-04-06 15:02:15.909-07  2015-04-06 15:02:15.909-07
2   Delmer  Reed    2015-04-06 15:15:13.937-07  2015-04-06 15:15:13.937-07
\.
--
-- Name: Authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mark
--
SELECT pg_catalog.setval('"Authors_id_seq"', 2, true);
--
-- Name: Articles_pkey; Type: CONSTRAINT; Schema: public; Owner: mark; Tablespace: 
--
ALTER TABLE ONLY "Articles"
    ADD CONSTRAINT "Articles_pkey" PRIMARY KEY (id);
--
-- Name: Authors_pkey; Type: CONSTRAINT; Schema: public; Owner: mark; Tablespace: 
--
ALTER TABLE ONLY "Authors"
    ADD CONSTRAINT "Authors_pkey" PRIMARY KEY (id);
--
-- Name: Articles_AuthorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mark
--
ALTER TABLE ONLY "Articles"
    ADD CONSTRAINT "Articles_AuthorId_fkey" FOREIGN KEY ("AuthorId") REFERENCES "Authors"(id) ON UPDATE CASCADE ON DELETE SET NULL;
--
-- Name: public; Type: ACL; Schema: -; Owner: mark
--
REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM mark;
GRANT ALL ON SCHEMA public TO mark;
GRANT ALL ON SCHEMA public TO PUBLIC;
--
-- PostgreSQL database dump complete
--
