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

