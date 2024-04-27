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
		script{
			dir('spring-boot-hello-world'){
				sh 'pwd'
				sh 'mvn clean package'
			}
			}
			}
			}
	stage('deploy'){
	  steps{
		sh 'java -jar spring-boot-hello-world/target/spring-boot-hello-world-1.0.jar --server.port=8081 &'
	  }
	}
  }
}
