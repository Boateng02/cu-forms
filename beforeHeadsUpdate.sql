--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
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
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- Name: course_allocation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE course_allocation (
    id integer NOT NULL,
    level character varying,
    "courseCode" character varying,
    "courseTitle" character varying,
    "creditHours" character varying,
    stream character varying,
    campus character varying,
    lecturer character varying,
    "lecturerTitle" character varying,
    "lecturerStatus" character varying,
    "noOfStudents" character varying,
    departments character varying
);


ALTER TABLE public.course_allocation OWNER TO postgres;

--
-- Name: course_allocation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE course_allocation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_allocation_id_seq OWNER TO postgres;

--
-- Name: course_allocation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE course_allocation_id_seq OWNED BY course_allocation.id;


--
-- Name: department; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE department (
    id integer NOT NULL,
    name character varying NOT NULL,
    school character varying,
    "schoolSlug" character varying,
    slug character varying,
    count integer,
    hod character varying NOT NULL
);


ALTER TABLE public.department OWNER TO postgres;

--
-- Name: department_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.department_id_seq OWNER TO postgres;

--
-- Name: department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE department_id_seq OWNED BY department.id;


--
-- Name: lecture_assessment; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE lecture_assessment (
    id integer NOT NULL,
    "lectureName" character varying,
    "lectureId" character varying,
    department character varying,
    course character varying,
    semester character varying,
    "classSize" character varying,
    one character varying,
    two character varying,
    three character varying,
    four character varying,
    five character varying,
    six character varying,
    seven character varying,
    eight character varying,
    nine character varying,
    ten character varying,
    eleven character varying,
    twelve character varying,
    thirteen character varying,
    fourteen character varying,
    fifteen character varying,
    sixteen character varying,
    seventeen character varying,
    eighteen character varying,
    nineteen character varying,
    content character varying,
    attendance character varying
);


ALTER TABLE public.lecture_assessment OWNER TO postgres;

--
-- Name: lecture_assessment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE lecture_assessment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lecture_assessment_id_seq OWNER TO postgres;

--
-- Name: lecture_assessment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE lecture_assessment_id_seq OWNED BY lecture_assessment.id;


--
-- Name: lecturer; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE lecturer (
    id integer NOT NULL,
    name character varying NOT NULL,
    department character varying,
    "departmentSlug" character varying,
    school character varying,
    "schoolSlug" character varying,
    phone character varying NOT NULL,
    email character varying NOT NULL
);


ALTER TABLE public.lecturer OWNER TO postgres;

--
-- Name: lecturer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE lecturer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lecturer_id_seq OWNER TO postgres;

--
-- Name: lecturer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE lecturer_id_seq OWNED BY lecturer.id;


--
-- Name: question; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE question (
    id integer NOT NULL,
    question character varying,
    "skillGroup" character varying,
    q_number character varying,
    component character varying
);


ALTER TABLE public.question OWNER TO postgres;

--
-- Name: question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_id_seq OWNER TO postgres;

--
-- Name: question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE question_id_seq OWNED BY question.id;


--
-- Name: registration_form; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE registration_form (
    id integer NOT NULL,
    residence character varying,
    region character varying,
    gender character varying,
    age character varying,
    market character varying,
    recommendation character varying,
    nationality character varying,
    answers character varying
);


ALTER TABLE public.registration_form OWNER TO postgres;

--
-- Name: registration_form_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE registration_form_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registration_form_id_seq OWNER TO postgres;

--
-- Name: registration_form_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE registration_form_id_seq OWNED BY registration_form.id;


--
-- Name: responses; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE responses (
    id integer NOT NULL,
    "formName" character varying,
    "formId" character varying,
    response character varying
);


ALTER TABLE public.responses OWNER TO postgres;

--
-- Name: responses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE responses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.responses_id_seq OWNER TO postgres;

--
-- Name: responses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE responses_id_seq OWNED BY responses.id;


--
-- Name: school; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE school (
    id integer NOT NULL,
    slug character varying,
    name character varying NOT NULL,
    count integer,
    hod character varying NOT NULL
);


ALTER TABLE public.school OWNER TO postgres;

--
-- Name: school_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE school_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.school_id_seq OWNER TO postgres;

--
-- Name: school_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE school_id_seq OWNED BY school.id;


--
-- Name: section; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE section (
    id integer NOT NULL,
    name character varying,
    form character varying,
    questions character varying
);


ALTER TABLE public.section OWNER TO postgres;

--
-- Name: section_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE section_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.section_id_seq OWNER TO postgres;

--
-- Name: section_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE section_id_seq OWNED BY section.id;


--
-- Name: survey_form; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE survey_form (
    id integer NOT NULL,
    name character varying,
    "startDate" character varying,
    "endDate" character varying,
    "ownerId" character varying,
    status character varying,
    consumer character varying,
    slug character varying,
    family character varying,
    description character varying,
    type character varying
);


ALTER TABLE public.survey_form OWNER TO postgres;

--
-- Name: survey_form_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE survey_form_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.survey_form_id_seq OWNER TO postgres;

--
-- Name: survey_form_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE survey_form_id_seq OWNED BY survey_form.id;


--
-- Name: survey_question; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE survey_question (
    id integer NOT NULL,
    question character varying,
    family character varying,
    section character varying,
    type character varying,
    results character varying
);


ALTER TABLE public.survey_question OWNER TO postgres;

--
-- Name: survey_question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE survey_question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.survey_question_id_seq OWNER TO postgres;

--
-- Name: survey_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE survey_question_id_seq OWNED BY survey_question.id;


--
-- Name: tracer_form_response; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tracer_form_response (
    id integer NOT NULL,
    value json
);


ALTER TABLE public.tracer_form_response OWNER TO postgres;

--
-- Name: tracer_form_response_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tracer_form_response_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tracer_form_response_id_seq OWNER TO postgres;

