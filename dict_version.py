from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import requests  
import pandas as pd 
import numpy as  np 
from bs4 import BeautifulSoup 
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
vaccine = []
main = []
for job in jobs : 
    if i ==2 : 
        break 
    # the text file to the add the data 
    file = open('data'+str(i)+'.txt' , 'w')
    head = job.find("thead")
    body = job.find("tbody")
    # print(body)
    r=[]
    dic = {}
    head_rows = head.findAll("tr")
    list_of_items = [ ]
    for row in head_rows : 
        cols = row.findAll('th')
        for col in cols: 
            list_of_items.append(col.text)
            dic[col.text]=" "
    r = []
    rows = body.findAll("tr")
    # print(rows)
    for row in rows : 
        j = 0 
        cols = row.findAll('td')
        for col in cols: 
            dic[list_of_items[j]] = col.text
            j=j+1
        if i==0:
            vaccine.append(dic)
        else: 
            main.append(dic)     
    i=i+1   
print(vaccine)
b_obj.quit()