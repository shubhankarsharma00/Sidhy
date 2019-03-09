import datetime
import time
from flask import *
from config import *
import requests
import pygal
import sys
reload(sys)
sys.setdefaultencoding('utf8')
@app.route('/')
def dashboard():
    uri = "https://sidhy-33818.firebaseio.com/.json"
    try:
        uResponse = requests.get(uri)
    except requests.ConnectionError:
        return "Connection Error"  
    Jresponse = uResponse.text
    data = json.loads(Jresponse)

    confidence = data['confidence']# <-- The display name
    question = data['question']# <-- The reputation

    bar_chart = pygal.Bar(width=600, height=600,explicit_size=True, title="Confidence")
    
    imp_temps = list(confidence.values())	

    bar_chart.x_labels = sorted(list(confidence.keys()))
    bar_chart.add('Confidence', imp_temps)
    return render_template("index.html",bar_chart=bar_chart,questions=question)


@app.route('/delete_question/<int:ol>')
def delete_question():
    redirect(url_for("dashboard"))
