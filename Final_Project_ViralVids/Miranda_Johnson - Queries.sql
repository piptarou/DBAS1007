-- 1- Write a query to find the most recent “hash” and “salt” combination for a user with the username “johndoe”. 
-- This will be used to verify the user’s password at login. 
SELECT TOP 1
    HashedPasswords.HashedPassword,
    (SELECT TOP 1 Salt FROM SaltPasswords
     WHERE SaltPasswords.UserID = Users.UserID
     ORDER BY CreatedTimestamp DESC) AS Salt
FROM HashedPasswords
JOIN Users ON HashedPasswords.UserID = Users.UserID
WHERE Users.Username = 'johndoe';

-- 2- Write a query to Show the Full name of all users who have outstanding unapproved follow requests for username “johndoe”.
SELECT DISTINCT Users.FullName FROM Users
JOIN FollowRequests ON Users.UserID = FollowRequests.FolloweeID
WHERE FollowRequests.FollowerID = (SELECT UserID FROM Users WHERE Username = 'johndoe') AND FollowRequests.ApprovalTime IS NULL;

-- 3- A user has just created a video and put the hashtags #ggwp #womenworldcup #gocanada and is intending to publish it. 
-- What query will your system run to check which of these hashtags are new?
SELECT HashtagText FROM Hashtags
WHERE HashtagText IN ('#ggwp', '#womenworldcup', '#gocanada')
AND HashtagText NOT IN (
    SELECT HashtagText FROM Hashtags
);

-- 4- Write a query to show the number of comments made on the latest video published by “johndoe”.
SELECT TOP 1 Videos.VideoID, Videos.UploadDate, COUNT(*) AS CommentCount FROM VideoComments
JOIN Videos ON VideoComments.VideoID = Videos.VideoID
JOIN Users ON Videos.AuthorID = Users.UserID
WHERE Users.Username = 'johndoe'
GROUP BY Videos.VideoID, Videos.UploadDate
ORDER BY Videos.UploadDate DESC;

-- 5- Write the name of the most elderly user who follows “johndoe”.
SELECT TOP 1 Users.FullName AS MostElderlyFollower FROM Users
JOIN FollowRequests ON Users.UserID = FollowRequests.FollowerID
WHERE FollowRequests.FolloweeID = (SELECT Users.UserID FROM Users WHERE Users.Username = 'johndoe')
ORDER BY Users.DateOfBirth ASC;

-- 6- Show all information for the top 10 most recently published videos 
SELECT TOP 10
    Videos.VideoID,
    Videos.Title,
    Users.FullName AS AuthorName,
    Videos.VideoURL,
    Videos.UploadDate,
    Videos.DeletedTimestamp
FROM Videos
JOIN Users ON Videos.AuthorID = Users.UserID
ORDER BY Videos.UploadDate DESC;

-- 7- Show all videos that contain the hashtags #nerdpower and #next_level_engineering 
-- but exclude the ones that have #mongodb or #javascript (any video that contains either #mongodb or #javascript or both should be excluded from the final result. 
SELECT DISTINCT Videos.* FROM Videos
JOIN VideoHashtags ON Videos.VideoID = VideoHashtags.VideoID
JOIN Hashtags ON VideoHashtags.HashtagID = Hashtags.HashtagID AND Hashtags.HashtagText IN ('#nerdpower', '#next_level_engineering')
WHERE Videos.VideoID NOT IN (
    SELECT DISTINCT Videos.VideoID FROM Videos
    JOIN VideoHashtags ON Videos.VideoID = VideoHashtags.VideoID
    JOIN Hashtags ON VideoHashtags.HashtagID = Hashtags.HashtagID AND Hashtags.HashtagText IN ('#mongodb', '#javascript')
);

-- 8- Show the top 20 most recent videos published by authors who are followed by “johndoe”
SELECT TOP 20 Videos.* FROM Videos
JOIN Users AS Followers ON Videos.AuthorID = Followers.UserID
JOIN FollowRequests ON Followers.UserID = FollowRequests.FollowerID
JOIN Users ON Users.UserID = FollowRequests.FolloweeID
WHERE Users.Username = 'johndoe'
ORDER BY Videos.UploadDate DESC;

-- 9- for bonus marks:
-- Write a query to show the top 10 videos with the most reactions of all time 
SELECT TOP 10 Videos.*, COUNT(VideoReacts.ReactionTypeID) AS ReactionCount FROM Videos
LEFT JOIN VideoReacts ON Videos.VideoID = VideoReacts.VideoID
GROUP BY Videos.VideoID, Videos.Title, Videos.AuthorID, Videos.VideoURL, Videos.UploadDate, Videos.DeletedTimestamp
ORDER BY ReactionCount DESC;

