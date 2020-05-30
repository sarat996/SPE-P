#!groovy
pipeline {
  agent any
  stages 
    {
    stage('Build docker images') {
      steps {
        sh 'docker build -t sarat996/spe-p .'
      }
    }
    stage('Test'){
      steps {
        sh 'python3 app.py' 
      }
    }
    stage('Docker Hub') {
      steps 
      {
        withDockerRegistry([credentialsId: 'DockerHub', url:""])
        {
          sh 'docker sarat996/spe-p:latest'
        }
      }
    }
    stage('Execute Rundeck job') {
      steps {
  script {
    step([$class: "RundeckNotifier",
          includeRundeckLogs: true,
          jobId: "f483d450-d091-457e-a3d6-78e727981eb6",
          rundeckInstance: "rundeck",
          shouldFailTheBuild: true,
          shouldWaitForRundeckJob: true,
          tags: "",
          tailLog: true])
  }
}
  } 
  }
}
