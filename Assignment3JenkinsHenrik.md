# Assignment 3 Jenkins/Pipeline

## Description of pipeline

There are two pipelines setup for the project. Both branches are setup as scripted pipelines. They pull a Jenkinsfile from the repository. They both poll every minute. 

1. ca-project-lauritsen - Running build and test on any ready branch.

   * Runs each time a new ready branch is pushed to origin or a change is detected on one of the ready branches.
   *  There are 3 stages:
      * Preparations - pulls the code from the repo, also stashes `run.py`
      * test - runs the `tests.py` on another node (ubuntu-test)
      * Publish - archives the artifacts and triggers the pretested integration plugin
   * When the pretested integration plugin is triggered it tries to merge the change into master. If it is possible to do a fast forward merge it does it and deletes the ready branch. If it isn't possible the pipeline fails.

2. ca-project-master-lauritsen - Running deploy on master branch
   * When the pretested integration plugin merges new code into the master branch this pipeline is triggered.
   * The pipeline has two stages:
      * preparations - pulls the code from the repo
      * runs `docker-compose up -d` which deploys the code so it is available at port 5000 on the server.

This setup enables the developers to get fast feedback from pipeline #1 and also the code to be deployed with to the server with pipeline #2 (CI/CD). Off course this is simulated to show the possibilities as this project 

## Problems during development
There we're some problems getting the docker containers to behave. This was mainly due to this being a learning experience.

I pushed my image to dockerhub early on, but decided to change the name so it didn't have the same name locally and on docker hub. This wasn't a problem until I deleted the image on the server. Then the server needed to pull the image from docker hub, but wasn't able to as the name wasn't there. I renamed, so the naming made sense and was aligned on docker hub and in the code.

When starting to use another node on another server there was a problem with the ports. I used port 5000, but that port was already in use on the other server. I figured I didn't need the port to run the tests script, so decided to run the tests on the other node. 

## What to do next?

1. Build the docker image in the pipeline and push it to dockerhub
2. Optimize docker image build
3. Use the stash/unstash in a more meaningful way
4. Maybe not poll every minute - could be interesting to look in to using webhooks instead.