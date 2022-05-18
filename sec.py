from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import requests  
import pandas as pd 
import numpy as  np 
from bs4 import BeautifulSoup 
def create_csv():
    driver_path = "/home/ishu/pro/scrap/chromedriver"
    b_obj = webdriver.Chrome(driver_path)
    b_obj.implicitly_wait(15000)
    b_obj.maximize_window()
    b_obj.get('https://www.mygov.in/covid-19/')

    soup = BeautifulSoup(b_obj.page_source , 'lxml')
    jobs = soup.findAll("table")
    # enter the head ::
    # print(len(jobs))
    data = [] 
    i =0 
    for job in jobs : 

        # the text file to the add the data 
        file = open('data'+str(i)+'.txt' , 'w')
        head = job.find("thead")
        body = job.find("tbody")
        # print(body)
        r=""
        main = []
        head_rows = head.findAll("tr")
        for row in head_rows : 
            cols = row.findAll('th')
            for col in cols: 
                r ='"'+col.text+'"'+","
                file.write(r)
            file.write('\n')
        r = ""
        rows = body.findAll("tr")
        # print(rows)
        for row in rows : 
            cols = row.findAll('td')
            for col in cols: 
                k = col.text 
                j=""
                if col.find('span'):
                 j = col.find('span').text
                 print(j)
                output = k.replace(j,"")
                r ='"'+output+'"'+","
                file.write(r)
            file.write('\n')
        i=i+1   
    b_obj.quit()

    import pandas as pd
    df = pd.read_csv("data0.txt",delimiter=',', index_col=False)
    df.to_csv('vaccine.csv')
    df = pd.read_csv('vaccine.csv')
    df = df.drop({"Unnamed: 0","Unnamed: 5"},axis=1)
    df.to_csv('vaccine.csv')
    df = pd.read_csv("data1.txt",delimiter=',',index_col=False)
    df.to_csv('corona.csv')
    df = pd.read_csv('corona.csv')
    df = df.drop({"Unnamed: 0","Unnamed: 8"},axis=1)
    df.to_csv('corona.csv')
    df.head()

if __name__ == "__main__":
    create_csv()