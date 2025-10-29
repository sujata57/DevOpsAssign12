# Simple Selenium script to test the login/register flow (example)
# Requires: selenium and a webdriver (e.g., chromedriver) available in PATH.
from selenium import webdriver
from selenium.webdriver.common.by import By
import time

driver = webdriver.Chrome()  # ensure chromedriver is installed
try:
    driver.get("http://localhost:8000/register/")
    time.sleep(1)
    driver.find_element(By.NAME, "username").send_keys("ITA700")
    driver.find_element(By.NAME, "password").send_keys("2022PE0000")
    driver.find_element(By.XPATH, "//button").click()
    time.sleep(1)
    driver.get("http://localhost:8000/login/")
    driver.find_element(By.NAME, "username").send_keys("ITA700")
    driver.find_element(By.NAME, "password").send_keys("2022PE0000")
    driver.find_element(By.XPATH, "//button").click()
    time.sleep(2)
    print("Test completed. Current URL:", driver.current_url)
finally:
    driver.quit()
