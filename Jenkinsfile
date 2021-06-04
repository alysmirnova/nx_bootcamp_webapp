pipeline {
    agent any
    options {
        skipDefaultCheckout()
    }
    environment {
        TELEGRAM_BOT_TOKEN = '1864129924:AAG1KoYcYU8f5D1u6T-bgFqKYBzMMAe0Nj0'
        CHAT_ID = 317493608
    }
    stages {
        stage('Git') {
            steps {
                checkout([$class: 'GitSCM',
                    branches: [[name: '*/main']],
                    doGenerateSubmoduleConfigurations: false,
                    extensions: [[$class: 'SubmoduleOption',
                            disableSubmodules: false,
                            parentCredentials: false,
                            recursiveSubmodules: true,
                            reference: '',
                            trackingSubmodules: false]], 
                    submoduleCfg: [], 
                    userRemoteConfigs: [[url: 'https://github.com/alysmirnova/nx_bootcamp_webapp.git']]])
            }
        }
        stage('Build') {
            steps {
                sh 'docker build -t nx_bootcamp_webapp .'
            }
        }
    stage('Run and test') {
        parallel {
            stage('Run') {
                    steps {
                        sh 'docker run --rm -p 80:80 nx_bootcamp_webapp'
                    }
                }
            stage('Test') {
                    steps {
                        sh 'curl -Is http://192.168.44.10:80 | head -1'
                    }
                }
            }
        }
    }
    post {
        always {
                sh "curl -s -X POST https://api.telegram.org/bot\$TELEGRAM_BOT_TOKEN/sendMessage -d chat_id=\$CHAT_ID -d text=\"Webapp is ${currentBuild.currentResult}\""
            }
        }
}
