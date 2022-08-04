export GOOS=linux
export GOARCH=amd64
export CGO_ENABLED=0
.DEFAULT_GOAL := deploy

deploy:
	go build -o hello
	zip -r function.zip hello
	aws lambda update-function-code --function-name "keys" --zip-file fileb://function.zip --region="us-east-2"  