CREATE DATABASE quizdb;
use quizdb;

#用户
CREATE TABLE user(
	id 	INT AUTO_INCREMENT PRIMARY KEY,
	acc VARCHAR(20),
	passwd VARCHAR(20)
);

#问卷
CREATE TABLE questionnaire(
	id INT 	AUTO_INCREMENT PRIMARY KEY,
	title TINYTEXT,
	description TEXT,
	ownner INT,
	status VARCHAR(10),
	cretime DATETIME,
	lasttime DATETIME,
	FOREIGN KEY(ownner) REFERENCES user(id)
);

#题目
CREATE TABLE question(
	id INT AUTO_INCREMENT PRIMARY KEY,
	belongsto INT,
	type VARCHAR(10),
	numbering INT,
	content TEXT,
	piture MEDIUMBLOB,
	FOREIGN KEY(belongsto) REFERENCES questionnaire(id)
);

#选项
CREATE TABLE options(
	id INT AUTO_INCREMENT PRIMARY KEY,
	content TEXT,
	belongsto INT,
	nextquestion INT,
	FOREIGN KEY(belongsto) REFERENCES question(id)
);

#答卷（一份问卷）
CREATE TABLE answernaire(
	id INT AUTO_INCREMENT PRIMARY KEY,
	belongsto INT,
	dotime DATETIME,
	FOREIGN KEY(belongsto) REFERENCES questionnaire(id)
);

#答案（一题）
CREATE TABLE answer(
	belongsto INT,
	answerto INT,
	optionto INT,
	content TEXT,
	FOREIGN KEY(belongsto) REFERENCES answernaire(id),
	FOREIGN KEY(answerto) REFERENCES question(id),
	FOREIGN KEY(optionto) REFERENCES options(id)
);

#模板题目
CREATE TABLE template(
	id INT AUTO_INCREMENT PRIMARY KEY,
	type VARCHAR(20),
	content TEXT
);
#模板选项
CREATE TABLE templateopt(
	content TEXT,
	belongsto INT,
	FOREIGN KEY(belongsto) REFERENCES template(id) 
);