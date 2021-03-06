pipeline {
	agent {
		label "Slave-Ansible"
	}
	environment {
        props = readYaml file: 'project.yaml'
		username = "${props.username}"
		password = "${props.password}"
		scriptsRepoUrl = "${props.scriptsRepo}"
		mvnGoals = "${props.mavenGoals}"
    }
    stages {
	    stage('SCM Checkout') {
			steps {	
			  logInfo(" SCM Checkout Started !!!")		
			  cleanWs notFailBuild: true
			  checkout scm
			  checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'ansibleScripts']], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'Git_Cred', url: "$scriptsRepoUrl"]] ])
   	  		  logInfo(" Complete - SCM Checkout !!!")
			}
		}
		stage('Build'){
			 steps {
				sh '''
				    echo -e " Executing in host : "`hostname`
					/opt/maven/bin/mvn --version
					/opt/maven/bin/mvn -f pom.xml $mvnGoals
				'''
			 }
		}
		stage('Provision VM & Deploy'){
			 steps {
				sh '''
				    chmod -R 777 ${WORKSPACE}/ansibleScripts
					cd ${WORKSPACE}/ansibleScripts
					VERSION_BUILT="1.0.2.${BUILD_NUMBER}"
					echo "$VERSION_BUILT" > app_version.txt
					echo "jenkins" | sudo -S -H -u ansibleusr bash -c 'bash executePlaybook.sh'
				'''
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