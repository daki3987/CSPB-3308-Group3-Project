# Project Milestone 5: SQL Design

The homepage features an interactive world map with clickable pins representing different continents or cultural regions. Clicking a pin opens a secondary view showing region-specific facts.

You will create a list of descriptions for tables and functions being created for the project.
You must add a file SQL_TESTING.md to your repository and provide the following for each table (at least 3 tables):

## Overview

This document defines the database schema and testing plan for the cultural facts web application. It includes detailed information on tables, access methods (queries/functions), and their related tests to ensure correct integration with the frontend pages (`index.html`, `window.html`, and `facts.html`).

---

## Tables

### 1. `continents`

**Description:**  
Stores metadata for each continent or region shown on the homepage map.

#### Fields

| Field Name | Description                     | Constraints                   |
|------------|---------------------------------|-------------------------------|
| id         | Unique identifier               | PRIMARY KEY, AUTO_INCREMENT   |
| name       | Continent or region name        | UNIQUE, NOT NULL              |
| lat        | Latitude for map pin            | NOT NULL                      |
| lng        | Longitude for map pin           | NOT NULL                      |
| label      | Display label on the map        | NOT NULL                      |

#### Tests

- **Use case:** Load map pins  
- **Test steps:**  
  1. Query `SELECT * FROM continents`  
  2. Check pin data loads and renders on map  
- **Expected result:** Pins display at correct coordinates  
- **Status:** Pass  

---

### 2. `facts`

**Description:**  
Stores cultural facts associated with continents.

#### Fields

| Field Name   | Description                         | Constraints                          |
|--------------|-------------------------------------|--------------------------------------|
| id           | Unique identifier for the fact      | PRIMARY KEY, AUTO_INCREMENT          |
| continent_id | Reference to `continents.id`        | FOREIGN KEY, NOT NULL                |
| name         | Fact title                          | NOT NULL                             |
| imageUrl     | URL of related image                | NULLABLE                             |
| description  | Full description of the fact        | NOT NULL                             |
| rating       | Average rating (1–5)                | NULLABLE, FLOAT                      |

#### Tests

- **Use case:** Show facts for region  
- **Test steps:**  
  1. Query `SELECT * FROM facts WHERE continent_id = ?`  
- **Expected result:** Correct list of facts per region  
- **Status:** Pass  

---

### 3. `comments`

**Description:**  
Stores user-submitted comments and ratings on facts.

#### Fields

| Field Name   | Description                         | Constraints                              |
|--------------|-------------------------------------|------------------------------------------|
| id           | Comment identifier                  | PRIMARY KEY, AUTO_INCREMENT              |
| fact_id      | Reference to `facts.id`             | FOREIGN KEY, NOT NULL                    |
| username     | Name of the commenter               | NOT NULL                                 |
| commentText  | Comment text                        | NOT NULL                                 |
| date         | Timestamp of submission             | DEFAULT CURRENT_TIMESTAMP                |
| rating       | Rating value (1–5)                  | CHECK (rating BETWEEN 1 AND 5), NOT NULL |

#### Tests

- **Use case:** Add new comment  
- **Test steps:**  
  1. Insert new comment with valid data  
  2. Query all comments for that fact  
- **Expected result:** Comment is stored and shown  
- **Status:** Pass  

---

## 🧩 Access Methods

### `getContinents()`

- **Description:** Returns all continent metadata  
- **Parameters:** None  
- **Returns:** `id`, `name`, `lat`, `lng`, `label`

#### Tests

- Returns all expected rows
- Coordinates are valid
- Label and name match UI

---

### `getFactsByContinent(continentName)`

- **Description:** Retrieves facts linked to a region  
- **Parameters:** `continentName` (string)  
- **Returns:** Array of facts

#### Tests

- Returns correct facts for valid region
- Handles no results gracefully
- Fails if region does not exist

---

### `getFactById(factId)`

- **Description:** Returns a single fact's details  
- **Parameters:** `factId` (int)  
- **Returns:** `name`, `description`, `imageUrl`, `tags`, `rating`

#### Tests

- Valid ID returns correct fact
- Invalid ID returns null or empty
- All fields display correctly

---

### `getCommentsByFactId(factId)`

- **Description:** Fetches all comments for a fact  
- **Parameters:** `factId` (int)  
- **Returns:** Array of comments

#### Tests

- Comments ordered by timestamp
- No results returns empty list
- Rating values are within 1–5

---

### `addComment(factId, username, commentText, rating)`

- **Description:** Adds a new user comment  
- **Parameters:**  
  - `factId`: int  
  - `username`: string  
  - `commentText`: string  
  - `rating`: int (1–5)  
- **Returns:** Success/failure

#### Tests

- Valid comment saves
- Missing values rejected
- Rating must be between 1–5

---

##  Page-Level Data Access

| Page         | Tables Accessed     | Functions Used                        |
|--------------|---------------------|----------------------------------------|
| `index.html` | `continents`        | `getContinents()`                      |
| `window.html`| `facts`, `continents`| `getFactsByContinent()`               |
| `facts.html` | `facts`, `comments` | `getFactById()`, `getCommentsByFactId()`, `addComment()` |

---



---


