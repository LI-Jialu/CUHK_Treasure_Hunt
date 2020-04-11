DROP DATABASE IF EXISTS treasure_hunt;
CREATE DATABASE treasure_hunt;
USE treasure_hunt;

CREATE TABLE colleges (
	college_id tinyint unsigned NOT NULL AUTO_INCREMENT,
    college char(2) NOT NULL,
    PRIMARY KEY (college_id)
);
INSERT INTO colleges VALUES (DEFAULT, "CC");
INSERT INTO colleges VALUES (DEFAULT, "CW");
INSERT INTO colleges VALUES (DEFAULT, "MC");
INSERT INTO colleges VALUES (DEFAULT, "NA");
INSERT INTO colleges VALUES (DEFAULT, "SC");
INSERT INTO colleges VALUES (DEFAULT, "SH");
INSERT INTO colleges VALUES (DEFAULT, "UC");
INSERT INTO colleges VALUES (DEFAULT, "WS");
INSERT INTO colleges VALUES (DEFAULT, "YS");
INSERT INTO colleges VALUES (DEFAULT, "--");

CREATE TABLE users (
	user_id mediumint unsigned NOT NULL AUTO_INCREMENT,
    username varchar(20) NOT NULL,
    student_id char(10) NOT NULL,
    password varchar(20) NOT NULL,
    college_id tinyint unsigned DEFAULT 10,
    year tinyint unsigned DEFAULT 0,
    dorm varchar(20) DEFAULT "--", -- foreign key, collect names of all dorms
    reputation double(3,2) DEFAULT -1,
    PRIMARY KEY (user_id),
    FOREIGN KEY (college_id) REFERENCES colleges(college_id)
);
INSERT INTO users VALUES (DEFAULT,'admin1','0000000000','admin1',10,0,'--',5);
INSERT INTO users VALUES (DEFAULT, "admin2", '0000000001','admin2',6,2,'--',DEFAULT);
INSERT INTO users VALUES (DEFAULT, "admin3", '0000000002','admin3',6,2,'--',DEFAULT);
INSERT INTO users VALUES (DEFAULT, "admin4", '0000000003','admin4',6,2,'--',DEFAULT);
INSERT INTO users VALUES (DEFAULT, "admin5", '0000000004','admin5',6,2,'--',DEFAULT);

CREATE TABLE items (
	item_id int unsigned NOT NULL AUTO_INCREMENT,
    poster_id mediumint unsigned NOT NULL,
    name varchar(30) NOT NULL,
    price double(6,1) NOT NULL,
    quantity smallint unsigned NOT NULL,
    create_time datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (item_id),
    FOREIGN KEY (poster_id) REFERENCES users(user_id)
);
INSERT INTO items VALUES (DEFAULT, 1, 'homework coupon', 10000, 1, DEFAULT);
INSERT INTO items VALUES (DEFAULT, 1, 'coronavirus vaccine', 99999, 1, DEFAULT);
INSERT INTO items VALUES (DEFAULT, 2, 'plane ticket to chengdu', 4699, 2, DEFAULT);
INSERT INTO items VALUES (DEFAULT, 2, 'exam solution', 10000, 1, DEFAULT);
INSERT INTO items VALUES (DEFAULT, 3, 'UGFH book', 10.0, 1, DEFAULT);
INSERT INTO items VALUES (DEFAULT, 3, 'UGFN book', 10.0, 1, DEFAULT);
INSERT INTO items VALUES (DEFAULT, 4, 'Expired Mask', 10.0, 1, DEFAULT);
INSERT INTO items VALUES (DEFAULT, 4, 'Used Lipstick', 100.0, 1, DEFAULT);
INSERT INTO items VALUES (DEFAULT, 5, 'Fingernail', 105.0, 1, DEFAULT);
INSERT INTO items VALUES (DEFAULT, 5, 'Hair', 3.0, 1, DEFAULT);

CREATE TABLE transactions (
	transaction_id int unsigned NOT NULL AUTO_INCREMENT,
    status_s tinyint NOT NULL DEFAULT 0,
    status_b tinyint NOT NULL DEFAULT 0,
    seller_id mediumint unsigned NOT NULL,
    buyer_id mediumint unsigned NOT NULL,
    item_id int unsigned NOT NULL,
    price double(6,1) NOT NULL,
    quantity smallint unsigned NOT NULL,
    create_time datetime NOT NULL DEFAULT NOW(),
    PRIMARY KEY (transaction_id),
    FOREIGN KEY (seller_id) REFERENCES users (user_id),
    FOREIGN KEY (buyer_id) REFERENCES users (user_id),
    FOREIGN KEY (item_id) REFERENCES items (item_id)
);
INSERT INTO transactions VALUES(DEFAULT, 1, 1, 1, 2, 1, 2.2, 1, DEFAULT);

CREATE TABLE favourites ( -- create surrogate key to allow set null
	favourite_id int unsigned NOT NULL AUTO_INCREMENT,
	item_id int unsigned,
    user_id mediumint unsigned NOT NULL,
    PRIMARY KEY (favourite_id),
    FOREIGN KEY (item_id) REFERENCES items (item_id) ON DELETE SET NULL, -- notify user of the deletion
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);
INSERT INTO favourites VALUES (DEFAULT, 1, 2);
INSERT INTO favourites VALUES (DEFAULT, 2, 2);

CREATE TABLE messages (
	message_id bigint unsigned NOT NULL AUTO_INCREMENT,
    sender_id mediumint unsigned NOT NULL,
    receiver_id mediumint unsigned NOT NULL,
    message varchar(200) NOT NULL,
    create_time datetime NOT NULL,
    PRIMARY KEY (message_id),
    FOREIGN KEY (sender_id) REFERENCES users (user_id),
    FOREIGN KEY (receiver_id) REFERENCES users (user_id)
);

CREATE TABLE buy_requests ( -- create surrogate key to allow set null
	buy_request_id int unsigned NOT NULL AUTO_INCREMENT,
	item_id int unsigned,
    buyer_id mediumint unsigned NOT NULL,
    quantity smallint unsigned NOT NULL,
    PRIMARY KEY (buy_request_id),
    FOREIGN KEY (item_id) REFERENCES items (item_id) ON DELETE SET NULL, -- notify user of the deletion
    FOREIGN KEY (buyer_id) REFERENCES users (user_id)
);
INSERT INTO buy_requests VALUES (DEFAULT, 1, 2, 1);

CREATE TABLE tags (
	tag_id tinyint unsigned NOT NULL AUTO_INCREMENT,
    tag varchar(15) NOT NULL,
    PRIMARY KEY (tag_id)
);
INSERT INTO tags VALUES (DEFAULT, 'free');

CREATE TABLE item_tags (
	item_id int unsigned NOT NULL,
    tag_id tinyint unsigned NOT NULL,
    PRIMARY KEY (item_id, tag_id),
    FOREIGN KEY (item_id) REFERENCES items(item_id) ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES tags (tag_id)
);
INSERT INTO item_tags VALUES (1, 1);
