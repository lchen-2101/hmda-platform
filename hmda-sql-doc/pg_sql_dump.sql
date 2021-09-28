--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE hmda_user;
ALTER ROLE hmda_user WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE hmda_user_rd;
ALTER ROLE hmda_user_rd WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;






--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3 (Debian 13.3-1.pgdg100+1)
-- Dumped by pg_dump version 13.4 (Ubuntu 13.4-0ubuntu0.21.04.1)

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

--
-- PostgreSQL database dump complete
--

--
-- Database "hmda" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3 (Debian 13.3-1.pgdg100+1)
-- Dumped by pg_dump version 13.4 (Ubuntu 13.4-0ubuntu0.21.04.1)

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

--
-- Name: hmda; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE hmda WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE hmda OWNER TO postgres;

\connect hmda

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

--
-- Name: hmda_beta_user; Type: SCHEMA; Schema: -; Owner: hmda_user
--

CREATE SCHEMA hmda_beta_user;


ALTER SCHEMA hmda_beta_user OWNER TO hmda_user;

--
-- Name: hmda_user; Type: SCHEMA; Schema: -; Owner: hmda_user
--

CREATE SCHEMA hmda_user;


ALTER SCHEMA hmda_user OWNER TO hmda_user;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: institutions2019; Type: TABLE; Schema: hmda_beta_user; Owner: hmda_user
--

