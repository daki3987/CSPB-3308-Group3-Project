# Project Milestone 5: SQL Design

The homepage features an interactive world map with clickable pins representing different continents or cultural regions. Clicking a pin opens a secondary view showing region-specific facts.

You will create a list of descriptions for tables and functions being created for the project.
You must add a file SQL_TESTING.md to your repository and provide the following for each table (at least 3 tables):

## Overview

This document defines the database schema and testing plan for the cultural facts web application. It includes detailed information on tables, access methods (queries/functions), and their related tests to ensure correct integration with the frontend pages.

---

## Tables

### 1. continents

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

### 2. facts

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

### 3. comments

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


## Data Access Methods

### 1. `getContinents()`

**Description:** Retrieves all continent records for the homepage map.

- **Parameters:** None  
- **Return Values:** List of `{ id, name, lat, lng, label }`

**Tests:**

**Use Case Name:** Retrieve list of continents  
**Description:** Populate homepage with region pins  
**Pre-conditions:** Table contains valid rows  
**Test Steps:**
1. Execute `SELECT * FROM continents`
2. Ensure all records have valid coordinate and name fields  
**Expected Result:** Non-empty list of valid regions  
**Actual Result:** All pins renderable  
**Status:** Pass  
**Post-conditions:** Frontend map is populated with DB data

---

### 2. `getFactsByContinent(continentName)`

**Description:** Retrieves facts filtered by the name of the continent.

- **Parameters:** `continentName` (string)  
- **Return Values:** List of facts with `{ id, name, imageUrl, description, rating }`

**Tests:**

**Use Case Name:** Retrieve facts by region name  
**Description:** Show only facts matching selected region  
**Pre-conditions:** Region exists with at least one fact  
**Test Steps:**
1. JOIN `facts` and `continents` on `continent_id`
2. Filter `WHERE continents.name = ?`
**Expected Result:** List of matching facts returned  
**Actual Result:** Facts match region parameter  
**Status:** Pass  
**Post-conditions:** Region page displays filtered fact cards

---

### 3. `getFactById(factId)`

**Description:** Returns full fact details for a given ID.

- **Parameters:** `factId` (int)  
- **Return Values:** One record with `{ name, imageUrl, description, rating }`

**Tests:**

**Use Case Name:** Fetch single fact  
**Description:** Load detail view for one fact  
**Pre-conditions:** Fact with matching ID exists  
**Test Steps:**
1. Query `SELECT * FROM facts WHERE id = ?`
2. Validate that all fields are returned  
**Expected Result:** One record matching fact ID  
**Actual Result:** Correct data displayed  
**Status:** Pass  
**Post-conditions:** Page `facts.html` renders content

---

### 4. `getCommentsByFactId(factId)`

**Description:** Fetches all comments tied to a specific fact.

- **Parameters:** `factId` (int)  
- **Return Values:** List of `{ username, commentText, date, rating }`

**Tests:**

**Use Case Name:** Display comments for a fact  
**Description:** Verify all feedback is shown in order  
**Pre-conditions:** Comments exist for selected fact  
**Test Steps:**
1. Query `SELECT * FROM comments WHERE fact_id = ? ORDER BY date DESC`
2. Confirm rows match expected structure  
**Expected Result:** Comments shown in reverse chronological order  
**Actual Result:** All rows retrieved  
**Status:** Pass  
**Post-conditions:** Comments load under fact page

---

### 5. `addComment(factId, username, commentText, rating)`

**Description:** Inserts a new comment with a rating for a fact.

- **Parameters:**  
  - `factId` (int)  
  - `username` (string)  
  - `commentText` (string)  
  - `rating` (int: 1–5)  
- **Return Values:** Success/failure confirmation

**Tests:**

**Use Case Name:** Submit a new comment  
**Description:** Verify comment is saved to database  
**Pre-conditions:** Valid fact exists  
**Test Steps:**
1. Call `INSERT INTO comments (...) VALUES (...)`
2. Re-query to ensure comment was stored  
**Expected Result:** New row in `comments` table  
**Actual Result:** Entry visible in re-query  
**Status:** Pass  
**Post-conditions:** Fact now has a new comment in the thread

---

## Page-Level Database Access Summary

| Page         | Tables Used        | Access Methods Used                         |
|--------------|--------------------|---------------------------------------------|
| `index.html` | `continents`       | `getContinents()`                           |
| `window.html`| `facts`, `continents` | `getFactsByContinent(continentName)`      |
| `facts.html` | `facts`, `comments` | `getFactById(factId)`, `getCommentsByFactId(factId)`, `addComment(...)` |

---

