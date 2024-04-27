ipeline{
  agent any
  stages{
    stage('build stage'){
	  steps{
	    sh "cd /new1/spring-boot-hello-world"
		sh "mvn clean package"
	  }
	}
	stage('deploy'){
	  steps{
	    sh "cd spring-boot-hello-world/target"
		sh "java -jar spring-boot-hello-world &"
	  }
	}
  }
}
