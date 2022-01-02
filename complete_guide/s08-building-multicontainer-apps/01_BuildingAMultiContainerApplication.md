# Building a Multi-Container Application

## Single Container Deployment Issues

* The app was simple. No outside dependencies.
* Our image was built multiple times.
* How do we connect to a database from a container?

## Application Overview

* Fibonacci Sequence. Calculate the value at a particular index.
* User Interface to enter index to calculate Fibonacci number.
* Application will have some kind of persistence and calculate the correct value.

## Application Architecture

* Nginx will be our web server
  * React application
  * Express server for API
    * Redis
      * Worker
    * Postgres

Redis is an in-memory datastore.    
Postgres is a database.  
All of the values/indices is stored in Postgres.    
Calculated values have to come from Redis.  

How it will work:  
* User submits number
* Number gets stored into Postgres DB
* Number gets stored into Redis DB
  * When a new index gets added to Redis, 
    * the worker pulls the value out, 
    * calculates the value, 
    * and adds the result to redis.

## Worker Process Setup

Setting up a Worker process to pull an index and calculate the Fibonacci value for an index.

## Express API Setup

Setting up Express server.

## Connecting to Postgres

Continuing setting up Express to connect to Postgres.

## More Express API Setup

More setup in server/index.js for client.

## Generating the React App

`npx create-react-app client`

## Fetching Data in the React App

Setting up Fib Calculator and Dummy page in client.

## Rendering logic in the app

Setting up the UI in `Fib.js`.

## Routing in the React App

Set up routing for React pages in `App.js`.