--
-- Name: tracer_form_response_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tracer_form_response_id_seq OWNED BY tracer_form_response.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "user" (
    id integer NOT NULL,
    firstname character varying(200) NOT NULL,
    lastname character varying NOT NULL,
    phone character varying(200) NOT NULL,
    email character varying(200) NOT NULL,
    answers character varying
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_id_seq OWNED BY "user".id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY course_allocation ALTER COLUMN id SET DEFAULT nextval('course_allocation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY department ALTER COLUMN id SET DEFAULT nextval('department_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lecture_assessment ALTER COLUMN id SET DEFAULT nextval('lecture_assessment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lecturer ALTER COLUMN id SET DEFAULT nextval('lecturer_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY question ALTER COLUMN id SET DEFAULT nextval('question_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY registration_form ALTER COLUMN id SET DEFAULT nextval('registration_form_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY responses ALTER COLUMN id SET DEFAULT nextval('responses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY school ALTER COLUMN id SET DEFAULT nextval('school_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY section ALTER COLUMN id SET DEFAULT nextval('section_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY survey_form ALTER COLUMN id SET DEFAULT nextval('survey_form_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY survey_question ALTER COLUMN id SET DEFAULT nextval('survey_question_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tracer_form_response ALTER COLUMN id SET DEFAULT nextval('tracer_form_response_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('user_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY alembic_version (version_num) FROM stdin;
5af2099b5329
\.


--
-- Data for Name: course_allocation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY course_allocation (id, level, "courseCode", "courseTitle", "creditHours", stream, campus, lecturer, "lecturerTitle", "lecturerStatus", "noOfStudents", departments) FROM stdin;
\.


--
-- Name: course_allocation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('course_allocation_id_seq', 1, false);


--
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY department (id, name, school, "schoolSlug", slug, count, hod) FROM stdin;
\.


--
-- Name: department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('department_id_seq', 1, false);


--
-- Data for Name: lecture_assessment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY lecture_assessment (id, "lectureName", "lectureId", department, course, semester, "classSize", one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen, content, attendance) FROM stdin;
\.


--
-- Name: lecture_assessment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('lecture_assessment_id_seq', 1, false);


--
-- Data for Name: lecturer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY lecturer (id, name, department, "departmentSlug", school, "schoolSlug", phone, email) FROM stdin;
\.


--
-- Name: lecturer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('lecturer_id_seq', 1, false);


--
-- Data for Name: question; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY question (id, question, "skillGroup", q_number, component) FROM stdin;
\.


--
-- Name: question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('question_id_seq', 1, false);


--
-- Data for Name: registration_form; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY registration_form (id, residence, region, gender, age, market, recommendation, nationality, answers) FROM stdin;
\.


--
-- Name: registration_form_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('registration_form_id_seq', 1, false);


--
-- Data for Name: responses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY responses (id, "formName", "formId", response) FROM stdin;
\.


--
-- Name: responses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('responses_id_seq', 1, false);


--
-- Data for Name: school; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY school (id, slug, name, count, hod) FROM stdin;
\.


--
-- Name: school_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('school_id_seq', 1, false);


--
-- Data for Name: section; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY section (id, name, form, questions) FROM stdin;
\.


--
-- Name: section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('section_id_seq', 1, false);


--
-- Data for Name: survey_form; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY survey_form (id, name, "startDate", "endDate", "ownerId", status, consumer, slug, family, description, type) FROM stdin;
\.


--
-- Name: survey_form_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('survey_form_id_seq', 1, false);


--
-- Data for Name: survey_question; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY survey_question (id, question, family, section, type, results) FROM stdin;
\.


--
-- Name: survey_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('survey_question_id_seq', 1, false);


--
-- Data for Name: tracer_form_response; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tracer_form_response (id, value) FROM stdin;
66	"{\\"(If Yes, What is your current status, If No skip)\\": \\"Enrolled part time\\", \\"Adaptable - adapts to new situations and demands by applying or updating knowledge and skills\\": \\"Well Prepared\\", \\"CSRF Token\\": \\"ImMyOTFkNDAzOGJkYjE0ZTRmODQ5ZjEyMGQxODk2ZjIwYzZkZTI4ODEi.ZOl0vQ.hKm5NX3yQ2VIpgJ4PbeBRB10yis\\", \\"Communication (oral and written) \\\\u2013 speak/write in a clear,concise,correctmanner\\": \\"Well Prepared\\", \\"Comprehension - can restate information, ideas and concepts in different ways\\": \\"Well Prepared\\", \\"Computer skills\\": \\"Well Prepared\\", \\"Country of Residence\\": \\"Ghana\\", \\"Creative and innovative - creates innovative strategies and / or products that meet identified needs\\": \\"Well Prepared\\", \\"Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making\\": \\"Well Prepared\\", \\"Did your degree earned from CU provide the requisite technical know-how of your job?\\": \\"Select\\", \\"Do you have any suggestions for overall service delivery at Central University?\\": \\"Nothing\\", \\"Gender\\": \\"Male\\", \\"Have you ever been employed since graduation?\\": \\"Yes\\", \\"How likely are you to return to the same school?\\": \\"Very likely\\", \\"How likely are you to staying in your current job or profession?\\": \\"Very likely\\", \\"How long did it take you to find your job?\\": \\"I found employment prior to graduation\\", \\"How long did you work?\\": \\"1-3 months\\", \\"How long have you been employed or self-employed?\\": \\" Less than 6 months\\", \\"How related is your current job to your program of study?\\": \\" Fully related\\", \\"How would you rate your overall satisfaction with your university\\\\u2019s preparation for the type of work you were/are doing?\\": \\"Very satisfied\\", \\"In your current job, are you\\": \\"A permanent employee\\", \\"Job title\\": \\"Oh \\", \\"List programme\\": \\"asdf\\", \\"Mobile Number\\": \\"545977791\\", \\"Name of Institution\\": \\"asdf\\", \\"Organization\\": \\"Presto Solutions\\", \\"Organization Address\\": \\"Presto Solutions\\", \\"Organization and planning - determines tasks and resources to complete project objectives\\": \\"Well Prepared\\", \\"Overall how satisfied were you with the academic preparation for your current programme\\": \\"Very satisfied\\", \\"Programme Pursued\\": \\"Oh \\", \\"Quality of work - performs tasks accurately and pays attention to detail\\": \\"Well Prepared\\", \\"Quantitative skills (Ability to use mathematical concepts)\\": \\"Well Prepared\\", \\"Research and analysis - collects, analyzes and organizes relevant information\\": \\"Well Prepared\\", \\"Responsible - takes responsibility for his/her own actions and decisions\\": \\"Well Prepared\\", \\"Since your graduation have you gone on to take any other programme?\\": \\"Yes\\", \\"Specific job-related skills(e.g. technical skills)\\": \\"Well Prepared\\", \\"Specific job-related theoretical knowledge\\": \\"Well Prepared\\", \\"Submit\\": false, \\"Team-work\\": \\"Well Prepared\\", \\"Time management - sets priorities and allocates time efficiently to complete tasks within deadlines\\": \\"Well Prepared\\", \\"To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were\\": \\"Very helpful\\", \\"Type of Organization\\": \\"Private\\", \\"What is the main reason you are unemployed?\\": \\" There are no jobs available in my filed\\", \\"What is your current monthly gross salary?\\": \\"Below GHC1000\\", \\"Which one of the following best describes your current employment status?\\": \\"Working full-time\\", \\"Work Address\\": \\"Sankofa Avenue 15\\", \\"Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] \\": \\"Yes\\", \\"Year of Completion\\": 2000}"
67	"{\\"(If Yes, What is your current status, If No skip)\\": \\"Enrolled part time\\", \\"Adaptable - adapts to new situations and demands by applying or updating knowledge and skills\\": \\"Well Prepared\\", \\"CSRF Token\\": \\"ImMyOTFkNDAzOGJkYjE0ZTRmODQ5ZjEyMGQxODk2ZjIwYzZkZTI4ODEi.ZOl0vQ.hKm5NX3yQ2VIpgJ4PbeBRB10yis\\", \\"Communication (oral and written) \\\\u2013 speak/write in a clear,concise,correctmanner\\": \\"Well Prepared\\", \\"Comprehension - can restate information, ideas and concepts in different ways\\": \\"Well Prepared\\", \\"Computer skills\\": \\"Well Prepared\\", \\"Country of Residence\\": \\"Ghana\\", \\"Creative and innovative - creates innovative strategies and / or products that meet identified needs\\": \\"Well Prepared\\", \\"Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making\\": \\"Well Prepared\\", \\"Did your degree earned from CU provide the requisite technical know-how of your job?\\": \\"Select\\", \\"Do you have any suggestions for overall service delivery at Central University?\\": \\"Nothing\\", \\"Gender\\": \\"Male\\", \\"Have you ever been employed since graduation?\\": \\"Yes\\", \\"How likely are you to return to the same school?\\": \\"Very likely\\", \\"How likely are you to staying in your current job or profession?\\": \\"Very likely\\", \\"How long did it take you to find your job?\\": \\"I found employment prior to graduation\\", \\"How long did you work?\\": \\"1-3 months\\", \\"How long have you been employed or self-employed?\\": \\" Less than 6 months\\", \\"How related is your current job to your program of study?\\": \\" Fully related\\", \\"How would you rate your overall satisfaction with your university\\\\u2019s preparation for the type of work you were/are doing?\\": \\"Very satisfied\\", \\"In your current job, are you\\": \\"A permanent employee\\", \\"Job title\\": \\"Oh \\", \\"List programme\\": \\"asdf\\", \\"Mobile Number\\": \\"545977791\\", \\"Name of Institution\\": \\"asdf\\", \\"Organization\\": \\"Presto Solutions\\", \\"Organization Address\\": \\"Presto Solutions\\", \\"Organization and planning - determines tasks and resources to complete project objectives\\": \\"Well Prepared\\", \\"Overall how satisfied were you with the academic preparation for your current programme\\": \\"Very satisfied\\", \\"Programme Pursued\\": \\"Oh \\", \\"Quality of work - performs tasks accurately and pays attention to detail\\": \\"Well Prepared\\", \\"Quantitative skills (Ability to use mathematical concepts)\\": \\"Well Prepared\\", \\"Research and analysis - collects, analyzes and organizes relevant information\\": \\"Well Prepared\\", \\"Responsible - takes responsibility for his/her own actions and decisions\\": \\"Well Prepared\\", \\"Since your graduation have you gone on to take any other programme?\\": \\"Yes\\", \\"Specific job-related skills(e.g. technical skills)\\": \\"Well Prepared\\", \\"Specific job-related theoretical knowledge\\": \\"Well Prepared\\", \\"Submit\\": false, \\"Team-work\\": \\"Well Prepared\\", \\"Time management - sets priorities and allocates time efficiently to complete tasks within deadlines\\": \\"Well Prepared\\", \\"To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were\\": \\"Very helpful\\", \\"Type of Organization\\": \\"Private\\", \\"What is the main reason you are unemployed?\\": \\" There are no jobs available in my filed\\", \\"What is your current monthly gross salary?\\": \\"Below GHC1000\\", \\"Which one of the following best describes your current employment status?\\": \\"Working full-time\\", \\"Work Address\\": \\"Sankofa Avenue 15\\", \\"Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] \\": \\"Yes\\", \\"Year of Completion\\": 2000}"
68	"{\\"(If Yes, What is your current status, If No skip)\\": \\"Enrolled part time\\", \\"Adaptable - adapts to new situations and demands by applying or updating knowledge and skills\\": \\"Well Prepared\\", \\"CSRF Token\\": \\"ImUyMzI1M2MzMmI3MTAyMWMxMjRhZTUwNzBmM2Y2ZWM2NWU4YjQ4OTgi.ZOl6hA.RWEmFcwDP6WoB0n_SV2gW2HwWjs\\", \\"Communication (oral and written) \\\\u2013 speak/write in a clear,concise,correctmanner\\": \\"Well Prepared\\", \\"Comprehension - can restate information, ideas and concepts in different ways\\": \\"Well Prepared\\", \\"Computer skills\\": \\"Well Prepared\\", \\"Country of Residence\\": \\"Ghana\\", \\"Creative and innovative - creates innovative strategies and / or products that meet identified needs\\": \\"Well Prepared\\", \\"Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making\\": \\"Well Prepared\\", \\"Did your degree earned from CU provide the requisite technical know-how of your job?\\": \\"Select\\", \\"Do you have any suggestions for overall service delivery at Central University?\\": \\"Nothing\\", \\"Gender\\": \\"Male\\", \\"Have you ever been employed since graduation?\\": \\"Yes\\", \\"How likely are you to return to the same school?\\": \\"Very likely\\", \\"How likely are you to staying in your current job or profession?\\": \\"Very likely\\", \\"How long did it take you to find your job?\\": \\"I found employment prior to graduation\\", \\"How long did you work?\\": \\"1-3 months\\", \\"How long have you been employed or self-employed?\\": \\" Less than 6 months\\", \\"How related is your current job to your program of study?\\": \\" Fully related\\", \\"How would you rate your overall satisfaction with your university\\\\u2019s preparation for the type of work you were/are doing?\\": \\"Very satisfied\\", \\"In your current job, are you\\": \\"A permanent employee\\", \\"Job title\\": \\"Oh \\", \\"List programme\\": \\"\\", \\"Mobile Number\\": \\"545977791\\", \\"Name of Institution\\": \\"\\", \\"Organization\\": \\"Presto Solutions\\", \\"Organization Address\\": \\"Presto Solutions\\", \\"Organization and planning - determines tasks and resources to complete project objectives\\": \\"Well Prepared\\", \\"Overall how satisfied were you with the academic preparation for your current programme\\": \\"Very satisfied\\", \\"Programme Pursued\\": \\"Oh \\", \\"Quality of work - performs tasks accurately and pays attention to detail\\": \\"Well Prepared\\", \\"Quantitative skills (Ability to use mathematical concepts)\\": \\"Well Prepared\\", \\"Research and analysis - collects, analyzes and organizes relevant information\\": \\"Well Prepared\\", \\"Responsible - takes responsibility for his/her own actions and decisions\\": \\"Well Prepared\\", \\"Since your graduation have you gone on to take any other programme?\\": \\"Select\\", \\"Specific job-related skills(e.g. technical skills)\\": \\"Well Prepared\\", \\"Specific job-related theoretical knowledge\\": \\"Well Prepared\\", \\"Submit\\": false, \\"Team-work\\": \\"Well Prepared\\", \\"Time management - sets priorities and allocates time efficiently to complete tasks within deadlines\\": \\"Well Prepared\\", \\"To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were\\": \\"Very helpful\\", \\"Type of Organization\\": \\"Private\\", \\"What is the main reason you are unemployed?\\": \\" There are no jobs available in my filed\\", \\"What is your current monthly gross salary?\\": \\"Below GHC1000\\", \\"Which one of the following best describes your current employment status?\\": \\"Working full-time\\", \\"Work Address\\": \\"Sankofa Avenue 15\\", \\"Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] \\": \\"Yes\\", \\"Year of Completion\\": null}"
69	"{\\"(If Yes, What is your current status, If No skip)\\": \\"Enrolled part time\\", \\"Adaptable - adapts to new situations and demands by applying or updating knowledge and skills\\": \\"Well Prepared\\", \\"CSRF Token\\": \\"ImUyMzI1M2MzMmI3MTAyMWMxMjRhZTUwNzBmM2Y2ZWM2NWU4YjQ4OTgi.ZOl6yQ.07wUHHqB4p599fyGt1mveM_eOZY\\", \\"Communication (oral and written) \\\\u2013 speak/write in a clear,concise,correctmanner\\": \\"Well Prepared\\", \\"Comprehension - can restate information, ideas and concepts in different ways\\": \\"Well Prepared\\", \\"Computer skills\\": \\"Well Prepared\\", \\"Country of Residence\\": \\"Ghana\\", \\"Creative and innovative - creates innovative strategies and / or products that meet identified needs\\": \\"Well Prepared\\", \\"Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making\\": \\"Well Prepared\\", \\"Did your degree earned from CU provide the requisite technical know-how of your job?\\": \\"Select\\", \\"Do you have any suggestions for overall service delivery at Central University?\\": \\"Nothing\\", \\"Gender\\": \\"Male\\", \\"Have you ever been employed since graduation?\\": \\"Yes\\", \\"How likely are you to return to the same school?\\": \\"Very likely\\", \\"How likely are you to staying in your current job or profession?\\": \\"Very likely\\", \\"How long did it take you to find your job?\\": \\"I found employment prior to graduation\\", \\"How long did you work?\\": \\"1-3 months\\", \\"How long have you been employed or self-employed?\\": \\" Less than 6 months\\", \\"How related is your current job to your program of study?\\": \\" Fully related\\", \\"How would you rate your overall satisfaction with your university\\\\u2019s preparation for the type of work you were/are doing?\\": \\"Very satisfied\\", \\"In your current job, are you\\": \\"A permanent employee\\", \\"Job title\\": \\"Oh \\", \\"List programme\\": \\"\\", \\"Mobile Number\\": \\"545977791\\", \\"Name of Institution\\": \\"\\", \\"Organization\\": \\"Presto Solutions\\", \\"Organization Address\\": \\"Presto Solutions\\", \\"Organization and planning - determines tasks and resources to complete project objectives\\": \\"Well Prepared\\", \\"Overall how satisfied were you with the academic preparation for your current programme\\": \\"Very satisfied\\", \\"Programme Pursued\\": \\"Oh \\", \\"Quality of work - performs tasks accurately and pays attention to detail\\": \\"Well Prepared\\", \\"Quantitative skills (Ability to use mathematical concepts)\\": \\"Well Prepared\\", \\"Research and analysis - collects, analyzes and organizes relevant information\\": \\"Well Prepared\\", \\"Responsible - takes responsibility for his/her own actions and decisions\\": \\"Well Prepared\\", \\"Since your graduation have you gone on to take any other programme?\\": \\"Select\\", \\"Specific job-related skills(e.g. technical skills)\\": \\"Well Prepared\\", \\"Specific job-related theoretical knowledge\\": \\"Well Prepared\\", \\"Submit\\": false, \\"Team-work\\": \\"Well Prepared\\", \\"Time management - sets priorities and allocates time efficiently to complete tasks within deadlines\\": \\"Well Prepared\\", \\"To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were\\": \\"Very helpful\\", \\"Type of Organization\\": \\"Private\\", \\"What is the main reason you are unemployed?\\": \\" There are no jobs available in my filed\\", \\"What is your current monthly gross salary?\\": \\"Below GHC1000\\", \\"Which one of the following best describes your current employment status?\\": \\"Working full-time\\", \\"Work Address\\": \\"Sankofa Avenue 15\\", \\"Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] \\": \\"Yes\\", \\"Year of Completion\\": null}"
70	"{\\"(If Yes, What is your current status, If No skip)\\": \\"Enrolled part time\\", \\"Adaptable - adapts to new situations and demands by applying or updating knowledge and skills\\": \\"Well Prepared\\", \\"CSRF Token\\": \\"ImUyMzI1M2MzMmI3MTAyMWMxMjRhZTUwNzBmM2Y2ZWM2NWU4YjQ4OTgi.ZOl6yQ.07wUHHqB4p599fyGt1mveM_eOZY\\", \\"Communication (oral and written) \\\\u2013 speak/write in a clear,concise,correctmanner\\": \\"Well Prepared\\", \\"Comprehension - can restate information, ideas and concepts in different ways\\": \\"Well Prepared\\", \\"Computer skills\\": \\"Well Prepared\\", \\"Country of Residence\\": \\"Ghana\\", \\"Creative and innovative - creates innovative strategies and / or products that meet identified needs\\": \\"Well Prepared\\", \\"Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making\\": \\"Well Prepared\\", \\"Did your degree earned from CU provide the requisite technical know-how of your job?\\": \\"Select\\", \\"Do you have any suggestions for overall service delivery at Central University?\\": \\"Nothing\\", \\"Gender\\": \\"Male\\", \\"Have you ever been employed since graduation?\\": \\"Yes\\", \\"How likely are you to return to the same school?\\": \\"Very likely\\", \\"How likely are you to staying in your current job or profession?\\": \\"Very likely\\", \\"How long did it take you to find your job?\\": \\"I found employment prior to graduation\\", \\"How long did you work?\\": \\"1-3 months\\", \\"How long have you been employed or self-employed?\\": \\" Less than 6 months\\", \\"How related is your current job to your program of study?\\": \\" Fully related\\", \\"How would you rate your overall satisfaction with your university\\\\u2019s preparation for the type of work you were/are doing?\\": \\"Very satisfied\\", \\"In your current job, are you\\": \\"A permanent employee\\", \\"Job title\\": \\"Oh \\", \\"List programme\\": \\"\\", \\"Mobile Number\\": \\"545977791\\", \\"Name of Institution\\": \\"\\", \\"Organization\\": \\"Presto Solutions\\", \\"Organization Address\\": \\"Presto Solutions\\", \\"Organization and planning - determines tasks and resources to complete project objectives\\": \\"Well Prepared\\", \\"Overall how satisfied were you with the academic preparation for your current programme\\": \\"Very satisfied\\", \\"Programme Pursued\\": \\"Oh \\", \\"Quality of work - performs tasks accurately and pays attention to detail\\": \\"Well Prepared\\", \\"Quantitative skills (Ability to use mathematical concepts)\\": \\"Well Prepared\\", \\"Research and analysis - collects, analyzes and organizes relevant information\\": \\"Well Prepared\\", \\"Responsible - takes responsibility for his/her own actions and decisions\\": \\"Well Prepared\\", \\"Since your graduation have you gone on to take any other programme?\\": \\"Select\\", \\"Specific job-related skills(e.g. technical skills)\\": \\"Well Prepared\\", \\"Specific job-related theoretical knowledge\\": \\"Well Prepared\\", \\"Submit\\": false, \\"Team-work\\": \\"Well Prepared\\", \\"Time management - sets priorities and allocates time efficiently to complete tasks within deadlines\\": \\"Well Prepared\\", \\"To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were\\": \\"Very helpful\\", \\"Type of Organization\\": \\"Private\\", \\"What is the main reason you are unemployed?\\": \\" There are no jobs available in my filed\\", \\"What is your current monthly gross salary?\\": \\"Below GHC1000\\", \\"Which one of the following best describes your current employment status?\\": \\"Working full-time\\", \\"Work Address\\": \\"Sankofa Avenue 15\\", \\"Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] \\": \\"Yes\\", \\"Year of Completion\\": null}"
71	"{\\"(If Yes, What is your current status, If No skip)\\": \\"Enrolled part time\\", \\"Adaptable - adapts to new situations and demands by applying or updating knowledge and skills\\": \\"Well Prepared\\", \\"CSRF Token\\": \\"ImUyMzI1M2MzMmI3MTAyMWMxMjRhZTUwNzBmM2Y2ZWM2NWU4YjQ4OTgi.ZOl6yQ.07wUHHqB4p599fyGt1mveM_eOZY\\", \\"Communication (oral and written) \\\\u2013 speak/write in a clear,concise,correctmanner\\": \\"Well Prepared\\", \\"Comprehension - can restate information, ideas and concepts in different ways\\": \\"Well Prepared\\", \\"Computer skills\\": \\"Well Prepared\\", \\"Country of Residence\\": \\"Ghana\\", \\"Creative and innovative - creates innovative strategies and / or products that meet identified needs\\": \\"Well Prepared\\", \\"Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making\\": \\"Well Prepared\\", \\"Did your degree earned from CU provide the requisite technical know-how of your job?\\": \\"Select\\", \\"Do you have any suggestions for overall service delivery at Central University?\\": \\"Nothing\\", \\"Gender\\": \\"Male\\", \\"Have you ever been employed since graduation?\\": \\"Yes\\", \\"How likely are you to return to the same school?\\": \\"Very likely\\", \\"How likely are you to staying in your current job or profession?\\": \\"Very likely\\", \\"How long did it take you to find your job?\\": \\"I found employment prior to graduation\\", \\"How long did you work?\\": \\"1-3 months\\", \\"How long have you been employed or self-employed?\\": \\" Less than 6 months\\", \\"How related is your current job to your program of study?\\": \\" Fully related\\", \\"How would you rate your overall satisfaction with your university\\\\u2019s preparation for the type of work you were/are doing?\\": \\"Very satisfied\\", \\"In your current job, are you\\": \\"A permanent employee\\", \\"Job title\\": \\"Oh \\", \\"List programme\\": \\"\\", \\"Mobile Number\\": \\"545977791\\", \\"Name of Institution\\": \\"\\", \\"Organization\\": \\"Presto Solutions\\", \\"Organization Address\\": \\"Presto Solutions\\", \\"Organization and planning - determines tasks and resources to complete project objectives\\": \\"Well Prepared\\", \\"Overall how satisfied were you with the academic preparation for your current programme\\": \\"Very satisfied\\", \\"Programme Pursued\\": \\"Oh \\", \\"Quality of work - performs tasks accurately and pays attention to detail\\": \\"Well Prepared\\", \\"Quantitative skills (Ability to use mathematical concepts)\\": \\"Well Prepared\\", \\"Research and analysis - collects, analyzes and organizes relevant information\\": \\"Well Prepared\\", \\"Responsible - takes responsibility for his/her own actions and decisions\\": \\"Well Prepared\\", \\"Since your graduation have you gone on to take any other programme?\\": \\"Select\\", \\"Specific job-related skills(e.g. technical skills)\\": \\"Well Prepared\\", \\"Specific job-related theoretical knowledge\\": \\"Well Prepared\\", \\"Submit\\": false, \\"Team-work\\": \\"Well Prepared\\", \\"Time management - sets priorities and allocates time efficiently to complete tasks within deadlines\\": \\"Well Prepared\\", \\"To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were\\": \\"Very helpful\\", \\"Type of Organization\\": \\"Private\\", \\"What is the main reason you are unemployed?\\": \\" There are no jobs available in my filed\\", \\"What is your current monthly gross salary?\\": \\"Below GHC1000\\", \\"Which one of the following best describes your current employment status?\\": \\"Working full-time\\", \\"Work Address\\": \\"Sankofa Avenue 15\\", \\"Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] \\": \\"Yes\\", \\"Year of Completion\\": null}"
72	"{\\"(If Yes, What is your current status, If No skip)\\": \\"Enrolled part time\\", \\"Adaptable - adapts to new situations and demands by applying or updating knowledge and skills\\": \\"Well Prepared\\", \\"CSRF Token\\": \\"ImUyMzI1M2MzMmI3MTAyMWMxMjRhZTUwNzBmM2Y2ZWM2NWU4YjQ4OTgi.ZOl70g.boqf5_HnfFSfrw5YADDn4OAYSr0\\", \\"Communication (oral and written) \\\\u2013 speak/write in a clear,concise,correctmanner\\": \\"Well Prepared\\", \\"Comprehension - can restate information, ideas and concepts in different ways\\": \\"Well Prepared\\", \\"Computer skills\\": \\"Well Prepared\\", \\"Country of Residence\\": \\"Ghana\\", \\"Creative and innovative - creates innovative strategies and / or products that meet identified needs\\": \\"Well Prepared\\", \\"Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making\\": \\"Well Prepared\\", \\"Did your degree earned from CU provide the requisite technical know-how of your job?\\": \\"No\\", \\"Do you have any suggestions for overall service delivery at Central University?\\": \\"asdf\\", \\"Gender\\": \\"Male\\", \\"Have you ever been employed since graduation?\\": \\"Yes\\", \\"How likely are you to return to the same school?\\": \\"Very likely\\", \\"How likely are you to staying in your current job or profession?\\": \\"Very likely\\", \\"How long did it take you to find your job?\\": \\"I found employment prior to graduation\\", \\"How long did you work?\\": \\"1-3 months\\", \\"How long have you been employed or self-employed?\\": \\" Less than 6 months\\", \\"How related is your current job to your program of study?\\": \\" Fully related\\", \\"How would you rate your overall satisfaction with your university\\\\u2019s preparation for the type of work you were/are doing?\\": \\"Very satisfied\\", \\"In your current job, are you\\": \\"A permanent employee\\", \\"Job title\\": \\"123\\", \\"List programme\\": \\"123\\", \\"Mobile Number\\": \\"545977791\\", \\"Name of Institution\\": \\"123\\", \\"Organization\\": \\"123\\", \\"Organization Address\\": \\"123\\", \\"Organization and planning - determines tasks and resources to complete project objectives\\": \\"Well Prepared\\", \\"Overall how satisfied were you with the academic preparation for your current programme\\": \\"Very satisfied\\", \\"Programme Pursued\\": \\"Oh \\", \\"Quality of work - performs tasks accurately and pays attention to detail\\": \\"Well Prepared\\", \\"Quantitative skills (Ability to use mathematical concepts)\\": \\"Well Prepared\\", \\"Research and analysis - collects, analyzes and organizes relevant information\\": \\"Well Prepared\\", \\"Responsible - takes responsibility for his/her own actions and decisions\\": \\"Well Prepared\\", \\"Since your graduation have you gone on to take any other programme?\\": \\"Yes\\", \\"Specific job-related skills(e.g. technical skills)\\": \\"Well Prepared\\", \\"Specific job-related theoretical knowledge\\": \\"Well Prepared\\", \\"Submit\\": false, \\"Team-work\\": \\"Well Prepared\\", \\"Time management - sets priorities and allocates time efficiently to complete tasks within deadlines\\": \\"Well Prepared\\", \\"To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were\\": \\"Very helpful\\", \\"Type of Organization\\": \\"Private\\", \\"What is the main reason you are unemployed?\\": \\" There are no jobs available in my filed\\", \\"What is your current monthly gross salary?\\": \\"Below GHC1000\\", \\"Which one of the following best describes your current employment status?\\": \\"Working full-time\\", \\"Work Address\\": \\"Sankofa Avenue 15\\", \\"Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] \\": \\"Yes\\", \\"Year of Completion\\": 123}"
73	"{\\"(If Yes, What is your current status, If No skip)\\": \\"Enrolled part time\\", \\"Adaptable - adapts to new situations and demands by applying or updating knowledge and skills\\": \\"Well Prepared\\", \\"CSRF Token\\": \\"ImUyMzI1M2MzMmI3MTAyMWMxMjRhZTUwNzBmM2Y2ZWM2NWU4YjQ4OTgi.ZOl70g.boqf5_HnfFSfrw5YADDn4OAYSr0\\", \\"Communication (oral and written) \\\\u2013 speak/write in a clear,concise,correctmanner\\": \\"Well Prepared\\", \\"Comprehension - can restate information, ideas and concepts in different ways\\": \\"Well Prepared\\", \\"Computer skills\\": \\"Well Prepared\\", \\"Country of Residence\\": \\"Ghana\\", \\"Creative and innovative - creates innovative strategies and / or products that meet identified needs\\": \\"Well Prepared\\", \\"Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making\\": \\"Well Prepared\\", \\"Did your degree earned from CU provide the requisite technical know-how of your job?\\": \\"No\\", \\"Do you have any suggestions for overall service delivery at Central University?\\": \\"asdf\\", \\"Gender\\": \\"Male\\", \\"Have you ever been employed since graduation?\\": \\"Yes\\", \\"How likely are you to return to the same school?\\": \\"Very likely\\", \\"How likely are you to staying in your current job or profession?\\": \\"Very likely\\", \\"How long did it take you to find your job?\\": \\"I found employment prior to graduation\\", \\"How long did you work?\\": \\"1-3 months\\", \\"How long have you been employed or self-employed?\\": \\" Less than 6 months\\", \\"How related is your current job to your program of study?\\": \\" Fully related\\", \\"How would you rate your overall satisfaction with your university\\\\u2019s preparation for the type of work you were/are doing?\\": \\"Very satisfied\\", \\"In your current job, are you\\": \\"A permanent employee\\", \\"Job title\\": \\"123\\", \\"List programme\\": \\"123\\", \\"Mobile Number\\": \\"545977791\\", \\"Name of Institution\\": \\"123\\", \\"Organization\\": \\"123\\", \\"Organization Address\\": \\"123\\", \\"Organization and planning - determines tasks and resources to complete project objectives\\": \\"Well Prepared\\", \\"Overall how satisfied were you with the academic preparation for your current programme\\": \\"Very satisfied\\", \\"Programme Pursued\\": \\"Oh \\", \\"Quality of work - performs tasks accurately and pays attention to detail\\": \\"Well Prepared\\", \\"Quantitative skills (Ability to use mathematical concepts)\\": \\"Well Prepared\\", \\"Research and analysis - collects, analyzes and organizes relevant information\\": \\"Well Prepared\\", \\"Responsible - takes responsibility for his/her own actions and decisions\\": \\"Well Prepared\\", \\"Since your graduation have you gone on to take any other programme?\\": \\"Yes\\", \\"Specific job-related skills(e.g. technical skills)\\": \\"Well Prepared\\", \\"Specific job-related theoretical knowledge\\": \\"Well Prepared\\", \\"Submit\\": false, \\"Team-work\\": \\"Well Prepared\\", \\"Time management - sets priorities and allocates time efficiently to complete tasks within deadlines\\": \\"Well Prepared\\", \\"To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were\\": \\"Very helpful\\", \\"Type of Organization\\": \\"Private\\", \\"What is the main reason you are unemployed?\\": \\" There are no jobs available in my filed\\", \\"What is your current monthly gross salary?\\": \\"Below GHC1000\\", \\"Which one of the following best describes your current employment status?\\": \\"Working full-time\\", \\"Work Address\\": \\"Sankofa Avenue 15\\", \\"Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] \\": \\"Yes\\", \\"Year of Completion\\": 123}"
74	"{\\"(If Yes, What is your current status, If No skip)\\": \\"Enrolled part time\\", \\"Adaptable - adapts to new situations and demands by applying or updating knowledge and skills\\": \\"Well Prepared\\", \\"CSRF Token\\": \\"ImUyMzI1M2MzMmI3MTAyMWMxMjRhZTUwNzBmM2Y2ZWM2NWU4YjQ4OTgi.ZOl70g.boqf5_HnfFSfrw5YADDn4OAYSr0\\", \\"Communication (oral and written) \\\\u2013 speak/write in a clear,concise,correctmanner\\": \\"Well Prepared\\", \\"Comprehension - can restate information, ideas and concepts in different ways\\": \\"Well Prepared\\", \\"Computer skills\\": \\"Well Prepared\\", \\"Country of Residence\\": \\"Ghana\\", \\"Creative and innovative - creates innovative strategies and / or products that meet identified needs\\": \\"Well Prepared\\", \\"Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making\\": \\"Well Prepared\\", \\"Did your degree earned from CU provide the requisite technical know-how of your job?\\": \\"No\\", \\"Do you have any suggestions for overall service delivery at Central University?\\": \\"asdf\\", \\"Gender\\": \\"Male\\", \\"Have you ever been employed since graduation?\\": \\"Yes\\", \\"How likely are you to return to the same school?\\": \\"Very likely\\", \\"How likely are you to staying in your current job or profession?\\": \\"Very likely\\", \\"How long did it take you to find your job?\\": \\"I found employment prior to graduation\\", \\"How long did you work?\\": \\"1-3 months\\", \\"How long have you been employed or self-employed?\\": \\" Less than 6 months\\", \\"How related is your current job to your program of study?\\": \\" Fully related\\", \\"How would you rate your overall satisfaction with your university\\\\u2019s preparation for the type of work you were/are doing?\\": \\"Very satisfied\\", \\"In your current job, are you\\": \\"A permanent employee\\", \\"Job title\\": \\"123\\", \\"List programme\\": \\"123\\", \\"Mobile Number\\": \\"545977791\\", \\"Name of Institution\\": \\"123\\", \\"Organization\\": \\"123\\", \\"Organization Address\\": \\"123\\", \\"Organization and planning - determines tasks and resources to complete project objectives\\": \\"Well Prepared\\", \\"Overall how satisfied were you with the academic preparation for your current programme\\": \\"Very satisfied\\", \\"Programme Pursued\\": \\"Oh \\", \\"Quality of work - performs tasks accurately and pays attention to detail\\": \\"Well Prepared\\", \\"Quantitative skills (Ability to use mathematical concepts)\\": \\"Well Prepared\\", \\"Research and analysis - collects, analyzes and organizes relevant information\\": \\"Well Prepared\\", \\"Responsible - takes responsibility for his/her own actions and decisions\\": \\"Well Prepared\\", \\"Since your graduation have you gone on to take any other programme?\\": \\"Yes\\", \\"Specific job-related skills(e.g. technical skills)\\": \\"Well Prepared\\", \\"Specific job-related theoretical knowledge\\": \\"Well Prepared\\", \\"Submit\\": false, \\"Team-work\\": \\"Well Prepared\\", \\"Time management - sets priorities and allocates time efficiently to complete tasks within deadlines\\": \\"Well Prepared\\", \\"To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were\\": \\"Very helpful\\", \\"Type of Organization\\": \\"Private\\", \\"What is the main reason you are unemployed?\\": \\" There are no jobs available in my filed\\", \\"What is your current monthly gross salary?\\": \\"Below GHC1000\\", \\"Which one of the following best describes your current employment status?\\": \\"Working full-time\\", \\"Work Address\\": \\"Sankofa Avenue 15\\", \\"Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] \\": \\"Yes\\", \\"Year of Completion\\": 123}"
75	"{\\"(If Yes, What is your current status, If No skip)\\": \\"Enrolled part time\\", \\"Adaptable - adapts to new situations and demands by applying or updating knowledge and skills\\": \\"Well Prepared\\", \\"CSRF Token\\": \\"ImUyMzI1M2MzMmI3MTAyMWMxMjRhZTUwNzBmM2Y2ZWM2NWU4YjQ4OTgi.ZOl70g.boqf5_HnfFSfrw5YADDn4OAYSr0\\", \\"Communication (oral and written) \\\\u2013 speak/write in a clear,concise,correctmanner\\": \\"Well Prepared\\", \\"Comprehension - can restate information, ideas and concepts in different ways\\": \\"Well Prepared\\", \\"Computer skills\\": \\"Well Prepared\\", \\"Country of Residence\\": \\"Ghana\\", \\"Creative and innovative - creates innovative strategies and / or products that meet identified needs\\": \\"Well Prepared\\", \\"Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making\\": \\"Well Prepared\\", \\"Did your degree earned from CU provide the requisite technical know-how of your job?\\": \\"No\\", \\"Do you have any suggestions for overall service delivery at Central University?\\": \\"asdf\\", \\"Gender\\": \\"Male\\", \\"Have you ever been employed since graduation?\\": \\"Yes\\", \\"How likely are you to return to the same school?\\": \\"Very likely\\", \\"How likely are you to staying in your current job or profession?\\": \\"Very likely\\", \\"How long did it take you to find your job?\\": \\"I found employment prior to graduation\\", \\"How long did you work?\\": \\"1-3 months\\", \\"How long have you been employed or self-employed?\\": \\" Less than 6 months\\", \\"How related is your current job to your program of study?\\": \\" Fully related\\", \\"How would you rate your overall satisfaction with your university\\\\u2019s preparation for the type of work you were/are doing?\\": \\"Very satisfied\\", \\"In your current job, are you\\": \\"A permanent employee\\", \\"Job title\\": \\"123\\", \\"List programme\\": \\"123\\", \\"Mobile Number\\": \\"545977791\\", \\"Name of Institution\\": \\"123\\", \\"Organization\\": \\"123\\", \\"Organization Address\\": \\"123\\", \\"Organization and planning - determines tasks and resources to complete project objectives\\": \\"Well Prepared\\", \\"Overall how satisfied were you with the academic preparation for your current programme\\": \\"Very satisfied\\", \\"Programme Pursued\\": \\"Oh \\", \\"Quality of work - performs tasks accurately and pays attention to detail\\": \\"Well Prepared\\", \\"Quantitative skills (Ability to use mathematical concepts)\\": \\"Well Prepared\\", \\"Research and analysis - collects, analyzes and organizes relevant information\\": \\"Well Prepared\\", \\"Responsible - takes responsibility for his/her own actions and decisions\\": \\"Well Prepared\\", \\"Since your graduation have you gone on to take any other programme?\\": \\"Yes\\", \\"Specific job-related skills(e.g. technical skills)\\": \\"Well Prepared\\", \\"Specific job-related theoretical knowledge\\": \\"Well Prepared\\", \\"Submit\\": false, \\"Team-work\\": \\"Well Prepared\\", \\"Time management - sets priorities and allocates time efficiently to complete tasks within deadlines\\": \\"Well Prepared\\", \\"To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were\\": \\"Very helpful\\", \\"Type of Organization\\": \\"Private\\", \\"What is the main reason you are unemployed?\\": \\" There are no jobs available in my filed\\", \\"What is your current monthly gross salary?\\": \\"Below GHC1000\\", \\"Which one of the following best describes your current employment status?\\": \\"Working full-time\\", \\"Work Address\\": \\"Sankofa Avenue 15\\", \\"Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] \\": \\"Yes\\", \\"Year of Completion\\": 123}"
76	"{\\"(If Yes, What is your current status, If No skip)\\": \\"Enrolled part time\\", \\"Adaptable - adapts to new situations and demands by applying or updating knowledge and skills\\": \\"Well Prepared\\", \\"CSRF Token\\": \\"ImUyMzI1M2MzMmI3MTAyMWMxMjRhZTUwNzBmM2Y2ZWM2NWU4YjQ4OTgi.ZOl70g.boqf5_HnfFSfrw5YADDn4OAYSr0\\", \\"Communication (oral and written) \\\\u2013 speak/write in a clear,concise,correctmanner\\": \\"Well Prepared\\", \\"Comprehension - can restate information, ideas and concepts in different ways\\": \\"Well Prepared\\", \\"Computer skills\\": \\"Well Prepared\\", \\"Country of Residence\\": \\"Ghana\\", \\"Creative and innovative - creates innovative strategies and / or products that meet identified needs\\": \\"Well Prepared\\", \\"Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making\\": \\"Well Prepared\\", \\"Did your degree earned from CU provide the requisite technical know-how of your job?\\": \\"No\\", \\"Do you have any suggestions for overall service delivery at Central University?\\": \\"asdf\\", \\"Gender\\": \\"Male\\", \\"Have you ever been employed since graduation?\\": \\"Yes\\", \\"How likely are you to return to the same school?\\": \\"Very likely\\", \\"How likely are you to staying in your current job or profession?\\": \\"Very likely\\", \\"How long did it take you to find your job?\\": \\"I found employment prior to graduation\\", \\"How long did you work?\\": \\"1-3 months\\", \\"How long have you been employed or self-employed?\\": \\" Less than 6 months\\", \\"How related is your current job to your program of study?\\": \\" Fully related\\", \\"How would you rate your overall satisfaction with your university\\\\u2019s preparation for the type of work you were/are doing?\\": \\"Very satisfied\\", \\"In your current job, are you\\": \\"A permanent employee\\", \\"Job title\\": \\"123\\", \\"List programme\\": \\"123\\", \\"Mobile Number\\": \\"545977791\\", \\"Name of Institution\\": \\"123\\", \\"Organization\\": \\"123\\", \\"Organization Address\\": \\"123\\", \\"Organization and planning - determines tasks and resources to complete project objectives\\": \\"Well Prepared\\", \\"Overall how satisfied were you with the academic preparation for your current programme\\": \\"Very satisfied\\", \\"Programme Pursued\\": \\"Oh \\", \\"Quality of work - performs tasks accurately and pays attention to detail\\": \\"Well Prepared\\", \\"Quantitative skills (Ability to use mathematical concepts)\\": \\"Well Prepared\\", \\"Research and analysis - collects, analyzes and organizes relevant information\\": \\"Well Prepared\\", \\"Responsible - takes responsibility for his/her own actions and decisions\\": \\"Well Prepared\\", \\"Since your graduation have you gone on to take any other programme?\\": \\"Yes\\", \\"Specific job-related skills(e.g. technical skills)\\": \\"Well Prepared\\", \\"Specific job-related theoretical knowledge\\": \\"Well Prepared\\", \\"Submit\\": false, \\"Team-work\\": \\"Well Prepared\\", \\"Time management - sets priorities and allocates time efficiently to complete tasks within deadlines\\": \\"Well Prepared\\", \\"To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were\\": \\"Very helpful\\", \\"Type of Organization\\": \\"Private\\", \\"What is the main reason you are unemployed?\\": \\" There are no jobs available in my filed\\", \\"What is your current monthly gross salary?\\": \\"Below GHC1000\\", \\"Which one of the following best describes your current employment status?\\": \\"Working full-time\\", \\"Work Address\\": \\"Sankofa Avenue 15\\", \\"Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] \\": \\"Yes\\", \\"Year of Completion\\": 123}"
77	"{\\"(If Yes, What is your current status, If No skip)\\": \\"Enrolled part time\\", \\"Adaptable - adapts to new situations and demands by applying or updating knowledge and skills\\": \\"Well Prepared\\", \\"CSRF Token\\": \\"ImUyMzI1M2MzMmI3MTAyMWMxMjRhZTUwNzBmM2Y2ZWM2NWU4YjQ4OTgi.ZOl70g.boqf5_HnfFSfrw5YADDn4OAYSr0\\", \\"Communication (oral and written) \\\\u2013 speak/write in a clear,concise,correctmanner\\": \\"Well Prepared\\", \\"Comprehension - can restate information, ideas and concepts in different ways\\": \\"Well Prepared\\", \\"Computer skills\\": \\"Well Prepared\\", \\"Country of Residence\\": \\"Ghana\\", \\"Creative and innovative - creates innovative strategies and / or products that meet identified needs\\": \\"Well Prepared\\", \\"Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making\\": \\"Well Prepared\\", \\"Did your degree earned from CU provide the requisite technical know-how of your job?\\": \\"No\\", \\"Do you have any suggestions for overall service delivery at Central University?\\": \\"asdf\\", \\"Gender\\": \\"Male\\", \\"Have you ever been employed since graduation?\\": \\"Yes\\", \\"How likely are you to return to the same school?\\": \\"Very likely\\", \\"How likely are you to staying in your current job or profession?\\": \\"Very likely\\", \\"How long did it take you to find your job?\\": \\"I found employment prior to graduation\\", \\"How long did you work?\\": \\"1-3 months\\", \\"How long have you been employed or self-employed?\\": \\" Less than 6 months\\", \\"How related is your current job to your program of study?\\": \\" Fully related\\", \\"How would you rate your overall satisfaction with your university\\\\u2019s preparation for the type of work you were/are doing?\\": \\"Very satisfied\\", \\"In your current job, are you\\": \\"A permanent employee\\", \\"Job title\\": \\"123\\", \\"List programme\\": \\"123\\", \\"Mobile Number\\": \\"545977791\\", \\"Name of Institution\\": \\"123\\", \\"Organization\\": \\"123\\", \\"Organization Address\\": \\"123\\", \\"Organization and planning - determines tasks and resources to complete project objectives\\": \\"Well Prepared\\", \\"Overall how satisfied were you with the academic preparation for your current programme\\": \\"Very satisfied\\", \\"Programme Pursued\\": \\"Oh \\", \\"Quality of work - performs tasks accurately and pays attention to detail\\": \\"Well Prepared\\", \\"Quantitative skills (Ability to use mathematical concepts)\\": \\"Well Prepared\\", \\"Research and analysis - collects, analyzes and organizes relevant information\\": \\"Well Prepared\\", \\"Responsible - takes responsibility for his/her own actions and decisions\\": \\"Well Prepared\\", \\"Since your graduation have you gone on to take any other programme?\\": \\"Yes\\", \\"Specific job-related skills(e.g. technical skills)\\": \\"Well Prepared\\", \\"Specific job-related theoretical knowledge\\": \\"Well Prepared\\", \\"Submit\\": false, \\"Team-work\\": \\"Well Prepared\\", \\"Time management - sets priorities and allocates time efficiently to complete tasks within deadlines\\": \\"Well Prepared\\", \\"To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were\\": \\"Very helpful\\", \\"Type of Organization\\": \\"Private\\", \\"What is the main reason you are unemployed?\\": \\" There are no jobs available in my filed\\", \\"What is your current monthly gross salary?\\": \\"Below GHC1000\\", \\"Which one of the following best describes your current employment status?\\": \\"Working full-time\\", \\"Work Address\\": \\"Sankofa Avenue 15\\", \\"Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] \\": \\"Yes\\", \\"Year of Completion\\": 123}"
78	"{\\"(If Yes, What is your current status, If No skip)\\": \\"Enrolled part time\\", \\"Adaptable - adapts to new situations and demands by applying or updating knowledge and skills\\": \\"Well Prepared\\", \\"CSRF Token\\": \\"ImUyMzI1M2MzMmI3MTAyMWMxMjRhZTUwNzBmM2Y2ZWM2NWU4YjQ4OTgi.ZOl70g.boqf5_HnfFSfrw5YADDn4OAYSr0\\", \\"Communication (oral and written) \\\\u2013 speak/write in a clear,concise,correctmanner\\": \\"Well Prepared\\", \\"Comprehension - can restate information, ideas and concepts in different ways\\": \\"Well Prepared\\", \\"Computer skills\\": \\"Well Prepared\\", \\"Country of Residence\\": \\"Ghana\\", \\"Creative and innovative - creates innovative strategies and / or products that meet identified needs\\": \\"Well Prepared\\", \\"Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making\\": \\"Well Prepared\\", \\"Did your degree earned from CU provide the requisite technical know-how of your job?\\": \\"No\\", \\"Do you have any suggestions for overall service delivery at Central University?\\": \\"asdf\\", \\"Gender\\": \\"Male\\", \\"Have you ever been employed since graduation?\\": \\"Yes\\", \\"How likely are you to return to the same school?\\": \\"Very likely\\", \\"How likely are you to staying in your current job or profession?\\": \\"Very likely\\", \\"How long did it take you to find your job?\\": \\"I found employment prior to graduation\\", \\"How long did you work?\\": \\"1-3 months\\", \\"How long have you been employed or self-employed?\\": \\" Less than 6 months\\", \\"How related is your current job to your program of study?\\": \\" Fully related\\", \\"How would you rate your overall satisfaction with your university\\\\u2019s preparation for the type of work you were/are doing?\\": \\"Very satisfied\\", \\"In your current job, are you\\": \\"A permanent employee\\", \\"Job title\\": \\"123\\", \\"List programme\\": \\"123\\", \\"Mobile Number\\": \\"545977791\\", \\"Name of Institution\\": \\"123\\", \\"Organization\\": \\"123\\", \\"Organization Address\\": \\"123\\", \\"Organization and planning - determines tasks and resources to complete project objectives\\": \\"Well Prepared\\", \\"Overall how satisfied were you with the academic preparation for your current programme\\": \\"Very satisfied\\", \\"Programme Pursued\\": \\"Oh \\", \\"Quality of work - performs tasks accurately and pays attention to detail\\": \\"Well Prepared\\", \\"Quantitative skills (Ability to use mathematical concepts)\\": \\"Well Prepared\\", \\"Research and analysis - collects, analyzes and organizes relevant information\\": \\"Well Prepared\\", \\"Responsible - takes responsibility for his/her own actions and decisions\\": \\"Well Prepared\\", \\"Since your graduation have you gone on to take any other programme?\\": \\"Yes\\", \\"Specific job-related skills(e.g. technical skills)\\": \\"Well Prepared\\", \\"Specific job-related theoretical knowledge\\": \\"Well Prepared\\", \\"Submit\\": false, \\"Team-work\\": \\"Well Prepared\\", \\"Time management - sets priorities and allocates time efficiently to complete tasks within deadlines\\": \\"Well Prepared\\", \\"To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were\\": \\"Very helpful\\", \\"Type of Organization\\": \\"Private\\", \\"What is the main reason you are unemployed?\\": \\" There are no jobs available in my filed\\", \\"What is your current monthly gross salary?\\": \\"Below GHC1000\\", \\"Which one of the following best describes your current employment status?\\": \\"Working full-time\\", \\"Work Address\\": \\"Sankofa Avenue 15\\", \\"Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] \\": \\"Yes\\", \\"Year of Completion\\": 123}"
79	"{\\"(If Yes, What is your current status, If No skip)\\": \\"Enrolled part time\\", \\"Adaptable - adapts to new situations and demands by applying or updating knowledge and skills\\": \\"Well Prepared\\", \\"CSRF Token\\": \\"ImUyMzI1M2MzMmI3MTAyMWMxMjRhZTUwNzBmM2Y2ZWM2NWU4YjQ4OTgi.ZOmAEQ.dCQt6chtYmWRLxZKP5cbWDdMXV4\\", \\"Communication (oral and written) \\\\u2013 speak/write in a clear,concise,correctmanner\\": \\"Well Prepared\\", \\"Comprehension - can restate information, ideas and concepts in different ways\\": \\"Well Prepared\\", \\"Computer skills\\": \\"Well Prepared\\", \\"Country of Residence\\": \\"Ghana\\", \\"Creative and innovative - creates innovative strategies and / or products that meet identified needs\\": \\"Well Prepared\\", \\"Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making\\": \\"Well Prepared\\", \\"Did your degree earned from CU provide the requisite technical know-how of your job?\\": \\"No\\", \\"Do you have any suggestions for overall service delivery at Central University?\\": \\"asdf\\", \\"Gender\\": \\"Male\\", \\"Have you ever been employed since graduation?\\": \\"Yes\\", \\"How likely are you to return to the same school?\\": \\"Very likely\\", \\"How likely are you to staying in your current job or profession?\\": \\"Very likely\\", \\"How long did it take you to find your job?\\": \\"I found employment prior to graduation\\", \\"How long did you work?\\": \\"1-3 months\\", \\"How long have you been employed or self-employed?\\": \\" Less than 6 months\\", \\"How related is your current job to your program of study?\\": \\" Fully related\\", \\"How would you rate your overall satisfaction with your university\\\\u2019s preparation for the type of work you were/are doing?\\": \\"Very satisfied\\", \\"In your current job, are you\\": \\"A permanent employee\\", \\"Job title\\": \\"123\\", \\"List programme\\": \\"123\\", \\"Mobile Number\\": \\"545977791\\", \\"Name of Institution\\": \\"123\\", \\"Organization\\": \\"123\\", \\"Organization Address\\": \\"123\\", \\"Organization and planning - determines tasks and resources to complete project objectives\\": \\"Well Prepared\\", \\"Overall how satisfied were you with the academic preparation for your current programme\\": \\"Very satisfied\\", \\"Programme Pursued\\": \\"Oh \\", \\"Quality of work - performs tasks accurately and pays attention to detail\\": \\"Well Prepared\\", \\"Quantitative skills (Ability to use mathematical concepts)\\": \\"Well Prepared\\", \\"Research and analysis - collects, analyzes and organizes relevant information\\": \\"Well Prepared\\", \\"Responsible - takes responsibility for his/her own actions and decisions\\": \\"Well Prepared\\", \\"Since your graduation have you gone on to take any other programme?\\": \\"Yes\\", \\"Specific job-related skills(e.g. technical skills)\\": \\"Well Prepared\\", \\"Specific job-related theoretical knowledge\\": \\"Well Prepared\\", \\"Submit\\": false, \\"Team-work\\": \\"Well Prepared\\", \\"Time management - sets priorities and allocates time efficiently to complete tasks within deadlines\\": \\"Well Prepared\\", \\"To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were\\": \\"Very helpful\\", \\"Type of Organization\\": \\"Private\\", \\"What is the main reason you are unemployed?\\": \\" There are no jobs available in my filed\\", \\"What is your current monthly gross salary?\\": \\"Below GHC1000\\", \\"Which one of the following best describes your current employment status?\\": \\"Working full-time\\", \\"Work Address\\": \\"Sankofa Avenue 15\\", \\"Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] \\": \\"Yes\\", \\"Year of Completion\\": 123}"
80	"{\\"(If Yes, What is your current status, If No skip)\\": \\"Enrolled part time\\", \\"Adaptable - adapts to new situations and demands by applying or updating knowledge and skills\\": \\"Well Prepared\\", \\"CSRF Token\\": \\"ImUyMzI1M2MzMmI3MTAyMWMxMjRhZTUwNzBmM2Y2ZWM2NWU4YjQ4OTgi.ZOmIBw.9nSBZWNHxwLlI-kjzUlItR1QGUQ\\", \\"Communication (oral and written) \\\\u2013 speak/write in a clear,concise,correctmanner\\": \\"Well Prepared\\", \\"Comprehension - can restate information, ideas and concepts in different ways\\": \\"Well Prepared\\", \\"Computer skills\\": \\"Well Prepared\\", \\"Country of Residence\\": \\"Ghana\\", \\"Creative and innovative - creates innovative strategies and / or products that meet identified needs\\": \\"Well Prepared\\", \\"Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making\\": \\"Well Prepared\\", \\"Did your degree earned from CU provide the requisite technical know-how of your job?\\": \\"Select\\", \\"Do you have any suggestions for overall service delivery at Central University?\\": \\"Oh \\", \\"Gender\\": \\"Male\\", \\"Have you ever been employed since graduation?\\": \\"Yes\\", \\"How likely are you to return to the same school?\\": \\"Very likely\\", \\"How likely are you to staying in your current job or profession?\\": \\"Very likely\\", \\"How long did it take you to find your job?\\": \\"I found employment prior to graduation\\", \\"How long did you work?\\": \\"1-3 months\\", \\"How long have you been employed or self-employed?\\": \\" Less than 6 months\\", \\"How related is your current job to your program of study?\\": \\" Fully related\\", \\"How would you rate your overall satisfaction with your university\\\\u2019s preparation for the type of work you were/are doing?\\": \\"Very satisfied\\", \\"In your current job, are you\\": \\"A permanent employee\\", \\"Job title\\": \\"Oh \\", \\"List programme\\": \\"Oh \\", \\"Mobile Number\\": \\"545977791\\", \\"Name of Institution\\": \\"Nana Kweku Adumatta\\", \\"Organization\\": \\"Presto Solutions\\", \\"Organization Address\\": \\"Presto Solutions\\", \\"Organization and planning - determines tasks and resources to complete project objectives\\": \\"Well Prepared\\", \\"Overall how satisfied were you with the academic preparation for your current programme\\": \\"Very satisfied\\", \\"Programme Pursued\\": \\"I \\", \\"Quality of work - performs tasks accurately and pays attention to detail\\": \\"Well Prepared\\", \\"Quantitative skills (Ability to use mathematical concepts)\\": \\"Well Prepared\\", \\"Research and analysis - collects, analyzes and organizes relevant information\\": \\"Well Prepared\\", \\"Responsible - takes responsibility for his/her own actions and decisions\\": \\"Well Prepared\\", \\"Since your graduation have you gone on to take any other programme?\\": \\"Yes\\", \\"Specific job-related skills(e.g. technical skills)\\": \\"Well Prepared\\", \\"Specific job-related theoretical knowledge\\": \\"Well Prepared\\", \\"Submit\\": false, \\"Team-work\\": \\"Well Prepared\\", \\"Time management - sets priorities and allocates time efficiently to complete tasks within deadlines\\": \\"Well Prepared\\", \\"To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were\\": \\"Very helpful\\", \\"Type of Organization\\": \\"Private\\", \\"What is the main reason you are unemployed?\\": \\" There are no jobs available in my filed\\", \\"What is your current monthly gross salary?\\": \\"Below GHC1000\\", \\"Which one of the following best describes your current employment status?\\": \\"Working full-time\\", \\"Work Address\\": \\"Sankofa Avenue 15\\", \\"Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] \\": \\"Yes\\", \\"Year of Completion\\": 2000}"
81	"{\\"(If Yes, What is your current status, If No skip)\\": \\"Enrolled part time\\", \\"Adaptable - adapts to new situations and demands by applying or updating knowledge and skills\\": \\"Well Prepared\\", \\"CSRF Token\\": \\"ImUyMzI1M2MzMmI3MTAyMWMxMjRhZTUwNzBmM2Y2ZWM2NWU4YjQ4OTgi.ZOmIBw.9nSBZWNHxwLlI-kjzUlItR1QGUQ\\", \\"Communication (oral and written) \\\\u2013 speak/write in a clear,concise,correctmanner\\": \\"Well Prepared\\", \\"Comprehension - can restate information, ideas and concepts in different ways\\": \\"Well Prepared\\", \\"Computer skills\\": \\"Well Prepared\\", \\"Country of Residence\\": \\"Ghana\\", \\"Creative and innovative - creates innovative strategies and / or products that meet identified needs\\": \\"Well Prepared\\", \\"Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making\\": \\"Well Prepared\\", \\"Did your degree earned from CU provide the requisite technical know-how of your job?\\": \\"Select\\", \\"Do you have any suggestions for overall service delivery at Central University?\\": \\"Oh \\", \\"Gender\\": \\"Male\\", \\"Have you ever been employed since graduation?\\": \\"Yes\\", \\"How likely are you to return to the same school?\\": \\"Very likely\\", \\"How likely are you to staying in your current job or profession?\\": \\"Very likely\\", \\"How long did it take you to find your job?\\": \\"I found employment prior to graduation\\", \\"How long did you work?\\": \\"1-3 months\\", \\"How long have you been employed or self-employed?\\": \\" Less than 6 months\\", \\"How related is your current job to your program of study?\\": \\" Fully related\\", \\"How would you rate your overall satisfaction with your university\\\\u2019s preparation for the type of work you were/are doing?\\": \\"Very satisfied\\", \\"In your current job, are you\\": \\"A permanent employee\\", \\"Job title\\": \\"Oh \\", \\"List programme\\": \\"Oh \\", \\"Mobile Number\\": \\"545977791\\", \\"Name of Institution\\": \\"Nana Kweku Adumatta\\", \\"Organization\\": \\"Presto Solutions\\", \\"Organization Address\\": \\"Presto Solutions\\", \\"Organization and planning - determines tasks and resources to complete project objectives\\": \\"Well Prepared\\", \\"Overall how satisfied were you with the academic preparation for your current programme\\": \\"Very satisfied\\", \\"Programme Pursued\\": \\"I \\", \\"Quality of work - performs tasks accurately and pays attention to detail\\": \\"Well Prepared\\", \\"Quantitative skills (Ability to use mathematical concepts)\\": \\"Well Prepared\\", \\"Research and analysis - collects, analyzes and organizes relevant information\\": \\"Well Prepared\\", \\"Responsible - takes responsibility for his/her own actions and decisions\\": \\"Well Prepared\\", \\"Since your graduation have you gone on to take any other programme?\\": \\"Yes\\", \\"Specific job-related skills(e.g. technical skills)\\": \\"Well Prepared\\", \\"Specific job-related theoretical knowledge\\": \\"Well Prepared\\", \\"Submit\\": false, \\"Team-work\\": \\"Well Prepared\\", \\"Time management - sets priorities and allocates time efficiently to complete tasks within deadlines\\": \\"Well Prepared\\", \\"To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were\\": \\"Very helpful\\", \\"Type of Organization\\": \\"Private\\", \\"What is the main reason you are unemployed?\\": \\" There are no jobs available in my filed\\", \\"What is your current monthly gross salary?\\": \\"Below GHC1000\\", \\"Which one of the following best describes your current employment status?\\": \\"Working full-time\\", \\"Work Address\\": \\"Sankofa Avenue 15\\", \\"Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] \\": \\"Yes\\", \\"Year of Completion\\": 2000}"
82	"{\\"(If Yes, What is your current status, If No skip)\\": \\"Enrolled part time\\", \\"Adaptable - adapts to new situations and demands by applying or updating knowledge and skills\\": \\"Well Prepared\\", \\"CSRF Token\\": \\"ImUyMzI1M2MzMmI3MTAyMWMxMjRhZTUwNzBmM2Y2ZWM2NWU4YjQ4OTgi.ZOmIBw.9nSBZWNHxwLlI-kjzUlItR1QGUQ\\", \\"Communication (oral and written) \\\\u2013 speak/write in a clear,concise,correctmanner\\": \\"Well Prepared\\", \\"Comprehension - can restate information, ideas and concepts in different ways\\": \\"Well Prepared\\", \\"Computer skills\\": \\"Well Prepared\\", \\"Country of Residence\\": \\"Ghana\\", \\"Creative and innovative - creates innovative strategies and / or products that meet identified needs\\": \\"Well Prepared\\", \\"Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making\\": \\"Well Prepared\\", \\"Did your degree earned from CU provide the requisite technical know-how of your job?\\": \\"Select\\", \\"Do you have any suggestions for overall service delivery at Central University?\\": \\"Oh \\", \\"Gender\\": \\"Male\\", \\"Have you ever been employed since graduation?\\": \\"Yes\\", \\"How likely are you to return to the same school?\\": \\"Very likely\\", \\"How likely are you to staying in your current job or profession?\\": \\"Very likely\\", \\"How long did it take you to find your job?\\": \\"I found employment prior to graduation\\", \\"How long did you work?\\": \\"1-3 months\\", \\"How long have you been employed or self-employed?\\": \\" Less than 6 months\\", \\"How related is your current job to your program of study?\\": \\" Fully related\\", \\"How would you rate your overall satisfaction with your university\\\\u2019s preparation for the type of work you were/are doing?\\": \\"Very satisfied\\", \\"In your current job, are you\\": \\"A permanent employee\\", \\"Job title\\": \\"Oh \\", \\"List programme\\": \\"Oh \\", \\"Mobile Number\\": \\"545977791\\", \\"Name of Institution\\": \\"Nana Kweku Adumatta\\", \\"Organization\\": \\"Presto Solutions\\", \\"Organization Address\\": \\"Presto Solutions\\", \\"Organization and planning - determines tasks and resources to complete project objectives\\": \\"Well Prepared\\", \\"Overall how satisfied were you with the academic preparation for your current programme\\": \\"Very satisfied\\", \\"Programme Pursued\\": \\"I \\", \\"Quality of work - performs tasks accurately and pays attention to detail\\": \\"Well Prepared\\", \\"Quantitative skills (Ability to use mathematical concepts)\\": \\"Well Prepared\\", \\"Research and analysis - collects, analyzes and organizes relevant information\\": \\"Well Prepared\\", \\"Responsible - takes responsibility for his/her own actions and decisions\\": \\"Well Prepared\\", \\"Since your graduation have you gone on to take any other programme?\\": \\"Yes\\", \\"Specific job-related skills(e.g. technical skills)\\": \\"Well Prepared\\", \\"Specific job-related theoretical knowledge\\": \\"Well Prepared\\", \\"Submit\\": false, \\"Team-work\\": \\"Well Prepared\\", \\"Time management - sets priorities and allocates time efficiently to complete tasks within deadlines\\": \\"Well Prepared\\", \\"To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were\\": \\"Very helpful\\", \\"Type of Organization\\": \\"Private\\", \\"What is the main reason you are unemployed?\\": \\" There are no jobs available in my filed\\", \\"What is your current monthly gross salary?\\": \\"Below GHC1000\\", \\"Which one of the following best describes your current employment status?\\": \\"Working full-time\\", \\"Work Address\\": \\"Sankofa Avenue 15\\", \\"Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] \\": \\"Yes\\", \\"Year of Completion\\": 2000}"
83	"{\\"(If Yes, What is your current status, If No skip)\\": \\"Enrolled part time\\", \\"Adaptable - adapts to new situations and demands by applying or updating knowledge and skills\\": \\"Well Prepared\\", \\"CSRF Token\\": \\"ImUyMzI1M2MzMmI3MTAyMWMxMjRhZTUwNzBmM2Y2ZWM2NWU4YjQ4OTgi.ZOmIBw.9nSBZWNHxwLlI-kjzUlItR1QGUQ\\", \\"Communication (oral and written) \\\\u2013 speak/write in a clear,concise,correctmanner\\": \\"Well Prepared\\", \\"Comprehension - can restate information, ideas and concepts in different ways\\": \\"Well Prepared\\", \\"Computer skills\\": \\"Well Prepared\\", \\"Country of Residence\\": \\"Ghana\\", \\"Creative and innovative - creates innovative strategies and / or products that meet identified needs\\": \\"Well Prepared\\", \\"Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making\\": \\"Well Prepared\\", \\"Did your degree earned from CU provide the requisite technical know-how of your job?\\": \\"Select\\", \\"Do you have any suggestions for overall service delivery at Central University?\\": \\"Oh \\", \\"Gender\\": \\"Male\\", \\"Have you ever been employed since graduation?\\": \\"Yes\\", \\"How likely are you to return to the same school?\\": \\"Very likely\\", \\"How likely are you to staying in your current job or profession?\\": \\"Very likely\\", \\"How long did it take you to find your job?\\": \\"I found employment prior to graduation\\", \\"How long did you work?\\": \\"1-3 months\\", \\"How long have you been employed or self-employed?\\": \\" Less than 6 months\\", \\"How related is your current job to your program of study?\\": \\" Fully related\\", \\"How would you rate your overall satisfaction with your university\\\\u2019s preparation for the type of work you were/are doing?\\": \\"Very satisfied\\", \\"In your current job, are you\\": \\"A permanent employee\\", \\"Job title\\": \\"Oh \\", \\"List programme\\": \\"Oh \\", \\"Mobile Number\\": \\"545977791\\", \\"Name of Institution\\": \\"Nana Kweku Adumatta\\", \\"Organization\\": \\"Presto Solutions\\", \\"Organization Address\\": \\"Presto Solutions\\", \\"Organization and planning - determines tasks and resources to complete project objectives\\": \\"Well Prepared\\", \\"Overall how satisfied were you with the academic preparation for your current programme\\": \\"Very satisfied\\", \\"Programme Pursued\\": \\"I \\", \\"Quality of work - performs tasks accurately and pays attention to detail\\": \\"Well Prepared\\", \\"Quantitative skills (Ability to use mathematical concepts)\\": \\"Well Prepared\\", \\"Research and analysis - collects, analyzes and organizes relevant information\\": \\"Well Prepared\\", \\"Responsible - takes responsibility for his/her own actions and decisions\\": \\"Well Prepared\\", \\"Since your graduation have you gone on to take any other programme?\\": \\"Yes\\", \\"Specific job-related skills(e.g. technical skills)\\": \\"Well Prepared\\", \\"Specific job-related theoretical knowledge\\": \\"Well Prepared\\", \\"Submit\\": false, \\"Team-work\\": \\"Well Prepared\\", \\"Time management - sets priorities and allocates time efficiently to complete tasks within deadlines\\": \\"Well Prepared\\", \\"To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were\\": \\"Very helpful\\", \\"Type of Organization\\": \\"Private\\", \\"What is the main reason you are unemployed?\\": \\" There are no jobs available in my filed\\", \\"What is your current monthly gross salary?\\": \\"Below GHC1000\\", \\"Which one of the following best describes your current employment status?\\": \\"Working full-time\\", \\"Work Address\\": \\"Sankofa Avenue 15\\", \\"Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] \\": \\"Yes\\", \\"Year of Completion\\": 2000}"
84	"{\\"(If Yes, What is your current status, If No skip)\\": \\"Enrolled part time\\", \\"Adaptable - adapts to new situations and demands by applying or updating knowledge and skills\\": \\"Well Prepared\\", \\"CSRF Token\\": \\"ImUyMzI1M2MzMmI3MTAyMWMxMjRhZTUwNzBmM2Y2ZWM2NWU4YjQ4OTgi.ZOmIBw.9nSBZWNHxwLlI-kjzUlItR1QGUQ\\", \\"Communication (oral and written) \\\\u2013 speak/write in a clear,concise,correctmanner\\": \\"Well Prepared\\", \\"Comprehension - can restate information, ideas and concepts in different ways\\": \\"Well Prepared\\", \\"Computer skills\\": \\"Well Prepared\\", \\"Country of Residence\\": \\"Ghana\\", \\"Creative and innovative - creates innovative strategies and / or products that meet identified needs\\": \\"Well Prepared\\", \\"Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making\\": \\"Well Prepared\\", \\"Did your degree earned from CU provide the requisite technical know-how of your job?\\": \\"Select\\", \\"Do you have any suggestions for overall service delivery at Central University?\\": \\"Oh \\", \\"Gender\\": \\"Male\\", \\"Have you ever been employed since graduation?\\": \\"Yes\\", \\"How likely are you to return to the same school?\\": \\"Very likely\\", \\"How likely are you to staying in your current job or profession?\\": \\"Very likely\\", \\"How long did it take you to find your job?\\": \\"I found employment prior to graduation\\", \\"How long did you work?\\": \\"1-3 months\\", \\"How long have you been employed or self-employed?\\": \\" Less than 6 months\\", \\"How related is your current job to your program of study?\\": \\" Fully related\\", \\"How would you rate your overall satisfaction with your university\\\\u2019s preparation for the type of work you were/are doing?\\": \\"Very satisfied\\", \\"In your current job, are you\\": \\"A permanent employee\\", \\"Job title\\": \\"Oh \\", \\"List programme\\": \\"Oh \\", \\"Mobile Number\\": \\"545977791\\", \\"Name of Institution\\": \\"Nana Kweku Adumatta\\", \\"Organization\\": \\"Presto Solutions\\", \\"Organization Address\\": \\"Presto Solutions\\", \\"Organization and planning - determines tasks and resources to complete project objectives\\": \\"Well Prepared\\", \\"Overall how satisfied were you with the academic preparation for your current programme\\": \\"Very satisfied\\", \\"Programme Pursued\\": \\"I \\", \\"Quality of work - performs tasks accurately and pays attention to detail\\": \\"Well Prepared\\", \\"Quantitative skills (Ability to use mathematical concepts)\\": \\"Well Prepared\\", \\"Research and analysis - collects, analyzes and organizes relevant information\\": \\"Well Prepared\\", \\"Responsible - takes responsibility for his/her own actions and decisions\\": \\"Well Prepared\\", \\"Since your graduation have you gone on to take any other programme?\\": \\"Yes\\", \\"Specific job-related skills(e.g. technical skills)\\": \\"Well Prepared\\", \\"Specific job-related theoretical knowledge\\": \\"Well Prepared\\", \\"Submit\\": false, \\"Team-work\\": \\"Well Prepared\\", \\"Time management - sets priorities and allocates time efficiently to complete tasks within deadlines\\": \\"Well Prepared\\", \\"To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were\\": \\"Very helpful\\", \\"Type of Organization\\": \\"Private\\", \\"What is the main reason you are unemployed?\\": \\" There are no jobs available in my filed\\", \\"What is your current monthly gross salary?\\": \\"Below GHC1000\\", \\"Which one of the following best describes your current employment status?\\": \\"Working full-time\\", \\"Work Address\\": \\"Sankofa Avenue 15\\", \\"Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] \\": \\"Yes\\", \\"Year of Completion\\": 2000}"
85	"{\\"(If Yes, What is your current status, If No skip)\\": \\"Enrolled part time\\", \\"Adaptable - adapts to new situations and demands by applying or updating knowledge and skills\\": \\"Well Prepared\\", \\"CSRF Token\\": \\"ImUyMzI1M2MzMmI3MTAyMWMxMjRhZTUwNzBmM2Y2ZWM2NWU4YjQ4OTgi.ZOmIBw.9nSBZWNHxwLlI-kjzUlItR1QGUQ\\", \\"Communication (oral and written) \\\\u2013 speak/write in a clear,concise,correctmanner\\": \\"Well Prepared\\", \\"Comprehension - can restate information, ideas and concepts in different ways\\": \\"Well Prepared\\", \\"Computer skills\\": \\"Well Prepared\\", \\"Country of Residence\\": \\"Ghana\\", \\"Creative and innovative - creates innovative strategies and / or products that meet identified needs\\": \\"Well Prepared\\", \\"Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making\\": \\"Well Prepared\\", \\"Did your degree earned from CU provide the requisite technical know-how of your job?\\": \\"Select\\", \\"Do you have any suggestions for overall service delivery at Central University?\\": \\"Oh \\", \\"Gender\\": \\"Male\\", \\"Have you ever been employed since graduation?\\": \\"Yes\\", \\"How likely are you to return to the same school?\\": \\"Very likely\\", \\"How likely are you to staying in your current job or profession?\\": \\"Very likely\\", \\"How long did it take you to find your job?\\": \\"I found employment prior to graduation\\", \\"How long did you work?\\": \\"1-3 months\\", \\"How long have you been employed or self-employed?\\": \\" Less than 6 months\\", \\"How related is your current job to your program of study?\\": \\" Fully related\\", \\"How would you rate your overall satisfaction with your university\\\\u2019s preparation for the type of work you were/are doing?\\": \\"Very satisfied\\", \\"In your current job, are you\\": \\"A permanent employee\\", \\"Job title\\": \\"Oh \\", \\"List programme\\": \\"Oh \\", \\"Mobile Number\\": \\"545977791\\", \\"Name of Institution\\": \\"Nana Kweku Adumatta\\", \\"Organization\\": \\"Presto Solutions\\", \\"Organization Address\\": \\"Presto Solutions\\", \\"Organization and planning - determines tasks and resources to complete project objectives\\": \\"Well Prepared\\", \\"Overall how satisfied were you with the academic preparation for your current programme\\": \\"Very satisfied\\", \\"Programme Pursued\\": \\"I \\", \\"Quality of work - performs tasks accurately and pays attention to detail\\": \\"Well Prepared\\", \\"Quantitative skills (Ability to use mathematical concepts)\\": \\"Well Prepared\\", \\"Research and analysis - collects, analyzes and organizes relevant information\\": \\"Well Prepared\\", \\"Responsible - takes responsibility for his/her own actions and decisions\\": \\"Well Prepared\\", \\"Since your graduation have you gone on to take any other programme?\\": \\"Yes\\", \\"Specific job-related skills(e.g. technical skills)\\": \\"Well Prepared\\", \\"Specific job-related theoretical knowledge\\": \\"Well Prepared\\", \\"Submit\\": false, \\"Team-work\\": \\"Well Prepared\\", \\"Time management - sets priorities and allocates time efficiently to complete tasks within deadlines\\": \\"Well Prepared\\", \\"To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were\\": \\"Very helpful\\", \\"Type of Organization\\": \\"Private\\", \\"What is the main reason you are unemployed?\\": \\" There are no jobs available in my filed\\", \\"What is your current monthly gross salary?\\": \\"Below GHC1000\\", \\"Which one of the following best describes your current employment status?\\": \\"Working full-time\\", \\"Work Address\\": \\"Sankofa Avenue 15\\", \\"Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] \\": \\"Yes\\", \\"Year of Completion\\": 2000}"
86	"{\\"(If Yes, What is your current status, If No skip)\\": \\"Enrolled part time\\", \\"Adaptable - adapts to new situations and demands by applying or updating knowledge and skills\\": \\"Well Prepared\\", \\"CSRF Token\\": \\"ImUyMzI1M2MzMmI3MTAyMWMxMjRhZTUwNzBmM2Y2ZWM2NWU4YjQ4OTgi.ZOmIBw.9nSBZWNHxwLlI-kjzUlItR1QGUQ\\", \\"Communication (oral and written) \\\\u2013 speak/write in a clear,concise,correctmanner\\": \\"Well Prepared\\", \\"Comprehension - can restate information, ideas and concepts in different ways\\": \\"Well Prepared\\", \\"Computer skills\\": \\"Well Prepared\\", \\"Country of Residence\\": \\"Ghana\\", \\"Creative and innovative - creates innovative strategies and / or products that meet identified needs\\": \\"Well Prepared\\", \\"Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making\\": \\"Well Prepared\\", \\"Did your degree earned from CU provide the requisite technical know-how of your job?\\": \\"Select\\", \\"Do you have any suggestions for overall service delivery at Central University?\\": \\"Oh \\", \\"Gender\\": \\"Male\\", \\"Have you ever been employed since graduation?\\": \\"Yes\\", \\"How likely are you to return to the same school?\\": \\"Very likely\\", \\"How likely are you to staying in your current job or profession?\\": \\"Very likely\\", \\"How long did it take you to find your job?\\": \\"I found employment prior to graduation\\", \\"How long did you work?\\": \\"1-3 months\\", \\"How long have you been employed or self-employed?\\": \\" Less than 6 months\\", \\"How related is your current job to your program of study?\\": \\" Fully related\\", \\"How would you rate your overall satisfaction with your university\\\\u2019s preparation for the type of work you were/are doing?\\": \\"Very satisfied\\", \\"In your current job, are you\\": \\"A permanent employee\\", \\"Job title\\": \\"Oh \\", \\"List programme\\": \\"Oh \\", \\"Mobile Number\\": \\"545977791\\", \\"Name of Institution\\": \\"Nana Kweku Adumatta\\", \\"Organization\\": \\"Presto Solutions\\", \\"Organization Address\\": \\"Presto Solutions\\", \\"Organization and planning - determines tasks and resources to complete project objectives\\": \\"Well Prepared\\", \\"Overall how satisfied were you with the academic preparation for your current programme\\": \\"Very satisfied\\", \\"Programme Pursued\\": \\"I \\", \\"Quality of work - performs tasks accurately and pays attention to detail\\": \\"Well Prepared\\", \\"Quantitative skills (Ability to use mathematical concepts)\\": \\"Well Prepared\\", \\"Research and analysis - collects, analyzes and organizes relevant information\\": \\"Well Prepared\\", \\"Responsible - takes responsibility for his/her own actions and decisions\\": \\"Well Prepared\\", \\"Since your graduation have you gone on to take any other programme?\\": \\"Yes\\", \\"Specific job-related skills(e.g. technical skills)\\": \\"Well Prepared\\", \\"Specific job-related theoretical knowledge\\": \\"Well Prepared\\", \\"Submit\\": false, \\"Team-work\\": \\"Well Prepared\\", \\"Time management - sets priorities and allocates time efficiently to complete tasks within deadlines\\": \\"Well Prepared\\", \\"To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were\\": \\"Very helpful\\", \\"Type of Organization\\": \\"Private\\", \\"What is the main reason you are unemployed?\\": \\" There are no jobs available in my filed\\", \\"What is your current monthly gross salary?\\": \\"Below GHC1000\\", \\"Which one of the following best describes your current employment status?\\": \\"Working full-time\\", \\"Work Address\\": \\"Sankofa Avenue 15\\", \\"Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] \\": \\"Yes\\", \\"Year of Completion\\": 2000}"
87	"{\\"(If Yes, What is your current status, If No skip)\\": \\"Enrolled part time\\", \\"Adaptable - adapts to new situations and demands by applying or updating knowledge and skills\\": \\"Well Prepared\\", \\"CSRF Token\\": \\"ImUyMzI1M2MzMmI3MTAyMWMxMjRhZTUwNzBmM2Y2ZWM2NWU4YjQ4OTgi.ZOmIBw.9nSBZWNHxwLlI-kjzUlItR1QGUQ\\", \\"Communication (oral and written) \\\\u2013 speak/write in a clear,concise,correctmanner\\": \\"Well Prepared\\", \\"Comprehension - can restate information, ideas and concepts in different ways\\": \\"Well Prepared\\", \\"Computer skills\\": \\"Well Prepared\\", \\"Country of Residence\\": \\"Ghana\\", \\"Creative and innovative - creates innovative strategies and / or products that meet identified needs\\": \\"Well Prepared\\", \\"Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making\\": \\"Well Prepared\\", \\"Did your degree earned from CU provide the requisite technical know-how of your job?\\": \\"Select\\", \\"Do you have any suggestions for overall service delivery at Central University?\\": \\"Oh \\", \\"Gender\\": \\"Male\\", \\"Have you ever been employed since graduation?\\": \\"Yes\\", \\"How likely are you to return to the same school?\\": \\"Very likely\\", \\"How likely are you to staying in your current job or profession?\\": \\"Very likely\\", \\"How long did it take you to find your job?\\": \\"I found employment prior to graduation\\", \\"How long did you work?\\": \\"1-3 months\\", \\"How long have you been employed or self-employed?\\": \\" Less than 6 months\\", \\"How related is your current job to your program of study?\\": \\" Fully related\\", \\"How would you rate your overall satisfaction with your university\\\\u2019s preparation for the type of work you were/are doing?\\": \\"Very satisfied\\", \\"In your current job, are you\\": \\"A permanent employee\\", \\"Job title\\": \\"Oh \\", \\"List programme\\": \\"Oh \\", \\"Mobile Number\\": \\"545977791\\", \\"Name of Institution\\": \\"Nana Kweku Adumatta\\", \\"Organization\\": \\"Presto Solutions\\", \\"Organization Address\\": \\"Presto Solutions\\", \\"Organization and planning - determines tasks and resources to complete project objectives\\": \\"Well Prepared\\", \\"Overall how satisfied were you with the academic preparation for your current programme\\": \\"Very satisfied\\", \\"Programme Pursued\\": \\"I \\", \\"Quality of work - performs tasks accurately and pays attention to detail\\": \\"Well Prepared\\", \\"Quantitative skills (Ability to use mathematical concepts)\\": \\"Well Prepared\\", \\"Research and analysis - collects, analyzes and organizes relevant information\\": \\"Well Prepared\\", \\"Responsible - takes responsibility for his/her own actions and decisions\\": \\"Well Prepared\\", \\"Since your graduation have you gone on to take any other programme?\\": \\"Yes\\", \\"Specific job-related skills(e.g. technical skills)\\": \\"Well Prepared\\", \\"Specific job-related theoretical knowledge\\": \\"Well Prepared\\", \\"Submit\\": false, \\"Team-work\\": \\"Well Prepared\\", \\"Time management - sets priorities and allocates time efficiently to complete tasks within deadlines\\": \\"Well Prepared\\", \\"To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were\\": \\"Very helpful\\", \\"Type of Organization\\": \\"Private\\", \\"What is the main reason you are unemployed?\\": \\" There are no jobs available in my filed\\", \\"What is your current monthly gross salary?\\": \\"Below GHC1000\\", \\"Which one of the following best describes your current employment status?\\": \\"Working full-time\\", \\"Work Address\\": \\"Sankofa Avenue 15\\", \\"Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] \\": \\"Yes\\", \\"Year of Completion\\": 2000}"
88	"{\\"(If Yes, What is your current status, If No skip)\\": \\"Enrolled part time\\", \\"Adaptable - adapts to new situations and demands by applying or updating knowledge and skills\\": \\"Well Prepared\\", \\"CSRF Token\\": \\"ImUyMzI1M2MzMmI3MTAyMWMxMjRhZTUwNzBmM2Y2ZWM2NWU4YjQ4OTgi.ZOmIBw.9nSBZWNHxwLlI-kjzUlItR1QGUQ\\", \\"Communication (oral and written) \\\\u2013 speak/write in a clear,concise,correctmanner\\": \\"Well Prepared\\", \\"Comprehension - can restate information, ideas and concepts in different ways\\": \\"Well Prepared\\", \\"Computer skills\\": \\"Well Prepared\\", \\"Country of Residence\\": \\"Ghana\\", \\"Creative and innovative - creates innovative strategies and / or products that meet identified needs\\": \\"Well Prepared\\", \\"Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making\\": \\"Well Prepared\\", \\"Did your degree earned from CU provide the requisite technical know-how of your job?\\": \\"Select\\", \\"Do you have any suggestions for overall service delivery at Central University?\\": \\"Oh \\", \\"Gender\\": \\"Male\\", \\"Have you ever been employed since graduation?\\": \\"Yes\\", \\"How likely are you to return to the same school?\\": \\"Very likely\\", \\"How likely are you to staying in your current job or profession?\\": \\"Very likely\\", \\"How long did it take you to find your job?\\": \\"I found employment prior to graduation\\", \\"How long did you work?\\": \\"1-3 months\\", \\"How long have you been employed or self-employed?\\": \\" Less than 6 months\\", \\"How related is your current job to your program of study?\\": \\" Fully related\\", \\"How would you rate your overall satisfaction with your university\\\\u2019s preparation for the type of work you were/are doing?\\": \\"Very satisfied\\", \\"In your current job, are you\\": \\"A permanent employee\\", \\"Job title\\": \\"Oh \\", \\"List programme\\": \\"Oh \\", \\"Mobile Number\\": \\"545977791\\", \\"Name of Institution\\": \\"Nana Kweku Adumatta\\", \\"Organization\\": \\"Presto Solutions\\", \\"Organization Address\\": \\"Presto Solutions\\", \\"Organization and planning - determines tasks and resources to complete project objectives\\": \\"Well Prepared\\", \\"Overall how satisfied were you with the academic preparation for your current programme\\": \\"Very satisfied\\", \\"Programme Pursued\\": \\"I \\", \\"Quality of work - performs tasks accurately and pays attention to detail\\": \\"Well Prepared\\", \\"Quantitative skills (Ability to use mathematical concepts)\\": \\"Well Prepared\\", \\"Research and analysis - collects, analyzes and organizes relevant information\\": \\"Well Prepared\\", \\"Responsible - takes responsibility for his/her own actions and decisions\\": \\"Well Prepared\\", \\"Since your graduation have you gone on to take any other programme?\\": \\"Yes\\", \\"Specific job-related skills(e.g. technical skills)\\": \\"Well Prepared\\", \\"Specific job-related theoretical knowledge\\": \\"Well Prepared\\", \\"Submit\\": false, \\"Team-work\\": \\"Well Prepared\\", \\"Time management - sets priorities and allocates time efficiently to complete tasks within deadlines\\": \\"Well Prepared\\", \\"To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were\\": \\"Very helpful\\", \\"Type of Organization\\": \\"Private\\", \\"What is the main reason you are unemployed?\\": \\" There are no jobs available in my filed\\", \\"What is your current monthly gross salary?\\": \\"Below GHC1000\\", \\"Which one of the following best describes your current employment status?\\": \\"Working full-time\\", \\"Work Address\\": \\"Sankofa Avenue 15\\", \\"Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] \\": \\"Yes\\", \\"Year of Completion\\": 2000}"
89	"{\\"(If Yes, What is your current status, If No skip)\\": \\"Enrolled part time\\", \\"Adaptable - adapts to new situations and demands by applying or updating knowledge and skills\\": \\"Well Prepared\\", \\"CSRF Token\\": \\"ImUyMzI1M2MzMmI3MTAyMWMxMjRhZTUwNzBmM2Y2ZWM2NWU4YjQ4OTgi.ZOmIBw.9nSBZWNHxwLlI-kjzUlItR1QGUQ\\", \\"Communication (oral and written) \\\\u2013 speak/write in a clear,concise,correctmanner\\": \\"Well Prepared\\", \\"Comprehension - can restate information, ideas and concepts in different ways\\": \\"Well Prepared\\", \\"Computer skills\\": \\"Well Prepared\\", \\"Country of Residence\\": \\"Ghana\\", \\"Creative and innovative - creates innovative strategies and / or products that meet identified needs\\": \\"Well Prepared\\", \\"Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making\\": \\"Well Prepared\\", \\"Did your degree earned from CU provide the requisite technical know-how of your job?\\": \\"Select\\", \\"Do you have any suggestions for overall service delivery at Central University?\\": \\"Oh \\", \\"Gender\\": \\"Male\\", \\"Have you ever been employed since graduation?\\": \\"Yes\\", \\"How likely are you to return to the same school?\\": \\"Very likely\\", \\"How likely are you to staying in your current job or profession?\\": \\"Very likely\\", \\"How long did it take you to find your job?\\": \\"I found employment prior to graduation\\", \\"How long did you work?\\": \\"1-3 months\\", \\"How long have you been employed or self-employed?\\": \\" Less than 6 months\\", \\"How related is your current job to your program of study?\\": \\" Fully related\\", \\"How would you rate your overall satisfaction with your university\\\\u2019s preparation for the type of work you were/are doing?\\": \\"Very satisfied\\", \\"In your current job, are you\\": \\"A permanent employee\\", \\"Job title\\": \\"Oh \\", \\"List programme\\": \\"Oh \\", \\"Mobile Number\\": \\"545977791\\", \\"Name of Institution\\": \\"Nana Kweku Adumatta\\", \\"Organization\\": \\"Presto Solutions\\", \\"Organization Address\\": \\"Presto Solutions\\", \\"Organization and planning - determines tasks and resources to complete project objectives\\": \\"Well Prepared\\", \\"Overall how satisfied were you with the academic preparation for your current programme\\": \\"Very satisfied\\", \\"Programme Pursued\\": \\"I \\", \\"Quality of work - performs tasks accurately and pays attention to detail\\": \\"Well Prepared\\", \\"Quantitative skills (Ability to use mathematical concepts)\\": \\"Well Prepared\\", \\"Research and analysis - collects, analyzes and organizes relevant information\\": \\"Well Prepared\\", \\"Responsible - takes responsibility for his/her own actions and decisions\\": \\"Well Prepared\\", \\"Since your graduation have you gone on to take any other programme?\\": \\"Yes\\", \\"Specific job-related skills(e.g. technical skills)\\": \\"Well Prepared\\", \\"Specific job-related theoretical knowledge\\": \\"Well Prepared\\", \\"Submit\\": false, \\"Team-work\\": \\"Well Prepared\\", \\"Time management - sets priorities and allocates time efficiently to complete tasks within deadlines\\": \\"Well Prepared\\", \\"To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were\\": \\"Very helpful\\", \\"Type of Organization\\": \\"Private\\", \\"What is the main reason you are unemployed?\\": \\" There are no jobs available in my filed\\", \\"What is your current monthly gross salary?\\": \\"Below GHC1000\\", \\"Which one of the following best describes your current employment status?\\": \\"Working full-time\\", \\"Work Address\\": \\"Sankofa Avenue 15\\", \\"Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] \\": \\"Yes\\", \\"Year of Completion\\": 2000}"
90	"{\\"(If Yes, What is your current status, If No skip)\\": \\"Enrolled part time\\", \\"Adaptable - adapts to new situations and demands by applying or updating knowledge and skills\\": \\"Well Prepared\\", \\"CSRF Token\\": \\"ImUyMzI1M2MzMmI3MTAyMWMxMjRhZTUwNzBmM2Y2ZWM2NWU4YjQ4OTgi.ZOmIBw.9nSBZWNHxwLlI-kjzUlItR1QGUQ\\", \\"Communication (oral and written) \\\\u2013 speak/write in a clear,concise,correctmanner\\": \\"Well Prepared\\", \\"Comprehension - can restate information, ideas and concepts in different ways\\": \\"Well Prepared\\", \\"Computer skills\\": \\"Well Prepared\\", \\"Country of Residence\\": \\"Ghana\\", \\"Creative and innovative - creates innovative strategies and / or products that meet identified needs\\": \\"Well Prepared\\", \\"Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making\\": \\"Well Prepared\\", \\"Did your degree earned from CU provide the requisite technical know-how of your job?\\": \\"Select\\", \\"Do you have any suggestions for overall service delivery at Central University?\\": \\"Oh \\", \\"Gender\\": \\"Male\\", \\"Have you ever been employed since graduation?\\": \\"Yes\\", \\"How likely are you to return to the same school?\\": \\"Very likely\\", \\"How likely are you to staying in your current job or profession?\\": \\"Very likely\\", \\"How long did it take you to find your job?\\": \\"I found employment prior to graduation\\", \\"How long did you work?\\": \\"1-3 months\\", \\"How long have you been employed or self-employed?\\": \\" Less than 6 months\\", \\"How related is your current job to your program of study?\\": \\" Fully related\\", \\"How would you rate your overall satisfaction with your university\\\\u2019s preparation for the type of work you were/are doing?\\": \\"Very satisfied\\", \\"In your current job, are you\\": \\"A permanent employee\\", \\"Job title\\": \\"Oh \\", \\"List programme\\": \\"Oh \\", \\"Mobile Number\\": \\"545977791\\", \\"Name of Institution\\": \\"Nana Kweku Adumatta\\", \\"Organization\\": \\"Presto Solutions\\", \\"Organization Address\\": \\"Presto Solutions\\", \\"Organization and planning - determines tasks and resources to complete project objectives\\": \\"Well Prepared\\", \\"Overall how satisfied were you with the academic preparation for your current programme\\": \\"Very satisfied\\", \\"Programme Pursued\\": \\"I \\", \\"Quality of work - performs tasks accurately and pays attention to detail\\": \\"Well Prepared\\", \\"Quantitative skills (Ability to use mathematical concepts)\\": \\"Well Prepared\\", \\"Research and analysis - collects, analyzes and organizes relevant information\\": \\"Well Prepared\\", \\"Responsible - takes responsibility for his/her own actions and decisions\\": \\"Well Prepared\\", \\"Since your graduation have you gone on to take any other programme?\\": \\"Yes\\", \\"Specific job-related skills(e.g. technical skills)\\": \\"Well Prepared\\", \\"Specific job-related theoretical knowledge\\": \\"Well Prepared\\", \\"Submit\\": false, \\"Team-work\\": \\"Well Prepared\\", \\"Time management - sets priorities and allocates time efficiently to complete tasks within deadlines\\": \\"Well Prepared\\", \\"To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were\\": \\"Very helpful\\", \\"Type of Organization\\": \\"Private\\", \\"What is the main reason you are unemployed?\\": \\" There are no jobs available in my filed\\", \\"What is your current monthly gross salary?\\": \\"Below GHC1000\\", \\"Which one of the following best describes your current employment status?\\": \\"Working full-time\\", \\"Work Address\\": \\"Sankofa Avenue 15\\", \\"Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] \\": \\"Yes\\", \\"Year of Completion\\": 2000}"
91	"{\\"(If Yes, What is your current status, If No skip)\\": \\"Enrolled part time\\", \\"Adaptable - adapts to new situations and demands by applying or updating knowledge and skills\\": \\"Well Prepared\\", \\"CSRF Token\\": \\"ImUyMzI1M2MzMmI3MTAyMWMxMjRhZTUwNzBmM2Y2ZWM2NWU4YjQ4OTgi.ZOmIBw.9nSBZWNHxwLlI-kjzUlItR1QGUQ\\", \\"Communication (oral and written) \\\\u2013 speak/write in a clear,concise,correctmanner\\": \\"Well Prepared\\", \\"Comprehension - can restate information, ideas and concepts in different ways\\": \\"Well Prepared\\", \\"Computer skills\\": \\"Well Prepared\\", \\"Country of Residence\\": \\"Ghana\\", \\"Creative and innovative - creates innovative strategies and / or products that meet identified needs\\": \\"Well Prepared\\", \\"Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making\\": \\"Well Prepared\\", \\"Did your degree earned from CU provide the requisite technical know-how of your job?\\": \\"Select\\", \\"Do you have any suggestions for overall service delivery at Central University?\\": \\"Oh \\", \\"Gender\\": \\"Male\\", \\"Have you ever been employed since graduation?\\": \\"Yes\\", \\"How likely are you to return to the same school?\\": \\"Very likely\\", \\"How likely are you to staying in your current job or profession?\\": \\"Very likely\\", \\"How long did it take you to find your job?\\": \\"I found employment prior to graduation\\", \\"How long did you work?\\": \\"1-3 months\\", \\"How long have you been employed or self-employed?\\": \\" Less than 6 months\\", \\"How related is your current job to your program of study?\\": \\" Fully related\\", \\"How would you rate your overall satisfaction with your university\\\\u2019s preparation for the type of work you were/are doing?\\": \\"Very satisfied\\", \\"In your current job, are you\\": \\"A permanent employee\\", \\"Job title\\": \\"Oh \\", \\"List programme\\": \\"Oh \\", \\"Mobile Number\\": \\"545977791\\", \\"Name of Institution\\": \\"Nana Kweku Adumatta\\", \\"Organization\\": \\"Presto Solutions\\", \\"Organization Address\\": \\"Presto Solutions\\", \\"Organization and planning - determines tasks and resources to complete project objectives\\": \\"Well Prepared\\", \\"Overall how satisfied were you with the academic preparation for your current programme\\": \\"Very satisfied\\", \\"Programme Pursued\\": \\"I \\", \\"Quality of work - performs tasks accurately and pays attention to detail\\": \\"Well Prepared\\", \\"Quantitative skills (Ability to use mathematical concepts)\\": \\"Well Prepared\\", \\"Research and analysis - collects, analyzes and organizes relevant information\\": \\"Well Prepared\\", \\"Responsible - takes responsibility for his/her own actions and decisions\\": \\"Well Prepared\\", \\"Since your graduation have you gone on to take any other programme?\\": \\"Yes\\", \\"Specific job-related skills(e.g. technical skills)\\": \\"Well Prepared\\", \\"Specific job-related theoretical knowledge\\": \\"Well Prepared\\", \\"Submit\\": false, \\"Team-work\\": \\"Well Prepared\\", \\"Time management - sets priorities and allocates time efficiently to complete tasks within deadlines\\": \\"Well Prepared\\", \\"To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were\\": \\"Very helpful\\", \\"Type of Organization\\": \\"Private\\", \\"What is the main reason you are unemployed?\\": \\" There are no jobs available in my filed\\", \\"What is your current monthly gross salary?\\": \\"Below GHC1000\\", \\"Which one of the following best describes your current employment status?\\": \\"Working full-time\\", \\"Work Address\\": \\"Sankofa Avenue 15\\", \\"Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] \\": \\"Yes\\", \\"Year of Completion\\": 2000}"
92	"{\\"(If Yes, What is your current status, If No skip)\\": \\"Enrolled part time\\", \\"Adaptable - adapts to new situations and demands by applying or updating knowledge and skills\\": \\"Well Prepared\\", \\"CSRF Token\\": \\"ImMyOTFkNDAzOGJkYjE0ZTRmODQ5ZjEyMGQxODk2ZjIwYzZkZTI4ODEi.ZOmOkg.GtdYFK9isw9iSGEeVTD-3Q6rZdE\\", \\"Communication (oral and written) \\\\u2013 speak/write in a clear,concise,correctmanner\\": \\"Well Prepared\\", \\"Comprehension - can restate information, ideas and concepts in different ways\\": \\"Well Prepared\\", \\"Computer skills\\": \\"Well Prepared\\", \\"Country of Residence\\": \\"Ghana\\", \\"Creative and innovative - creates innovative strategies and / or products that meet identified needs\\": \\"Well Prepared\\", \\"Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making\\": \\"Well Prepared\\", \\"Did your degree earned from CU provide the requisite technical know-how of your job?\\": \\"Select\\", \\"Do you have any suggestions for overall service delivery at Central University?\\": \\"Nothing\\", \\"Gender\\": \\"Male\\", \\"Have you ever been employed since graduation?\\": \\"Yes\\", \\"How likely are you to return to the same school?\\": \\"Very likely\\", \\"How likely are you to staying in your current job or profession?\\": \\"Very likely\\", \\"How long did it take you to find your job?\\": \\"I found employment prior to graduation\\", \\"How long did you work?\\": \\"1-3 months\\", \\"How long have you been employed or self-employed?\\": \\" Less than 6 months\\", \\"How related is your current job to your program of study?\\": \\" Fully related\\", \\"How would you rate your overall satisfaction with your university\\\\u2019s preparation for the type of work you were/are doing?\\": \\"Very satisfied\\", \\"In your current job, are you\\": \\"A permanent employee\\", \\"Job title\\": \\"Oh \\", \\"List programme\\": \\"asdf\\", \\"Mobile Number\\": \\"545977791\\", \\"Name of Institution\\": \\"asdf\\", \\"Organization\\": \\"Presto Solutions\\", \\"Organization Address\\": \\"Presto Solutions\\", \\"Organization and planning - determines tasks and resources to complete project objectives\\": \\"Well Prepared\\", \\"Overall how satisfied were you with the academic preparation for your current programme\\": \\"Very satisfied\\", \\"Programme Pursued\\": \\"Oh \\", \\"Quality of work - performs tasks accurately and pays attention to detail\\": \\"Well Prepared\\", \\"Quantitative skills (Ability to use mathematical concepts)\\": \\"Well Prepared\\", \\"Research and analysis - collects, analyzes and organizes relevant information\\": \\"Well Prepared\\", \\"Responsible - takes responsibility for his/her own actions and decisions\\": \\"Well Prepared\\", \\"Since your graduation have you gone on to take any other programme?\\": \\"Yes\\", \\"Specific job-related skills(e.g. technical skills)\\": \\"Well Prepared\\", \\"Specific job-related theoretical knowledge\\": \\"Well Prepared\\", \\"Submit\\": false, \\"Team-work\\": \\"Well Prepared\\", \\"Time management - sets priorities and allocates time efficiently to complete tasks within deadlines\\": \\"Well Prepared\\", \\"To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were\\": \\"Very helpful\\", \\"Type of Organization\\": \\"Private\\", \\"What is the main reason you are unemployed?\\": \\" There are no jobs available in my filed\\", \\"What is your current monthly gross salary?\\": \\"Below GHC1000\\", \\"Which one of the following best describes your current employment status?\\": \\"Working full-time\\", \\"Work Address\\": \\"Sankofa Avenue 15\\", \\"Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] \\": \\"Yes\\", \\"Year of Completion\\": 2000}"
93	"{\\"(If Yes, What is your current status, If No skip)\\": \\"Enrolled part time\\", \\"Adaptable - adapts to new situations and demands by applying or updating knowledge and skills\\": \\"Well Prepared\\", \\"CSRF Token\\": \\"ImMyOTFkNDAzOGJkYjE0ZTRmODQ5ZjEyMGQxODk2ZjIwYzZkZTI4ODEi.ZOmPZw.0pI0c2XhZHAjaBtvAjlQ5msoqoA\\", \\"Communication (oral and written) \\\\u2013 speak/write in a clear,concise,correctmanner\\": \\"Well Prepared\\", \\"Comprehension - can restate information, ideas and concepts in different ways\\": \\"Well Prepared\\", \\"Computer skills\\": \\"Well Prepared\\", \\"Country of Residence\\": \\"Ghana\\", \\"Creative and innovative - creates innovative strategies and / or products that meet identified needs\\": \\"Well Prepared\\", \\"Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making\\": \\"Well Prepared\\", \\"Did your degree earned from CU provide the requisite technical know-how of your job?\\": \\"Select\\", \\"Do you have any suggestions for overall service delivery at Central University?\\": \\"Nothing\\", \\"Gender\\": \\"Male\\", \\"Have you ever been employed since graduation?\\": \\"Yes\\", \\"How likely are you to return to the same school?\\": \\"Very likely\\", \\"How likely are you to staying in your current job or profession?\\": \\"Very likely\\", \\"How long did it take you to find your job?\\": \\"I found employment prior to graduation\\", \\"How long did you work?\\": \\"1-3 months\\", \\"How long have you been employed or self-employed?\\": \\" Less than 6 months\\", \\"How related is your current job to your program of study?\\": \\" Fully related\\", \\"How would you rate your overall satisfaction with your university\\\\u2019s preparation for the type of work you were/are doing?\\": \\"Very satisfied\\", \\"In your current job, are you\\": \\"A permanent employee\\", \\"Job title\\": \\"Oh \\", \\"List programme\\": \\"asdf\\", \\"Mobile Number\\": \\"545977791\\", \\"Name of Institution\\": \\"asdf\\", \\"Organization\\": \\"Presto Solutions\\", \\"Organization Address\\": \\"Presto Solutions\\", \\"Organization and planning - determines tasks and resources to complete project objectives\\": \\"Well Prepared\\", \\"Overall how satisfied were you with the academic preparation for your current programme\\": \\"Very satisfied\\", \\"Programme Pursued\\": \\"Oh \\", \\"Quality of work - performs tasks accurately and pays attention to detail\\": \\"Well Prepared\\", \\"Quantitative skills (Ability to use mathematical concepts)\\": \\"Well Prepared\\", \\"Research and analysis - collects, analyzes and organizes relevant information\\": \\"Well Prepared\\", \\"Responsible - takes responsibility for his/her own actions and decisions\\": \\"Well Prepared\\", \\"Since your graduation have you gone on to take any other programme?\\": \\"Yes\\", \\"Specific job-related skills(e.g. technical skills)\\": \\"Well Prepared\\", \\"Specific job-related theoretical knowledge\\": \\"Well Prepared\\", \\"Submit\\": false, \\"Team-work\\": \\"Well Prepared\\", \\"Time management - sets priorities and allocates time efficiently to complete tasks within deadlines\\": \\"Well Prepared\\", \\"To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were\\": \\"Very helpful\\", \\"Type of Organization\\": \\"Private\\", \\"What is the main reason you are unemployed?\\": \\" There are no jobs available in my filed\\", \\"What is your current monthly gross salary?\\": \\"Below GHC1000\\", \\"Which one of the following best describes your current employment status?\\": \\"Working full-time\\", \\"Work Address\\": \\"Sankofa Avenue 15\\", \\"Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] \\": \\"Yes\\", \\"Year of Completion\\": 2000}"
94	"{\\"(If Yes, What is your current status, If No skip)\\": \\"Enrolled part time\\", \\"Adaptable - adapts to new situations and demands by applying or updating knowledge and skills\\": \\"Well Prepared\\", \\"CSRF Token\\": \\"ImMyOTFkNDAzOGJkYjE0ZTRmODQ5ZjEyMGQxODk2ZjIwYzZkZTI4ODEi.ZOmPZw.0pI0c2XhZHAjaBtvAjlQ5msoqoA\\", \\"Communication (oral and written) \\\\u2013 speak/write in a clear,concise,correctmanner\\": \\"Well Prepared\\", \\"Comprehension - can restate information, ideas and concepts in different ways\\": \\"Well Prepared\\", \\"Computer skills\\": \\"Well Prepared\\", \\"Country of Residence\\": \\"Ghana\\", \\"Creative and innovative - creates innovative strategies and / or products that meet identified needs\\": \\"Well Prepared\\", \\"Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making\\": \\"Well Prepared\\", \\"Did your degree earned from CU provide the requisite technical know-how of your job?\\": \\"Select\\", \\"Do you have any suggestions for overall service delivery at Central University?\\": \\"Nothing\\", \\"Gender\\": \\"Male\\", \\"Have you ever been employed since graduation?\\": \\"Yes\\", \\"How likely are you to return to the same school?\\": \\"Very likely\\", \\"How likely are you to staying in your current job or profession?\\": \\"Very likely\\", \\"How long did it take you to find your job?\\": \\"I found employment prior to graduation\\", \\"How long did you work?\\": \\"1-3 months\\", \\"How long have you been employed or self-employed?\\": \\" Less than 6 months\\", \\"How related is your current job to your program of study?\\": \\" Fully related\\", \\"How would you rate your overall satisfaction with your university\\\\u2019s preparation for the type of work you were/are doing?\\": \\"Very satisfied\\", \\"In your current job, are you\\": \\"A permanent employee\\", \\"Job title\\": \\"Oh \\", \\"List programme\\": \\"asdf\\", \\"Mobile Number\\": \\"545977791\\", \\"Name of Institution\\": \\"asdf\\", \\"Organization\\": \\"Presto Solutions\\", \\"Organization Address\\": \\"Presto Solutions\\", \\"Organization and planning - determines tasks and resources to complete project objectives\\": \\"Well Prepared\\", \\"Overall how satisfied were you with the academic preparation for your current programme\\": \\"Very satisfied\\", \\"Programme Pursued\\": \\"Oh \\", \\"Quality of work - performs tasks accurately and pays attention to detail\\": \\"Well Prepared\\", \\"Quantitative skills (Ability to use mathematical concepts)\\": \\"Well Prepared\\", \\"Research and analysis - collects, analyzes and organizes relevant information\\": \\"Well Prepared\\", \\"Responsible - takes responsibility for his/her own actions and decisions\\": \\"Well Prepared\\", \\"Since your graduation have you gone on to take any other programme?\\": \\"Yes\\", \\"Specific job-related skills(e.g. technical skills)\\": \\"Well Prepared\\", \\"Specific job-related theoretical knowledge\\": \\"Well Prepared\\", \\"Submit\\": false, \\"Team-work\\": \\"Well Prepared\\", \\"Time management - sets priorities and allocates time efficiently to complete tasks within deadlines\\": \\"Well Prepared\\", \\"To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were\\": \\"Very helpful\\", \\"Type of Organization\\": \\"Private\\", \\"What is the main reason you are unemployed?\\": \\" There are no jobs available in my filed\\", \\"What is your current monthly gross salary?\\": \\"Below GHC1000\\", \\"Which one of the following best describes your current employment status?\\": \\"Working full-time\\", \\"Work Address\\": \\"Sankofa Avenue 15\\", \\"Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] \\": \\"Yes\\", \\"Year of Completion\\": 2000}"
95	"{\\"(If Yes, What is your current status, If No skip)\\": \\"Enrolled part time\\", \\"Adaptable - adapts to new situations and demands by applying or updating knowledge and skills\\": \\"Well Prepared\\", \\"CSRF Token\\": \\"ImMyOTFkNDAzOGJkYjE0ZTRmODQ5ZjEyMGQxODk2ZjIwYzZkZTI4ODEi.ZOmPZw.0pI0c2XhZHAjaBtvAjlQ5msoqoA\\", \\"Communication (oral and written) \\\\u2013 speak/write in a clear,concise,correctmanner\\": \\"Well Prepared\\", \\"Comprehension - can restate information, ideas and concepts in different ways\\": \\"Well Prepared\\", \\"Computer skills\\": \\"Well Prepared\\", \\"Country of Residence\\": \\"Ghana\\", \\"Creative and innovative - creates innovative strategies and / or products that meet identified needs\\": \\"Well Prepared\\", \\"Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making\\": \\"Well Prepared\\", \\"Did your degree earned from CU provide the requisite technical know-how of your job?\\": \\"Select\\", \\"Do you have any suggestions for overall service delivery at Central University?\\": \\"Nothing\\", \\"Gender\\": \\"Male\\", \\"Have you ever been employed since graduation?\\": \\"Yes\\", \\"How likely are you to return to the same school?\\": \\"Very likely\\", \\"How likely are you to staying in your current job or profession?\\": \\"Very likely\\", \\"How long did it take you to find your job?\\": \\"I found employment prior to graduation\\", \\"How long did you work?\\": \\"1-3 months\\", \\"How long have you been employed or self-employed?\\": \\" Less than 6 months\\", \\"How related is your current job to your program of study?\\": \\" Fully related\\", \\"How would you rate your overall satisfaction with your university\\\\u2019s preparation for the type of work you were/are doing?\\": \\"Very satisfied\\", \\"In your current job, are you\\": \\"A permanent employee\\", \\"Job title\\": \\"Oh \\", \\"List programme\\": \\"asdf\\", \\"Mobile Number\\": \\"545977791\\", \\"Name of Institution\\": \\"asdf\\", \\"Organization\\": \\"Presto Solutions\\", \\"Organization Address\\": \\"Presto Solutions\\", \\"Organization and planning - determines tasks and resources to complete project objectives\\": \\"Well Prepared\\", \\"Overall how satisfied were you with the academic preparation for your current programme\\": \\"Very satisfied\\", \\"Programme Pursued\\": \\"Oh \\", \\"Quality of work - performs tasks accurately and pays attention to detail\\": \\"Well Prepared\\", \\"Quantitative skills (Ability to use mathematical concepts)\\": \\"Well Prepared\\", \\"Research and analysis - collects, analyzes and organizes relevant information\\": \\"Well Prepared\\", \\"Responsible - takes responsibility for his/her own actions and decisions\\": \\"Well Prepared\\", \\"Since your graduation have you gone on to take any other programme?\\": \\"Yes\\", \\"Specific job-related skills(e.g. technical skills)\\": \\"Well Prepared\\", \\"Specific job-related theoretical knowledge\\": \\"Well Prepared\\", \\"Submit\\": false, \\"Team-work\\": \\"Well Prepared\\", \\"Time management - sets priorities and allocates time efficiently to complete tasks within deadlines\\": \\"Well Prepared\\", \\"To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were\\": \\"Very helpful\\", \\"Type of Organization\\": \\"Private\\", \\"What is the main reason you are unemployed?\\": \\" There are no jobs available in my filed\\", \\"What is your current monthly gross salary?\\": \\"Below GHC1000\\", \\"Which one of the following best describes your current employment status?\\": \\"Working full-time\\", \\"Work Address\\": \\"Sankofa Avenue 15\\", \\"Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] \\": \\"Yes\\", \\"Year of Completion\\": 2000}"
96	"{\\"(If Yes, What is your current status, If No skip)\\": \\"Enrolled part time\\", \\"Adaptable - adapts to new situations and demands by applying or updating knowledge and skills\\": \\"Well Prepared\\", \\"CSRF Token\\": \\"ImMyOTFkNDAzOGJkYjE0ZTRmODQ5ZjEyMGQxODk2ZjIwYzZkZTI4ODEi.ZOmPZw.0pI0c2XhZHAjaBtvAjlQ5msoqoA\\", \\"Communication (oral and written) \\\\u2013 speak/write in a clear,concise,correctmanner\\": \\"Well Prepared\\", \\"Comprehension - can restate information, ideas and concepts in different ways\\": \\"Well Prepared\\", \\"Computer skills\\": \\"Well Prepared\\", \\"Country of Residence\\": \\"Ghana\\", \\"Creative and innovative - creates innovative strategies and / or products that meet identified needs\\": \\"Well Prepared\\", \\"Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making\\": \\"Well Prepared\\", \\"Did your degree earned from CU provide the requisite technical know-how of your job?\\": \\"Select\\", \\"Do you have any suggestions for overall service delivery at Central University?\\": \\"Nothing\\", \\"Gender\\": \\"Male\\", \\"Have you ever been employed since graduation?\\": \\"Yes\\", \\"How likely are you to return to the same school?\\": \\"Very likely\\", \\"How likely are you to staying in your current job or profession?\\": \\"Very likely\\", \\"How long did it take you to find your job?\\": \\"I found employment prior to graduation\\", \\"How long did you work?\\": \\"1-3 months\\", \\"How long have you been employed or self-employed?\\": \\" Less than 6 months\\", \\"How related is your current job to your program of study?\\": \\" Fully related\\", \\"How would you rate your overall satisfaction with your university\\\\u2019s preparation for the type of work you were/are doing?\\": \\"Very satisfied\\", \\"In your current job, are you\\": \\"A permanent employee\\", \\"Job title\\": \\"Oh \\", \\"List programme\\": \\"asdf\\", \\"Mobile Number\\": \\"545977791\\", \\"Name of Institution\\": \\"asdf\\", \\"Organization\\": \\"Presto Solutions\\", \\"Organization Address\\": \\"Presto Solutions\\", \\"Organization and planning - determines tasks and resources to complete project objectives\\": \\"Well Prepared\\", \\"Overall how satisfied were you with the academic preparation for your current programme\\": \\"Very satisfied\\", \\"Programme Pursued\\": \\"Oh \\", \\"Quality of work - performs tasks accurately and pays attention to detail\\": \\"Well Prepared\\", \\"Quantitative skills (Ability to use mathematical concepts)\\": \\"Well Prepared\\", \\"Research and analysis - collects, analyzes and organizes relevant information\\": \\"Well Prepared\\", \\"Responsible - takes responsibility for his/her own actions and decisions\\": \\"Well Prepared\\", \\"Since your graduation have you gone on to take any other programme?\\": \\"Yes\\", \\"Specific job-related skills(e.g. technical skills)\\": \\"Well Prepared\\", \\"Specific job-related theoretical knowledge\\": \\"Well Prepared\\", \\"Submit\\": false, \\"Team-work\\": \\"Well Prepared\\", \\"Time management - sets priorities and allocates time efficiently to complete tasks within deadlines\\": \\"Well Prepared\\", \\"To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were\\": \\"Very helpful\\", \\"Type of Organization\\": \\"Private\\", \\"What is the main reason you are unemployed?\\": \\" There are no jobs available in my filed\\", \\"What is your current monthly gross salary?\\": \\"Below GHC1000\\", \\"Which one of the following best describes your current employment status?\\": \\"Working full-time\\", \\"Work Address\\": \\"Sankofa Avenue 15\\", \\"Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] \\": \\"Yes\\", \\"Year of Completion\\": 2000}"
97	"{\\"(If Yes, What is your current status, If No skip)\\": \\"Enrolled part time\\", \\"Adaptable - adapts to new situations and demands by applying or updating knowledge and skills\\": \\"Well Prepared\\", \\"CSRF Token\\": \\"ImMyOTFkNDAzOGJkYjE0ZTRmODQ5ZjEyMGQxODk2ZjIwYzZkZTI4ODEi.ZOmPZw.0pI0c2XhZHAjaBtvAjlQ5msoqoA\\", \\"Communication (oral and written) \\\\u2013 speak/write in a clear,concise,correctmanner\\": \\"Well Prepared\\", \\"Comprehension - can restate information, ideas and concepts in different ways\\": \\"Well Prepared\\", \\"Computer skills\\": \\"Well Prepared\\", \\"Country of Residence\\": \\"Ghana\\", \\"Creative and innovative - creates innovative strategies and / or products that meet identified needs\\": \\"Well Prepared\\", \\"Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making\\": \\"Well Prepared\\", \\"Did your degree earned from CU provide the requisite technical know-how of your job?\\": \\"Select\\", \\"Do you have any suggestions for overall service delivery at Central University?\\": \\"Nothing\\", \\"Gender\\": \\"Male\\", \\"Have you ever been employed since graduation?\\": \\"Yes\\", \\"How likely are you to return to the same school?\\": \\"Very likely\\", \\"How likely are you to staying in your current job or profession?\\": \\"Very likely\\", \\"How long did it take you to find your job?\\": \\"I found employment prior to graduation\\", \\"How long did you work?\\": \\"1-3 months\\", \\"How long have you been employed or self-employed?\\": \\" Less than 6 months\\", \\"How related is your current job to your program of study?\\": \\" Fully related\\", \\"How would you rate your overall satisfaction with your university\\\\u2019s preparation for the type of work you were/are doing?\\": \\"Very satisfied\\", \\"In your current job, are you\\": \\"A permanent employee\\", \\"Job title\\": \\"Oh \\", \\"List programme\\": \\"asdf\\", \\"Mobile Number\\": \\"545977791\\", \\"Name of Institution\\": \\"asdf\\", \\"Organization\\": \\"Presto Solutions\\", \\"Organization Address\\": \\"Presto Solutions\\", \\"Organization and planning - determines tasks and resources to complete project objectives\\": \\"Well Prepared\\", \\"Overall how satisfied were you with the academic preparation for your current programme\\": \\"Very satisfied\\", \\"Programme Pursued\\": \\"Oh \\", \\"Quality of work - performs tasks accurately and pays attention to detail\\": \\"Well Prepared\\", \\"Quantitative skills (Ability to use mathematical concepts)\\": \\"Well Prepared\\", \\"Research and analysis - collects, analyzes and organizes relevant information\\": \\"Well Prepared\\", \\"Responsible - takes responsibility for his/her own actions and decisions\\": \\"Well Prepared\\", \\"Since your graduation have you gone on to take any other programme?\\": \\"Yes\\", \\"Specific job-related skills(e.g. technical skills)\\": \\"Well Prepared\\", \\"Specific job-related theoretical knowledge\\": \\"Well Prepared\\", \\"Submit\\": false, \\"Team-work\\": \\"Well Prepared\\", \\"Time management - sets priorities and allocates time efficiently to complete tasks within deadlines\\": \\"Well Prepared\\", \\"To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were\\": \\"Very helpful\\", \\"Type of Organization\\": \\"Private\\", \\"What is the main reason you are unemployed?\\": \\" There are no jobs available in my filed\\", \\"What is your current monthly gross salary?\\": \\"Below GHC1000\\", \\"Which one of the following best describes your current employment status?\\": \\"Working full-time\\", \\"Work Address\\": \\"Sankofa Avenue 15\\", \\"Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] \\": \\"Yes\\", \\"Year of Completion\\": 2000}"
98	"{\\"(If Yes, What is your current status, If No skip)\\": \\"Enrolled part time\\", \\"Adaptable - adapts to new situations and demands by applying or updating knowledge and skills\\": \\"Well Prepared\\", \\"CSRF Token\\": \\"ImMyOTFkNDAzOGJkYjE0ZTRmODQ5ZjEyMGQxODk2ZjIwYzZkZTI4ODEi.ZOmPZw.0pI0c2XhZHAjaBtvAjlQ5msoqoA\\", \\"Communication (oral and written) \\\\u2013 speak/write in a clear,concise,correctmanner\\": \\"Well Prepared\\", \\"Comprehension - can restate information, ideas and concepts in different ways\\": \\"Well Prepared\\", \\"Computer skills\\": \\"Well Prepared\\", \\"Country of Residence\\": \\"Ghana\\", \\"Creative and innovative - creates innovative strategies and / or products that meet identified needs\\": \\"Well Prepared\\", \\"Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making\\": \\"Well Prepared\\", \\"Did your degree earned from CU provide the requisite technical know-how of your job?\\": \\"Select\\", \\"Do you have any suggestions for overall service delivery at Central University?\\": \\"Nothing\\", \\"Gender\\": \\"Male\\", \\"Have you ever been employed since graduation?\\": \\"Yes\\", \\"How likely are you to return to the same school?\\": \\"Very likely\\", \\"How likely are you to staying in your current job or profession?\\": \\"Very likely\\", \\"How long did it take you to find your job?\\": \\"I found employment prior to graduation\\", \\"How long did you work?\\": \\"1-3 months\\", \\"How long have you been employed or self-employed?\\": \\" Less than 6 months\\", \\"How related is your current job to your program of study?\\": \\" Fully related\\", \\"How would you rate your overall satisfaction with your university\\\\u2019s preparation for the type of work you were/are doing?\\": \\"Very satisfied\\", \\"In your current job, are you\\": \\"A permanent employee\\", \\"Job title\\": \\"Oh \\", \\"List programme\\": \\"asdf\\", \\"Mobile Number\\": \\"545977791\\", \\"Name of Institution\\": \\"asdf\\", \\"Organization\\": \\"Presto Solutions\\", \\"Organization Address\\": \\"Presto Solutions\\", \\"Organization and planning - determines tasks and resources to complete project objectives\\": \\"Well Prepared\\", \\"Overall how satisfied were you with the academic preparation for your current programme\\": \\"Very satisfied\\", \\"Programme Pursued\\": \\"Oh \\", \\"Quality of work - performs tasks accurately and pays attention to detail\\": \\"Well Prepared\\", \\"Quantitative skills (Ability to use mathematical concepts)\\": \\"Well Prepared\\", \\"Research and analysis - collects, analyzes and organizes relevant information\\": \\"Well Prepared\\", \\"Responsible - takes responsibility for his/her own actions and decisions\\": \\"Well Prepared\\", \\"Since your graduation have you gone on to take any other programme?\\": \\"Yes\\", \\"Specific job-related skills(e.g. technical skills)\\": \\"Well Prepared\\", \\"Specific job-related theoretical knowledge\\": \\"Well Prepared\\", \\"Submit\\": false, \\"Team-work\\": \\"Well Prepared\\", \\"Time management - sets priorities and allocates time efficiently to complete tasks within deadlines\\": \\"Well Prepared\\", \\"To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were\\": \\"Very helpful\\", \\"Type of Organization\\": \\"Private\\", \\"What is the main reason you are unemployed?\\": \\" There are no jobs available in my filed\\", \\"What is your current monthly gross salary?\\": \\"Below GHC1000\\", \\"Which one of the following best describes your current employment status?\\": \\"Working full-time\\", \\"Work Address\\": \\"Sankofa Avenue 15\\", \\"Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] \\": \\"Yes\\", \\"Year of Completion\\": 2000}"
99	"{\\"(If Yes, What is your current status, If No skip)\\": \\"Enrolled part time\\", \\"Adaptable - adapts to new situations and demands by applying or updating knowledge and skills\\": \\"Well Prepared\\", \\"CSRF Token\\": \\"ImMyOTFkNDAzOGJkYjE0ZTRmODQ5ZjEyMGQxODk2ZjIwYzZkZTI4ODEi.ZOmPZw.0pI0c2XhZHAjaBtvAjlQ5msoqoA\\", \\"Communication (oral and written) \\\\u2013 speak/write in a clear,concise,correctmanner\\": \\"Well Prepared\\", \\"Comprehension - can restate information, ideas and concepts in different ways\\": \\"Well Prepared\\", \\"Computer skills\\": \\"Well Prepared\\", \\"Country of Residence\\": \\"Ghana\\", \\"Creative and innovative - creates innovative strategies and / or products that meet identified needs\\": \\"Well Prepared\\", \\"Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making\\": \\"Well Prepared\\", \\"Did your degree earned from CU provide the requisite technical know-how of your job?\\": \\"Select\\", \\"Do you have any suggestions for overall service delivery at Central University?\\": \\"Nothing\\", \\"Gender\\": \\"Male\\", \\"Have you ever been employed since graduation?\\": \\"Yes\\", \\"How likely are you to return to the same school?\\": \\"Very likely\\", \\"How likely are you to staying in your current job or profession?\\": \\"Very likely\\", \\"How long did it take you to find your job?\\": \\"I found employment prior to graduation\\", \\"How long did you work?\\": \\"1-3 months\\", \\"How long have you been employed or self-employed?\\": \\" Less than 6 months\\", \\"How related is your current job to your program of study?\\": \\" Fully related\\", \\"How would you rate your overall satisfaction with your university\\\\u2019s preparation for the type of work you were/are doing?\\": \\"Very satisfied\\", \\"In your current job, are you\\": \\"A permanent employee\\", \\"Job title\\": \\"Oh \\", \\"List programme\\": \\"asdf\\", \\"Mobile Number\\": \\"545977791\\", \\"Name of Institution\\": \\"asdf\\", \\"Organization\\": \\"Presto Solutions\\", \\"Organization Address\\": \\"Presto Solutions\\", \\"Organization and planning - determines tasks and resources to complete project objectives\\": \\"Well Prepared\\", \\"Overall how satisfied were you with the academic preparation for your current programme\\": \\"Very satisfied\\", \\"Programme Pursued\\": \\"Oh \\", \\"Quality of work - performs tasks accurately and pays attention to detail\\": \\"Well Prepared\\", \\"Quantitative skills (Ability to use mathematical concepts)\\": \\"Well Prepared\\", \\"Research and analysis - collects, analyzes and organizes relevant information\\": \\"Well Prepared\\", \\"Responsible - takes responsibility for his/her own actions and decisions\\": \\"Well Prepared\\", \\"Since your graduation have you gone on to take any other programme?\\": \\"Yes\\", \\"Specific job-related skills(e.g. technical skills)\\": \\"Well Prepared\\", \\"Specific job-related theoretical knowledge\\": \\"Well Prepared\\", \\"Submit\\": false, \\"Team-work\\": \\"Well Prepared\\", \\"Time management - sets priorities and allocates time efficiently to complete tasks within deadlines\\": \\"Well Prepared\\", \\"To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were\\": \\"Very helpful\\", \\"Type of Organization\\": \\"Private\\", \\"What is the main reason you are unemployed?\\": \\" There are no jobs available in my filed\\", \\"What is your current monthly gross salary?\\": \\"Below GHC1000\\", \\"Which one of the following best describes your current employment status?\\": \\"Working full-time\\", \\"Work Address\\": \\"Sankofa Avenue 15\\", \\"Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] \\": \\"Yes\\", \\"Year of Completion\\": 2000}"
100	"{\\"(If Yes, What is your current status, If No skip)\\": \\"Enrolled part time\\", \\"Adaptable - adapts to new situations and demands by applying or updating knowledge and skills\\": \\"Well Prepared\\", \\"CSRF Token\\": \\"ImMyOTFkNDAzOGJkYjE0ZTRmODQ5ZjEyMGQxODk2ZjIwYzZkZTI4ODEi.ZOmPZw.0pI0c2XhZHAjaBtvAjlQ5msoqoA\\", \\"Communication (oral and written) \\\\u2013 speak/write in a clear,concise,correctmanner\\": \\"Well Prepared\\", \\"Comprehension - can restate information, ideas and concepts in different ways\\": \\"Well Prepared\\", \\"Computer skills\\": \\"Well Prepared\\", \\"Country of Residence\\": \\"Ghana\\", \\"Creative and innovative - creates innovative strategies and / or products that meet identified needs\\": \\"Well Prepared\\", \\"Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making\\": \\"Well Prepared\\", \\"Did your degree earned from CU provide the requisite technical know-how of your job?\\": \\"Select\\", \\"Do you have any suggestions for overall service delivery at Central University?\\": \\"Nothing\\", \\"Gender\\": \\"Male\\", \\"Have you ever been employed since graduation?\\": \\"Yes\\", \\"How likely are you to return to the same school?\\": \\"Very likely\\", \\"How likely are you to staying in your current job or profession?\\": \\"Very likely\\", \\"How long did it take you to find your job?\\": \\"I found employment prior to graduation\\", \\"How long did you work?\\": \\"1-3 months\\", \\"How long have you been employed or self-employed?\\": \\" Less than 6 months\\", \\"How related is your current job to your program of study?\\": \\" Fully related\\", \\"How would you rate your overall satisfaction with your university\\\\u2019s preparation for the type of work you were/are doing?\\": \\"Very satisfied\\", \\"In your current job, are you\\": \\"A permanent employee\\", \\"Job title\\": \\"Oh \\", \\"List programme\\": \\"asdf\\", \\"Mobile Number\\": \\"545977791\\", \\"Name of Institution\\": \\"asdf\\", \\"Organization\\": \\"Presto Solutions\\", \\"Organization Address\\": \\"Presto Solutions\\", \\"Organization and planning - determines tasks and resources to complete project objectives\\": \\"Well Prepared\\", \\"Overall how satisfied were you with the academic preparation for your current programme\\": \\"Very satisfied\\", \\"Programme Pursued\\": \\"Oh \\", \\"Quality of work - performs tasks accurately and pays attention to detail\\": \\"Well Prepared\\", \\"Quantitative skills (Ability to use mathematical concepts)\\": \\"Well Prepared\\", \\"Research and analysis - collects, analyzes and organizes relevant information\\": \\"Well Prepared\\", \\"Responsible - takes responsibility for his/her own actions and decisions\\": \\"Well Prepared\\", \\"Since your graduation have you gone on to take any other programme?\\": \\"Yes\\", \\"Specific job-related skills(e.g. technical skills)\\": \\"Well Prepared\\", \\"Specific job-related theoretical knowledge\\": \\"Well Prepared\\", \\"Submit\\": false, \\"Team-work\\": \\"Well Prepared\\", \\"Time management - sets priorities and allocates time efficiently to complete tasks within deadlines\\": \\"Well Prepared\\", \\"To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were\\": \\"Very helpful\\", \\"Type of Organization\\": \\"Private\\", \\"What is the main reason you are unemployed?\\": \\" There are no jobs available in my filed\\", \\"What is your current monthly gross salary?\\": \\"Below GHC1000\\", \\"Which one of the following best describes your current employment status?\\": \\"Working full-time\\", \\"Work Address\\": \\"Sankofa Avenue 15\\", \\"Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] \\": \\"Yes\\", \\"Year of Completion\\": 2000}"
101	"{\\"(If Yes, What is your current status, If No skip)\\": \\"Enrolled part time\\", \\"Adaptable - adapts to new situations and demands by applying or updating knowledge and skills\\": \\"Well Prepared\\", \\"CSRF Token\\": \\"ImMyOTFkNDAzOGJkYjE0ZTRmODQ5ZjEyMGQxODk2ZjIwYzZkZTI4ODEi.ZOmPZw.0pI0c2XhZHAjaBtvAjlQ5msoqoA\\", \\"Communication (oral and written) \\\\u2013 speak/write in a clear,concise,correctmanner\\": \\"Well Prepared\\", \\"Comprehension - can restate information, ideas and concepts in different ways\\": \\"Well Prepared\\", \\"Computer skills\\": \\"Well Prepared\\", \\"Country of Residence\\": \\"Ghana\\", \\"Creative and innovative - creates innovative strategies and / or products that meet identified needs\\": \\"Well Prepared\\", \\"Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making\\": \\"Well Prepared\\", \\"Did your degree earned from CU provide the requisite technical know-how of your job?\\": \\"Select\\", \\"Do you have any suggestions for overall service delivery at Central University?\\": \\"Nothing\\", \\"Gender\\": \\"Male\\", \\"Have you ever been employed since graduation?\\": \\"Yes\\", \\"How likely are you to return to the same school?\\": \\"Very likely\\", \\"How likely are you to staying in your current job or profession?\\": \\"Very likely\\", \\"How long did it take you to find your job?\\": \\"I found employment prior to graduation\\", \\"How long did you work?\\": \\"1-3 months\\", \\"How long have you been employed or self-employed?\\": \\" Less than 6 months\\", \\"How related is your current job to your program of study?\\": \\" Fully related\\", \\"How would you rate your overall satisfaction with your university\\\\u2019s preparation for the type of work you were/are doing?\\": \\"Very satisfied\\", \\"In your current job, are you\\": \\"A permanent employee\\", \\"Job title\\": \\"Oh \\", \\"List programme\\": \\"asdf\\", \\"Mobile Number\\": \\"545977791\\", \\"Name of Institution\\": \\"asdf\\", \\"Organization\\": \\"Presto Solutions\\", \\"Organization Address\\": \\"Presto Solutions\\", \\"Organization and planning - determines tasks and resources to complete project objectives\\": \\"Well Prepared\\", \\"Overall how satisfied were you with the academic preparation for your current programme\\": \\"Very satisfied\\", \\"Programme Pursued\\": \\"Oh \\", \\"Quality of work - performs tasks accurately and pays attention to detail\\": \\"Well Prepared\\", \\"Quantitative skills (Ability to use mathematical concepts)\\": \\"Well Prepared\\", \\"Research and analysis - collects, analyzes and organizes relevant information\\": \\"Well Prepared\\", \\"Responsible - takes responsibility for his/her own actions and decisions\\": \\"Well Prepared\\", \\"Since your graduation have you gone on to take any other programme?\\": \\"Yes\\", \\"Specific job-related skills(e.g. technical skills)\\": \\"Well Prepared\\", \\"Specific job-related theoretical knowledge\\": \\"Well Prepared\\", \\"Submit\\": false, \\"Team-work\\": \\"Well Prepared\\", \\"Time management - sets priorities and allocates time efficiently to complete tasks within deadlines\\": \\"Well Prepared\\", \\"To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were\\": \\"Very helpful\\", \\"Type of Organization\\": \\"Private\\", \\"What is the main reason you are unemployed?\\": \\" There are no jobs available in my filed\\", \\"What is your current monthly gross salary?\\": \\"Below GHC1000\\", \\"Which one of the following best describes your current employment status?\\": \\"Working full-time\\", \\"Work Address\\": \\"Sankofa Avenue 15\\", \\"Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] \\": \\"Yes\\", \\"Year of Completion\\": 2000}"
102	"{\\"(If Yes, What is your current status, If No skip)\\": \\"Enrolled part time\\", \\"Adaptable - adapts to new situations and demands by applying or updating knowledge and skills\\": \\"Well Prepared\\", \\"CSRF Token\\": \\"ImMyOTFkNDAzOGJkYjE0ZTRmODQ5ZjEyMGQxODk2ZjIwYzZkZTI4ODEi.ZOmPZw.0pI0c2XhZHAjaBtvAjlQ5msoqoA\\", \\"Communication (oral and written) \\\\u2013 speak/write in a clear,concise,correctmanner\\": \\"Well Prepared\\", \\"Comprehension - can restate information, ideas and concepts in different ways\\": \\"Well Prepared\\", \\"Computer skills\\": \\"Well Prepared\\", \\"Country of Residence\\": \\"Ghana\\", \\"Creative and innovative - creates innovative strategies and / or products that meet identified needs\\": \\"Well Prepared\\", \\"Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making\\": \\"Well Prepared\\", \\"Did your degree earned from CU provide the requisite technical know-how of your job?\\": \\"Select\\", \\"Do you have any suggestions for overall service delivery at Central University?\\": \\"Nothing\\", \\"Gender\\": \\"Male\\", \\"Have you ever been employed since graduation?\\": \\"Yes\\", \\"How likely are you to return to the same school?\\": \\"Very likely\\", \\"How likely are you to staying in your current job or profession?\\": \\"Very likely\\", \\"How long did it take you to find your job?\\": \\"I found employment prior to graduation\\", \\"How long did you work?\\": \\"1-3 months\\", \\"How long have you been employed or self-employed?\\": \\" Less than 6 months\\", \\"How related is your current job to your program of study?\\": \\" Fully related\\", \\"How would you rate your overall satisfaction with your university\\\\u2019s preparation for the type of work you were/are doing?\\": \\"Very satisfied\\", \\"In your current job, are you\\": \\"A permanent employee\\", \\"Job title\\": \\"Oh \\", \\"List programme\\": \\"asdf\\", \\"Mobile Number\\": \\"545977791\\", \\"Name of Institution\\": \\"asdf\\", \\"Organization\\": \\"Presto Solutions\\", \\"Organization Address\\": \\"Presto Solutions\\", \\"Organization and planning - determines tasks and resources to complete project objectives\\": \\"Well Prepared\\", \\"Overall how satisfied were you with the academic preparation for your current programme\\": \\"Very satisfied\\", \\"Programme Pursued\\": \\"Oh \\", \\"Quality of work - performs tasks accurately and pays attention to detail\\": \\"Well Prepared\\", \\"Quantitative skills (Ability to use mathematical concepts)\\": \\"Well Prepared\\", \\"Research and analysis - collects, analyzes and organizes relevant information\\": \\"Well Prepared\\", \\"Responsible - takes responsibility for his/her own actions and decisions\\": \\"Well Prepared\\", \\"Since your graduation have you gone on to take any other programme?\\": \\"Yes\\", \\"Specific job-related skills(e.g. technical skills)\\": \\"Well Prepared\\", \\"Specific job-related theoretical knowledge\\": \\"Well Prepared\\", \\"Submit\\": false, \\"Team-work\\": \\"Well Prepared\\", \\"Time management - sets priorities and allocates time efficiently to complete tasks within deadlines\\": \\"Well Prepared\\", \\"To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were\\": \\"Very helpful\\", \\"Type of Organization\\": \\"Private\\", \\"What is the main reason you are unemployed?\\": \\" There are no jobs available in my filed\\", \\"What is your current monthly gross salary?\\": \\"Below GHC1000\\", \\"Which one of the following best describes your current employment status?\\": \\"Working full-time\\", \\"Work Address\\": \\"Sankofa Avenue 15\\", \\"Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] \\": \\"Yes\\", \\"Year of Completion\\": 2000}"
103	"{\\"(If Yes, What is your current status, If No skip)\\": \\"Enrolled part time\\", \\"Adaptable - adapts to new situations and demands by applying or updating knowledge and skills\\": \\"Well Prepared\\", \\"CSRF Token\\": \\"ImMyOTFkNDAzOGJkYjE0ZTRmODQ5ZjEyMGQxODk2ZjIwYzZkZTI4ODEi.ZOmPZw.0pI0c2XhZHAjaBtvAjlQ5msoqoA\\", \\"Communication (oral and written) \\\\u2013 speak/write in a clear,concise,correctmanner\\": \\"Well Prepared\\", \\"Comprehension - can restate information, ideas and concepts in different ways\\": \\"Well Prepared\\", \\"Computer skills\\": \\"Well Prepared\\", \\"Country of Residence\\": \\"Ghana\\", \\"Creative and innovative - creates innovative strategies and / or products that meet identified needs\\": \\"Well Prepared\\", \\"Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making\\": \\"Well Prepared\\", \\"Did your degree earned from CU provide the requisite technical know-how of your job?\\": \\"Select\\", \\"Do you have any suggestions for overall service delivery at Central University?\\": \\"Nothing\\", \\"Gender\\": \\"Male\\", \\"Have you ever been employed since graduation?\\": \\"Yes\\", \\"How likely are you to return to the same school?\\": \\"Very likely\\", \\"How likely are you to staying in your current job or profession?\\": \\"Very likely\\", \\"How long did it take you to find your job?\\": \\"I found employment prior to graduation\\", \\"How long did you work?\\": \\"1-3 months\\", \\"How long have you been employed or self-employed?\\": \\" Less than 6 months\\", \\"How related is your current job to your program of study?\\": \\" Fully related\\", \\"How would you rate your overall satisfaction with your university\\\\u2019s preparation for the type of work you were/are doing?\\": \\"Very satisfied\\", \\"In your current job, are you\\": \\"A permanent employee\\", \\"Job title\\": \\"Oh \\", \\"List programme\\": \\"asdf\\", \\"Mobile Number\\": \\"545977791\\", \\"Name of Institution\\": \\"asdf\\", \\"Organization\\": \\"Presto Solutions\\", \\"Organization Address\\": \\"Presto Solutions\\", \\"Organization and planning - determines tasks and resources to complete project objectives\\": \\"Well Prepared\\", \\"Overall how satisfied were you with the academic preparation for your current programme\\": \\"Very satisfied\\", \\"Programme Pursued\\": \\"Oh \\", \\"Quality of work - performs tasks accurately and pays attention to detail\\": \\"Well Prepared\\", \\"Quantitative skills (Ability to use mathematical concepts)\\": \\"Well Prepared\\", \\"Research and analysis - collects, analyzes and organizes relevant information\\": \\"Well Prepared\\", \\"Responsible - takes responsibility for his/her own actions and decisions\\": \\"Well Prepared\\", \\"Since your graduation have you gone on to take any other programme?\\": \\"Yes\\", \\"Specific job-related skills(e.g. technical skills)\\": \\"Well Prepared\\", \\"Specific job-related theoretical knowledge\\": \\"Well Prepared\\", \\"Submit\\": false, \\"Team-work\\": \\"Well Prepared\\", \\"Time management - sets priorities and allocates time efficiently to complete tasks within deadlines\\": \\"Well Prepared\\", \\"To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were\\": \\"Very helpful\\", \\"Type of Organization\\": \\"Private\\", \\"What is the main reason you are unemployed?\\": \\" There are no jobs available in my filed\\", \\"What is your current monthly gross salary?\\": \\"Below GHC1000\\", \\"Which one of the following best describes your current employment status?\\": \\"Working full-time\\", \\"Work Address\\": \\"Sankofa Avenue 15\\", \\"Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] \\": \\"Yes\\", \\"Year of Completion\\": 2000}"
104	"{\\"(If Yes, What is your current status, If No skip)\\": \\"Enrolled part time\\", \\"Adaptable - adapts to new situations and demands by applying or updating knowledge and skills\\": \\"Well Prepared\\", \\"CSRF Token\\": \\"ImMyOTFkNDAzOGJkYjE0ZTRmODQ5ZjEyMGQxODk2ZjIwYzZkZTI4ODEi.ZOmPZw.0pI0c2XhZHAjaBtvAjlQ5msoqoA\\", \\"Communication (oral and written) \\\\u2013 speak/write in a clear,concise,correctmanner\\": \\"Well Prepared\\", \\"Comprehension - can restate information, ideas and concepts in different ways\\": \\"Well Prepared\\", \\"Computer skills\\": \\"Well Prepared\\", \\"Country of Residence\\": \\"Ghana\\", \\"Creative and innovative - creates innovative strategies and / or products that meet identified needs\\": \\"Well Prepared\\", \\"Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making\\": \\"Well Prepared\\", \\"Did your degree earned from CU provide the requisite technical know-how of your job?\\": \\"Select\\", \\"Do you have any suggestions for overall service delivery at Central University?\\": \\"Nothing\\", \\"Gender\\": \\"Male\\", \\"Have you ever been employed since graduation?\\": \\"Yes\\", \\"How likely are you to return to the same school?\\": \\"Very likely\\", \\"How likely are you to staying in your current job or profession?\\": \\"Very likely\\", \\"How long did it take you to find your job?\\": \\"I found employment prior to graduation\\", \\"How long did you work?\\": \\"1-3 months\\", \\"How long have you been employed or self-employed?\\": \\" Less than 6 months\\", \\"How related is your current job to your program of study?\\": \\" Fully related\\", \\"How would you rate your overall satisfaction with your university\\\\u2019s preparation for the type of work you were/are doing?\\": \\"Very satisfied\\", \\"In your current job, are you\\": \\"A permanent employee\\", \\"Job title\\": \\"Oh \\", \\"List programme\\": \\"asdf\\", \\"Mobile Number\\": \\"545977791\\", \\"Name of Institution\\": \\"asdf\\", \\"Organization\\": \\"Presto Solutions\\", \\"Organization Address\\": \\"Presto Solutions\\", \\"Organization and planning - determines tasks and resources to complete project objectives\\": \\"Well Prepared\\", \\"Overall how satisfied were you with the academic preparation for your current programme\\": \\"Very satisfied\\", \\"Programme Pursued\\": \\"Oh \\", \\"Quality of work - performs tasks accurately and pays attention to detail\\": \\"Well Prepared\\", \\"Quantitative skills (Ability to use mathematical concepts)\\": \\"Well Prepared\\", \\"Research and analysis - collects, analyzes and organizes relevant information\\": \\"Well Prepared\\", \\"Responsible - takes responsibility for his/her own actions and decisions\\": \\"Well Prepared\\", \\"Since your graduation have you gone on to take any other programme?\\": \\"Yes\\", \\"Specific job-related skills(e.g. technical skills)\\": \\"Well Prepared\\", \\"Specific job-related theoretical knowledge\\": \\"Well Prepared\\", \\"Submit\\": false, \\"Team-work\\": \\"Well Prepared\\", \\"Time management - sets priorities and allocates time efficiently to complete tasks within deadlines\\": \\"Well Prepared\\", \\"To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were\\": \\"Very helpful\\", \\"Type of Organization\\": \\"Private\\", \\"What is the main reason you are unemployed?\\": \\" There are no jobs available in my filed\\", \\"What is your current monthly gross salary?\\": \\"Below GHC1000\\", \\"Which one of the following best describes your current employment status?\\": \\"Working full-time\\", \\"Work Address\\": \\"Sankofa Avenue 15\\", \\"Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] \\": \\"Yes\\", \\"Year of Completion\\": 2000}"
105	"{\\"(If Yes, What is your current status, If No skip)\\": \\"Enrolled part time\\", \\"Adaptable - adapts to new situations and demands by applying or updating knowledge and skills\\": \\"Well Prepared\\", \\"CSRF Token\\": \\"ImMyOTFkNDAzOGJkYjE0ZTRmODQ5ZjEyMGQxODk2ZjIwYzZkZTI4ODEi.ZOmPZw.0pI0c2XhZHAjaBtvAjlQ5msoqoA\\", \\"Communication (oral and written) \\\\u2013 speak/write in a clear,concise,correctmanner\\": \\"Well Prepared\\", \\"Comprehension - can restate information, ideas and concepts in different ways\\": \\"Well Prepared\\", \\"Computer skills\\": \\"Well Prepared\\", \\"Country of Residence\\": \\"Ghana\\", \\"Creative and innovative - creates innovative strategies and / or products that meet identified needs\\": \\"Well Prepared\\", \\"Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making\\": \\"Well Prepared\\", \\"Did your degree earned from CU provide the requisite technical know-how of your job?\\": \\"Select\\", \\"Do you have any suggestions for overall service delivery at Central University?\\": \\"Nothing\\", \\"Gender\\": \\"Male\\", \\"Have you ever been employed since graduation?\\": \\"Yes\\", \\"How likely are you to return to the same school?\\": \\"Very likely\\", \\"How likely are you to staying in your current job or profession?\\": \\"Very likely\\", \\"How long did it take you to find your job?\\": \\"I found employment prior to graduation\\", \\"How long did you work?\\": \\"1-3 months\\", \\"How long have you been employed or self-employed?\\": \\" Less than 6 months\\", \\"How related is your current job to your program of study?\\": \\" Fully related\\", \\"How would you rate your overall satisfaction with your university\\\\u2019s preparation for the type of work you were/are doing?\\": \\"Very satisfied\\", \\"In your current job, are you\\": \\"A permanent employee\\", \\"Job title\\": \\"Oh \\", \\"List programme\\": \\"asdf\\", \\"Mobile Number\\": \\"545977791\\", \\"Name of Institution\\": \\"asdf\\", \\"Organization\\": \\"Presto Solutions\\", \\"Organization Address\\": \\"Presto Solutions\\", \\"Organization and planning - determines tasks and resources to complete project objectives\\": \\"Well Prepared\\", \\"Overall how satisfied were you with the academic preparation for your current programme\\": \\"Very satisfied\\", \\"Programme Pursued\\": \\"Oh \\", \\"Quality of work - performs tasks accurately and pays attention to detail\\": \\"Well Prepared\\", \\"Quantitative skills (Ability to use mathematical concepts)\\": \\"Well Prepared\\", \\"Research and analysis - collects, analyzes and organizes relevant information\\": \\"Well Prepared\\", \\"Responsible - takes responsibility for his/her own actions and decisions\\": \\"Well Prepared\\", \\"Since your graduation have you gone on to take any other programme?\\": \\"Yes\\", \\"Specific job-related skills(e.g. technical skills)\\": \\"Well Prepared\\", \\"Specific job-related theoretical knowledge\\": \\"Well Prepared\\", \\"Submit\\": false, \\"Team-work\\": \\"Well Prepared\\", \\"Time management - sets priorities and allocates time efficiently to complete tasks within deadlines\\": \\"Well Prepared\\", \\"To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were\\": \\"Very helpful\\", \\"Type of Organization\\": \\"Private\\", \\"What is the main reason you are unemployed?\\": \\" There are no jobs available in my filed\\", \\"What is your current monthly gross salary?\\": \\"Below GHC1000\\", \\"Which one of the following best describes your current employment status?\\": \\"Working full-time\\", \\"Work Address\\": \\"Sankofa Avenue 15\\", \\"Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] \\": \\"Yes\\", \\"Year of Completion\\": 2000}"
65	"{\\"(If Yes, What is your current status, If No skip)\\": \\"Enrolled part time\\", \\"Adaptable - adapts to new situations and demands by applying or updating knowledge and skills\\": \\"Well Prepared\\", \\"CSRF Token\\": \\"ImMyOTFkNDAzOGJkYjE0ZTRmODQ5ZjEyMGQxODk2ZjIwYzZkZTI4ODEi.ZOl0vQ.hKm5NX3yQ2VIpgJ4PbeBRB10yis\\", \\"Communication (oral and written) \\\\u2013 speak/write in a clear,concise,correctmanner\\": \\"Well Prepared\\", \\"Comprehension - can restate information, ideas and concepts in different ways\\": \\"Well Prepared\\", \\"Computer skills\\": \\"Well Prepared\\", \\"Country of Residence\\": \\"Ghana\\", \\"Creative and innovative - creates innovative strategies and / or products that meet identified needs\\": \\"Well Prepared\\", \\"Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making\\": \\"Well Prepared\\", \\"Did your degree earned from CU provide the requisite technical know-how of your job?\\": \\"Select\\", \\"Do you have any suggestions for overall service delivery at Central University?\\": \\"Nothing\\", \\"Gender\\": \\"Male\\", \\"Have you ever been employed since graduation?\\": \\"Yes\\", \\"How likely are you to return to the same school?\\": \\"Very likely\\", \\"How likely are you to staying in your current job or profession?\\": \\"Very likely\\", \\"How long did it take you to find your job?\\": \\"I found employment prior to graduation\\", \\"How long did you work?\\": \\"1-3 months\\", \\"How long have you been employed or self-employed?\\": \\" Less than 6 months\\", \\"How related is your current job to your program of study?\\": \\" Fully related\\", \\"How would you rate your overall satisfaction with your university\\\\u2019s preparation for the type of work you were/are doing?\\": \\"Very satisfied\\", \\"In your current job, are you\\": \\"A permanent employee\\", \\"Job title\\": \\"Oh \\", \\"List programme\\": \\"asdf\\", \\"Mobile Number\\": \\"545977791\\", \\"Name of Institution\\": \\"asdf\\", \\"Organization\\": \\"Presto Solutions\\", \\"Organization Address\\": \\"Presto Solutions\\", \\"Organization and planning - determines tasks and resources to complete project objectives\\": \\"Well Prepared\\", \\"Overall how satisfied were you with the academic preparation for your current programme\\": \\"Very satisfied\\", \\"Programme Pursued\\": \\"Oh \\", \\"Quality of work - performs tasks accurately and pays attention to detail\\": \\"Well Prepared\\", \\"Quantitative skills (Ability to use mathematical concepts)\\": \\"Well Prepared\\", \\"Research and analysis - collects, analyzes and organizes relevant information\\": \\"Well Prepared\\", \\"Responsible - takes responsibility for his/her own actions and decisions\\": \\"Well Prepared\\", \\"Since your graduation have you gone on to take any other programme?\\": \\"Yes\\", \\"Specific job-related skills(e.g. technical skills)\\": \\"Well Prepared\\", \\"Specific job-related theoretical knowledge\\": \\"Well Prepared\\", \\"Submit\\": false, \\"Team-work\\": \\"Well Prepared\\", \\"Time management - sets priorities and allocates time efficiently to complete tasks within deadlines\\": \\"Well Prepared\\", \\"To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were\\": \\"Very helpful\\", \\"Type of Organization\\": \\"Private\\", \\"What is the main reason you are unemployed?\\": \\" There are no jobs available in my filed\\", \\"What is your current monthly gross salary?\\": \\"Below GHC1000\\", \\"Which one of the following best describes your current employment status?\\": \\"Working full-time\\", \\"Work Address\\": \\"Sankofa Avenue 15\\", \\"Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] \\": \\"Yes\\", \\"Year of Completion\\": 2000}"
\.


