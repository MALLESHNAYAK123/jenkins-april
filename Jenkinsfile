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
		sh 'nohup java -jar /var/lib/jenkins/workspace/pipelinedeploy/spring-boot-hello-world/target/spring-boot-hello-world-1.0.jar --server.port=8081 > /dev/null 2>&1 &'
		sleep time: 20,
		      unit: 'SECONDS'
		sh 'ss -ntulp'
		sh 'ps'
		sh 'pwd'
	  }
	}
  }
}
