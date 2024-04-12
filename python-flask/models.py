from flask_sqlalchemy import SQLAlchemy
       
db = SQLAlchemy()
       
class Products(db.Model):
    __tablename__ = "products"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(150), index=True)
    image = db.Column(db.String(150), index=True)
    price = db.Column(db.Integer,default=0)