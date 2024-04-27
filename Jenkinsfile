pipeline{
  agent any
  stages{
    stage('build stage'){
	  steps{
	    sh "cd /new1/newjenkins/jenkins-april/spring-boot-hello-world"
		sh "mvn clean package"
	  }
	}
	stage('deploy'){
	  step{
	    sh "cd /new1/newjenkins/jenkins-april/spring-boot-hello-world/target"
		sh "java -jar spring-boot-hello-world"
	  }
	}
  }
}
