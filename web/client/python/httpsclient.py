import http.client
import json
import ssl

# Defining certificate related stuff and host of endpoint
certificate_file = 'a_certificate_file.pem'
certificate_secret= 'your_certificate_secret'
host = 'mozilla.org'

# Defining parts of the HTTP request
request_url='https://www.mozilla.org/fr/'
request_headers = {
    'Content-Type': 'application/json'
}
request_body_dict={
    'Temperature': 38,
    'Humidity': 80
}

# Define the client certificate settings for https connection
context = ssl.SSLContext(ssl.PROTOCOL_SSLv23)
context.load_cert_chain(certfile=certificate_file, password=certificate_secret)

# Create a connection to submit HTTP requests
connection = http.client.HTTPSConnection(host, port=443, context=context)

# Use connection to submit a HTTP POST request
connection.request(method="POST", url=request_url, headers=request_headers, body=json.dumps(request_body_dict))

# Print the HTTP response from the IOT service endpoint
response = connection.getresponse()
print(response.status, response.reason)
data = response.read()
print(data)
