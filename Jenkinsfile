pipeline {
    agent any

    stages 
    {
        
        stage('clone github') 
        {
            steps 
            {
                sh 'rm -Rf linktoworld'
                echo 'cloning github'
                sh 'git clone https://github.com/pursottam1234/linktoworld.git'
                sh 'ls -ltr linktoworld'
            }
        }
        
        stage('create docker image') 
        {
            steps 
            {
                echo 'creating docker image'
		sh 'cd linktoworld && docker build -t papache .'
            }
        }
	

	 stage('push docker image') 
        {
            steps 
            {
                echo 'pushing docker image'
            }
        }
        
    }
}