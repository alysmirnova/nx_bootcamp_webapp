pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                checkout([
                $class: 'GitSCM', 
                branches: [[name: '$BRANCH_NAME']], 
                extensions: [[$class: 'SubmoduleOption',
                 disableSubmodules: false, 
                 parentCredentials: false, 
                 recursiveSubmodules: true, 
                 reference: '', 
                 trackingSubmodules: false]], 
                 userRemoteConfigs: [[url: 'https://github.com/alysmirnova/nx_bootcamp_webapp.git']]])
                docker build -t nx_bootcamp_webapp .
            }
        }
        stage('Run') {
            steps {
                docker run --rm -p 80:80 nx_bootcamp_webapp
            }
        }
    }
}
