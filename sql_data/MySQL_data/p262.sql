-- p262

USE moviedb;

CREATE TABLE movietbl
( movie_id    INT,
  movie_title VARCHAR(30),
  movie_director VARCHAR(20),
  movie_star  VARCHAR(20),
  movie_script  LONGTEXT,
  movie_film  LONGBLOB
) DEFAULT CHARSET=utf8mb4;

INSERT INTO movietbl VALUES ( 1, '쉰들러 리스트', '스필버그', '리암 니슨',
    LOAD_FILE('C:/SQL/Movies/Schindler.txt'), LOAD_FILE('C:/SQL/Movies/Schindler.mp4')
);

select * from movietbl;

SHOW variables LIKE 'max_allowed_packet';

SHOW variables LIKE 'secure_file_priv';