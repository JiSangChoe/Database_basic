CREATE TABLE favorite (

	user_email VARCHAR(50) PRIMARY KEY NOT NULL,
    board_number INT PRIMARY KEY NOT NULL,
    FOREIGN KEY (user_email) REFERENCES user (email),
    FOREIGN KEY (board_number) REFERENCES board (board_number)
);

CREATE TABLE user (
	email VARCHAR(50) PRIMARY KEY NOT NULL, -- 기본키
	password VARCHAR(100) NOT NULL,
    nickname VARCHAR(20) NOT NULL UNIQUE,  -- 후보키
    tel_number VARCHAR(15) NOT NULL UNIQUE, -- 후보키
    address TEXT NOT NULL, 
    address_detail TEXT,
    profile_image TEXT,
    agreed_personal boolean NOT NULL
);

CREATE TABLE board (
	board_number INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    contents TEXT NOT NULL,
    write_datetime DATETIME NOT NULL DEFAULT now(),
    favorite_count INT NOT NULL DEFAULT 0 ,
    comment_count INT NOT NULL DEFAULT 0,
    view_count INT NOT NULL DEFAULT 0,
    writer_email VARCHAR(50) NOT NULL,
    FOREIGN KEY (writer_email)  REFERENCES user (email)
);


CREATE TABLE board_image  (
	sequence  INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    board_number INT NOT NULL,
    image_url TEXT,
    FOREIGN KEY (board_number) REFERENCES board (board_number)
    
);

CREATE TABLE comment (
    comment_number INT PRIMARY KEY NOT NULL,
    contents TEXT NOT NULL,
    write_datetime DATETIME NOT NULL,
    user_email VARCHAR(50) NOT NULL,
    board_number INT, 
    FOREIGN KEY (user_email) REFERENCES user (email),
    FOREIGN KEY (board_number) REFERENCES board (board_number)
);

CREATE TABLE search_log (
	sequence INT PRIMARY KEY NOT NULL,
    search_word TEXT NOT NULL,
    relation_word TEXT,
    relation boolean NOT NULL
);


