pipeline {
    agent {
        docker {
            image 'maven:3-alpine'
            args '-v /root/.m2:/root/.m2'
        }
    }
    environment {
        PCF_CREDS = credentials('pcfcreds')
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean package -Dmaven.test.skip=true'
            }
        }
        stage('Deploy'){
            agent any
            steps {
               sh 'cf login -u $PCF_CREDS_USR -p $PCF_CREDS_PSW -a api.system.pcf-full.bvader.net -o elastic-demo-org -s demo-space-sandbox'
               sh 'cf push'
            }
        }
    }
}



pipeline {
    agent any
    environment {
        PCF_CREDS     = credentials('pcfcreds')
    }
    stages {
        stage('Build') {
            agent {
            docker {
                image 'maven:3-alpine'
                args '-v /root/.m2:/root/.m2'
             }
            }
            steps {
               // sh 'git clone https://github.com/bvader/spring-petclinic/'
               dir("/home/workspace/repos/bvader/spring-petclinic/") {
               sh "pwd"
               sh 'mvn clean package -Dmaven.test.skip=true'
              }
            }
        }
        stage('Deploy') {
            steps {
                dir("spring-petclinic") {
                sh 'cf login -u $PCF_CREDS_USR -p $PCF_CREDS_PSW -a api.system.pcf-full.bvader.net -o elastic-demo-org -s demo-space-sandbox'
                sh 'cf push'

                }
            }
        }
    }
}
