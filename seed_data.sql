-- Continents
INSERT INTO continents (name, lat, lng, label) VALUES
('Europe', 48.8566, 2.3522, 'Europe'),
('Africa', -1.9577, 30.1127, 'Africa'),
('Asia', 35.6895, 139.6917, 'Asia'),
('Middle East', 24.7136, 46.6753, 'Middle East'),
('Oceania', -40.9006, 174.8860, 'Oceania'),
('North America', 56.1304, -106.3468, 'North America'),
('South America', -14.2350, -51.9253, 'South America');

-- Facts
INSERT INTO facts (continent_id, name, imageUrl, description, rating) VALUES
(1, 'French fries were invented in Belgium', '/static/images/fact1.jpg', 'Despite their name, French fries were invented in Belgium, not France. They’re typically eaten with mayonnaise.', 4.8),
(2, 'Ostrich eggs feed 10 people', '/static/images/fact2.jpg', 'In some African cultures, one ostrich egg is large enough to feed up to 10 people due to its size.', 4.6),
(3, 'Kimchi fermented underground', '/static/images/fact3.jpg', 'Traditional Korean kimchi is stored in clay pots and buried underground to ferment for months.', 4.9),
(4, 'Snow in Sahara', '/static/images/fact4.jpg', 'Snow fell in the Sahara Desert in 2018, a rare weather event that lasted only a few hours.', 4.4),
(5, 'Kiwi is a bird', '/static/images/fact5.jpg', 'New Zealand’s national animal is the kiwi, a small flightless bird, not the fruit.', 4.7),
(6, 'Canadians tap maple trees', '/static/images/fact6.jpg', 'Maple syrup is made by tapping sugar maple trees, a traditional Canadian practice.', 4.5),
(7, 'Llamas roam Andean cities', '/static/images/fact7.jpg', 'In many Andean cities in South America, it’s common to see llamas walking the streets.', 4.6);
