# Deploying Docker Containers

## Introduction

- Deployment Overview and General Process
- Deployment Scenarios, Examples, and Problems

## From Development to Container

- Containers are standardized unit of software
- We want to have the exact same environment for development and production

### Things to watch out for

- Bind Mounts shouldn't be used in production!
- Containerized apps might need a build step (e.g. React apps)
- Multi-container projects might need to be split across multiple hosts / remote machines
- Trade-offs between control and responsibility might be worth it!
