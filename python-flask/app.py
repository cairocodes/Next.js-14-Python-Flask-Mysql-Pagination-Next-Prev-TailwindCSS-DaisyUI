from flask import Flask, request, jsonify
from flask_cors import CORS, cross_origin #ModuleNotFoundError: No module named 'flask_cors' = pip install Flask-Cors
   
from models import db, Products

app = Flask(__name__)
   
app.config['SECRET_KEY'] = 'cairocoders-ednalan'
#app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///flaskdb.db'
# Databse configuration mysql                             Username:password@hostname/databasename
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:root@localhost:8889/nextjsdb'
   
SQLALCHEMY_TRACK_MODIFICATIONS = False
SQLALCHEMY_ECHO = True
   
CORS(app, supports_credentials=True)
   
db.init_app(app)
      
with app.app_context():
    db.create_all()
   
@app.route("/")
def hello_world():
    return "Hello, World!"
   
@app.route('/products/<int:page>/<int:per_page>', methods=['GET']) #http://127.0.0.1:5000/products/1/4
def products(page=1, per_page=3):
    
    nextpage = page + 1
    prevpage = page - 1
         
    total = Products.query.count()
     
    productdata = Products.query.order_by(Products.id.asc())  
    products = productdata.paginate(page=page, per_page=per_page)
     
    #print(products.next_num)
    #print(products.prev_num)
     
    nextnumber = products.next_num
    if nextnumber == None:
        next_page_url = ""
    else:
        next_page_url = f"http://127.0.0.1:5000/products/{nextpage}/{per_page}"
        
    prev_number = products.prev_num
    if prev_number == None:
        prev_page = ""
    else:
        prev_page = f"http://127.0.0.1:5000/products/{prevpage}/{per_page}"
         
    return jsonify({
        'total': total,
        'next_page_url': next_page_url,
        'prev_page_url': prev_page,
        'results': [{
            'id': rs.id,
            'name': rs.name,
            'image': rs.image,
            'price': rs.price
        } for rs in products.items]
    })
   
if __name__ == "__main__":
    app.run(debug=True)