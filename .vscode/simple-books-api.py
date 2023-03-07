import requests
tw = requests.get('https://simple-books-api.glitch.me/books')
print(tw.json())
output = tw.json()