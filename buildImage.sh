docker build -t vanillabrain/serverless-docker:$(cat VERSION) --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` --build-arg VCS_REF=`git rev-parse --short HEAD` --build-arg VERSION=`cat VERSION` .
docker image tag vanillabrain/serverless-docker:$(cat VERSION) vanillabrain/serverless-docker:latest
