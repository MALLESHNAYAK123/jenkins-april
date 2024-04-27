pipeline{
  agent any
  stages{
    stage('build stage'){
	  steps{
	    sh "cd spring-boot-hello-world"
		sh "mvn clean package"
	  }
	}
	stage('deploy'){
	  steps{
		sh "java -jar ./target/*.jar &"
	  }
	}
  }
}
