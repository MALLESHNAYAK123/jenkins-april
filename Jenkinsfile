pipeline{
  agent any
  stages{
    stage('build stage'){
	  steps{
	    sh 'cd /var/lib/jenkins/workspace/pipelinedeploy/spring-boot-hello-world'
		sh 'uptime'
		sh 'pwd'
		sh 'mvn clean package'
	  }
	}
	stage('deploy'){
	  steps{
		sh 'java -jar target/*.jar &'
	  }
	}
  }
}
