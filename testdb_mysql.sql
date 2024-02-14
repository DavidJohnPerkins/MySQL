
CREATE DATABASE TestDB;
USE TestDB;

DROP TABLE IF EXISTS model;

CREATE TABLE model(
	model_id		int 		AUTO_INCREMENT,
	sobriquet		varchar(50) NOT NULL,
	year_of_birth	int 		NOT NULL,
	`comment`		varchar(1000),
	for_comparison	BOOL		NOT NULL,
	is_excluded		BOOL		NOT NULL,
	PRIMARY KEY (model_id)
);

CREATE UNIQUE INDEX U_IDX_model_sobriquet ON model (sobriquet);
CREATE INDEX IDX_model_for_comparison ON model (for_comparison);

DROP TABLE IF EXISTS model_name;

CREATE TABLE model_name
(
	id				int 		AUTO_INCREMENT,
	model_id		int			NOT NULL,
	model_name		varchar(50)	NOT NULL,
	principal_name	BOOL 		NOT NULL,
	PRIMARY KEY (id)
);
CREATE UNIQUE INDEX U_IDX_modelid_nameid ON model_name (model_id, id);
ALTER TABLE model_name ADD CONSTRAINT FK_model_name_model FOREIGN KEY (model_id) REFERENCES model(model_id) ON DELETE CASCADE;


DROP TABLE IF EXISTS flag;

CREATE TABLE flag
(
	flag_id				int AUTO_INCREMENT,
	flag_abbrev			char(8)				NOT NULL,
	flag_desc			varchar(50)			NOT NULL,
	PRIMARY KEY (flag_id)
);

CREATE UNIQUE INDEX U_IDX_flag_abbrev ON flag(flag_abbrev);


DROP TABLE IF EXISTS model_flag;

CREATE TABLE model_flag
(
	id				int AUTO_INCREMENT,
	model_id		int	NOT NULL,
	flag_id			int	NOT NULL,
	PRIMARY KEY (id)
);

CREATE UNIQUE INDEX U_IDX_modelflag_modelid_flagid ON model_flag (model_id, flag_id);

ALTER TABLE model_flag ADD CONSTRAINT FK_modelflag_modelid_model FOREIGN KEY (model_id) REFERENCES model(model_id) ON DELETE CASCADE;
ALTER TABLE model_flag ADD CONSTRAINT FK_modelflag_flagid_flag FOREIGN KEY (flag_id) REFERENCES flag(flag_id) ON DELETE CASCADE;


DROP TABLE IF EXISTS attribute_scheme;

CREATE TABLE attribute_scheme
(
	scheme_id			int AUTO_INCREMENT,
	`scheme_abbrev`		varchar(20) not null,
	`scheme_desc`		varchar(50) NOT NULL,
	`active`			bool,
	PRIMARY KEY (scheme_id)
);

CREATE UNIQUE INDEX U_IDX_attr_scheme_abbrev ON attribute_scheme (scheme_abbrev);


DROP TABLE IF EXISTS attribute_level_1;

CREATE TABLE attribute_level_1
(
	l1_id				int AUTO_INCREMENT,
	l1_desc				varchar(50) NOT NULL,
	abbrev				char(4) NULL,
	for_aggregation		bool NOT NULL,
	PRIMARY KEY (l1_id)
);

