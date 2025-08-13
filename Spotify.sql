create database spotify;

use spotify;
select * from spotify_history;
describe spotify_history;

-- DATA CLEANING

select count(*) as Total_rows,
sum(case when ï»¿spotify_track_uri is null or ï»¿spotify_track_uri = '' then 1 else 0 end) as  null_url,
sum(case when ts is null or ts = '' then 1 else 0 end) as  null_ts,
sum(case when platform is null or platform = '' then 1 else 0 end) as  null_platform,
sum(case when ms_played is null or ms_played = '' then 1 else 0 end) as  null_ms_played,
sum(case when track_name is null or track_name = '' then 1 else 0 end) as  null_track_name,
sum(case when artist_name is null or artist_name = '' then 1 else 0 end) as  null_artist_name,
sum(case when album_name is null or album_name = '' then 1 else 0 end) as  null_album_name,
sum(case when reason_start is null or reason_start = '' then 1 else 0 end) as  null_reason_start,
sum(case when reason_end is null or reason_end = '' then 1 else 0 end) as  null_reason_end,
sum(case when shuffle is null or shuffle = '' then 1 else 0 end) as  null_shuffle,
sum(case when skipped is null or skipped = '' then 1 else 0 end) as  null_skipped
from spotify_history;

alter table spotify_history
modify ï»¿spotify_track_uri VARCHAR(2000),
modify ts varchar (32),
modify platform varchar(255),
modify ms_played varchar(255),
modify track_name varchar(1000),
modify artist_name varchar(1000),
modify album_name varchar(1000),
modify reason_start varchar(255),
modify reason_end varchar(255),
modify shuffle varchar(255),
modify skipped varchar(255);

set sql_safe_updates = 0;
delete from spotify_history
where reason_start is null or reason_start = '' or reason_start = ' ' or reason_end is null or reason_end = '' or reason_end = ' ';

delete from spotify_history
where ts is null or ts = '';

delete from spotify_history
where ms_played is null or ms_played < 0;

update spotify_history
set 
ï»¿spotify_track_uri = trim(ï»¿spotify_track_uri),
platform = trim(platform),
track_name = trim(track_name),
artist_name = trim(artist_name),
album_name = trim(reason_start),
reason_start = trim(reason_start),
reason_end = trim(reason_end);

update spotify_history
set ts = str_to_date(ts, '%m/%d/%Y %H:%i')
where ts not like '%-%';

UPDATE spotify_history
SET shuffle = (shuffle = 'TRUE');

UPDATE spotify_history 
SET skipped = (skipped = 'TRUE');



DELETE FROM spotify_history
WHERE ï»¿spotify_track_uri NOT IN (
  SELECT uri FROM (
    SELECT MIN(ï»¿spotify_track_uri) AS uri
    FROM spotify_history
    GROUP BY ï»¿spotify_track_uri, ts, platform, ms_played, track_name, artist_name, album_name
  ) AS temp
);

select * from spotify_history;
set sql_safe_updates = 0;

-- Analysis queries
-- Total number of plays
select count(*) as total_plays
from spotify_history;

-- Total listening time (hours)

SELECT ROUND(SUM(ms_played) / 1000 / 60 / 60, 2) AS total_hours_listened
FROM spotify_history;

-- Top 10 most played tracks (by time)
SELECT
    track_name,
    artist_name,
    SUM(ms_played) AS total_ms_played,
    COUNT(*) AS play_count
FROM spotify_history
GROUP BY track_name, artist_name
ORDER BY total_ms_played DESC
LIMIT 10;

-- Top tracks by number of plays
SELECT
    track_name,
    artist_name,
    COUNT(*) AS play_count
FROM spotify_history
GROUP BY track_name, artist_name
ORDER BY play_count DESC
LIMIT 10;

-- Top artists by total listening time
SELECT
    artist_name,
    ROUND(SUM(ms_played) / 1000 / 60, 2) AS total_minutes
FROM spotify_history
GROUP BY artist_name
ORDER BY total_minutes DESC
LIMIT 5;

-- Top 5 albums by listening time
SELECT
    album_name,
    artist_name,
    ROUND(SUM(ms_played) / 1000 / 60, 2) AS total_minutes
FROM spotify_history
GROUP BY album_name, artist_name
ORDER BY total_minutes DESC
LIMIT 5;

-- Most common reason tracks start
SELECT
    reason_start,
    COUNT(*) AS count
FROM spotify_history
GROUP BY reason_start
ORDER BY count DESC;

-- Most common reason tracks end
SELECT
    reason_end,
    COUNT(*) AS count
FROM spotify_history
GROUP BY reason_end
ORDER BY count DESC; 

-- How often shuffle is used
SELECT
    shuffle,
    COUNT(*) AS count
FROM spotify_history
GROUP BY shuffle;


-- How often tracks are skipped
SELECT
    skipped,
    COUNT(*) AS count
FROM spotify_history
GROUP BY skipped;

-- Top platforms used
SELECT
    platform,
    COUNT(*) AS play_count
FROM spotify_history
GROUP BY platform
ORDER BY play_count DESC;

-- Distribution of play durations
SELECT
    CASE
        WHEN ms_played = 0 THEN 'Skipped'
        WHEN ms_played < 30000 THEN '<30 sec'
        WHEN ms_played < 120000 THEN '30 sec - 2 min'
        WHEN ms_played < 300000 THEN '2 min - 5 min'
        ELSE '>5 min'
    END AS duration_bucket,
    COUNT(*) AS play_count
FROM spotify_plays
GROUP BY duration_bucket
ORDER BY play_count DESC;

-- Tracks with the most skips
SELECT
    track_name,
    artist_name,
    COUNT(*) AS skip_count
FROM spotify_history
WHERE skipped = 1
GROUP BY track_name, artist_name
ORDER BY skip_count DESC
LIMIT 10;