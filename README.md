# dentaku
## phases
First phase will be to create the infrastructure (Flask to host the application, Jenkins for CI/CD)


## How To Run

We first need to start our Jenkins container. Go to your Jenkins directory and execute the following

docker run -d --name jenkins \
  -p 8080:8080 -p 50000:50000 \
  -v jenkins_home:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --group-add 0 \
  my-jenkins-docker


If you need to rebuild the Jenkins docker image, execute first docker build -t my-jenkins-docker .

Once we have our Jenkins docker executed, we can run the pipeline from there.
