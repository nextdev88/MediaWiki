# MediaWiki

1. If wanted this setup in Ec2-instance (AWS), we can use the CFT to procure ec2 instance which will host  mediawiki & mariadb

Repo: https://github.com/nextdev88/MediaWiki
CLone URL: https://github.com/nextdev88/MediaWiki.git
Run CFT.json in AWS Stack

2. If wanted this setup containerized, use provided DockerFile to create image with above reqs
   cmd: docker build -t <nameofimage> <location of dockerfile>
   Push this image to any of the docker registry (dockerhub, quay, ACR, ECR)
 
3. K8s manifest for deployment & Expose to internet

   provided deployment & Service manifest files - which will pull the image and create pods with replicasets
   
   deployment: kubectl apply -f deployment.yml
   service: kubectl apply -f service.yml
   
4. If opted Containrized application - Application can be scaled depending on the replicasets that we define in the deployment manifest file.
5. If opted Ec2-instance, scalability can be achived with autoscaling groups




File Description:

https://github.com/nextdev88/MediaWiki

CFT.json --> responsible for creating Ec2-instance with mediawiki setup
Dockerfile --> responsible for creating containrized image of mediawiki
db.sql --> has sql changes
httpd.conf --> has required config changes
insatll.sh/mediawiki.sh --> has scriptlets responsible for setup of mediawiki applicaiton
deployment.yml/service.yml --> K8s manifest files for onboarindg app to K8s