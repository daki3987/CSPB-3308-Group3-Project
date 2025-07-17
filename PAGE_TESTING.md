# Project Milestone 4: Web Page Design Specification

The homepage features an interactive world map with clickable pins representing different continents or cultural regions. Clicking a pin opens a secondary view showing region-specific facts.

---

## 1. Page Title: Home Page (`index.html`)

### Description
The homepage displays an interactive world map with pins representing different regions or continents. Users can click a pin to open a pop-up window showing facts from that region.

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

## 2. Regional Listing (window.html)

### Description
This page shows a list of fun facts filtered by the clicked region (passed via URL). Users can search, filter, or sort these cards.

### Parameters
- `continent`: required, e.g., `"Asia"`
- `search`: optional string filter
- `sort`: optional sort value, e.g., `"newest"`, `"rating"`(optional) 

### Data Needed
- Facts for region: `id`, `name`, `imageUrl`, `description`, `rating`(optional), `tags`

### Link Destinations
- `facts.html?id=123` — on card click
- Back to `index.html`

### Tests
- Cards show title and images (optional) 
- Cards link to correct facts pages
- Filters and sort options update results live
- Page reflects the selected continent in the heading
- Responsive layout for mobile and tablet
- Back button or link returns to `index.html`

---

## 3. Page Title: Facts Page (`facts.html`)

### Description

Displays a detailed fun fact with tags, rating, and user comments.


### Parameters
- `id`: required fact ID

### Data Needed
- Fact details: `name`, `imageUrl`, `description`, `tags[]`
- Rating (optional) :  "rating"`
- Comments: array of `{ username, commentText, date }`

### Link Destinations
- Back to `window.html?continent=...`

### Tests
- All facts are present and styled
- Comments section allows new comment with star rating
- Star rating component updates on click
- User can submit a comment (saved locally or sent to server)
- Page handles invalid or missing fact ID gracefully
- “Back to map” or “Back to region” works

---


