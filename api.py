from flask import Flask , request , jsonify
import pandas as pd
import os
import sec
app = Flask(__name__)
@app.route('/api',methods=['GET'])
def data():
    input = str(request.args['query'])
    df = pd.read_csv("corona.csv")
    df1 = pd.read_csv("vaccine.csv")
    return df[df["State/UTs"]==input].to_dict('list') 


if __name__ == "__main__":
    # sec.create_csv()
    app.run()