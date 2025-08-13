# 🎵 Spotify Listening History – Data Cleaning & Analysis with SQL

This project showcases a full workflow of cleaning and analyzing Spotify listening data using **MySQL**. The dataset contains listening history exported from Spotify, which includes timestamps, track and artist names, playback duration, platform used, shuffle/skipped status, and more.

---

## 📁 Dataset
- `spotify_history`: Table containing raw listening data exported from Spotify.
- Columns include:
  - `spotify_track_uri`
  - `ts` (timestamp)
  - `platform`
  - `ms_played`
  - `track_name`
  - `artist_name`
  - `album_name`
  - `reason_start`
  - `reason_end`
  - `shuffle`
  - `skipped`

---

## 🔧 Data Cleaning Steps

1. **Check for nulls and empty values** in key columns.
2. **Modify data types** to standardize the structure.
3. **Remove invalid rows**, e.g., with empty `reason_start`, `ts`, or negative `ms_played`.
4. **Trim whitespace** from string fields.
5. **Convert timestamp (`ts`)** to a valid `DATETIME` format.
6. **Normalize boolean fields** like `shuffle` and `skipped`.
7. **Remove duplicate entries** using a nested `SELECT` with `GROUP BY`.

---

## 📊 Analysis Queries

- Total number of plays and total listening hours.
- Top 10 tracks by listening time and play count.
- Top artists and albums by total time.
- Most common start and end reasons.
- Shuffle/skipped usage statistics.
- Platform usage distribution.
- Duration-based distribution of plays.
- Most skipped tracks.

---

## 📦 Tools Used

- **MySQL / SQL**
- **Spotify Listening History Export**
- **DBMS for query execution and visualization**

---
