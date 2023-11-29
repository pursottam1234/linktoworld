pipeline 
{
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
		sh 'docker image tag papache pursottam69bhandari/papache:v1'
            }
        }

	stage('push docker image to dockerhub') 
        {
            steps 
            {
                echo 'creating docker image'
		sh ' sudo docker login -u=pursottam69bhandari -p=purush.bhandari69@ && sudo docker push pursottam69bhandari/papache:v1'
            }
        }

	stage('create kubernetes deployement') 
        {
            steps 
            {
                echo 'creating deployement'
		sh 'chmod 600 jmtksrv01.pem'
		sh 'scp -i jmtksrv01.pem -o StrictHostKeyChecking=no papache.yml ec2-user@13.232.242.187:/home/ec2-user/ && kubectl apply -f 		papache.yml'
            }
        }
        
    }
}


