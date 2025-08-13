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

## 📈 Queries & results
<img width="509" height="221" alt="Screenshot 2025-08-13 123411" src="https://github.com/user-attachments/assets/18fc6085-2052-44f2-baf2-281d96f69e59" />
<img width="582" height="156" alt="Screenshot 2025-08-13 123433" src="https://github.com/user-attachments/assets/82f56c46-8a77-416c-a1e2-c836c9d9983e" />
<img width="607" height="473" alt="Screenshot 2025-08-13 123516" src="https://github.com/user-attachments/assets/b88aab39-8004-4d43-a7e3-1c800e81cbf6" />
<img width="620" height="475" alt="Screenshot 2025-08-13 123538" src="https://github.com/user-attachments/assets/1346d43b-9965-440e-9592-e6f9a9fde43e" />
<img width="613" height="333" alt="Screenshot 2025-08-13 123557" src="https://github.com/user-attachments/assets/337301bb-4dfb-4207-9d05-0f5b64a68a79" />
<img width="624" height="360" alt="Screenshot 2025-08-13 123616" src="https://github.com/user-attachments/assets/8e19f75b-dc0d-4882-9403-d65ba1f6aad9" />
<img width="484" height="535" alt="Screenshot 2025-08-13 123642" src="https://github.com/user-attachments/assets/40eda5b5-f1b6-4f29-9597-7dbea25cb035" />
<img width="500" height="528" alt="Screenshot 2025-08-13 123719" src="https://github.com/user-attachments/assets/61959408-521f-4f37-9680-34a3d32b1d75" />
<img width="512" height="401" alt="Screenshot 2025-08-13 123750" src="https://github.com/user-attachments/assets/8b1de010-c22a-4a97-9a11-801b491450f8" />
<img width="497" height="253" alt="Screenshot 2025-08-13 123809" src="https://github.com/user-attachments/assets/9fe7db45-3ebf-4f85-8029-a44806fbb445" />
<img width="499" height="349" alt="Screenshot 2025-08-13 123830" src="https://github.com/user-attachments/assets/146b3cec-34bf-4fbb-9788-04db3019fc00" />
<img width="506" height="468" alt="Screenshot 2025-08-13 123928" src="https://github.com/user-attachments/assets/c8a66822-8643-4119-9641-52c532457d8d" />
