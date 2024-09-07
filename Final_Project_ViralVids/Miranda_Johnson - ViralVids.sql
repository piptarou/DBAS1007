CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username VARCHAR(255) NOT NULL UNIQUE,
    FullName VARCHAR(255) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Gender VARCHAR(20)
);

INSERT INTO Users (UserID, Username, FullName, DateOfBirth, Email, Gender)
VALUES
    (1, 'johndoe', 'John Doe', '1990-01-15', 'john.doe@boringmail.com', 'Male'),
    (2, 'gblnzrule', 'Boblin Goblin', '1985-05-20', 'boblin@dungeonzmail.com', 'Male'),
    (3, 'mnstrhntr', 'Volotham Geddarm', '1992-09-08', 'volothamp@dungeonzmail.com', 'Male'),
    (4, 'haglyfe', 'Baba Yaga', '1962-01-26', 'baba.yaga@hagmail.com', 'Female'),
    (5, 'healingz4suckaz', 'Jester Lavorre', '1999-06-06', 'sprinkles@feymail.com', 'Female');

CREATE TABLE ProfilePictures (
    PictureID INT PRIMARY KEY,
    UserID INT,
    PictureURL VARCHAR(255) UNIQUE NOT NULL,
    UploadDate DATETIME NOT NULL,
    DeletedDate DATETIME,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

INSERT INTO ProfilePictures (PictureID, UserID, PictureURL, UploadDate, DeletedDate)
VALUES
    (1, 1, 'profile_picture_url_1', '2023-01-15', NULL),
    (2, 1, 'profile_picture_url_2', '2023-02-20', NULL),
    (3, 2, 'profile_picture_url_3', '2023-03-25', NULL),
    (4, 2, 'profile_picture_url_4', '2023-04-30', '2023-05-10'),
    (5, 3, 'profile_picture_url_5', '2023-06-05', NULL),
    (6, 3, 'profile_picture_url_6', '2023-07-10', NULL);

CREATE TABLE HashedPasswords (
    PasswordID INT PRIMARY KEY,
    UserID INT,
    HashedPassword VARCHAR(255) NOT NULL,
    CreatedTimestamp DATETIME NOT NULL,
    ExpirationTimestamp DATETIME,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE SaltPasswords (
    PasswordID INT PRIMARY KEY,
    UserID INT,
    Salt VARCHAR(255) NOT NULL,
    CreatedTimestamp DATETIME NOT NULL,
    ExpirationTimestamp DATETIME,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

INSERT INTO HashedPasswords (PasswordID, UserID, HashedPassword, CreatedTimestamp, ExpirationTimestamp)
VALUES
    (1, 1, 'hashed_password_1', '2023-04-01', '2023-10-01'),
    (2, 2, 'hashed_password_2', '2023-05-01', '2023-11-01'),
    (3, 3, 'hashed_password_3', '2023-06-01', '2023-12-01'),
    (4, 4, 'hashed_password_4', '2023-07-01', '2024-01-01'),
    (5, 5, 'hashed_password_5', '2023-08-01', '2024-02-01'),
    (6, 1, 'new_hashed_password_1', '2024-02-01', '2024-08-01'),
    (7, 1, 'new_hashed_password_2', '2024-08-02', '2025-02-02'),
    (8, 2, 'new_hashed_password_3', '2024-03-01', '2024-09-01'),
    (9, 2, 'new_hashed_password_4', '2024-09-02', '2025-03-02'),
    (10, 3, 'new_hashed_password_5', '2024-04-01', '2024-10-01'),
    (11, 3, 'new_hashed_password_6', '2024-10-02', '2025-04-02'),
    (12, 4, 'new_hashed_password_7', '2024-05-01', '2024-11-01'),
    (13, 4, 'new_hashed_password_8', '2024-11-02', '2025-05-02');

INSERT INTO SaltPasswords (PasswordID, UserID, Salt, CreatedTimestamp, ExpirationTimestamp)
VALUES
    (1, 1, 'salt_1', '2023-04-01', '2023-10-01'),
    (2, 2, 'salt_2', '2023-05-01', '2023-11-01'),
    (3, 3, 'salt_3', '2023-06-01', '2023-12-01'),
    (4, 4, 'salt_4', '2023-07-01', '2024-01-01'),
    (5, 5, 'hashed_password_5', '2023-08-01', '2024-02-01'),
    (6, 1, 'new_salt_password_1', '2024-02-01', '2024-08-01'),
    (7, 1, 'new_salt_password_2', '2024-08-02', '2025-02-02'),
    (8, 2, 'new_salt_password_3', '2024-03-01', '2024-09-01'),
    (9, 2, 'new_salt_password_4', '2024-09-02', '2025-03-02'),
    (10, 3, 'new_salt_password_5', '2024-04-01', '2024-10-01'),
    (11, 3, 'new_salt_password_6', '2024-10-02', '2025-04-02'),
    (12, 4, 'new_salt_password_7', '2024-05-01', '2024-11-01'),
    (13, 4, 'new_salt_password_8', '2024-11-02', '2025-05-02');

CREATE TABLE FollowRequests (
    FollowID INT PRIMARY KEY,
    FollowerID INT,
    FolloweeID INT,
    FollowRequestTime DATETIME NOT NULL,
    ApprovalTime DATETIME NULL,
    FOREIGN KEY (FollowerID) REFERENCES Users(UserID),
    FOREIGN KEY (FolloweeID) REFERENCES Users(UserID)
);

INSERT INTO FollowRequests (FollowID, FollowerID, FolloweeID, FollowRequestTime, ApprovalTime)
VALUES
    (1, 1, 2, '2023-01-01', '2023-01-02'),
    (2, 1, 3, '2023-02-01', NULL),
    (3, 2, 1, '2023-03-01', '2023-03-02'),
    (4, 2, 3, '2023-03-03', '2023-03-12'),
    (5, 4, 3, '2023-05-13', NULL),
    (6, 5, 4, '2023-05-11', '2023-06-07'),
    (7, 1, 4, '2023-05-11', NULL),
    (8, 4, 1, '2023-05-11', '2023-05-11'),
    (9, 1, 5, '2023-05-11', NULL);

CREATE TABLE Videos (
    VideoID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    AuthorID INT,
    VideoURL VARCHAR(255) NOT NULL,
    UploadDate DATETIME NOT NULL,
    DeletedTimestamp DATETIME,
    FOREIGN KEY (AuthorID) REFERENCES Users(UserID)
);

INSERT INTO Videos (VideoID, Title, AuthorID, VideoURL, UploadDate)
VALUES
    (1, 'Contagion Spell Goes Wrong', 2, 'dnd_video_1_url', '2020-03-13'),
    (2, 'Shadowy Rogue Adventures', 2, 'dnd_video_2_url', '2021-04-18'),
    (3, 'Barbarian Rage Unleashed', 1, 'dnd_video_3_url', '2022-05-20'),
    (4, 'Epic Sword Fight', 3, 'dnd_video_4_url', '2023-05-20'),
    (5, 'Pit Fighting 101', 2, 'dnd_video_5_url', '2023-05-23'),
    (6, 'Alchemy for the Casual', 4, 'dnd_video_6_url', '2023-06-02'),
    (7, 'Oerth and Canada', 3, 'dnd_video_7_url', '2023-07-25'),
    (8, 'Best Taverns in Faerun', 3, 'dnd_video_8_url', '2023-09-24'),
    (9, 'How to RAGE', 1, 'dnd_video_9_url', '2023-09-24'),
    (10, 'Totem of the Duck', 1, 'dnd_video_10_url', '2023-09-27'),
    (11, 'How to Choose an Improvised Weapon', 1, 'dnd_video_11_url', '2023-09-29'),
    (12, 'Great Weapon Fighting', 1, 'dnd_video_12_url', '2023-09-30'),
    (13, 'How to Attack Recklessly', 3, 'dnd_video_13_url', '2023-10-04'),
    (14, 'How to Talk to Talking Swords', 4, 'dnd_video_14_url', '2023-10-12'),
    (15, 'Best Chewy Cookie Recipe', 4, 'dnd_video_15_url', '2023-10-20'),
    (16, 'How to Make Friends', 4, 'dnd_video_16_url', '2023-10-25'),
    (17, 'Combat Chair World Cup', 5, 'dnd_video_17_url', '2023-10-28');

CREATE TABLE Hashtags (
    HashtagID INT PRIMARY KEY,
    HashtagText VARCHAR(255) UNIQUE NOT NULL,
);

INSERT INTO Hashtags (HashtagID, HashtagText)
VALUES
    (1, '#ggwp'),
    (2, '#womenworldcup'),
    (3, '#gocanada'),
    (4, '#nerdpower'),
    (5, '#next_level_engineering'),
    (6, '#mongodb'),
    (7, '#javascript');

CREATE TABLE VideoHashtags (
    VideoID INT,
    HashtagID INT,
    PRIMARY KEY (VideoID, HashtagID),
    FOREIGN KEY (VideoID) REFERENCES Videos(VideoID),
    FOREIGN KEY (HashtagID) REFERENCES Hashtags(HashtagID)
);

INSERT INTO VideoHashtags (VideoID, HashtagID)
VALUES
    (1, 4),
    (1, 5),
    (1, 1),
    (2, 4),
    (2, 6),
    (3, 4),
    (3, 5),
    (3, 7),
    (17, 1),
    (17, 2),
    (17, 3);

CREATE TABLE ReactionTypes (
    ReactionTypeID INT PRIMARY KEY,
    ReactionText NVARCHAR(10) NOT NULL
);

INSERT INTO ReactionTypes (ReactionTypeID, ReactionText)
VALUES
    (1, N'❤️'),
    (2, N'👍'),
    (3, N'💯'),
    (4, N'🔥');

CREATE TABLE VideoReacts (
    UserID INT,
    VideoID INT,
    ReactionTypeID INT,
    PRIMARY KEY (UserID, VideoID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (VideoID) REFERENCES Videos(VideoID),
    FOREIGN KEY (ReactionTypeID) REFERENCES ReactionTypes(ReactionTypeID)
);

INSERT INTO VideoReacts (UserID, VideoID, ReactionTypeID)
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 4, 3),
    (4, 3, 4);

CREATE TABLE VideoComments (
    CommentID INT PRIMARY KEY,
    UserID INT,
    VideoID INT,
    CommentText TEXT NOT NULL,
    CommentTime DATETIME NOT NULL,
    ParentCommentID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (VideoID) REFERENCES Videos(VideoID),
    FOREIGN KEY (ParentCommentID) REFERENCES VideoComments(CommentID)
);

INSERT INTO VideoComments (CommentID, UserID, VideoID, CommentText, CommentTime, ParentCommentID)
VALUES
    (1, 1, 1, 'Great video!', '2023-01-02', NULL),
    (2, 2, 4, 'Nice job!', '2023-01-03', NULL),
    (3, 3, 4, 'Thanks!', '2023-01-04', 2),
    (4, 3, 2, 'Interesting content', '2023-02-02', NULL),
    (5, 1, 2, 'Agreed!', '2023-02-03', 4),
    (6, 4, 2, 'Indeed!', '2023-02-04', 4),
    (7, 4, 2, 'Wow', '2023-02-02', NULL),
    (8, 5, 10, 'Ducks are like so cute', '2023-10-02', NULL),
    (9, 3, 10, 'Absolutely adorable!', '2023-10-03', 8),
    (10, 3, 5, 'So cool', '2023-10-02', NULL),
    (11, 3, 1, 'Totally agree!', '2023-10-04', 1),
    (12, 3, 6, 'Cool content', '2023-10-03', NULL),
    (13, 4, 12, 'Interesting take', '2023-10-04', NULL),
    (14, 4, 10, 'Delicious too!', '2023-10-05', 8), 
    (15, 4, 7, 'Nice', '2023-10-05', NULL),
    (16, 3, 7, 'Thanks!', '2023-10-06', 15),
    (17, 3, 12, 'I gotta do this', '2023-10-08', NULL),
    (18, 1, 12, 'You should definitely try it!', '2023-10-09', 17), 
    (19, 5, 15, 'I like blueberry muffins better...', '2023-10-30', 15),
    (20, 4, 15, 'Blueberry muffins are great too!', '2023-10-31', 19),
    (21, 1, 17, 'Nice work', '2023-10-30', NULL);

CREATE TABLE CommentReacts (
    UserID INT,
    CommentID INT,
    ReactionTypeID INT,
    PRIMARY KEY (UserID, CommentID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (CommentID) REFERENCES VideoComments(CommentID),
    FOREIGN KEY (ReactionTypeID) REFERENCES ReactionTypes(ReactionTypeID)
);

INSERT INTO CommentReacts (UserID, CommentID, ReactionTypeID)
VALUES
    (1, 6, 1),
    (1, 3, 2),
    (2, 2, 3),
    (3, 5, 4);

CREATE TABLE PrivacyConfiguration (
    PrivacyID INT PRIMARY KEY,
    UserID INT,
    ShowFullName BIT NOT NULL,
    AutoApproveFollowRequests BIT NOT NULL,
    ShowVideosToNonFollowers BIT NOT NULL,
    LastUpdatedTimestamp DATETIME NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

INSERT INTO PrivacyConfiguration (PrivacyID, UserID, ShowFullName, AutoApproveFollowRequests, ShowVideosToNonFollowers, LastUpdatedTimestamp)
VALUES
    (1, 1, 1, 0, 1, '2023-01-01'),
    (2, 2, 1, 1, 0, '2023-01-02'),
    (3, 3, 1, 1, 0, '2023-01-03'),
    (4, 4, 1, 0, 1, '2023-01-04'),
    (5, 5, 1, 0, 1, '2023-01-05'),
    (6, 1, 0, 1, 1, '2023-01-06'),
    (7, 2, 1, 0, 1, '2023-01-07'),
    (8, 3, 0, 0, 1, '2023-01-08'),
    (9, 4, 1, 1, 0, '2023-01-09'),
    (10, 5, 0, 1, 0, '2023-01-10');

CREATE TABLE UserTracksHashtag (
    UserID INT,
    HashtagID INT,
    PRIMARY KEY (UserID, HashtagID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (HashtagID) REFERENCES Hashtags(HashtagID)
);

INSERT INTO UserTracksHashtag (UserID, HashtagID)
VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (3, 4),
    (4, 5),
    (5, 6),
    (1, 7),
    (2, 1),
    (3, 2),
    (4, 3),
    (5, 4),
    (1, 5),
    (2, 6),
    (3, 7),
    (4, 1),
    (5, 2);