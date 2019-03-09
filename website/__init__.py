from app import app
from config import *

db.create_all()

if __name__ == '__main__':
    app.debug = True    
    app.jinja_env.auto_reload = True
    app.run('127.0.0.1',5000)
