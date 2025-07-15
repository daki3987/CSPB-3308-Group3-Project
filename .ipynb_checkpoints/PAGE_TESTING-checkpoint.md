# Project Milestone 4: Web Pages Design

This document outlines the design and testing considerations for the key web pages in the Recipe Handbook project. Each section includes a description, mockup, parameters, required data, link destinations, and test cases.

---

## 1. Page Title: Home Page (`index.html`)

### Description
The Home Page serves as the initial entry point for users, offering a welcoming interface. It includes a search bar, featured recipes, and categories to browse by cuisine or meal type.

### Mockup
# Project Milestone 4: Web Pages Design

This document outlines the design and testing considerations for the key web pages in the Recipe Handbook project. Each section includes a description, mockup, parameters, required data, link destinations, and test cases.

---

## 1. Page Title: Home Page (`index.html`)

### Description
The Home Page serves as the initial entry point for users, offering a welcoming interface. It includes a search bar, featured recipes, and categories to browse by cuisine or meal type.

### Mockup


### Parameters
- None (initial load)

### Data Needed
- List of featured recipes: ID, Name, Image URL, Description
- Categories: ID, Name, Image/Icon URL

### Link Destinations
- Recipes Listing Page (search submission)
- Recipe Detail Page (from featured recipe card)
- Recipes Listing Page (filtered by category)

### Tests
- Verify the "Recipe Handbook" logo and title are displayed
- Confirm the search bar is present with appropriate placeholder
- Check that the banner with encouraging text is visible
- Ensure at least 3 featured recipe cards are displayed
- Verify each recipe card has an image and name
- Confirm category links are labeled correctly
- Footer displays correctly with working links
- Responsive design on various screen sizes

---

## 2. Page Title: Recipes Listing Page (`recipes.html`)

### Description
This page displays a searchable, filterable, and sortable list of recipes. Recipes appear as cards with an image, name, and short description. Supports pagination.

### Mockup



### Parameters
- `searchTerm`: optional string from the search bar
- `categoryId`: optional category ID
- `filters`: optional object, e.g. `{ cuisine: 'Italian', difficulty: 'Easy' }`
- `sortBy`: optional string (e.g., "newest")
- `page`: optional current page number

### Data Needed
- List of recipes: recipeId, name, image URL, description, cuisine, difficulty, prep time
- Filter options
- Total number of recipes (for pagination)

### Link Destinations
- Home Page
- Recipe Detail Page
- Updated Recipes Listing Page (when filters/sorting/pagination applied)

### Tests
- Page title reflects search/category if present
- Filters and sort options are visible and usable
- At least 6 recipe cards are shown
- Cards show image, name, and description
- Clicking a card goes to the correct detail page
- Filters and sorting update recipe list
- Pagination works correctly

---

## 3. Page Title: Recipe Detail Page (`recipe_detail.html`)

### Description
Displays full details for a single recipe including image, ingredients, instructions, prep/cook times, and user reviews.

### Mockup



### Parameters
- `recipeId`: ID of the recipe to show

### Data Needed
- Name, image URL, prep time, cook time, servings
- ingredients (array), instructions (array)
- average rating
- comments (array with username, text, date)

### Link Destinations
- Recipes Listing Page
- Login/Register Page (if needed to comment)

### Tests
- Correct recipe name shown
- Image, times, and servings visible
- Ingredients shown in list
- Instructions shown in ordered steps
- Comments/reviews section appears
- Comment form is present
- "Back to Recipes" link works

---

## 4. Page Title: About Us Page

### Description
Shares the story, mission, team, and technologies of the Recipe Handbook project.

### Mockup
