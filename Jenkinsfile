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
			dir('web-thymeleaf'){
				sh 'pwd'
				sh 'mvn clean package'
			}
			}
			}
			}
	stage('deploy'){
	  steps{
		script{
                withEnv(['BUILD_ID=dontkill']) {
		sh '''cd /var/lib/jenkins/workspace/pipeline1/spring-boot-hello-world/target/ && java -jar spring-boot-hello-world-1.0.jar --server.port=8081 & > spring-boot.log 2>&1 & '''
	  }
	}
  }
}
}
}
