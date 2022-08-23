import requests
import json
import sys
import time


def call_api(url, token):
	headers = {'Authorization' : 'Bearer ' + token}
	print(headers)
	print(url)
	#response = requests.get(url, headers=headers)
	response = requests.request("GET", url, headers=headers)
	print(response.json())
	return response

def delete_user(account_id, token):
	# print(account_id)
	# account_id = account_id[0]
	url = 'https://api.dev.codeus.ai/api/accounts/'+account_id+'/delete'
	headers = {'Authorization': 'Bearer ' + token , 'Content-Type':'application/json'}
	print(headers)
	print(url)
	payload = {"delay":"00.00:05:00"}
	payload = json.dumps(payload)
	print("payload********************",payload)
	response = requests.post( url, headers=headers, data=payload)
	print(response.json())
	return response

def remove_delete_user_queue(account_id, token):
	# print(account_id)
	# account_id = account_id[0]
	url = 'https://api.dev.codeus.ai/api/accounts/' + account_id + '/delete'
	headers = {'Authorization': 'Bearer ' + token, 'Content-Type': 'application/json'}
	response = requests.delete(url, headers=headers)
	print(response.json())
	return response

def set_val(data):
	print(data)
	val = data[0]
	return val

def get_token(json):
	token = json["id_token"]