--
-- Name: tracer_form_response_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tracer_form_response_id_seq', 105, true);


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "user" (id, firstname, lastname, phone, email, answers) FROM stdin;
\.


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_id_seq', 1, false);


--
-- Name: alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: course_allocation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY course_allocation
    ADD CONSTRAINT course_allocation_pkey PRIMARY KEY (id);


--
-- Name: department_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY department
    ADD CONSTRAINT department_pkey PRIMARY KEY (id);


--
-- Name: lecture_assessment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lecture_assessment
    ADD CONSTRAINT lecture_assessment_pkey PRIMARY KEY (id);


--
-- Name: lecturer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lecturer
    ADD CONSTRAINT lecturer_pkey PRIMARY KEY (id);


--
-- Name: question_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY question
    ADD CONSTRAINT question_pkey PRIMARY KEY (id);


--
-- Name: registration_form_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY registration_form
    ADD CONSTRAINT registration_form_pkey PRIMARY KEY (id);


--
-- Name: responses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY responses
    ADD CONSTRAINT responses_pkey PRIMARY KEY (id);


--
-- Name: school_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY school
    ADD CONSTRAINT school_pkey PRIMARY KEY (id);


--
-- Name: section_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY section
    ADD CONSTRAINT section_pkey PRIMARY KEY (id);


--
-- Name: survey_form_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY survey_form
    ADD CONSTRAINT survey_form_pkey PRIMARY KEY (id);


--
-- Name: survey_question_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY survey_question
    ADD CONSTRAINT survey_question_pkey PRIMARY KEY (id);


--
-- Name: tracer_form_response_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tracer_form_response
    ADD CONSTRAINT tracer_form_response_pkey PRIMARY KEY (id);


--
-- Name: user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

