from flask import Flask
from sqlalchemy import create_engine, text
from flask import jsonify
from flask_cors import CORS
from row_to_json import row2json

app = Flask(__name__)
app.config.from_pyfile('config.py')

database = create_engine(app.config['DB_URL'], encoding='utf8')
app.database = database

CORS(app)


@app.route('/')
def get_areas():
    sql = text('SELECT ar.id, name, latitude, longitude, pred_infected, susceptible, infected, site_area, duration, '
               'vent_rate, scale,  DATE_FORMAT(MAX(im.history), "%Y년 %m월 %d일") AS date FROM areas AS ar JOIN images '
               'AS im WHERE ar.id = im.area_id AND im.is_svg = 0 GROUP BY ar.id')
    rows = app.database.execute(sql)
    return jsonify(row2json(rows))


@app.route('/area/<id>/images')
def get_images(id):
    sql = text('SELECT area_id, DATE_FORMAT(history, "%Y년 %m월 %d일") AS date, image FROM images WHERE '
               'area_id = :id AND is_svg = :bool ORDER BY history DESC')
    svg_image = app.database.execute(sql.params(id=id, bool=1))
    area_images = app.database.execute(sql.params(id=id, bool=0))
    return {'svg': svg_image.fetchone()['image'], 'images': row2json(area_images)}


if __name__ == '__main__':
    app.run(debug=True, host='127.0.0.1', port=5000)
