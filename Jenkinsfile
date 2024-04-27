pipeline{
  agent any
  stages{
    stage('build stage'){
	  steps{
		sh 'uptime'
		sh 'pwd'
	  }
	  }
	stage('build stage-01'){
	  steps{
		scripts{
			dir('/var/lib/jenkins/workspace/pipelinedeploy/spring-boot-hello-world'){
				sh 'pwd'
				sh 'mvn clean package'
			}
			}
			}
			}
	stage('deploy'){
	  steps{
		sh 'java -jar spring-boot-hello-world/target/*.jar &'
	  }
	}
  }
}
