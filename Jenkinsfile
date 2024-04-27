pipeline{
  agent any
  stages{
	stage('git checkout'){
	  steps{
		git 'https://github.com/MALLESHNAYAK123/jenkins-april.git' 
	  }
	  }
    stage('build stage'){
	  steps{
		sh 'uptime'
		sh 'pwd'
	  }
	  }
	stage('build stage-01'){
	  steps{
		scripts{
			dir('spring-boot-hello-world'){
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
