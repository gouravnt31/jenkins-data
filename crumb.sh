crumb=$(curl -u "build-user:Password@2" -s 'http://jenkins.local:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')
#curl -u "build-user:Password@2" -H "$crumb" -X POST http://jenkins.local:8080/job/ENV/build?delay=0sec
curl -u "build-user:Password@2" -H "$crumb" -X POST  jenkins.local:8080/job/jenkins-user-db/buildWithParameters?AGE=$1
