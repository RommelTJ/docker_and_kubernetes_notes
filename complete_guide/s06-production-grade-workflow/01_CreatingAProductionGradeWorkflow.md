# Creating a Production-Grade Workflow

## Development Workflow

Walking through how to publish an app using Docker.

Flow:
* Development
* Testing
* Deployment

## Flow Specifics

Development Workflow:  
* Create a GitHub repository with a `main` and `feature` branch.
* We work on the `feature` branch.
* `master` changes will be automatically deployed.
* We pull and push code into `feature` branch. Then create a pull request to merge into `main`.
* When the pull request is created: 
  * Travis CI workflow will pull down code and run tests.
* When the pull request is merged:  
  * Travis CI workflow will pull down code and run tests.
  * If tests pass, push to AWS Hosting.

## Docker's Purpose

* Docker is a tool in a normal development flow.
* Docker makes some of these tasks a lot easier.

## Project Generation

We're going to make a simple React frontend and then containerize it.

## Create React App Generation

```
npm cache clean -f
npm install -g n
sudo n stable
npx create-react-app frontend
```

## Necessary Commands

```
npm run start // Starts a development server.
npm run test // Runs tests associated with the project
npm run build // Builds a production version of the application
```

## Creating the Dev Dockerfile

See `Dockerfile.dev`.

```
docker build -f Dockerfile.dev -t rommelrico/frontend .
docker run rommelrico/frontend
```

## Duplicating Dependencies

* Create-react-app automatically installed dependencies.   
* At present we have dependencies from create-react-app and from running `npm install`
* We delete the folder from our filesystem
* `docker build -f Dockerfile.dev -t rommelrico/frontend .`
* `docker run rommelrico/frontend`

## Starting the Container

```
docker run -it -p 3000:3000 rommelrico/frontend 
```

## Docker Volumes

We need automatic restarts on running container. For that, we need volumes.  
Instead of copying the "src" folder into the container, we add a reference to a volume on our machine.  

```
docker run -it -p 3000:3000 -v /app/node_modules -v ${pwd}:/app rommelrico/frontend
```

* pwd = present working directory

## Bookmarking Volumes

* The binding for the /app volume does not include the `node_modules` folder.
* Thus, `node_modules` inside the container gets cleared out/overwritten.
* The reason is the `node_modules` reference in our container maps to nothing in our local machine.
* The fix is to add `-v /app/node_modules`.
* The colon syntax says to map from a folder inside the container to a folder outside the container.
* The syntax without a colon says to use it as a placeholder and don't try to map it to an outside container.

```
docker run -it -p 3000:3000 -v /app/node_modules -v $(pwd):/app rommelrico/frontend
```

## Shorthand with Docker Compose

* See `docker-compose.yml`
* Notice the volume "." shorthand instead of $(pwd)

```
docker-compose up
```

## Overriding Dockerfile selection

* See `docker-compose.yml`

```
docker-compose up
```

## Do we need copy?

* Since we added a volume mount, do we still need the copy?
* Technically we could remove the `COPY . .`
* But we might choose to leave it in because,
  * Maybe we no longer want to use docker-compose.yml
  * Maybe we want a production setup.
  * Even though it's not strictly required, it could serve as a reminder.

## Executing Tests

* Build container: `docker build -f Dockerfile.dev -t rommelrico/frontend .`
* Run tests: `docker run -it rommelrico/frontend npm run test`

## Live Updating Tests

Tests don't automatically update because volume is not set up.

Another approach is to attach to the existing container.

To live update tests:  
* `docker-compose up`
* `docker ps`
* `docker exec -it b5fe0f168fe2 npm run test`

## Docker Compose for Running Tests

Another approach to test using docker compose is as follows:  
* Edit `docker-compose.yml` and add a new service.
* `docker-compose up --build`
* Downside to this approach is that we get all the output into one terminal and we can't use the terminal.

## Shortcomings on Testing

Attaching to a process via another terminal window:  
* `docker ps`
* `docker attach 272c9d4a01b7`
* Unfortunately, it doesn't work.
  * Docker Compose will not allow you to enter terminal input.

```
docker exec -it 272c9d4a01b7 sh
```

The reason it doesn't work is because npm will start a second process to run the tests.

## Need for Nginx

`npm run build` requires nginx to create a production web container.   
Nginx is required to serve the index.html and main.js files.  

## Multi-Step Docker Builds

* Generate Dockerfile.prod
* Dependencies only need to execute during `npm run build`.
* We need to install nginx before we can start nginx, obviously.
* We will solve this in two phases:
  * Build phase: Build up to `npm run build`.
  * Run phase: Use nginx, copy results of npm run build, and start nginx.

## Implementing Multi-Step Builds

See `Dockerfile.prod`.
