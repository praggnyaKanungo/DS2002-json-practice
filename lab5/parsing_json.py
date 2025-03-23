#Praggnya Kanungo
#ufx9hn
#parsing json with python

#imports
import json
import pandas as pd

#here i am loading the json data 
with open('../data/schacon.repos.json', 'r') as fileHere:
    dataFromJson = json.load(fileHere)

#making a DataFrame
df = pd.DataFrame(dataFromJson)

#getting the colunms i want
df = df[['name', 'html_url', 'updated_at', 'visibility']]

#output to csv files
df.head(5).to_csv('chacon.csv', index=False, header=False)

#For the sake of me, I was printing to make sure it was righ
#then commented it out
#print(df.head(5))


