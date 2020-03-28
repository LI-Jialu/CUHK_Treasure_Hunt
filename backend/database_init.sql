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
    email varchar(40) NOT NULL,
    password varchar(20) NOT NULL,
    college_id tinyint unsigned DEFAULT 10,
    year tinyint unsigned DEFAULT 0,
    dorm varchar(20) DEFAULT "--", -- foreign key, collect names of all dorms
    reputation double(3,2) DEFAULT -1,
    PRIMARY KEY (user_id),
    FOREIGN KEY (college_id) REFERENCES colleges(college_id)
);
INSERT INTO users VALUES (DEFAULT,'system admin','admin@cuhk.edu.hk','notagoodpassword',10,0,'--',5);

CREATE TABLE items (
	item_id int unsigned NOT NULL AUTO_INCREMENT,
    poster_id mediumint unsigned NOT NULL,
    name varchar(20) NOT NULL,
    price double(6,1) NOT NULL,
    quantity smallint unsigned NOT NULL,
    create_time datetime NOT NULL,
    PRIMARY KEY (item_id),
    FOREIGN KEY (poster_id) REFERENCES users(user_id)
);

CREATE TABLE transactions (
	transaction_id int unsigned NOT NULL AUTO_INCREMENT,
    status BOOL NOT NULL DEFAULT 0,
    seller_id mediumint unsigned NOT NULL,
    buyer_id mediumint unsigned NOT NULL,
    item_id int unsigned NOT NULL,
    create_time datetime NOT NULL,
    PRIMARY KEY (transaction_id),
    FOREIGN KEY (seller_id) REFERENCES users (user_id),
    FOREIGN KEY (buyer_id) REFERENCES users (user_id),
    FOREIGN KEY (item_id) REFERENCES items (item_id)
);

CREATE TABLE favourites (
	item_id int unsigned NOT NULL,
    user_id mediumint unsigned NOT NULL,
    PRIMARY KEY (item_id, user_id),
    FOREIGN KEY (item_id) REFERENCES items (item_id) ON DELETE CASCADE, -- notify user of the deletion
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);

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

CREATE TABLE buy_requests (
	item_id int unsigned NOT NULL,
    buyer_id mediumint unsigned NOT NULL,
    quantity smallint unsigned NOT NULL,
    PRIMARY KEY (item_id, buyer_id),
    FOREIGN KEY (item_id) REFERENCES items (item_id) ON DELETE CASCADE, -- notify user of the deletion
    FOREIGN KEY (buyer_id) REFERENCES users (user_id)
);

CREATE TABLE tags (
	tag_id tinyint unsigned NOT NULL AUTO_INCREMENT,
    tag varchar(15) NOT NULL,
    PRIMARY KEY (tag_id)
);

CREATE TABLE item_tags (
	item_id int unsigned NOT NULL,
    tag_id tinyint unsigned NOT NULL,
    PRIMARY KEY (item_id, tag_id),
    FOREIGN KEY (item_id) REFERENCES items(item_id) ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES tags (tag_id)
);