CREATE TABLE hmda_beta_user.institutions2019 (
    lei character varying NOT NULL,
    activity_year integer NOT NULL,
    agency integer NOT NULL,
    institution_type integer NOT NULL,
    id2017 character varying NOT NULL,
    tax_id character varying NOT NULL,
    rssd integer NOT NULL,
    respondent_name character varying NOT NULL,
    respondent_state character varying NOT NULL,
    respondent_city character varying NOT NULL,
    parent_id_rssd integer NOT NULL,
    parent_name character varying NOT NULL,
    assets integer NOT NULL,
    other_lender_code integer NOT NULL,
    topholder_id_rssd integer NOT NULL,
    topholder_name character varying NOT NULL,
    hmda_filer boolean NOT NULL,
    quarterly_filer boolean DEFAULT false NOT NULL,
    quarterly_filer_has_filed boolean DEFAULT false NOT NULL,
    notes text NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE hmda_beta_user.institutions2019 OWNER TO hmda_user;

--
-- Name: institutions_emails; Type: TABLE; Schema: hmda_beta_user; Owner: hmda_user
--

CREATE TABLE hmda_beta_user.institutions_emails (
    id integer NOT NULL,
    lei character varying NOT NULL,
    email_domain character varying NOT NULL
);


ALTER TABLE hmda_beta_user.institutions_emails OWNER TO hmda_user;

--
-- Name: institutions_emails_id_seq; Type: SEQUENCE; Schema: hmda_beta_user; Owner: hmda_user
--

CREATE SEQUENCE hmda_beta_user.institutions_emails_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hmda_beta_user.institutions_emails_id_seq OWNER TO hmda_user;

--
-- Name: institutions_emails_id_seq; Type: SEQUENCE OWNED BY; Schema: hmda_beta_user; Owner: hmda_user
--

ALTER SEQUENCE hmda_beta_user.institutions_emails_id_seq OWNED BY hmda_beta_user.institutions_emails.id;


--
-- Name: institutions2018; Type: TABLE; Schema: hmda_user; Owner: hmda_user
--

CREATE TABLE hmda_user.institutions2018 (
    lei character varying NOT NULL,
    activity_year integer NOT NULL,
    agency integer NOT NULL,
    institution_type integer NOT NULL,
    id2017 character varying NOT NULL,
    tax_id character varying NOT NULL,
    rssd integer NOT NULL,
    respondent_name character varying NOT NULL,
    respondent_state character varying NOT NULL,
    respondent_city character varying NOT NULL,
    parent_id_rssd integer NOT NULL,
    parent_name character varying NOT NULL,
    assets integer NOT NULL,
    other_lender_code integer NOT NULL,
    topholder_id_rssd integer NOT NULL,
    topholder_name character varying NOT NULL,
    hmda_filer boolean DEFAULT false NOT NULL,
    quarterly_filer boolean DEFAULT false NOT NULL,
    notes text NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE hmda_user.institutions2018 OWNER TO hmda_user;

--
-- Name: institutions2019; Type: TABLE; Schema: hmda_user; Owner: hmda_user
--

CREATE TABLE hmda_user.institutions2019 (
    lei character varying NOT NULL,
    activity_year integer NOT NULL,
    agency integer NOT NULL,
    institution_type integer NOT NULL,
    id2017 character varying NOT NULL,
    tax_id character varying NOT NULL,
    rssd integer NOT NULL,
    respondent_name character varying NOT NULL,
    respondent_state character varying NOT NULL,
    respondent_city character varying NOT NULL,
    parent_id_rssd integer NOT NULL,
    parent_name character varying NOT NULL,
    assets integer NOT NULL,
    other_lender_code integer NOT NULL,
    topholder_id_rssd integer NOT NULL,
    topholder_name character varying NOT NULL,
    hmda_filer boolean NOT NULL,
    quarterly_filer boolean DEFAULT false NOT NULL,
    quarterly_filer_has_filed boolean DEFAULT false NOT NULL,
    notes text NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE hmda_user.institutions2019 OWNER TO hmda_user;

--
-- Name: institutions2020; Type: TABLE; Schema: hmda_user; Owner: hmda_user
--

CREATE TABLE hmda_user.institutions2020 (
    lei character varying NOT NULL,
    activity_year integer NOT NULL,
    agency integer NOT NULL,
    institution_type integer NOT NULL,
    id2017 character varying NOT NULL,
    tax_id character varying NOT NULL,
    rssd integer NOT NULL,
    respondent_name character varying NOT NULL,
    respondent_state character varying NOT NULL,
    respondent_city character varying NOT NULL,
    parent_id_rssd integer NOT NULL,
    parent_name character varying NOT NULL,
    assets integer NOT NULL,
    other_lender_code integer NOT NULL,
    topholder_id_rssd integer NOT NULL,
    topholder_name character varying NOT NULL,
    hmda_filer boolean NOT NULL,
    quarterly_filer boolean DEFAULT false NOT NULL,
    notes text NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE hmda_user.institutions2020 OWNER TO hmda_user;

--
-- Name: institutions2021; Type: TABLE; Schema: hmda_user; Owner: hmda_user
--

CREATE TABLE hmda_user.institutions2021 (
    lei character varying NOT NULL,
    activity_year integer NOT NULL,
    agency integer NOT NULL,
    institution_type integer NOT NULL,
    id2017 character varying NOT NULL,
    tax_id character varying NOT NULL,
    rssd integer NOT NULL,
    respondent_name character varying NOT NULL,
    respondent_state character varying NOT NULL,
    respondent_city character varying NOT NULL,
    parent_id_rssd integer NOT NULL,
    parent_name character varying NOT NULL,
    assets integer NOT NULL,
    other_lender_code integer NOT NULL,
    topholder_id_rssd integer NOT NULL,
    topholder_name character varying NOT NULL,
    hmda_filer boolean NOT NULL,
    quarterly_filer boolean DEFAULT false NOT NULL,
    notes text NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE hmda_user.institutions2021 OWNER TO hmda_user;

--
-- Name: institutions_history_notes; Type: TABLE; Schema: hmda_user; Owner: hmda_user
--

CREATE TABLE hmda_user.institutions_history_notes (
    id integer NOT NULL,
    lei character varying NOT NULL,
    history_id character varying NOT NULL,
    notes character varying NOT NULL
);


ALTER TABLE hmda_user.institutions_history_notes OWNER TO hmda_user;

--
-- Name: institutions_history_notes_id_seq; Type: SEQUENCE; Schema: hmda_user; Owner: hmda_user
--

CREATE SEQUENCE hmda_user.institutions_history_notes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hmda_user.institutions_history_notes_id_seq OWNER TO hmda_user;

--
-- Name: institutions_history_notes_id_seq; Type: SEQUENCE OWNED BY; Schema: hmda_user; Owner: hmda_user
--

ALTER SEQUENCE hmda_user.institutions_history_notes_id_seq OWNED BY hmda_user.institutions_history_notes.id;


--
-- Name: lar2020_q1; Type: TABLE; Schema: hmda_user; Owner: hmda_user
--

CREATE TABLE hmda_user.lar2020_q1 (
    id integer,
    lei character varying,
    uli character varying,
    application_date character varying,
    loan_type integer,
    loan_purpose integer,
    preapproval integer,
    construction_method character varying,
    occupancy_type integer,
    loan_amount numeric,
    action_taken_type integer,
    action_taken_date integer,
    street character varying,
    city character varying,
    state character varying,
    zip character varying,
    county character varying,
    tract character varying,
    ethnicity_applicant_1 character varying,
    ethnicity_applicant_2 character varying,
    ethnicity_applicant_3 character varying,
    ethnicity_applicant_4 character varying,
    ethnicity_applicant_5 character varying,
    other_hispanic_applicant character varying,
    ethnicity_co_applicant_1 character varying,
    ethnicity_co_applicant_2 character varying,
    ethnicity_co_applicant_3 character varying,
    ethnicity_co_applicant_4 character varying,
    ethnicity_co_applicant_5 character varying,
    other_hispanic_co_applicant character varying,
    ethnicity_observed_applicant integer,
    ethnicity_observed_co_applicant integer,
    race_applicant_1 character varying,
    race_applicant_2 character varying,
    race_applicant_3 character varying,
    race_applicant_4 character varying,
    race_applicant_5 character varying,
    other_native_race_applicant character varying,
    other_asian_race_applicant character varying,
    other_pacific_race_applicant character varying,
    race_co_applicant_1 character varying,
    race_co_applicant_2 character varying,
    race_co_applicant_3 character varying,
    race_co_applicant_4 character varying,
    race_co_applicant_5 character varying,
    other_native_race_co_applicant character varying,
    other_asian_race_co_applicant character varying,
    other_pacific_race_co_applicant character varying,
    race_observed_applicant integer,
    race_observed_co_applicant integer,
    sex_applicant integer,
    sex_co_applicant integer,
    observed_sex_applicant integer,
    observed_sex_co_applicant integer,
    age_applicant integer,
    age_co_applicant integer,
    income character varying,
    purchaser_type integer,
    rate_spread character varying,
    hoepa_status integer,
    lien_status integer,
    credit_score_applicant integer,
    credit_score_co_applicant integer,
    credit_score_type_applicant integer,
    credit_score_model_applicant character varying,
    credit_score_type_co_applicant integer,
    credit_score_model_co_applicant character varying,
    denial_reason1 character varying,
    denial_reason2 character varying,
    denial_reason3 character varying,
    denial_reason4 character varying,
    other_denial_reason character varying,
    total_loan_costs character varying,
    total_points character varying,
    origination_charges character varying,
    discount_points character varying,
    lender_credits character varying,
    interest_rate character varying,
    payment_penalty character varying,
    debt_to_incode character varying,
    loan_value_ratio character varying,
    loan_term character varying,
    rate_spread_intro character varying,
    baloon_payment integer,
    insert_only_payment integer,
    amortization integer,
    other_amortization integer,
    property_value character varying,
    home_security_policy integer,
    lan_property_interest integer,
    total_uits integer,
    mf_affordable character varying,
    application_submission integer,
    payable integer,
    nmls character varying,
    aus1 character varying,
    aus2 character varying,
    aus3 character varying,
    aus4 character varying,
    aus5 character varying,
    other_aus character varying,
    aus1_result integer,
    aus2_result character varying,
    aus3_result character varying,
    aus4_result character varying,
    aus5_result character varying,
    other_aus_result character varying,
    reverse_mortgage integer,
    line_of_credits integer,
    business_or_commercial integer,
    conforming_loan_limit character varying,
    ethnicity_categorization character varying,
    race_categorization character varying,
    sex_categorization character varying,
    dwelling_categorization character varying,
    loan_product_type_categorization character varying,
    tract_population integer,
    tract_minority_population_percent double precision,
    ffiec_msa_md_median_family_income integer,
    tract_owner_occupied_units integer,
    tract_one_to_four_family_homes integer,
    tract_median_age_of_housing_units integer,
    tract_to_msa_income_percentage double precision,
    is_quarterly boolean,
    created_at timestamp without time zone,
    msa_md character varying,
    msa_md_name character varying,
    checksum character varying
);


ALTER TABLE hmda_user.lar2020_q1 OWNER TO hmda_user;

--
-- Name: lar2020_q2; Type: TABLE; Schema: hmda_user; Owner: hmda_user
--

CREATE TABLE hmda_user.lar2020_q2 (
    id integer,
    lei character varying,
    uli character varying,
    application_date character varying,
    loan_type integer,
    loan_purpose integer,
    preapproval integer,
    construction_method character varying,
    occupancy_type integer,
    loan_amount numeric,
    action_taken_type integer,
    action_taken_date integer,
    street character varying,
    city character varying,
    state character varying,
    zip character varying,
    county character varying,
    tract character varying,
    ethnicity_applicant_1 character varying,
    ethnicity_applicant_2 character varying,
    ethnicity_applicant_3 character varying,
    ethnicity_applicant_4 character varying,
    ethnicity_applicant_5 character varying,
    other_hispanic_applicant character varying,
    ethnicity_co_applicant_1 character varying,
    ethnicity_co_applicant_2 character varying,
    ethnicity_co_applicant_3 character varying,
    ethnicity_co_applicant_4 character varying,
    ethnicity_co_applicant_5 character varying,
    other_hispanic_co_applicant character varying,
    ethnicity_observed_applicant integer,
    ethnicity_observed_co_applicant integer,
    race_applicant_1 character varying,
    race_applicant_2 character varying,
    race_applicant_3 character varying,
    race_applicant_4 character varying,
    race_applicant_5 character varying,
    other_native_race_applicant character varying,
    other_asian_race_applicant character varying,
    other_pacific_race_applicant character varying,
    race_co_applicant_1 character varying,
    race_co_applicant_2 character varying,
    race_co_applicant_3 character varying,
    race_co_applicant_4 character varying,
    race_co_applicant_5 character varying,
    other_native_race_co_applicant character varying,
    other_asian_race_co_applicant character varying,
    other_pacific_race_co_applicant character varying,
    race_observed_applicant integer,
    race_observed_co_applicant integer,
    sex_applicant integer,
    sex_co_applicant integer,
    observed_sex_applicant integer,
    observed_sex_co_applicant integer,
    age_applicant integer,
    age_co_applicant integer,
    income character varying,
    purchaser_type integer,
    rate_spread character varying,
    hoepa_status integer,
    lien_status integer,
    credit_score_applicant integer,
    credit_score_co_applicant integer,
    credit_score_type_applicant integer,
    credit_score_model_applicant character varying,
    credit_score_type_co_applicant integer,
    credit_score_model_co_applicant character varying,
    denial_reason1 character varying,
    denial_reason2 character varying,
    denial_reason3 character varying,
    denial_reason4 character varying,
    other_denial_reason character varying,
    total_loan_costs character varying,
    total_points character varying,
    origination_charges character varying,
    discount_points character varying,
    lender_credits character varying,
    interest_rate character varying,
    payment_penalty character varying,
    debt_to_incode character varying,
    loan_value_ratio character varying,
    loan_term character varying,
    rate_spread_intro character varying,
    baloon_payment integer,
    insert_only_payment integer,
    amortization integer,
    other_amortization integer,
    property_value character varying,
    home_security_policy integer,
    lan_property_interest integer,
    total_uits integer,
    mf_affordable character varying,
    application_submission integer,
    payable integer,
    nmls character varying,
    aus1 character varying,
    aus2 character varying,
    aus3 character varying,
    aus4 character varying,
    aus5 character varying,
    other_aus character varying,
    aus1_result integer,
    aus2_result character varying,
    aus3_result character varying,
    aus4_result character varying,
    aus5_result character varying,
    other_aus_result character varying,
    reverse_mortgage integer,
    line_of_credits integer,
    business_or_commercial integer,
    conforming_loan_limit character varying,
    ethnicity_categorization character varying,
    race_categorization character varying,
    sex_categorization character varying,
    dwelling_categorization character varying,
    loan_product_type_categorization character varying,
    tract_population integer,
    tract_minority_population_percent double precision,
    ffiec_msa_md_median_family_income integer,
    tract_owner_occupied_units integer,
    tract_one_to_four_family_homes integer,
    tract_median_age_of_housing_units integer,
    tract_to_msa_income_percentage double precision,
    is_quarterly boolean,
    created_at timestamp without time zone,
    msa_md character varying,
    msa_md_name character varying,
    checksum character varying
);


ALTER TABLE hmda_user.lar2020_q2 OWNER TO hmda_user;

--
-- Name: lar2020_q3; Type: TABLE; Schema: hmda_user; Owner: hmda_user
--

CREATE TABLE hmda_user.lar2020_q3 (
    id integer,
    lei character varying,
    uli character varying,
    application_date character varying,
    loan_type integer,
    loan_purpose integer,
    preapproval integer,
    construction_method character varying,
    occupancy_type integer,
    loan_amount numeric,
    action_taken_type integer,
    action_taken_date integer,
    street character varying,
    city character varying,
    state character varying,
    zip character varying,
    county character varying,
    tract character varying,
    ethnicity_applicant_1 character varying,
    ethnicity_applicant_2 character varying,
    ethnicity_applicant_3 character varying,
    ethnicity_applicant_4 character varying,
    ethnicity_applicant_5 character varying,
    other_hispanic_applicant character varying,
    ethnicity_co_applicant_1 character varying,
    ethnicity_co_applicant_2 character varying,
    ethnicity_co_applicant_3 character varying,
    ethnicity_co_applicant_4 character varying,
    ethnicity_co_applicant_5 character varying,
    other_hispanic_co_applicant character varying,
    ethnicity_observed_applicant integer,
    ethnicity_observed_co_applicant integer,
    race_applicant_1 character varying,
    race_applicant_2 character varying,
    race_applicant_3 character varying,
    race_applicant_4 character varying,
    race_applicant_5 character varying,
    other_native_race_applicant character varying,
    other_asian_race_applicant character varying,
    other_pacific_race_applicant character varying,
    race_co_applicant_1 character varying,
    race_co_applicant_2 character varying,
    race_co_applicant_3 character varying,
    race_co_applicant_4 character varying,
    race_co_applicant_5 character varying,
    other_native_race_co_applicant character varying,
    other_asian_race_co_applicant character varying,
    other_pacific_race_co_applicant character varying,
    race_observed_applicant integer,
    race_observed_co_applicant integer,
    sex_applicant integer,
    sex_co_applicant integer,
    observed_sex_applicant integer,
    observed_sex_co_applicant integer,
    age_applicant integer,
    age_co_applicant integer,
    income character varying,
    purchaser_type integer,
    rate_spread character varying,
    hoepa_status integer,
    lien_status integer,
    credit_score_applicant integer,
    credit_score_co_applicant integer,
    credit_score_type_applicant integer,
    credit_score_model_applicant character varying,
    credit_score_type_co_applicant integer,
    credit_score_model_co_applicant character varying,
    denial_reason1 character varying,
    denial_reason2 character varying,
    denial_reason3 character varying,
    denial_reason4 character varying,
    other_denial_reason character varying,
    total_loan_costs character varying,
    total_points character varying,
    origination_charges character varying,
    discount_points character varying,
    lender_credits character varying,
    interest_rate character varying,
    payment_penalty character varying,
    debt_to_incode character varying,
    loan_value_ratio character varying,
    loan_term character varying,
    rate_spread_intro character varying,
    baloon_payment integer,
    insert_only_payment integer,
    amortization integer,
    other_amortization integer,
    property_value character varying,
    home_security_policy integer,
    lan_property_interest integer,
    total_uits integer,
    mf_affordable character varying,
    application_submission integer,
    payable integer,
    nmls character varying,
    aus1 character varying,
    aus2 character varying,
    aus3 character varying,
    aus4 character varying,
    aus5 character varying,
    other_aus character varying,
    aus1_result integer,
    aus2_result character varying,
    aus3_result character varying,
    aus4_result character varying,
    aus5_result character varying,
    other_aus_result character varying,
    reverse_mortgage integer,
    line_of_credits integer,
    business_or_commercial integer,
    conforming_loan_limit character varying,
    ethnicity_categorization character varying,
    race_categorization character varying,
    sex_categorization character varying,
    dwelling_categorization character varying,
    loan_product_type_categorization character varying,
    tract_population integer,
    tract_minority_population_percent double precision,
    ffiec_msa_md_median_family_income integer,
    tract_owner_occupied_units integer,
    tract_one_to_four_family_homes integer,
    tract_median_age_of_housing_units integer,
    tract_to_msa_income_percentage double precision,
    is_quarterly boolean,
    created_at timestamp without time zone,
    msa_md character varying,
    msa_md_name character varying,
    checksum character varying
);


ALTER TABLE hmda_user.lar2020_q3 OWNER TO hmda_user;

--
-- Name: lar2021_q1; Type: TABLE; Schema: hmda_user; Owner: hmda_user
--

CREATE TABLE hmda_user.lar2021_q1 (
    id integer,
    lei character varying,
    uli character varying,
    application_date character varying,
    loan_type integer,
    loan_purpose integer,
    preapproval integer,
    construction_method character varying,
    occupancy_type integer,
    loan_amount numeric,
    action_taken_type integer,
    action_taken_date integer,
    street character varying,
    city character varying,
    state character varying,
    zip character varying,
    county character varying,
    tract character varying,
    ethnicity_applicant_1 character varying,
    ethnicity_applicant_2 character varying,
    ethnicity_applicant_3 character varying,
    ethnicity_applicant_4 character varying,
    ethnicity_applicant_5 character varying,
    other_hispanic_applicant character varying,
    ethnicity_co_applicant_1 character varying,
    ethnicity_co_applicant_2 character varying,
    ethnicity_co_applicant_3 character varying,
    ethnicity_co_applicant_4 character varying,
    ethnicity_co_applicant_5 character varying,
    other_hispanic_co_applicant character varying,
    ethnicity_observed_applicant integer,
    ethnicity_observed_co_applicant integer,
    race_applicant_1 character varying,
    race_applicant_2 character varying,
    race_applicant_3 character varying,
    race_applicant_4 character varying,
    race_applicant_5 character varying,
    other_native_race_applicant character varying,
    other_asian_race_applicant character varying,
    other_pacific_race_applicant character varying,
    race_co_applicant_1 character varying,
    race_co_applicant_2 character varying,
    race_co_applicant_3 character varying,
    race_co_applicant_4 character varying,
    race_co_applicant_5 character varying,
    other_native_race_co_applicant character varying,
    other_asian_race_co_applicant character varying,
    other_pacific_race_co_applicant character varying,
    race_observed_applicant integer,
    race_observed_co_applicant integer,
    sex_applicant integer,
    sex_co_applicant integer,
    observed_sex_applicant integer,
    observed_sex_co_applicant integer,
    age_applicant integer,
    age_co_applicant integer,
    income character varying,
    purchaser_type integer,
    rate_spread character varying,
    hoepa_status integer,
    lien_status integer,
    credit_score_applicant integer,
    credit_score_co_applicant integer,
    credit_score_type_applicant integer,
    credit_score_model_applicant character varying,
    credit_score_type_co_applicant integer,
    credit_score_model_co_applicant character varying,
    denial_reason1 character varying,
    denial_reason2 character varying,
    denial_reason3 character varying,
    denial_reason4 character varying,
    other_denial_reason character varying,
    total_loan_costs character varying,
    total_points character varying,
    origination_charges character varying,
    discount_points character varying,
    lender_credits character varying,
    interest_rate character varying,
    payment_penalty character varying,
    debt_to_incode character varying,
    loan_value_ratio character varying,
    loan_term character varying,
    rate_spread_intro character varying,
    baloon_payment integer,
    insert_only_payment integer,
    amortization integer,
    other_amortization integer,
    property_value character varying,
    home_security_policy integer,
    lan_property_interest integer,
    total_uits integer,
    mf_affordable character varying,
    application_submission integer,
    payable integer,
    nmls character varying,
    aus1 character varying,
    aus2 character varying,
    aus3 character varying,
    aus4 character varying,
    aus5 character varying,
    other_aus character varying,
    aus1_result integer,
    aus2_result character varying,
    aus3_result character varying,
    aus4_result character varying,
    aus5_result character varying,
    other_aus_result character varying,
    reverse_mortgage integer,
    line_of_credits integer,
    business_or_commercial integer,
    conforming_loan_limit character varying,
    ethnicity_categorization character varying,
    race_categorization character varying,
    sex_categorization character varying,
    dwelling_categorization character varying,
    loan_product_type_categorization character varying,
    tract_population integer,
    tract_minority_population_percent double precision,
    ffiec_msa_md_median_family_income integer,
    tract_owner_occupied_units integer,
    tract_one_to_four_family_homes integer,
    tract_median_age_of_housing_units integer,
    tract_to_msa_income_percentage double precision,
    is_quarterly boolean,
    created_at timestamp without time zone,
    msa_md character varying,
    msa_md_name character varying,
    checksum character varying
);


ALTER TABLE hmda_user.lar2021_q1 OWNER TO hmda_user;

--
-- Name: lar2021_q2; Type: TABLE; Schema: hmda_user; Owner: hmda_user
--

CREATE TABLE hmda_user.lar2021_q2 (
    id integer,
    lei character varying,
    uli character varying,
    application_date character varying,
    loan_type integer,
    loan_purpose integer,
    preapproval integer,
    construction_method character varying,
    occupancy_type integer,
    loan_amount numeric,
    action_taken_type integer,
    action_taken_date integer,
    street character varying,
    city character varying,
    state character varying,
    zip character varying,
    county character varying,
    tract character varying,
    ethnicity_applicant_1 character varying,
    ethnicity_applicant_2 character varying,
    ethnicity_applicant_3 character varying,
    ethnicity_applicant_4 character varying,
    ethnicity_applicant_5 character varying,
    other_hispanic_applicant character varying,
    ethnicity_co_applicant_1 character varying,
    ethnicity_co_applicant_2 character varying,
    ethnicity_co_applicant_3 character varying,
    ethnicity_co_applicant_4 character varying,
    ethnicity_co_applicant_5 character varying,
    other_hispanic_co_applicant character varying,
    ethnicity_observed_applicant integer,
    ethnicity_observed_co_applicant integer,
    race_applicant_1 character varying,
    race_applicant_2 character varying,
    race_applicant_3 character varying,
    race_applicant_4 character varying,
    race_applicant_5 character varying,
    other_native_race_applicant character varying,
    other_asian_race_applicant character varying,
    other_pacific_race_applicant character varying,
    race_co_applicant_1 character varying,
    race_co_applicant_2 character varying,
    race_co_applicant_3 character varying,
    race_co_applicant_4 character varying,
    race_co_applicant_5 character varying,
    other_native_race_co_applicant character varying,
    other_asian_race_co_applicant character varying,
    other_pacific_race_co_applicant character varying,
    race_observed_applicant integer,
    race_observed_co_applicant integer,
    sex_applicant integer,
    sex_co_applicant integer,
    observed_sex_applicant integer,
    observed_sex_co_applicant integer,
    age_applicant integer,
    age_co_applicant integer,
    income character varying,
    purchaser_type integer,
    rate_spread character varying,
    hoepa_status integer,
    lien_status integer,
    credit_score_applicant integer,
    credit_score_co_applicant integer,
    credit_score_type_applicant integer,
    credit_score_model_applicant character varying,
    credit_score_type_co_applicant integer,
    credit_score_model_co_applicant character varying,
    denial_reason1 character varying,
    denial_reason2 character varying,
    denial_reason3 character varying,
    denial_reason4 character varying,
    other_denial_reason character varying,
    total_loan_costs character varying,
    total_points character varying,
    origination_charges character varying,
    discount_points character varying,
    lender_credits character varying,
    interest_rate character varying,
    payment_penalty character varying,
    debt_to_incode character varying,
    loan_value_ratio character varying,
    loan_term character varying,
    rate_spread_intro character varying,
    baloon_payment integer,
    insert_only_payment integer,
    amortization integer,
    other_amortization integer,
    property_value character varying,
    home_security_policy integer,
    lan_property_interest integer,
    total_uits integer,
    mf_affordable character varying,
    application_submission integer,
    payable integer,
    nmls character varying,
    aus1 character varying,
    aus2 character varying,
    aus3 character varying,
    aus4 character varying,
    aus5 character varying,
    other_aus character varying,
    aus1_result integer,
    aus2_result character varying,
    aus3_result character varying,
    aus4_result character varying,
    aus5_result character varying,
    other_aus_result character varying,
    reverse_mortgage integer,
    line_of_credits integer,
    business_or_commercial integer,
    conforming_loan_limit character varying,
    ethnicity_categorization character varying,
    race_categorization character varying,
    sex_categorization character varying,
    dwelling_categorization character varying,
    loan_product_type_categorization character varying,
    tract_population integer,
    tract_minority_population_percent double precision,
    ffiec_msa_md_median_family_income integer,
    tract_owner_occupied_units integer,
    tract_one_to_four_family_homes integer,
    tract_median_age_of_housing_units integer,
    tract_to_msa_income_percentage double precision,
    is_quarterly boolean,
    created_at timestamp without time zone,
    msa_md character varying,
    msa_md_name character varying,
    checksum character varying
);


ALTER TABLE hmda_user.lar2021_q2 OWNER TO hmda_user;

--
-- Name: lar2021_q3; Type: TABLE; Schema: hmda_user; Owner: hmda_user
--

CREATE TABLE hmda_user.lar2021_q3 (
    id integer,
    lei character varying,
    uli character varying,
    application_date character varying,
    loan_type integer,
    loan_purpose integer,
    preapproval integer,
    construction_method character varying,
    occupancy_type integer,
    loan_amount numeric,
    action_taken_type integer,
    action_taken_date integer,
    street character varying,
    city character varying,
    state character varying,
    zip character varying,
    county character varying,
    tract character varying,
    ethnicity_applicant_1 character varying,
    ethnicity_applicant_2 character varying,
    ethnicity_applicant_3 character varying,
    ethnicity_applicant_4 character varying,
    ethnicity_applicant_5 character varying,
    other_hispanic_applicant character varying,
    ethnicity_co_applicant_1 character varying,
    ethnicity_co_applicant_2 character varying,
    ethnicity_co_applicant_3 character varying,
    ethnicity_co_applicant_4 character varying,
    ethnicity_co_applicant_5 character varying,
    other_hispanic_co_applicant character varying,
    ethnicity_observed_applicant integer,
    ethnicity_observed_co_applicant integer,
    race_applicant_1 character varying,
    race_applicant_2 character varying,
    race_applicant_3 character varying,
    race_applicant_4 character varying,
    race_applicant_5 character varying,
    other_native_race_applicant character varying,
    other_asian_race_applicant character varying,
    other_pacific_race_applicant character varying,
    race_co_applicant_1 character varying,
    race_co_applicant_2 character varying,
    race_co_applicant_3 character varying,
    race_co_applicant_4 character varying,
    race_co_applicant_5 character varying,
    other_native_race_co_applicant character varying,
    other_asian_race_co_applicant character varying,
    other_pacific_race_co_applicant character varying,
    race_observed_applicant integer,
    race_observed_co_applicant integer,
    sex_applicant integer,
    sex_co_applicant integer,
    observed_sex_applicant integer,
    observed_sex_co_applicant integer,
    age_applicant integer,
    age_co_applicant integer,
    income character varying,
    purchaser_type integer,
    rate_spread character varying,
    hoepa_status integer,
    lien_status integer,
    credit_score_applicant integer,
    credit_score_co_applicant integer,
    credit_score_type_applicant integer,
    credit_score_model_applicant character varying,
    credit_score_type_co_applicant integer,
    credit_score_model_co_applicant character varying,
    denial_reason1 character varying,
    denial_reason2 character varying,
    denial_reason3 character varying,
    denial_reason4 character varying,
    other_denial_reason character varying,
    total_loan_costs character varying,
    total_points character varying,
    origination_charges character varying,
    discount_points character varying,
    lender_credits character varying,
    interest_rate character varying,
    payment_penalty character varying,
    debt_to_incode character varying,
    loan_value_ratio character varying,
    loan_term character varying,
    rate_spread_intro character varying,
    baloon_payment integer,
    insert_only_payment integer,
    amortization integer,
    other_amortization integer,
    property_value character varying,
    home_security_policy integer,
    lan_property_interest integer,
    total_uits integer,
    mf_affordable character varying,
    application_submission integer,
    payable integer,
    nmls character varying,
    aus1 character varying,
    aus2 character varying,
    aus3 character varying,
    aus4 character varying,
    aus5 character varying,
    other_aus character varying,
    aus1_result integer,
    aus2_result character varying,
    aus3_result character varying,
    aus4_result character varying,
    aus5_result character varying,
    other_aus_result character varying,
    reverse_mortgage integer,
    line_of_credits integer,
    business_or_commercial integer,
    conforming_loan_limit character varying,
    ethnicity_categorization character varying,
    race_categorization character varying,
    sex_categorization character varying,
    dwelling_categorization character varying,
    loan_product_type_categorization character varying,
    tract_population integer,
    tract_minority_population_percent double precision,
    ffiec_msa_md_median_family_income integer,
    tract_owner_occupied_units integer,
    tract_one_to_four_family_homes integer,
    tract_median_age_of_housing_units integer,
    tract_to_msa_income_percentage double precision,
    is_quarterly boolean,
    created_at timestamp without time zone,
    msa_md character varying,
    msa_md_name character varying,
    checksum character varying
);


ALTER TABLE hmda_user.lar2021_q3 OWNER TO hmda_user;

--
-- Name: loanapplicationregister2018; Type: TABLE; Schema: hmda_user; Owner: hmda_user
--

CREATE TABLE hmda_user.loanapplicationregister2018 (
    id integer NOT NULL,
    lei character varying NOT NULL,
    uli character varying,
    application_date character varying,
    loan_type integer,
    loan_purpose integer,
    preapproval integer,
    construction_method character varying,
    occupancy_type integer,
    loan_amount numeric,
    action_taken_type integer,
    action_taken_date integer,
    street character varying,
    city character varying,
    state character varying,
    zip character varying,
    county character varying,
    tract character varying,
    ethnicity_applicant_1 character varying,
    ethnicity_applicant_2 character varying,
    ethnicity_applicant_3 character varying,
    ethnicity_applicant_4 character varying,
    ethnicity_applicant_5 character varying,
    other_hispanic_applicant character varying,
    ethnicity_co_applicant_1 character varying,
    ethnicity_co_applicant_2 character varying,
    ethnicity_co_applicant_3 character varying,
    ethnicity_co_applicant_4 character varying,
    ethnicity_co_applicant_5 character varying,
    other_hispanic_co_applicant character varying,
    ethnicity_observed_applicant integer,
    ethnicity_observed_co_applicant integer,
    race_applicant_1 character varying,
    race_applicant_2 character varying,
    race_applicant_3 character varying,
    race_applicant_4 character varying,
    race_applicant_5 character varying,
    other_native_race_applicant character varying,
    other_asian_race_applicant character varying,
    other_pacific_race_applicant character varying,
    race_co_applicant_1 character varying,
    race_co_applicant_2 character varying,
    race_co_applicant_3 character varying,
    race_co_applicant_4 character varying,
    race_co_applicant_5 character varying,
    other_native_race_co_applicant character varying,
    other_asian_race_co_applicant character varying,
    other_pacific_race_co_applicant character varying,
    race_observed_applicant integer,
    race_observed_co_applicant integer,
    sex_applicant integer,
    sex_co_applicant integer,
    observed_sex_applicant integer,
    observed_sex_co_applicant integer,
    age_applicant integer,
    age_co_applicant integer,
    income character varying,
    purchaser_type integer,
    rate_spread character varying,
    hoepa_status integer,
    lien_status integer,
    credit_score_applicant integer,
    credit_score_co_applicant integer,
    credit_score_type_applicant integer,
    credit_score_model_applicant character varying,
    credit_score_type_co_applicant integer,
    credit_score_model_co_applicant character varying,
    denial_reason1 character varying,
    denial_reason2 character varying,
    denial_reason3 character varying,
    denial_reason4 character varying,
    other_denial_reason character varying,
    total_loan_costs character varying,
    total_points character varying,
    origination_charges character varying,
    discount_points character varying,
    lender_credits character varying,
    interest_rate character varying,
    payment_penalty character varying,
    debt_to_incode character varying,
    loan_value_ratio character varying,
    loan_term character varying,
    rate_spread_intro character varying,
    baloon_payment integer,
    insert_only_payment integer,
    amortization integer,
    other_amortization integer,
    property_value character varying,
    home_security_policy integer,
    lan_property_interest integer,
    total_uits integer,
    mf_affordable character varying,
    application_submission integer,
    payable integer,
    nmls character varying,
    aus1 character varying,
    aus2 character varying,
    aus3 character varying,
    aus4 character varying,
    aus5 character varying,
    other_aus character varying,
    aus1_result integer,
    aus2_result character varying,
    aus3_result character varying,
    aus4_result character varying,
    aus5_result character varying,
    other_aus_result character varying,
    reverse_mortgage integer,
    line_of_credits integer,
    business_or_commercial integer,
    created_at timestamp without time zone DEFAULT now(),
    checksum character varying
);


ALTER TABLE hmda_user.loanapplicationregister2018 OWNER TO hmda_user;

--
-- Name: loanapplicationregister2019; Type: TABLE; Schema: hmda_user; Owner: hmda_user
--

CREATE TABLE hmda_user.loanapplicationregister2019 (
    id integer NOT NULL,
    lei character varying NOT NULL,
    uli character varying,
    application_date character varying,
    loan_type integer,
    loan_purpose integer,
    preapproval integer,
    construction_method character varying,
    occupancy_type integer,
    loan_amount numeric,
    action_taken_type integer,
    action_taken_date integer,
    street character varying,
    city character varying,
    state character varying,
    zip character varying,
    county character varying,
    tract character varying,
    ethnicity_applicant_1 character varying,
    ethnicity_applicant_2 character varying,
    ethnicity_applicant_3 character varying,
    ethnicity_applicant_4 character varying,
    ethnicity_applicant_5 character varying,
    other_hispanic_applicant character varying,
    ethnicity_co_applicant_1 character varying,
    ethnicity_co_applicant_2 character varying,
    ethnicity_co_applicant_3 character varying,
    ethnicity_co_applicant_4 character varying,
    ethnicity_co_applicant_5 character varying,
    other_hispanic_co_applicant character varying,
    ethnicity_observed_applicant integer,
    ethnicity_observed_co_applicant integer,
    race_applicant_1 character varying,
    race_applicant_2 character varying,
    race_applicant_3 character varying,
    race_applicant_4 character varying,
    race_applicant_5 character varying,
    other_native_race_applicant character varying,
    other_asian_race_applicant character varying,
    other_pacific_race_applicant character varying,
    race_co_applicant_1 character varying,
    race_co_applicant_2 character varying,
    race_co_applicant_3 character varying,
    race_co_applicant_4 character varying,
    race_co_applicant_5 character varying,
    other_native_race_co_applicant character varying,
    other_asian_race_co_applicant character varying,
    other_pacific_race_co_applicant character varying,
    race_observed_applicant integer,
    race_observed_co_applicant integer,
    sex_applicant integer,
    sex_co_applicant integer,
    observed_sex_applicant integer,
    observed_sex_co_applicant integer,
    age_applicant integer,
    age_co_applicant integer,
    income character varying,
    purchaser_type integer,
    rate_spread character varying,
    hoepa_status integer,
    lien_status integer,
    credit_score_applicant integer,
    credit_score_co_applicant integer,
    credit_score_type_applicant integer,
    credit_score_model_applicant character varying,
    credit_score_type_co_applicant integer,
    credit_score_model_co_applicant character varying,
    denial_reason1 character varying,
    denial_reason2 character varying,
    denial_reason3 character varying,
    denial_reason4 character varying,
    other_denial_reason character varying,
    total_loan_costs character varying,
    total_points character varying,
    origination_charges character varying,
    discount_points character varying,
    lender_credits character varying,
    interest_rate character varying,
    payment_penalty character varying,
    debt_to_incode character varying,
    loan_value_ratio character varying,
    loan_term character varying,
    rate_spread_intro character varying,
    baloon_payment integer,
    insert_only_payment integer,
    amortization integer,
    other_amortization integer,
    property_value character varying,
    home_security_policy integer,
    lan_property_interest integer,
    total_uits integer,
    mf_affordable character varying,
    application_submission integer,
    payable integer,
    nmls character varying,
    aus1 character varying,
    aus2 character varying,
    aus3 character varying,
    aus4 character varying,
    aus5 character varying,
    other_aus character varying,
    aus1_result integer,
    aus2_result character varying,
    aus3_result character varying,
    aus4_result character varying,
    aus5_result character varying,
    other_aus_result character varying,
    reverse_mortgage integer,
    line_of_credits integer,
    business_or_commercial integer,
    conforming_loan_limit character varying,
    ethnicity_categorization character varying,
    race_categorization character varying,
    sex_categorization character varying,
    dwelling_categorization character varying,
    loan_product_type_categorization character varying,
    tract_population integer,
    tract_minority_population_percent double precision,
    ffiec_msa_md_median_family_income integer,
    tract_owner_occupied_units integer,
    tract_one_to_four_family_homes integer,
    tract_median_age_of_housing_units integer,
    tract_to_msa_income_percentage double precision,
    is_quarterly boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    msa_md character varying,
    msa_md_name character varying,
    checksum character varying
);


ALTER TABLE hmda_user.loanapplicationregister2019 OWNER TO hmda_user;

--
-- Name: loanapplicationregister2020; Type: TABLE; Schema: hmda_user; Owner: hmda_user
--

CREATE TABLE hmda_user.loanapplicationregister2020 (
    id integer NOT NULL,
    lei character varying NOT NULL,
    uli character varying,
    application_date character varying,
    loan_type integer,
    loan_purpose integer,
    preapproval integer,
    construction_method character varying,
    occupancy_type integer,
    loan_amount numeric,
    action_taken_type integer,
    action_taken_date integer,
    street character varying,
    city character varying,
    state character varying,
    zip character varying,
    county character varying,
    tract character varying,
    ethnicity_applicant_1 character varying,
    ethnicity_applicant_2 character varying,
    ethnicity_applicant_3 character varying,
    ethnicity_applicant_4 character varying,
    ethnicity_applicant_5 character varying,
    other_hispanic_applicant character varying,
    ethnicity_co_applicant_1 character varying,
    ethnicity_co_applicant_2 character varying,
    ethnicity_co_applicant_3 character varying,
    ethnicity_co_applicant_4 character varying,
    ethnicity_co_applicant_5 character varying,
    other_hispanic_co_applicant character varying,
    ethnicity_observed_applicant integer,
    ethnicity_observed_co_applicant integer,
    race_applicant_1 character varying,
    race_applicant_2 character varying,
    race_applicant_3 character varying,
    race_applicant_4 character varying,
    race_applicant_5 character varying,
    other_native_race_applicant character varying,
    other_asian_race_applicant character varying,
    other_pacific_race_applicant character varying,
    race_co_applicant_1 character varying,
    race_co_applicant_2 character varying,
    race_co_applicant_3 character varying,
    race_co_applicant_4 character varying,
    race_co_applicant_5 character varying,
    other_native_race_co_applicant character varying,
    other_asian_race_co_applicant character varying,
    other_pacific_race_co_applicant character varying,
    race_observed_applicant integer,
    race_observed_co_applicant integer,
    sex_applicant integer,
    sex_co_applicant integer,
    observed_sex_applicant integer,
    observed_sex_co_applicant integer,
    age_applicant integer,
    age_co_applicant integer,
    income character varying,
    purchaser_type integer,
    rate_spread character varying,
    hoepa_status integer,
    lien_status integer,
    credit_score_applicant integer,
    credit_score_co_applicant integer,
    credit_score_type_applicant integer,
    credit_score_model_applicant character varying,
    credit_score_type_co_applicant integer,
    credit_score_model_co_applicant character varying,
    denial_reason1 character varying,
    denial_reason2 character varying,
    denial_reason3 character varying,
    denial_reason4 character varying,
    other_denial_reason character varying,
    total_loan_costs character varying,
    total_points character varying,
    origination_charges character varying,
    discount_points character varying,
    lender_credits character varying,
    interest_rate character varying,
    payment_penalty character varying,
    debt_to_incode character varying,
    loan_value_ratio character varying,
    loan_term character varying,
    rate_spread_intro character varying,
    baloon_payment integer,
    insert_only_payment integer,
    amortization integer,
    other_amortization integer,
    property_value character varying,
    home_security_policy integer,
    lan_property_interest integer,
    total_uits integer,
    mf_affordable character varying,
    application_submission integer,
    payable integer,
    nmls character varying,
    aus1 character varying,
    aus2 character varying,
    aus3 character varying,
    aus4 character varying,
    aus5 character varying,
    other_aus character varying,
    aus1_result integer,
    aus2_result character varying,
    aus3_result character varying,
    aus4_result character varying,
    aus5_result character varying,
    other_aus_result character varying,
    reverse_mortgage integer,
    line_of_credits integer,
    business_or_commercial integer,
    conforming_loan_limit character varying,
    ethnicity_categorization character varying,
    race_categorization character varying,
    sex_categorization character varying,
    dwelling_categorization character varying,
    loan_product_type_categorization character varying,
    tract_population integer,
    tract_minority_population_percent double precision,
    ffiec_msa_md_median_family_income integer,
    tract_owner_occupied_units integer,
    tract_one_to_four_family_homes integer,
    tract_median_age_of_housing_units integer,
    tract_to_msa_income_percentage double precision,
    is_quarterly boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    msa_md character varying,
    msa_md_name character varying,
    checksum character varying
);


ALTER TABLE hmda_user.loanapplicationregister2020 OWNER TO hmda_user;

--
-- Name: modifiedlar2018; Type: TABLE; Schema: hmda_user; Owner: hmda_user
--

CREATE TABLE hmda_user.modifiedlar2018 (
    id integer NOT NULL,
    uniq_id integer NOT NULL,
    lei character varying NOT NULL,
    loan_type integer,
    loan_purpose integer,
    preapproval integer,
    construction_method character varying,
    occupancy_type integer,
    loan_amount numeric,
    action_taken_type integer,
    state character varying,
    county character varying,
    tract character varying,
    ethnicity_applicant_1 character varying,
    ethnicity_applicant_2 character varying,
    ethnicity_applicant_3 character varying,
    ethnicity_applicant_4 character varying,
    ethnicity_applicant_5 character varying,
    ethnicity_observed_applicant integer,
    ethnicity_co_applicant_1 character varying,
    ethnicity_co_applicant_2 character varying,
    ethnicity_co_applicant_3 character varying,
    ethnicity_co_applicant_4 character varying,
    ethnicity_co_applicant_5 character varying,
    ethnicity_observed_co_applicant integer,
    race_applicant_1 character varying,
    race_applicant_2 character varying,
    race_applicant_3 character varying,
    race_applicant_4 character varying,
    race_applicant_5 character varying,
    race_co_applicant_1 character varying,
    race_co_applicant_2 character varying,
    race_co_applicant_3 character varying,
    race_co_applicant_4 character varying,
    race_co_applicant_5 character varying,
    race_observed_applicant integer,
    race_observed_co_applicant integer,
    sex_applicant integer,
    sex_co_applicant integer,
    observed_sex_applicant integer,
    observed_sex_co_applicant integer,
    age_applicant character varying,
    applicant_age_greater_than_62 character varying,
    age_co_applicant character varying,
    coapplicant_age_greater_than_62 character varying,
    income character varying,
    purchaser_type integer,
    rate_spread character varying,
    hoepa_status integer,
    lien_status integer,
    credit_score_type_applicant integer,
    credit_score_type_co_applicant integer,
    denial_reason1 integer,
    denial_reason2 integer,
    denial_reason3 integer,
    denial_reason4 integer,
    total_loan_costs character varying,
    total_points character varying,
    origination_charges character varying,
    discount_points character varying,
    lender_credits character varying,
    interest_rate character varying,
    payment_penalty character varying,
    debt_to_incode character varying,
    loan_value_ratio character varying,
    loan_term character varying,
    rate_spread_intro character varying,
    baloon_payment integer,
    insert_only_payment integer,
    amortization integer,
    other_amortization integer,
    property_value character varying,
    home_security_policy integer,
    lan_property_interest integer,
    total_units character varying,
    mf_affordable character varying,
    application_submission integer,
    payable integer,
    aus1 integer,
    aus2 integer,
    aus3 integer,
    aus4 integer,
    aus5 integer,
    reverse_mortgage integer,
    line_of_credits integer,
    business_or_commercial integer,
    population character varying,
    minority_population_percent character varying,
    ffiec_med_fam_income character varying,
    tract_to_msamd character varying,
    owner_occupied_units character varying,
    one_to_four_fam_units character varying,
    msa_md integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    submission_id character varying,
    msa_md_name character varying,
    filing_year integer,
    conforming_loan_limit character varying,
    median_age integer,
    median_age_calculated character varying,
    median_income_percentage numeric,
    race_categorization character varying,
    sex_categorization character varying,
    ethnicity_categorization character varying,
    percent_median_msa_income character varying,
    dwelling_category character varying,
    loan_product_type character varying,
    uli character varying,
    action_taken_date integer,
    checksum character varying
);


ALTER TABLE hmda_user.modifiedlar2018 OWNER TO hmda_user;

--
-- Name: modifiedlar2018_uniq_id_seq; Type: SEQUENCE; Schema: hmda_user; Owner: hmda_user
--

CREATE SEQUENCE hmda_user.modifiedlar2018_uniq_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hmda_user.modifiedlar2018_uniq_id_seq OWNER TO hmda_user;

--
-- Name: modifiedlar2018_uniq_id_seq; Type: SEQUENCE OWNED BY; Schema: hmda_user; Owner: hmda_user
--

ALTER SEQUENCE hmda_user.modifiedlar2018_uniq_id_seq OWNED BY hmda_user.modifiedlar2018.uniq_id;


--
-- Name: modifiedlar2019; Type: TABLE; Schema: hmda_user; Owner: hmda_user
--

CREATE TABLE hmda_user.modifiedlar2019 (
    id integer NOT NULL,
    uniq_id integer NOT NULL,
    lei character varying NOT NULL,
    loan_type integer,
    loan_purpose integer,
    preapproval integer,
    construction_method character varying,
    occupancy_type integer,
    loan_amount numeric,
    action_taken_type integer,
    state character varying,
    county character varying,
    tract character varying,
    ethnicity_applicant_1 character varying,
    ethnicity_applicant_2 character varying,
    ethnicity_applicant_3 character varying,
    ethnicity_applicant_4 character varying,
    ethnicity_applicant_5 character varying,
    ethnicity_observed_applicant integer,
    ethnicity_co_applicant_1 character varying,
    ethnicity_co_applicant_2 character varying,
    ethnicity_co_applicant_3 character varying,
    ethnicity_co_applicant_4 character varying,
    ethnicity_co_applicant_5 character varying,
    ethnicity_observed_co_applicant integer,
    race_applicant_1 character varying,
    race_applicant_2 character varying,
    race_applicant_3 character varying,
    race_applicant_4 character varying,
    race_applicant_5 character varying,
    race_co_applicant_1 character varying,
    race_co_applicant_2 character varying,
    race_co_applicant_3 character varying,
    race_co_applicant_4 character varying,
    race_co_applicant_5 character varying,
    race_observed_applicant integer,
    race_observed_co_applicant integer,
    sex_applicant integer,
    sex_co_applicant integer,
    observed_sex_applicant integer,
    observed_sex_co_applicant integer,
    age_applicant character varying,
    applicant_age_greater_than_62 character varying,
    age_co_applicant character varying,
    coapplicant_age_greater_than_62 character varying,
    income character varying,
    purchaser_type integer,
    rate_spread character varying,
    hoepa_status integer,
    lien_status integer,
    credit_score_type_applicant integer,
    credit_score_type_co_applicant integer,
    denial_reason1 integer,
    denial_reason2 integer,
    denial_reason3 integer,
    denial_reason4 integer,
    total_loan_costs character varying,
    total_points character varying,
    origination_charges character varying,
    discount_points character varying,
    lender_credits character varying,
    interest_rate character varying,
    payment_penalty character varying,
    debt_to_incode character varying,
    loan_value_ratio character varying,
    loan_term character varying,
    rate_spread_intro character varying,
    baloon_payment integer,
    insert_only_payment integer,
    amortization integer,
    other_amortization integer,
    property_value character varying,
    home_security_policy integer,
    lan_property_interest integer,
    total_units character varying,
    mf_affordable character varying,
    application_submission integer,
    payable integer,
    aus1 integer,
    aus2 integer,
    aus3 integer,
    aus4 integer,
    aus5 integer,
    reverse_mortgage integer,
    line_of_credits integer,
    business_or_commercial integer,
    population character varying,
    minority_population_percent character varying,
    ffiec_med_fam_income character varying,
    tract_to_msamd character varying,
    owner_occupied_units character varying,
    one_to_four_fam_units character varying,
    msa_md integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    submission_id character varying,
    msa_md_name character varying,
    filing_year integer,
    conforming_loan_limit character varying,
    median_age integer,
    median_age_calculated character varying,
    median_income_percentage numeric,
    race_categorization character varying,
    sex_categorization character varying,
    ethnicity_categorization character varying,
    percent_median_msa_income character varying,
    dwelling_category character varying,
    loan_product_type character varying,
    uli character varying,
    checksum character varying
);


ALTER TABLE hmda_user.modifiedlar2019 OWNER TO hmda_user;

--
-- Name: modifiedlar2019_uniq_id_seq; Type: SEQUENCE; Schema: hmda_user; Owner: hmda_user
--

CREATE SEQUENCE hmda_user.modifiedlar2019_uniq_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hmda_user.modifiedlar2019_uniq_id_seq OWNER TO hmda_user;

--
-- Name: modifiedlar2019_uniq_id_seq; Type: SEQUENCE OWNED BY; Schema: hmda_user; Owner: hmda_user
--

ALTER SEQUENCE hmda_user.modifiedlar2019_uniq_id_seq OWNED BY hmda_user.modifiedlar2019.uniq_id;


--
-- Name: modifiedlar2020; Type: TABLE; Schema: hmda_user; Owner: hmda_user
--

CREATE TABLE hmda_user.modifiedlar2020 (
    id integer NOT NULL,
    uniq_id integer NOT NULL,
    lei character varying NOT NULL,
    loan_type integer,
    loan_purpose integer,
    preapproval integer,
    construction_method character varying,
    occupancy_type integer,
    loan_amount numeric,
    action_taken_type integer,
    state character varying,
    county character varying,
    tract character varying,
    ethnicity_applicant_1 character varying,
    ethnicity_applicant_2 character varying,
    ethnicity_applicant_3 character varying,
    ethnicity_applicant_4 character varying,
    ethnicity_applicant_5 character varying,
    ethnicity_observed_applicant integer,
    ethnicity_co_applicant_1 character varying,
    ethnicity_co_applicant_2 character varying,
    ethnicity_co_applicant_3 character varying,
    ethnicity_co_applicant_4 character varying,
    ethnicity_co_applicant_5 character varying,
    ethnicity_observed_co_applicant integer,
    race_applicant_1 character varying,
    race_applicant_2 character varying,
    race_applicant_3 character varying,
    race_applicant_4 character varying,
    race_applicant_5 character varying,
    race_co_applicant_1 character varying,
    race_co_applicant_2 character varying,
    race_co_applicant_3 character varying,
    race_co_applicant_4 character varying,
    race_co_applicant_5 character varying,
    race_observed_applicant integer,
    race_observed_co_applicant integer,
    sex_applicant integer,
    sex_co_applicant integer,
    observed_sex_applicant integer,
    observed_sex_co_applicant integer,
    age_applicant character varying,
    applicant_age_greater_than_62 character varying,
    age_co_applicant character varying,
    coapplicant_age_greater_than_62 character varying,
    income character varying,
    purchaser_type integer,
    rate_spread character varying,
    hoepa_status integer,
    lien_status integer,
    credit_score_type_applicant integer,
    credit_score_type_co_applicant integer,
    denial_reason1 integer,
    denial_reason2 integer,
    denial_reason3 integer,
    denial_reason4 integer,
    total_loan_costs character varying,
    total_points character varying,
    origination_charges character varying,
    discount_points character varying,
    lender_credits character varying,
    interest_rate character varying,
    payment_penalty character varying,
    debt_to_incode character varying,
    loan_value_ratio character varying,
    loan_term character varying,
    rate_spread_intro character varying,
    baloon_payment integer,
    insert_only_payment integer,
    amortization integer,
    other_amortization integer,
    property_value character varying,
    home_security_policy integer,
    lan_property_interest integer,
    total_units character varying,
    mf_affordable character varying,
    application_submission integer,
    payable integer,
    aus1 integer,
    aus2 integer,
    aus3 integer,
    aus4 integer,
    aus5 integer,
    reverse_mortgage integer,
    line_of_credits integer,
    business_or_commercial integer,
    population character varying,
    minority_population_percent character varying,
    ffiec_med_fam_income character varying,
    tract_to_msamd character varying,
    owner_occupied_units character varying,
    one_to_four_fam_units character varying,
    msa_md integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    submission_id character varying,
    msa_md_name character varying,
    filing_year integer,
    conforming_loan_limit character varying,
    median_age integer,
    median_age_calculated character varying,
    median_income_percentage numeric,
    race_categorization character varying,
    sex_categorization character varying,
    ethnicity_categorization character varying,
    percent_median_msa_income character varying,
    dwelling_category character varying,
    loan_product_type character varying,
    uli character varying,
    checksum character varying
);


ALTER TABLE hmda_user.modifiedlar2020 OWNER TO hmda_user;

--
-- Name: modifiedlar2020_uniq_id_seq; Type: SEQUENCE; Schema: hmda_user; Owner: hmda_user
--

CREATE SEQUENCE hmda_user.modifiedlar2020_uniq_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hmda_user.modifiedlar2020_uniq_id_seq OWNER TO hmda_user;

--
-- Name: modifiedlar2020_uniq_id_seq; Type: SEQUENCE OWNED BY; Schema: hmda_user; Owner: hmda_user
--

ALTER SEQUENCE hmda_user.modifiedlar2020_uniq_id_seq OWNED BY hmda_user.modifiedlar2020.uniq_id;


--
-- Name: submission_history; Type: TABLE; Schema: hmda_user; Owner: hmda_user
--

CREATE TABLE hmda_user.submission_history (
    lei character varying NOT NULL,
    submission_id character varying NOT NULL,
    sign_date bigint
);


ALTER TABLE hmda_user.submission_history OWNER TO hmda_user;

--
-- Name: submission_hist_mview; Type: MATERIALIZED VIEW; Schema: hmda_user; Owner: hmda_user
--

CREATE MATERIALIZED VIEW hmda_user.submission_hist_mview AS
 SELECT submission_history.lei,
    submission_history.submission_id,
    submission_history.sign_date,
    timezone('UTC'::text, to_timestamp(((submission_history.sign_date / 1000))::double precision)) AS sign_date_utc,
    timezone('EST'::text, to_timestamp(((submission_history.sign_date / 1000))::double precision)) AS sign_date_east
   FROM hmda_user.submission_history
  WITH NO DATA;


ALTER TABLE hmda_user.submission_hist_mview OWNER TO hmda_user;

--
-- Name: submission_history2019; Type: TABLE; Schema: hmda_user; Owner: hmda_user
--

CREATE TABLE hmda_user.submission_history2019 (
    lei character varying NOT NULL,
    submission_id character varying NOT NULL,
    sign_date bigint
);


ALTER TABLE hmda_user.submission_history2019 OWNER TO hmda_user;

--
-- Name: transmittalsheet2018; Type: TABLE; Schema: hmda_user; Owner: hmda_user
--

CREATE TABLE hmda_user.transmittalsheet2018 (
    id integer NOT NULL,
    institution_name character varying NOT NULL,
    year integer,
    quarter integer,
    name character varying,
    phone character varying,
    email character varying,
    street character varying,
    city character varying,
    state character varying,
    zip_code character varying,
    agency integer,
    total_lines integer,
    tax_id character varying,
    lei character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    submission_id character varying,
    is_quarterly boolean DEFAULT false NOT NULL
);


ALTER TABLE hmda_user.transmittalsheet2018 OWNER TO hmda_user;

--
-- Name: transmittalsheet2019; Type: TABLE; Schema: hmda_user; Owner: hmda_user
--

CREATE TABLE hmda_user.transmittalsheet2019 (
    id integer NOT NULL,
    institution_name character varying NOT NULL,
    year integer,
    quarter integer,
    name character varying,
    phone character varying,
    email character varying,
    street character varying,
    city character varying,
    state character varying,
    zip_code character varying,
    agency integer,
    total_lines integer,
    tax_id character varying,
    lei character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    submission_id character varying,
    is_quarterly boolean DEFAULT false NOT NULL
);


ALTER TABLE hmda_user.transmittalsheet2019 OWNER TO hmda_user;

--
-- Name: transmittalsheet2020; Type: TABLE; Schema: hmda_user; Owner: hmda_user
--

CREATE TABLE hmda_user.transmittalsheet2020 (
    id integer NOT NULL,
    institution_name character varying NOT NULL,
    year integer,
    quarter integer,
    name character varying,
    phone character varying,
    email character varying,
    street character varying,
    city character varying,
    state character varying,
    zip_code character varying,
    agency integer,
    total_lines integer,
    tax_id character varying,
    lei character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    submission_id character varying,
    is_quarterly boolean DEFAULT false NOT NULL
);


ALTER TABLE hmda_user.transmittalsheet2020 OWNER TO hmda_user;

--
-- Name: institutions_emails id; Type: DEFAULT; Schema: hmda_beta_user; Owner: hmda_user
--

ALTER TABLE ONLY hmda_beta_user.institutions_emails ALTER COLUMN id SET DEFAULT nextval('hmda_beta_user.institutions_emails_id_seq'::regclass);


--
-- Name: institutions_history_notes id; Type: DEFAULT; Schema: hmda_user; Owner: hmda_user
--

ALTER TABLE ONLY hmda_user.institutions_history_notes ALTER COLUMN id SET DEFAULT nextval('hmda_user.institutions_history_notes_id_seq'::regclass);


--
-- Name: modifiedlar2018 uniq_id; Type: DEFAULT; Schema: hmda_user; Owner: hmda_user
--

ALTER TABLE ONLY hmda_user.modifiedlar2018 ALTER COLUMN uniq_id SET DEFAULT nextval('hmda_user.modifiedlar2018_uniq_id_seq'::regclass);


--
-- Name: modifiedlar2019 uniq_id; Type: DEFAULT; Schema: hmda_user; Owner: hmda_user
--

ALTER TABLE ONLY hmda_user.modifiedlar2019 ALTER COLUMN uniq_id SET DEFAULT nextval('hmda_user.modifiedlar2019_uniq_id_seq'::regclass);


--
-- Name: modifiedlar2020 uniq_id; Type: DEFAULT; Schema: hmda_user; Owner: hmda_user
--

ALTER TABLE ONLY hmda_user.modifiedlar2020 ALTER COLUMN uniq_id SET DEFAULT nextval('hmda_user.modifiedlar2020_uniq_id_seq'::regclass);


--
-- Data for Name: institutions2019; Type: TABLE DATA; Schema: hmda_beta_user; Owner: hmda_user
--

COPY hmda_beta_user.institutions2019 (lei, activity_year, agency, institution_type, id2017, tax_id, rssd, respondent_name, respondent_state, respondent_city, parent_id_rssd, parent_name, assets, other_lender_code, topholder_id_rssd, topholder_name, hmda_filer, quarterly_filer, quarterly_filer_has_filed, notes, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: institutions_emails; Type: TABLE DATA; Schema: hmda_beta_user; Owner: hmda_user
--

COPY hmda_beta_user.institutions_emails (id, lei, email_domain) FROM stdin;
\.


--
-- Data for Name: institutions2018; Type: TABLE DATA; Schema: hmda_user; Owner: hmda_user
--

COPY hmda_user.institutions2018 (lei, activity_year, agency, institution_type, id2017, tax_id, rssd, respondent_name, respondent_state, respondent_city, parent_id_rssd, parent_name, assets, other_lender_code, topholder_id_rssd, topholder_name, hmda_filer, quarterly_filer, notes, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: institutions2019; Type: TABLE DATA; Schema: hmda_user; Owner: hmda_user
--

COPY hmda_user.institutions2019 (lei, activity_year, agency, institution_type, id2017, tax_id, rssd, respondent_name, respondent_state, respondent_city, parent_id_rssd, parent_name, assets, other_lender_code, topholder_id_rssd, topholder_name, hmda_filer, quarterly_filer, quarterly_filer_has_filed, notes, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: institutions2020; Type: TABLE DATA; Schema: hmda_user; Owner: hmda_user
--

COPY hmda_user.institutions2020 (lei, activity_year, agency, institution_type, id2017, tax_id, rssd, respondent_name, respondent_state, respondent_city, parent_id_rssd, parent_name, assets, other_lender_code, topholder_id_rssd, topholder_name, hmda_filer, quarterly_filer, notes, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: institutions2021; Type: TABLE DATA; Schema: hmda_user; Owner: hmda_user
--

COPY hmda_user.institutions2021 (lei, activity_year, agency, institution_type, id2017, tax_id, rssd, respondent_name, respondent_state, respondent_city, parent_id_rssd, parent_name, assets, other_lender_code, topholder_id_rssd, topholder_name, hmda_filer, quarterly_filer, notes, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: institutions_history_notes; Type: TABLE DATA; Schema: hmda_user; Owner: hmda_user
--

COPY hmda_user.institutions_history_notes (id, lei, history_id, notes) FROM stdin;
\.


--
-- Data for Name: lar2020_q1; Type: TABLE DATA; Schema: hmda_user; Owner: hmda_user
--

COPY hmda_user.lar2020_q1 (id, lei, uli, application_date, loan_type, loan_purpose, preapproval, construction_method, occupancy_type, loan_amount, action_taken_type, action_taken_date, street, city, state, zip, county, tract, ethnicity_applicant_1, ethnicity_applicant_2, ethnicity_applicant_3, ethnicity_applicant_4, ethnicity_applicant_5, other_hispanic_applicant, ethnicity_co_applicant_1, ethnicity_co_applicant_2, ethnicity_co_applicant_3, ethnicity_co_applicant_4, ethnicity_co_applicant_5, other_hispanic_co_applicant, ethnicity_observed_applicant, ethnicity_observed_co_applicant, race_applicant_1, race_applicant_2, race_applicant_3, race_applicant_4, race_applicant_5, other_native_race_applicant, other_asian_race_applicant, other_pacific_race_applicant, race_co_applicant_1, race_co_applicant_2, race_co_applicant_3, race_co_applicant_4, race_co_applicant_5, other_native_race_co_applicant, other_asian_race_co_applicant, other_pacific_race_co_applicant, race_observed_applicant, race_observed_co_applicant, sex_applicant, sex_co_applicant, observed_sex_applicant, observed_sex_co_applicant, age_applicant, age_co_applicant, income, purchaser_type, rate_spread, hoepa_status, lien_status, credit_score_applicant, credit_score_co_applicant, credit_score_type_applicant, credit_score_model_applicant, credit_score_type_co_applicant, credit_score_model_co_applicant, denial_reason1, denial_reason2, denial_reason3, denial_reason4, other_denial_reason, total_loan_costs, total_points, origination_charges, discount_points, lender_credits, interest_rate, payment_penalty, debt_to_incode, loan_value_ratio, loan_term, rate_spread_intro, baloon_payment, insert_only_payment, amortization, other_amortization, property_value, home_security_policy, lan_property_interest, total_uits, mf_affordable, application_submission, payable, nmls, aus1, aus2, aus3, aus4, aus5, other_aus, aus1_result, aus2_result, aus3_result, aus4_result, aus5_result, other_aus_result, reverse_mortgage, line_of_credits, business_or_commercial, conforming_loan_limit, ethnicity_categorization, race_categorization, sex_categorization, dwelling_categorization, loan_product_type_categorization, tract_population, tract_minority_population_percent, ffiec_msa_md_median_family_income, tract_owner_occupied_units, tract_one_to_four_family_homes, tract_median_age_of_housing_units, tract_to_msa_income_percentage, is_quarterly, created_at, msa_md, msa_md_name, checksum) FROM stdin;
\.


--
-- Data for Name: lar2020_q2; Type: TABLE DATA; Schema: hmda_user; Owner: hmda_user
--

COPY hmda_user.lar2020_q2 (id, lei, uli, application_date, loan_type, loan_purpose, preapproval, construction_method, occupancy_type, loan_amount, action_taken_type, action_taken_date, street, city, state, zip, county, tract, ethnicity_applicant_1, ethnicity_applicant_2, ethnicity_applicant_3, ethnicity_applicant_4, ethnicity_applicant_5, other_hispanic_applicant, ethnicity_co_applicant_1, ethnicity_co_applicant_2, ethnicity_co_applicant_3, ethnicity_co_applicant_4, ethnicity_co_applicant_5, other_hispanic_co_applicant, ethnicity_observed_applicant, ethnicity_observed_co_applicant, race_applicant_1, race_applicant_2, race_applicant_3, race_applicant_4, race_applicant_5, other_native_race_applicant, other_asian_race_applicant, other_pacific_race_applicant, race_co_applicant_1, race_co_applicant_2, race_co_applicant_3, race_co_applicant_4, race_co_applicant_5, other_native_race_co_applicant, other_asian_race_co_applicant, other_pacific_race_co_applicant, race_observed_applicant, race_observed_co_applicant, sex_applicant, sex_co_applicant, observed_sex_applicant, observed_sex_co_applicant, age_applicant, age_co_applicant, income, purchaser_type, rate_spread, hoepa_status, lien_status, credit_score_applicant, credit_score_co_applicant, credit_score_type_applicant, credit_score_model_applicant, credit_score_type_co_applicant, credit_score_model_co_applicant, denial_reason1, denial_reason2, denial_reason3, denial_reason4, other_denial_reason, total_loan_costs, total_points, origination_charges, discount_points, lender_credits, interest_rate, payment_penalty, debt_to_incode, loan_value_ratio, loan_term, rate_spread_intro, baloon_payment, insert_only_payment, amortization, other_amortization, property_value, home_security_policy, lan_property_interest, total_uits, mf_affordable, application_submission, payable, nmls, aus1, aus2, aus3, aus4, aus5, other_aus, aus1_result, aus2_result, aus3_result, aus4_result, aus5_result, other_aus_result, reverse_mortgage, line_of_credits, business_or_commercial, conforming_loan_limit, ethnicity_categorization, race_categorization, sex_categorization, dwelling_categorization, loan_product_type_categorization, tract_population, tract_minority_population_percent, ffiec_msa_md_median_family_income, tract_owner_occupied_units, tract_one_to_four_family_homes, tract_median_age_of_housing_units, tract_to_msa_income_percentage, is_quarterly, created_at, msa_md, msa_md_name, checksum) FROM stdin;
\.


--
-- Data for Name: lar2020_q3; Type: TABLE DATA; Schema: hmda_user; Owner: hmda_user
--

COPY hmda_user.lar2020_q3 (id, lei, uli, application_date, loan_type, loan_purpose, preapproval, construction_method, occupancy_type, loan_amount, action_taken_type, action_taken_date, street, city, state, zip, county, tract, ethnicity_applicant_1, ethnicity_applicant_2, ethnicity_applicant_3, ethnicity_applicant_4, ethnicity_applicant_5, other_hispanic_applicant, ethnicity_co_applicant_1, ethnicity_co_applicant_2, ethnicity_co_applicant_3, ethnicity_co_applicant_4, ethnicity_co_applicant_5, other_hispanic_co_applicant, ethnicity_observed_applicant, ethnicity_observed_co_applicant, race_applicant_1, race_applicant_2, race_applicant_3, race_applicant_4, race_applicant_5, other_native_race_applicant, other_asian_race_applicant, other_pacific_race_applicant, race_co_applicant_1, race_co_applicant_2, race_co_applicant_3, race_co_applicant_4, race_co_applicant_5, other_native_race_co_applicant, other_asian_race_co_applicant, other_pacific_race_co_applicant, race_observed_applicant, race_observed_co_applicant, sex_applicant, sex_co_applicant, observed_sex_applicant, observed_sex_co_applicant, age_applicant, age_co_applicant, income, purchaser_type, rate_spread, hoepa_status, lien_status, credit_score_applicant, credit_score_co_applicant, credit_score_type_applicant, credit_score_model_applicant, credit_score_type_co_applicant, credit_score_model_co_applicant, denial_reason1, denial_reason2, denial_reason3, denial_reason4, other_denial_reason, total_loan_costs, total_points, origination_charges, discount_points, lender_credits, interest_rate, payment_penalty, debt_to_incode, loan_value_ratio, loan_term, rate_spread_intro, baloon_payment, insert_only_payment, amortization, other_amortization, property_value, home_security_policy, lan_property_interest, total_uits, mf_affordable, application_submission, payable, nmls, aus1, aus2, aus3, aus4, aus5, other_aus, aus1_result, aus2_result, aus3_result, aus4_result, aus5_result, other_aus_result, reverse_mortgage, line_of_credits, business_or_commercial, conforming_loan_limit, ethnicity_categorization, race_categorization, sex_categorization, dwelling_categorization, loan_product_type_categorization, tract_population, tract_minority_population_percent, ffiec_msa_md_median_family_income, tract_owner_occupied_units, tract_one_to_four_family_homes, tract_median_age_of_housing_units, tract_to_msa_income_percentage, is_quarterly, created_at, msa_md, msa_md_name, checksum) FROM stdin;
\.


--
-- Data for Name: lar2021_q1; Type: TABLE DATA; Schema: hmda_user; Owner: hmda_user
--

COPY hmda_user.lar2021_q1 (id, lei, uli, application_date, loan_type, loan_purpose, preapproval, construction_method, occupancy_type, loan_amount, action_taken_type, action_taken_date, street, city, state, zip, county, tract, ethnicity_applicant_1, ethnicity_applicant_2, ethnicity_applicant_3, ethnicity_applicant_4, ethnicity_applicant_5, other_hispanic_applicant, ethnicity_co_applicant_1, ethnicity_co_applicant_2, ethnicity_co_applicant_3, ethnicity_co_applicant_4, ethnicity_co_applicant_5, other_hispanic_co_applicant, ethnicity_observed_applicant, ethnicity_observed_co_applicant, race_applicant_1, race_applicant_2, race_applicant_3, race_applicant_4, race_applicant_5, other_native_race_applicant, other_asian_race_applicant, other_pacific_race_applicant, race_co_applicant_1, race_co_applicant_2, race_co_applicant_3, race_co_applicant_4, race_co_applicant_5, other_native_race_co_applicant, other_asian_race_co_applicant, other_pacific_race_co_applicant, race_observed_applicant, race_observed_co_applicant, sex_applicant, sex_co_applicant, observed_sex_applicant, observed_sex_co_applicant, age_applicant, age_co_applicant, income, purchaser_type, rate_spread, hoepa_status, lien_status, credit_score_applicant, credit_score_co_applicant, credit_score_type_applicant, credit_score_model_applicant, credit_score_type_co_applicant, credit_score_model_co_applicant, denial_reason1, denial_reason2, denial_reason3, denial_reason4, other_denial_reason, total_loan_costs, total_points, origination_charges, discount_points, lender_credits, interest_rate, payment_penalty, debt_to_incode, loan_value_ratio, loan_term, rate_spread_intro, baloon_payment, insert_only_payment, amortization, other_amortization, property_value, home_security_policy, lan_property_interest, total_uits, mf_affordable, application_submission, payable, nmls, aus1, aus2, aus3, aus4, aus5, other_aus, aus1_result, aus2_result, aus3_result, aus4_result, aus5_result, other_aus_result, reverse_mortgage, line_of_credits, business_or_commercial, conforming_loan_limit, ethnicity_categorization, race_categorization, sex_categorization, dwelling_categorization, loan_product_type_categorization, tract_population, tract_minority_population_percent, ffiec_msa_md_median_family_income, tract_owner_occupied_units, tract_one_to_four_family_homes, tract_median_age_of_housing_units, tract_to_msa_income_percentage, is_quarterly, created_at, msa_md, msa_md_name, checksum) FROM stdin;
\.


--
-- Data for Name: lar2021_q2; Type: TABLE DATA; Schema: hmda_user; Owner: hmda_user
--

COPY hmda_user.lar2021_q2 (id, lei, uli, application_date, loan_type, loan_purpose, preapproval, construction_method, occupancy_type, loan_amount, action_taken_type, action_taken_date, street, city, state, zip, county, tract, ethnicity_applicant_1, ethnicity_applicant_2, ethnicity_applicant_3, ethnicity_applicant_4, ethnicity_applicant_5, other_hispanic_applicant, ethnicity_co_applicant_1, ethnicity_co_applicant_2, ethnicity_co_applicant_3, ethnicity_co_applicant_4, ethnicity_co_applicant_5, other_hispanic_co_applicant, ethnicity_observed_applicant, ethnicity_observed_co_applicant, race_applicant_1, race_applicant_2, race_applicant_3, race_applicant_4, race_applicant_5, other_native_race_applicant, other_asian_race_applicant, other_pacific_race_applicant, race_co_applicant_1, race_co_applicant_2, race_co_applicant_3, race_co_applicant_4, race_co_applicant_5, other_native_race_co_applicant, other_asian_race_co_applicant, other_pacific_race_co_applicant, race_observed_applicant, race_observed_co_applicant, sex_applicant, sex_co_applicant, observed_sex_applicant, observed_sex_co_applicant, age_applicant, age_co_applicant, income, purchaser_type, rate_spread, hoepa_status, lien_status, credit_score_applicant, credit_score_co_applicant, credit_score_type_applicant, credit_score_model_applicant, credit_score_type_co_applicant, credit_score_model_co_applicant, denial_reason1, denial_reason2, denial_reason3, denial_reason4, other_denial_reason, total_loan_costs, total_points, origination_charges, discount_points, lender_credits, interest_rate, payment_penalty, debt_to_incode, loan_value_ratio, loan_term, rate_spread_intro, baloon_payment, insert_only_payment, amortization, other_amortization, property_value, home_security_policy, lan_property_interest, total_uits, mf_affordable, application_submission, payable, nmls, aus1, aus2, aus3, aus4, aus5, other_aus, aus1_result, aus2_result, aus3_result, aus4_result, aus5_result, other_aus_result, reverse_mortgage, line_of_credits, business_or_commercial, conforming_loan_limit, ethnicity_categorization, race_categorization, sex_categorization, dwelling_categorization, loan_product_type_categorization, tract_population, tract_minority_population_percent, ffiec_msa_md_median_family_income, tract_owner_occupied_units, tract_one_to_four_family_homes, tract_median_age_of_housing_units, tract_to_msa_income_percentage, is_quarterly, created_at, msa_md, msa_md_name, checksum) FROM stdin;
\.


--
-- Data for Name: lar2021_q3; Type: TABLE DATA; Schema: hmda_user; Owner: hmda_user
--

COPY hmda_user.lar2021_q3 (id, lei, uli, application_date, loan_type, loan_purpose, preapproval, construction_method, occupancy_type, loan_amount, action_taken_type, action_taken_date, street, city, state, zip, county, tract, ethnicity_applicant_1, ethnicity_applicant_2, ethnicity_applicant_3, ethnicity_applicant_4, ethnicity_applicant_5, other_hispanic_applicant, ethnicity_co_applicant_1, ethnicity_co_applicant_2, ethnicity_co_applicant_3, ethnicity_co_applicant_4, ethnicity_co_applicant_5, other_hispanic_co_applicant, ethnicity_observed_applicant, ethnicity_observed_co_applicant, race_applicant_1, race_applicant_2, race_applicant_3, race_applicant_4, race_applicant_5, other_native_race_applicant, other_asian_race_applicant, other_pacific_race_applicant, race_co_applicant_1, race_co_applicant_2, race_co_applicant_3, race_co_applicant_4, race_co_applicant_5, other_native_race_co_applicant, other_asian_race_co_applicant, other_pacific_race_co_applicant, race_observed_applicant, race_observed_co_applicant, sex_applicant, sex_co_applicant, observed_sex_applicant, observed_sex_co_applicant, age_applicant, age_co_applicant, income, purchaser_type, rate_spread, hoepa_status, lien_status, credit_score_applicant, credit_score_co_applicant, credit_score_type_applicant, credit_score_model_applicant, credit_score_type_co_applicant, credit_score_model_co_applicant, denial_reason1, denial_reason2, denial_reason3, denial_reason4, other_denial_reason, total_loan_costs, total_points, origination_charges, discount_points, lender_credits, interest_rate, payment_penalty, debt_to_incode, loan_value_ratio, loan_term, rate_spread_intro, baloon_payment, insert_only_payment, amortization, other_amortization, property_value, home_security_policy, lan_property_interest, total_uits, mf_affordable, application_submission, payable, nmls, aus1, aus2, aus3, aus4, aus5, other_aus, aus1_result, aus2_result, aus3_result, aus4_result, aus5_result, other_aus_result, reverse_mortgage, line_of_credits, business_or_commercial, conforming_loan_limit, ethnicity_categorization, race_categorization, sex_categorization, dwelling_categorization, loan_product_type_categorization, tract_population, tract_minority_population_percent, ffiec_msa_md_median_family_income, tract_owner_occupied_units, tract_one_to_four_family_homes, tract_median_age_of_housing_units, tract_to_msa_income_percentage, is_quarterly, created_at, msa_md, msa_md_name, checksum) FROM stdin;
\.


--
-- Data for Name: loanapplicationregister2018; Type: TABLE DATA; Schema: hmda_user; Owner: hmda_user
--

COPY hmda_user.loanapplicationregister2018 (id, lei, uli, application_date, loan_type, loan_purpose, preapproval, construction_method, occupancy_type, loan_amount, action_taken_type, action_taken_date, street, city, state, zip, county, tract, ethnicity_applicant_1, ethnicity_applicant_2, ethnicity_applicant_3, ethnicity_applicant_4, ethnicity_applicant_5, other_hispanic_applicant, ethnicity_co_applicant_1, ethnicity_co_applicant_2, ethnicity_co_applicant_3, ethnicity_co_applicant_4, ethnicity_co_applicant_5, other_hispanic_co_applicant, ethnicity_observed_applicant, ethnicity_observed_co_applicant, race_applicant_1, race_applicant_2, race_applicant_3, race_applicant_4, race_applicant_5, other_native_race_applicant, other_asian_race_applicant, other_pacific_race_applicant, race_co_applicant_1, race_co_applicant_2, race_co_applicant_3, race_co_applicant_4, race_co_applicant_5, other_native_race_co_applicant, other_asian_race_co_applicant, other_pacific_race_co_applicant, race_observed_applicant, race_observed_co_applicant, sex_applicant, sex_co_applicant, observed_sex_applicant, observed_sex_co_applicant, age_applicant, age_co_applicant, income, purchaser_type, rate_spread, hoepa_status, lien_status, credit_score_applicant, credit_score_co_applicant, credit_score_type_applicant, credit_score_model_applicant, credit_score_type_co_applicant, credit_score_model_co_applicant, denial_reason1, denial_reason2, denial_reason3, denial_reason4, other_denial_reason, total_loan_costs, total_points, origination_charges, discount_points, lender_credits, interest_rate, payment_penalty, debt_to_incode, loan_value_ratio, loan_term, rate_spread_intro, baloon_payment, insert_only_payment, amortization, other_amortization, property_value, home_security_policy, lan_property_interest, total_uits, mf_affordable, application_submission, payable, nmls, aus1, aus2, aus3, aus4, aus5, other_aus, aus1_result, aus2_result, aus3_result, aus4_result, aus5_result, other_aus_result, reverse_mortgage, line_of_credits, business_or_commercial, created_at, checksum) FROM stdin;
\.


--
-- Data for Name: loanapplicationregister2019; Type: TABLE DATA; Schema: hmda_user; Owner: hmda_user
--

COPY hmda_user.loanapplicationregister2019 (id, lei, uli, application_date, loan_type, loan_purpose, preapproval, construction_method, occupancy_type, loan_amount, action_taken_type, action_taken_date, street, city, state, zip, county, tract, ethnicity_applicant_1, ethnicity_applicant_2, ethnicity_applicant_3, ethnicity_applicant_4, ethnicity_applicant_5, other_hispanic_applicant, ethnicity_co_applicant_1, ethnicity_co_applicant_2, ethnicity_co_applicant_3, ethnicity_co_applicant_4, ethnicity_co_applicant_5, other_hispanic_co_applicant, ethnicity_observed_applicant, ethnicity_observed_co_applicant, race_applicant_1, race_applicant_2, race_applicant_3, race_applicant_4, race_applicant_5, other_native_race_applicant, other_asian_race_applicant, other_pacific_race_applicant, race_co_applicant_1, race_co_applicant_2, race_co_applicant_3, race_co_applicant_4, race_co_applicant_5, other_native_race_co_applicant, other_asian_race_co_applicant, other_pacific_race_co_applicant, race_observed_applicant, race_observed_co_applicant, sex_applicant, sex_co_applicant, observed_sex_applicant, observed_sex_co_applicant, age_applicant, age_co_applicant, income, purchaser_type, rate_spread, hoepa_status, lien_status, credit_score_applicant, credit_score_co_applicant, credit_score_type_applicant, credit_score_model_applicant, credit_score_type_co_applicant, credit_score_model_co_applicant, denial_reason1, denial_reason2, denial_reason3, denial_reason4, other_denial_reason, total_loan_costs, total_points, origination_charges, discount_points, lender_credits, interest_rate, payment_penalty, debt_to_incode, loan_value_ratio, loan_term, rate_spread_intro, baloon_payment, insert_only_payment, amortization, other_amortization, property_value, home_security_policy, lan_property_interest, total_uits, mf_affordable, application_submission, payable, nmls, aus1, aus2, aus3, aus4, aus5, other_aus, aus1_result, aus2_result, aus3_result, aus4_result, aus5_result, other_aus_result, reverse_mortgage, line_of_credits, business_or_commercial, conforming_loan_limit, ethnicity_categorization, race_categorization, sex_categorization, dwelling_categorization, loan_product_type_categorization, tract_population, tract_minority_population_percent, ffiec_msa_md_median_family_income, tract_owner_occupied_units, tract_one_to_four_family_homes, tract_median_age_of_housing_units, tract_to_msa_income_percentage, is_quarterly, created_at, msa_md, msa_md_name, checksum) FROM stdin;
\.


--
-- Data for Name: loanapplicationregister2020; Type: TABLE DATA; Schema: hmda_user; Owner: hmda_user
--

COPY hmda_user.loanapplicationregister2020 (id, lei, uli, application_date, loan_type, loan_purpose, preapproval, construction_method, occupancy_type, loan_amount, action_taken_type, action_taken_date, street, city, state, zip, county, tract, ethnicity_applicant_1, ethnicity_applicant_2, ethnicity_applicant_3, ethnicity_applicant_4, ethnicity_applicant_5, other_hispanic_applicant, ethnicity_co_applicant_1, ethnicity_co_applicant_2, ethnicity_co_applicant_3, ethnicity_co_applicant_4, ethnicity_co_applicant_5, other_hispanic_co_applicant, ethnicity_observed_applicant, ethnicity_observed_co_applicant, race_applicant_1, race_applicant_2, race_applicant_3, race_applicant_4, race_applicant_5, other_native_race_applicant, other_asian_race_applicant, other_pacific_race_applicant, race_co_applicant_1, race_co_applicant_2, race_co_applicant_3, race_co_applicant_4, race_co_applicant_5, other_native_race_co_applicant, other_asian_race_co_applicant, other_pacific_race_co_applicant, race_observed_applicant, race_observed_co_applicant, sex_applicant, sex_co_applicant, observed_sex_applicant, observed_sex_co_applicant, age_applicant, age_co_applicant, income, purchaser_type, rate_spread, hoepa_status, lien_status, credit_score_applicant, credit_score_co_applicant, credit_score_type_applicant, credit_score_model_applicant, credit_score_type_co_applicant, credit_score_model_co_applicant, denial_reason1, denial_reason2, denial_reason3, denial_reason4, other_denial_reason, total_loan_costs, total_points, origination_charges, discount_points, lender_credits, interest_rate, payment_penalty, debt_to_incode, loan_value_ratio, loan_term, rate_spread_intro, baloon_payment, insert_only_payment, amortization, other_amortization, property_value, home_security_policy, lan_property_interest, total_uits, mf_affordable, application_submission, payable, nmls, aus1, aus2, aus3, aus4, aus5, other_aus, aus1_result, aus2_result, aus3_result, aus4_result, aus5_result, other_aus_result, reverse_mortgage, line_of_credits, business_or_commercial, conforming_loan_limit, ethnicity_categorization, race_categorization, sex_categorization, dwelling_categorization, loan_product_type_categorization, tract_population, tract_minority_population_percent, ffiec_msa_md_median_family_income, tract_owner_occupied_units, tract_one_to_four_family_homes, tract_median_age_of_housing_units, tract_to_msa_income_percentage, is_quarterly, created_at, msa_md, msa_md_name, checksum) FROM stdin;
\.


--
-- Data for Name: modifiedlar2018; Type: TABLE DATA; Schema: hmda_user; Owner: hmda_user
--

COPY hmda_user.modifiedlar2018 (id, uniq_id, lei, loan_type, loan_purpose, preapproval, construction_method, occupancy_type, loan_amount, action_taken_type, state, county, tract, ethnicity_applicant_1, ethnicity_applicant_2, ethnicity_applicant_3, ethnicity_applicant_4, ethnicity_applicant_5, ethnicity_observed_applicant, ethnicity_co_applicant_1, ethnicity_co_applicant_2, ethnicity_co_applicant_3, ethnicity_co_applicant_4, ethnicity_co_applicant_5, ethnicity_observed_co_applicant, race_applicant_1, race_applicant_2, race_applicant_3, race_applicant_4, race_applicant_5, race_co_applicant_1, race_co_applicant_2, race_co_applicant_3, race_co_applicant_4, race_co_applicant_5, race_observed_applicant, race_observed_co_applicant, sex_applicant, sex_co_applicant, observed_sex_applicant, observed_sex_co_applicant, age_applicant, applicant_age_greater_than_62, age_co_applicant, coapplicant_age_greater_than_62, income, purchaser_type, rate_spread, hoepa_status, lien_status, credit_score_type_applicant, credit_score_type_co_applicant, denial_reason1, denial_reason2, denial_reason3, denial_reason4, total_loan_costs, total_points, origination_charges, discount_points, lender_credits, interest_rate, payment_penalty, debt_to_incode, loan_value_ratio, loan_term, rate_spread_intro, baloon_payment, insert_only_payment, amortization, other_amortization, property_value, home_security_policy, lan_property_interest, total_units, mf_affordable, application_submission, payable, aus1, aus2, aus3, aus4, aus5, reverse_mortgage, line_of_credits, business_or_commercial, population, minority_population_percent, ffiec_med_fam_income, tract_to_msamd, owner_occupied_units, one_to_four_fam_units, msa_md, created_at, submission_id, msa_md_name, filing_year, conforming_loan_limit, median_age, median_age_calculated, median_income_percentage, race_categorization, sex_categorization, ethnicity_categorization, percent_median_msa_income, dwelling_category, loan_product_type, uli, action_taken_date, checksum) FROM stdin;
\.


--
-- Data for Name: modifiedlar2019; Type: TABLE DATA; Schema: hmda_user; Owner: hmda_user
--

COPY hmda_user.modifiedlar2019 (id, uniq_id, lei, loan_type, loan_purpose, preapproval, construction_method, occupancy_type, loan_amount, action_taken_type, state, county, tract, ethnicity_applicant_1, ethnicity_applicant_2, ethnicity_applicant_3, ethnicity_applicant_4, ethnicity_applicant_5, ethnicity_observed_applicant, ethnicity_co_applicant_1, ethnicity_co_applicant_2, ethnicity_co_applicant_3, ethnicity_co_applicant_4, ethnicity_co_applicant_5, ethnicity_observed_co_applicant, race_applicant_1, race_applicant_2, race_applicant_3, race_applicant_4, race_applicant_5, race_co_applicant_1, race_co_applicant_2, race_co_applicant_3, race_co_applicant_4, race_co_applicant_5, race_observed_applicant, race_observed_co_applicant, sex_applicant, sex_co_applicant, observed_sex_applicant, observed_sex_co_applicant, age_applicant, applicant_age_greater_than_62, age_co_applicant, coapplicant_age_greater_than_62, income, purchaser_type, rate_spread, hoepa_status, lien_status, credit_score_type_applicant, credit_score_type_co_applicant, denial_reason1, denial_reason2, denial_reason3, denial_reason4, total_loan_costs, total_points, origination_charges, discount_points, lender_credits, interest_rate, payment_penalty, debt_to_incode, loan_value_ratio, loan_term, rate_spread_intro, baloon_payment, insert_only_payment, amortization, other_amortization, property_value, home_security_policy, lan_property_interest, total_units, mf_affordable, application_submission, payable, aus1, aus2, aus3, aus4, aus5, reverse_mortgage, line_of_credits, business_or_commercial, population, minority_population_percent, ffiec_med_fam_income, tract_to_msamd, owner_occupied_units, one_to_four_fam_units, msa_md, created_at, submission_id, msa_md_name, filing_year, conforming_loan_limit, median_age, median_age_calculated, median_income_percentage, race_categorization, sex_categorization, ethnicity_categorization, percent_median_msa_income, dwelling_category, loan_product_type, uli, checksum) FROM stdin;
\.


--
-- Data for Name: modifiedlar2020; Type: TABLE DATA; Schema: hmda_user; Owner: hmda_user
--

COPY hmda_user.modifiedlar2020 (id, uniq_id, lei, loan_type, loan_purpose, preapproval, construction_method, occupancy_type, loan_amount, action_taken_type, state, county, tract, ethnicity_applicant_1, ethnicity_applicant_2, ethnicity_applicant_3, ethnicity_applicant_4, ethnicity_applicant_5, ethnicity_observed_applicant, ethnicity_co_applicant_1, ethnicity_co_applicant_2, ethnicity_co_applicant_3, ethnicity_co_applicant_4, ethnicity_co_applicant_5, ethnicity_observed_co_applicant, race_applicant_1, race_applicant_2, race_applicant_3, race_applicant_4, race_applicant_5, race_co_applicant_1, race_co_applicant_2, race_co_applicant_3, race_co_applicant_4, race_co_applicant_5, race_observed_applicant, race_observed_co_applicant, sex_applicant, sex_co_applicant, observed_sex_applicant, observed_sex_co_applicant, age_applicant, applicant_age_greater_than_62, age_co_applicant, coapplicant_age_greater_than_62, income, purchaser_type, rate_spread, hoepa_status, lien_status, credit_score_type_applicant, credit_score_type_co_applicant, denial_reason1, denial_reason2, denial_reason3, denial_reason4, total_loan_costs, total_points, origination_charges, discount_points, lender_credits, interest_rate, payment_penalty, debt_to_incode, loan_value_ratio, loan_term, rate_spread_intro, baloon_payment, insert_only_payment, amortization, other_amortization, property_value, home_security_policy, lan_property_interest, total_units, mf_affordable, application_submission, payable, aus1, aus2, aus3, aus4, aus5, reverse_mortgage, line_of_credits, business_or_commercial, population, minority_population_percent, ffiec_med_fam_income, tract_to_msamd, owner_occupied_units, one_to_four_fam_units, msa_md, created_at, submission_id, msa_md_name, filing_year, conforming_loan_limit, median_age, median_age_calculated, median_income_percentage, race_categorization, sex_categorization, ethnicity_categorization, percent_median_msa_income, dwelling_category, loan_product_type, uli, checksum) FROM stdin;
\.


--
-- Data for Name: submission_history; Type: TABLE DATA; Schema: hmda_user; Owner: hmda_user
--

COPY hmda_user.submission_history (lei, submission_id, sign_date) FROM stdin;
\.


--
-- Data for Name: submission_history2019; Type: TABLE DATA; Schema: hmda_user; Owner: hmda_user
--

COPY hmda_user.submission_history2019 (lei, submission_id, sign_date) FROM stdin;
\.


--
-- Data for Name: transmittalsheet2018; Type: TABLE DATA; Schema: hmda_user; Owner: hmda_user
--

COPY hmda_user.transmittalsheet2018 (id, institution_name, year, quarter, name, phone, email, street, city, state, zip_code, agency, total_lines, tax_id, lei, created_at, submission_id, is_quarterly) FROM stdin;
\.


--
-- Data for Name: transmittalsheet2019; Type: TABLE DATA; Schema: hmda_user; Owner: hmda_user
--

COPY hmda_user.transmittalsheet2019 (id, institution_name, year, quarter, name, phone, email, street, city, state, zip_code, agency, total_lines, tax_id, lei, created_at, submission_id, is_quarterly) FROM stdin;
\.


--
-- Data for Name: transmittalsheet2020; Type: TABLE DATA; Schema: hmda_user; Owner: hmda_user
--

COPY hmda_user.transmittalsheet2020 (id, institution_name, year, quarter, name, phone, email, street, city, state, zip_code, agency, total_lines, tax_id, lei, created_at, submission_id, is_quarterly) FROM stdin;
\.


--
-- Name: institutions_emails_id_seq; Type: SEQUENCE SET; Schema: hmda_beta_user; Owner: hmda_user
--

SELECT pg_catalog.setval('hmda_beta_user.institutions_emails_id_seq', 1, false);


--
-- Name: institutions_history_notes_id_seq; Type: SEQUENCE SET; Schema: hmda_user; Owner: hmda_user
--

SELECT pg_catalog.setval('hmda_user.institutions_history_notes_id_seq', 1, false);


--
-- Name: modifiedlar2018_uniq_id_seq; Type: SEQUENCE SET; Schema: hmda_user; Owner: hmda_user
--

SELECT pg_catalog.setval('hmda_user.modifiedlar2018_uniq_id_seq', 1, false);


--
-- Name: modifiedlar2019_uniq_id_seq; Type: SEQUENCE SET; Schema: hmda_user; Owner: hmda_user
--

SELECT pg_catalog.setval('hmda_user.modifiedlar2019_uniq_id_seq', 1, false);


--
-- Name: modifiedlar2020_uniq_id_seq; Type: SEQUENCE SET; Schema: hmda_user; Owner: hmda_user
--

SELECT pg_catalog.setval('hmda_user.modifiedlar2020_uniq_id_seq', 1, false);


--
-- Name: institutions2019 institutions2019_pkey; Type: CONSTRAINT; Schema: hmda_beta_user; Owner: hmda_user
--

ALTER TABLE ONLY hmda_beta_user.institutions2019
    ADD CONSTRAINT institutions2019_pkey PRIMARY KEY (lei);


--
-- Name: institutions_emails institutions_emails_pkey; Type: CONSTRAINT; Schema: hmda_beta_user; Owner: hmda_user
--

ALTER TABLE ONLY hmda_beta_user.institutions_emails
    ADD CONSTRAINT institutions_emails_pkey PRIMARY KEY (id);


--
-- Name: institutions2018 institutions2018_pkey; Type: CONSTRAINT; Schema: hmda_user; Owner: hmda_user
--

ALTER TABLE ONLY hmda_user.institutions2018
    ADD CONSTRAINT institutions2018_pkey PRIMARY KEY (lei);


--
-- Name: institutions2019 institutions2019_pkey; Type: CONSTRAINT; Schema: hmda_user; Owner: hmda_user
--

ALTER TABLE ONLY hmda_user.institutions2019
    ADD CONSTRAINT institutions2019_pkey PRIMARY KEY (lei);


--
-- Name: institutions2020 institutions2020_pkey; Type: CONSTRAINT; Schema: hmda_user; Owner: hmda_user
--

ALTER TABLE ONLY hmda_user.institutions2020
    ADD CONSTRAINT institutions2020_pkey PRIMARY KEY (lei);


--
-- Name: institutions2021 institutions2021_pkey; Type: CONSTRAINT; Schema: hmda_user; Owner: hmda_user
--

ALTER TABLE ONLY hmda_user.institutions2021
    ADD CONSTRAINT institutions2021_pkey PRIMARY KEY (lei);


--
-- Name: institutions_history_notes institutions_history_notes_pkey; Type: CONSTRAINT; Schema: hmda_user; Owner: hmda_user
--

ALTER TABLE ONLY hmda_user.institutions_history_notes
    ADD CONSTRAINT institutions_history_notes_pkey PRIMARY KEY (id);


--
-- Name: modifiedlar2018 modifiedlar2018_pkey; Type: CONSTRAINT; Schema: hmda_user; Owner: hmda_user
--

ALTER TABLE ONLY hmda_user.modifiedlar2018
    ADD CONSTRAINT modifiedlar2018_pkey PRIMARY KEY (uniq_id);


--
-- Name: modifiedlar2019 modifiedlar2019_pkey; Type: CONSTRAINT; Schema: hmda_user; Owner: hmda_user
--

ALTER TABLE ONLY hmda_user.modifiedlar2019
    ADD CONSTRAINT modifiedlar2019_pkey PRIMARY KEY (uniq_id);


--
-- Name: modifiedlar2020 modifiedlar2020_pkey; Type: CONSTRAINT; Schema: hmda_user; Owner: hmda_user
--

ALTER TABLE ONLY hmda_user.modifiedlar2020
    ADD CONSTRAINT modifiedlar2020_pkey PRIMARY KEY (uniq_id);


--
-- Name: submission_history sh2018_pkey; Type: CONSTRAINT; Schema: hmda_user; Owner: hmda_user
--

ALTER TABLE ONLY hmda_user.submission_history
    ADD CONSTRAINT sh2018_pkey PRIMARY KEY (lei, submission_id);


--
-- Name: submission_history2019 sh2019_pkey; Type: CONSTRAINT; Schema: hmda_user; Owner: hmda_user
--

ALTER TABLE ONLY hmda_user.submission_history2019
    ADD CONSTRAINT sh2019_pkey PRIMARY KEY (lei, submission_id);


--
-- Name: transmittalsheet2018 ts2018_pkey; Type: CONSTRAINT; Schema: hmda_user; Owner: hmda_user
--

ALTER TABLE ONLY hmda_user.transmittalsheet2018
    ADD CONSTRAINT ts2018_pkey PRIMARY KEY (lei);


--
-- Name: transmittalsheet2019 ts2019_pkey; Type: CONSTRAINT; Schema: hmda_user; Owner: hmda_user
--

ALTER TABLE ONLY hmda_user.transmittalsheet2019
    ADD CONSTRAINT ts2019_pkey PRIMARY KEY (lei);


--
-- Name: transmittalsheet2020 ts2020_pkey; Type: CONSTRAINT; Schema: hmda_user; Owner: hmda_user
--

ALTER TABLE ONLY hmda_user.transmittalsheet2020
    ADD CONSTRAINT ts2020_pkey PRIMARY KEY (lei);


--
-- Name: modifiedlar2018_action_taken_type_idx; Type: INDEX; Schema: hmda_user; Owner: hmda_user
--

CREATE INDEX modifiedlar2018_action_taken_type_idx ON hmda_user.modifiedlar2018 USING btree (action_taken_type);


--
-- Name: modifiedlar2018_construction_method_idx; Type: INDEX; Schema: hmda_user; Owner: hmda_user
--

CREATE INDEX modifiedlar2018_construction_method_idx ON hmda_user.modifiedlar2018 USING btree (construction_method);


--
-- Name: modifiedlar2018_dwelling_category_idx; Type: INDEX; Schema: hmda_user; Owner: hmda_user
--

CREATE INDEX modifiedlar2018_dwelling_category_idx ON hmda_user.modifiedlar2018 USING btree (dwelling_category);


--
-- Name: modifiedlar2018_ethnicity_categorization_idx; Type: INDEX; Schema: hmda_user; Owner: hmda_user
--

CREATE INDEX modifiedlar2018_ethnicity_categorization_idx ON hmda_user.modifiedlar2018 USING btree (ethnicity_categorization);


--
-- Name: modifiedlar2018_filing_year_idx; Type: INDEX; Schema: hmda_user; Owner: hmda_user
--

CREATE INDEX modifiedlar2018_filing_year_idx ON hmda_user.modifiedlar2018 USING btree (filing_year);


--
-- Name: modifiedlar2018_lei_idx; Type: INDEX; Schema: hmda_user; Owner: hmda_user
--

CREATE INDEX modifiedlar2018_lei_idx ON hmda_user.modifiedlar2018 USING btree (lei);


--
-- Name: modifiedlar2018_lien_status_idx; Type: INDEX; Schema: hmda_user; Owner: hmda_user
--

CREATE INDEX modifiedlar2018_lien_status_idx ON hmda_user.modifiedlar2018 USING btree (lien_status);


--
-- Name: modifiedlar2018_loan_product_type_idx; Type: INDEX; Schema: hmda_user; Owner: hmda_user
--

CREATE INDEX modifiedlar2018_loan_product_type_idx ON hmda_user.modifiedlar2018 USING btree (loan_product_type);


--
-- Name: modifiedlar2018_loan_purpose_idx; Type: INDEX; Schema: hmda_user; Owner: hmda_user
--

CREATE INDEX modifiedlar2018_loan_purpose_idx ON hmda_user.modifiedlar2018 USING btree (loan_purpose);


--
-- Name: modifiedlar2018_loan_type_idx; Type: INDEX; Schema: hmda_user; Owner: hmda_user
--

CREATE INDEX modifiedlar2018_loan_type_idx ON hmda_user.modifiedlar2018 USING btree (loan_type);


--
-- Name: modifiedlar2018_median_age_year_idx; Type: INDEX; Schema: hmda_user; Owner: hmda_user
--

CREATE INDEX modifiedlar2018_median_age_year_idx ON hmda_user.modifiedlar2018 USING btree (median_age_calculated);


--
-- Name: modifiedlar2018_msa_md_idx; Type: INDEX; Schema: hmda_user; Owner: hmda_user
--

CREATE INDEX modifiedlar2018_msa_md_idx ON hmda_user.modifiedlar2018 USING btree (msa_md);


--
-- Name: modifiedlar2018_msamd_filing_year_idx; Type: INDEX; Schema: hmda_user; Owner: hmda_user
--

CREATE INDEX modifiedlar2018_msamd_filing_year_idx ON hmda_user.modifiedlar2018 USING btree (msa_md, filing_year);


--
-- Name: modifiedlar2018_race_categorization_idx; Type: INDEX; Schema: hmda_user; Owner: hmda_user
--

CREATE INDEX modifiedlar2018_race_categorization_idx ON hmda_user.modifiedlar2018 USING btree (race_categorization);


--
-- Name: modifiedlar2018_sex_categorization_idx; Type: INDEX; Schema: hmda_user; Owner: hmda_user
--

CREATE INDEX modifiedlar2018_sex_categorization_idx ON hmda_user.modifiedlar2018 USING btree (sex_categorization);


--
-- Name: modifiedlar2018_state_filing_year_idx; Type: INDEX; Schema: hmda_user; Owner: hmda_user
--

CREATE INDEX modifiedlar2018_state_filing_year_idx ON hmda_user.modifiedlar2018 USING btree (state, filing_year);


--
-- Name: modifiedlar2018_state_idx; Type: INDEX; Schema: hmda_user; Owner: hmda_user
--

CREATE INDEX modifiedlar2018_state_idx ON hmda_user.modifiedlar2018 USING btree (state);


--
-- Name: modifiedlar2018_total_units_year_idx; Type: INDEX; Schema: hmda_user; Owner: hmda_user
--

CREATE INDEX modifiedlar2018_total_units_year_idx ON hmda_user.modifiedlar2018 USING btree (total_units);


--
-- Name: modifiedlar2019_lei_idx; Type: INDEX; Schema: hmda_user; Owner: hmda_user
--

CREATE INDEX modifiedlar2019_lei_idx ON hmda_user.modifiedlar2019 USING btree (lei);


--
-- Name: modifiedlar2020_lei_idx; Type: INDEX; Schema: hmda_user; Owner: hmda_user
--

CREATE INDEX modifiedlar2020_lei_idx ON hmda_user.modifiedlar2020 USING btree (lei);


--
-- Name: DATABASE hmda; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON DATABASE hmda TO hmda_user;
GRANT ALL ON DATABASE hmda TO hmda_user_rd;


--
-- Name: TABLE lar2021_q1; Type: ACL; Schema: hmda_user; Owner: hmda_user
--

GRANT SELECT ON TABLE hmda_user.lar2021_q1 TO hmda_user_rd;


--
-- Name: TABLE lar2021_q2; Type: ACL; Schema: hmda_user; Owner: hmda_user
--

GRANT SELECT ON TABLE hmda_user.lar2021_q2 TO hmda_user_rd;


--
-- Name: TABLE lar2021_q3; Type: ACL; Schema: hmda_user; Owner: hmda_user
--

GRANT SELECT ON TABLE hmda_user.lar2021_q3 TO hmda_user_rd;


--
-- Name: submission_hist_mview; Type: MATERIALIZED VIEW DATA; Schema: hmda_user; Owner: hmda_user
--

REFRESH MATERIALIZED VIEW hmda_user.submission_hist_mview;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3 (Debian 13.3-1.pgdg100+1)
-- Dumped by pg_dump version 13.4 (Ubuntu 13.4-0ubuntu0.21.04.1)

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

--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

