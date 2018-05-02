pipeline {
	agent {
		label "Slave-Ansible"
	}
	environment {
        props = readYaml file: 'project.yaml'
		statFile = "/var/tmp/srangar1/hdp_deploy_stats.txt"
		env = "${props.env}"
		teamName = "${props.teamName}"
		artifactId = "${props.artifactId}"
		username = "${props.username}"
		password = "${props.password}"
    }
    stages {
	    stage('SCM Checkout') {
			steps {	
			  logInfo(" SCM Checkout Started !!!")		
			  cleanWs notFailBuild: true
			  checkout scm
			}
		}

    }
	post {
		always {
			logInfo("POST DEPLOYMENT ACTIVITIES STARTED!!!")
		}
		failure {
			logInfo("failure!!!")

        }
		success {
			logInfo("success!!!")

        }
	}
}

def logInfo(def infoMessage){
      println ("\n------------------------------------------------------------------------------------------")
      println (" [INFO] $infoMessage")
      println ("--------------------------------------------------------------------------------------------\n")	
}

def logError(def errorMessage){

      println ("\n------------------------------------------------------------------------------------------")
      println ("[ERROR] $errorMessage")
      println ("[ERROR] DEPLOYMENT FAILED !!!")
      println ("--------------------------------------------------------------------------------------------\n")	
	
}

def logWarning(def warningMessage){
      println ("\n------------------------------------------------------------------------------------------")
      println (" [INFO] $warningMessage")
      println ("--------------------------------------------------------------------------------------------\n")	
}