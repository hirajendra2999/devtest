node {  
    stage('Pull') { 
        git credentialsId: 'github-git', url: 'https://github.com/hirajendra2999/rworld.git'     
    }
    stage('Test') { 
        echo "Test Complete"
    }
}