mkdir -p ./data/serverless-docker
docker run -d --name serverless-docker -p 8080:8080 -p 50000:50000 -v ./data/jenkins-flutter-android:/var/jenkins_home vanillabrain/jenkins-flutter-android:1.0 .
