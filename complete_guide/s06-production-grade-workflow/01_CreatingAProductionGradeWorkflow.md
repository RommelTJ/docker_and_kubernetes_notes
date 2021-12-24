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
