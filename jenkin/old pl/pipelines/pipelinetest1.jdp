pipeline {
    agent any 
    stages {
        stage('Pull') { 
            steps {
                git branch: 'main', credentialsId: 'git-test', url: 'https://github.com/hirajendra2999/devtest.git'
            }
        }
        stage('Build') { 
            steps {
                sh 'echo "Build successefull"'
            }    
        }
        stage('Test') { 
            steps {
                echo 'Test Success!'
            }    
        }
        stage('Deploy') { 
            steps {
                sh 'echo "Deploy successefull"'
            }    
        }
    }
}    