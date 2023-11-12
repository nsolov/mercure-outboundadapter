# mercure-outboundadapter

Server-Sent Events (SSE) is a server push technology enabling a client to receive automatic updates from a server via an HTTP connection. SSE is supported out of the box in all modern browsers.

Mercure is an open protocol designed from the ground up to publish updates from server to clients. Mercure is built on top Server-Sent Events. It is a modern and efficient alternative to timer-based polling and to WebSocket.

Mercure comes with an authorization mechanism and some additional features. Fro more details discover https://mercure.rocks/ 

Mercure Hub is a dedicated server that handles persistent SSE connections with the clients. This adapter publishes the updates to the hub, that will broadcast them to clients. 

## Installation
IPM installation

`zpm “install sse-mercure-outboundadapter” `

IPM Installation includes only adapter and doesn’t include the Demo.

## Running the demo

1. Clone github repo

```
git clone git@github.com:nsolov/mercure-outboundadapter.git
cd mercure-outboundadapter
```

2. Mercure Authorisation

Mercure uses JWT token for publishers and client authorization. 
In this Demo we need minimum settings  authorisation only for the publisher.

To create Token you can go to the JWT.io. 
Paste the following JSON in the payload section

```
{
 "mercure": {
   "publish": [
     "*"
   ]
 }
}
```

And change `your-256-bit-secret` with *your secret*. 

Copy generated token somewhere.

In docker-compose.yml replace the value for `MERCURE_PUBLISHER_JWT_KEY` with *your secret*! 
   
3. Create and start container

```
docker compose pull
docker compose up -d
```

4. Interoperability settings
Open Mercure.Demo.Production
For Mercure.Demo.Operation specify the following settings:
* Server: `mercure-outboundadapter-mercure-1` (Mercure Hub server)
* Port: `9000` (this port is specified for Mercure in docker-compose.yml)
* Path: `/.well-known/mercure` (Mercure endpoint)
* Token: *Place generated JWT token here*

Run Mercure.Demo.Production production

5. Open index.html from the HTML folder in your browser.

6. Using IRIS Interoperability testing service for Mercure.Demo.Operation send a text string.
You'll see this string immediately in your browser.
