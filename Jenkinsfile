pipeline {
    agent any

    stages {
       
        stage('MVN BUILD') {
            steps {
                sh "mvn clean package"
            }
        }
        
         stage('DOCKER IMAGE') {
            steps {
                sh "docker build -t localhost:5000/employee-manager:v${env.BUILD_ID} ."
                sh "docker push localhost:5000/employee-manager:v${env.BUILD_ID}"                
            }
        }
        
          stage('SAVE BUILD ID') {
            steps {
                sh "echo 'v${env.BUILD_ID}' > build_id"
                sh "scp build_id vagrant@192.168.55.101:/home/vagrant/employee_manager_deploy"                
            }
        }
        
          stage('DEPLOY') {
            steps {
                sh "ssh vagrant@192.168.55.101 /home/vagrant/employee_manager_deploy/deploy.sh"               
            }
        }
            
        
    }
}
