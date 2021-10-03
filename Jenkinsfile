pipeline {
    agent { label 'python-web-server-node' }
    parameters {
string(name: 'VERSION', defaultValue: '1', description: '')
           gitParameter branchFilter: 'origin/(.*)', defaultValue: 'main', name: 'Branch', type: 'PT_BRANCH'
            }
    stages {
        stage("init") {
            steps {
                script {
                echo "init"
                git branch: "${params.Branch}", credentialsId: '66b0d7b0-eaad-4339-a3af-5505da29c569', url: 'https://github.com/exampleuser667/assignment.git'
                }
            }
        }
        stage("build") {
            steps {
                script {
                   echo 'build stage'
                    sh '''#!/bin/bash
                   ./build_app.sh ${BUILD_NUMBER}
                   '''
                }
            }
        }
        stage("deploy-staging") {
          
            steps {
                script {
                    echo 'deploy-staging'
                     sh '''#!/bin/bash
                    ./deploy_staging.sh ${BUILD_NUMBER}
                    '''
                }
            }
        }
        stage("test") {
            steps {
                script {
                    echo 'test'
                    sh '''#!/bin/bash
                  
                    ./test_cases.sh ${Heading}
                    '''
                }
            }
        }
       
        
        stage("deploy-prod") {
            steps {
                script {
                    sh '''#!/bin/bash
                    ./deploy_production.sh ${BUILD_NUMBER}
                    '''
                }
            }
        }
    }   
}
