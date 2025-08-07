from flask import Flask, render_template, jsonify, request
import sqlite3

app = Flask(__name__)

def get_db_connection():
    conn = sqlite3.connect('cultural_facts.db')
    conn.row_factory = sqlite3.Row
    return conn

# Home page
@app.route('/')
def index():
    return render_template('index.html')

# Region facts view
@app.route('/facts/<region>')
def facts(region):
    return render_template('window.html', region=region)

# Detail fact view
@app.route('/fact/<int:fact_id>')
def fact_detail(fact_id):
    return render_template('fact.html', fact_id=fact_id)

# === API ROUTES ===

@app.route('/api/continents')
def get_continents():
    conn = get_db_connection()
    continents = conn.execute('SELECT * FROM continents').fetchall()
    conn.close()
    return jsonify([dict(row) for row in continents])

@app.route('/api/facts/<region>')
def get_facts_by_region(region):
    conn = get_db_connection()
    query = '''
        SELECT facts.* FROM facts
        JOIN continents ON facts.continent_id = continents.id
        WHERE continents.name = ?
    '''
    facts = conn.execute(query, (region,)).fetchall()
    conn.close()
    return jsonify([dict(row) for row in facts])

@app.route('/api/fact/<int:fact_id>')
def get_fact_by_id(fact_id):
    conn = get_db_connection()
    fact = conn.execute('SELECT * FROM facts WHERE id = ?', (fact_id,)).fetchone()
    conn.close()
    return jsonify(dict(fact))

@app.route('/api/comments/<int:fact_id>')
def get_comments_by_fact(fact_id):
    conn = get_db_connection()
    comments = conn.execute(
        'SELECT username, commentText, date, rating FROM comments WHERE fact_id = ? ORDER BY date DESC',
        (fact_id,)
    ).fetchall()
    conn.close()
    return jsonify([dict(row) for row in comments])

@app.route('/api/comments/add', methods=['POST'])
def add_comment():
    data = request.get_json()
    fact_id = data.get('fact_id')
    username = data.get('username')
    comment = data.get('commentText')
    rating = data.get('rating')
    
    conn = get_db_connection()
    conn.execute(
        'INSERT INTO comments (fact_id, username, commentText, rating) VALUES (?, ?, ?, ?)',
        (fact_id, username, comment, rating)
    )
    conn.commit()
    conn.close()
    return jsonify({'message': 'Comment added successfully'}), 201

if __name__ == '__main__':
    app.run(debug=True)
