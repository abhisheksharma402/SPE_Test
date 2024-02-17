pipeline {

	agent any

	environment {
		DOCKER_IMAGE_NAME = 'my-java-app'
		GITHUB_REPO_URL = 'https://github.com/abhisheksharma402/SPE_Test.git'
	}

	stages {

		stage('Clone Project')
		{
			steps {

				script{
					git branch: 'main', url: "${GITHUB_REPO_URL}"
				}

			}
		}

		stage('Build Code')
		{
			steps {
				sh "javac SPE_Project.java"
			}
		}


		stage('Test Code')
		{
			steps {
				echo "Testing the code"
			}
		}

		stage('Building Docker Image')
		{
			steps {

				script {
					sh "docker build -t $DOCKER_IMAGE_NAME"
				}

			}
		}

		stage('Pushing Docker Image')
		{
			steps {

				script {

					docker.withRegistry('', 'dockerhub-credentials') {

						sh "docker image tag calculator abhisheksharma402/my-java-app:latest"
						sh "docker push abhisheksharma402/my-java-app:latest"

					}
				}

			}
		}

		stage('Run Ansible Playbook')
		{
			steps {

				script {

					ansiblePlaybook (

						playbook: 'playbook.yml',
						inventory: 'inventory'

					)
				}
			}
		}
	}
}
