# Project Milestone 4: Web Page Design Specification

This document outlines the structure and interactive behavior of the web pages for the *Taste Together* project. The interface consists of three connected pages: a map-based homepage, a pop-up window for regional recipe listings, and a recipe detail view.

---

## 1. Page Title: Home Page (`index.html`)

### Description
The homepage displays an interactive world map with pins representing different regions or continents. Users can click a pin to open a pop-up window showing recipes from that region.

### Interaction
- Clicking a map pin opens `window.html?continent=Asia` (or similar) in a pop-up window or modal.
- Each pin corresponds to a continent or cuisine category.

### Data Needed
- Pin positions and metadata: `continent`, `lat`, `lng`, `label`
- Background map image or interactive map script

### Link Destinations
- `window.html?continent=ContinentName` (opens as a pop-up or new tab)

### Tests
- Map loads correctly with styled pins
- Pins are interactive and match correct regions
- On click, window.html opens with correct query string
- Page scales responsively (desktop/tablet/mobile)

---

## 2. Page Title: Regional Recipes Listing (`window.html`)

### Description
This page shows a list of recipes filtered by the clicked region (passed via URL). Recipes appear as cards and can be searched, filtered, and sorted.

### Parameters
- `continent`: required, e.g., `"Asia"`
- `search`: optional string filter
- `sort`: optional sort value, e.g., `"newest"`, `"rating"`

### Data Needed
- Recipes for region: `id`, `name`, `imageUrl`, `description`, `rating`, `tags`
- Sort/filter options (difficulty, cuisine, etc.)

### Link Destinations
- `recipe_detail.html?id=123` — on card click
- Back to `index.html`

### Tests
- Recipe cards show name, image, and short description
- Cards link to correct recipe detail pages
- Filters and sort options update results live
- Page reflects the selected continent in the heading
- Responsive layout for mobile and tablet
- Back button or link returns to `index.html`

---

## 3. Page Title: Recipe Detail Page (`recipe_detail.html`)

### Description
This page displays the complete recipe including title, image, ingredients, instructions, and a user comment/review section.

### Parameters
- `id`: required recipe ID

### Data Needed
- Recipe details: `name`, `imageUrl`, `description`, `prepTime`, `cookTime`, `ingredients[]`, `instructions[]`, `tags[]`
- Ratings: average rating
- Comments: array of `{ username, rating, commentText, date }`

### Link Destinations
- Back to `window.html?continent=...`

### Tests
- All recipe details are present and styled
- Comments section allows new comment with star rating
- Star rating component updates on click
- User can submit a comment (saved locally or sent to server)
- Page handles invalid or missing recipe ID gracefully
- “Back to Recipes” link works

---


