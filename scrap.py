import requests  
import pandas as pd 
import numpy as  np 
from bs4 import BeautifulSoup 
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support.expected_conditions import presence_of_element_located
import time
import sys
url = "https://www.mygov.in/covid-19/"
chrome_driver_path = "/home/ishu/pro/scrap/chromedriver"
chrome_options = Options()
chrome_options.add_argument('--headless')
webdriver = webdriver.Chrome(
  executable_path=chrome_driver_path, chrome_options=chrome_options
)
webdriver.implicitly_wait(5)
webdriver.get(url)
webdriver.close()
# html_text = requests.get("https://www.mygov.in/covid-19/").text
# binary = FirefoxBinary("/home/ishu/pro/scrap/geckodriver")
# # binary = FirefoxBinary('path/to/installed firefox binary')
# fp = webdriver.FirefoxProfile()
# driver = webdriver.Firefox(firefox_binary=binary, firefox_profile=fp)
# driver.get("https://www.mygov.in/covid-19/")
# driver.implicitly_wait(5)
# soup = BeautifulSoup(driver.page_source , 'lxml')
# jobs = soup.find('div', id="statewise-data")
# # print(jobs)
# kk = soup.find("div", id="state record ac-boluc1")
# print(kk)
# # tabel = soup.find("thead")
# # print(tabel)
# # print(html_text)