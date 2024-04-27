pipeline{
  agent any
  stages{
    stage('build stage'){
	  steps{
	    sh 'cd spring-boot-hello-world'
		sh 'uptime'
		sh 'mvn clean package'
	  }
	}
	stage('deploy'){
	  steps{
		sh 'java -jar spring-boot-hello-world/target/*.jar &'
	  }
	}
  }
}
