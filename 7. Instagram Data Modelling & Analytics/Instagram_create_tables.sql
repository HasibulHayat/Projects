CREATE DATABASE Instagram;



CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(20) UNIQUE
);


CREATE TABLE Posts (
    post_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    caption VARCHAR(200),
    image_url VARCHAR(200),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);


CREATE TABLE Comments (
    comment_id INT PRIMARY KEY,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    comment_text VARCHAR(200) NOT NULL,
    FOREIGN KEY (post_id) REFERENCES Posts(post_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);


CREATE TABLE Likes (
    like_id INT PRIMARY KEY,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (post_id) REFERENCES Posts(post_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);


CREATE TABLE Followers (
    follower_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    follower_user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (follower_user_id) REFERENCES Users(user_id)
);