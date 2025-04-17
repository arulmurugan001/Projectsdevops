pipeline {
     agent any
    environment {
        TOMCAT_USER = 'admin'
        TOMCAT_PASS = 'admin123'
        TOMCAT_URL = 'http://13.57.37.189:9090/'
    }

    tools {
        maven 'Maven' // Use your Maven name from Jenkins config
    }

    stages {
        stage('Clone Repo') {
            steps {
                git credentialsId: 'github-creds',
                    url: 'https://github.com/arulmurugan001/jenkinstest.git',
                    branch: 'main'
            }
        }

        stage('Build WAR') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Deploy WAR to Tomcat') {
            steps {
                deploy adapters: [tomcat9(credentialsId: 'git_busaaaa', path: '', url: 'http://13.57.37.189:9090/')], contextPath: 'meaning&job', war: '**/*.war'
            }										
        }
    }
}
