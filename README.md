# Docker Containers in Azure
How to containerise and deploy an ASP.Net web app to Azure!

## Prerequisites
- Install Docker Desktop
- Install VSCode
- Install the .Net 6 SDK

## From Azure
- Create a new resource group 
- Create a new container instance inside that resource group
- Create a new container registry (this is where you will push/save your Docker image of the ASP.Net web app to)

## From VSCode
- Install the Azure extension
- Connect to your Azure account
- Install the Docker extension
- In the Docker extension bit
    - you should see all the Docker images and containers you currently have on your machine in a list
    - you should also see a part for Azure which shows the container registry you've just made

## Create a Dockerfile
- Ensure you are pulling the Docker images for ASP.Net _and_ the .Net SDK for the version of .Net you're using. In this case, .Net 6
- If you don't include the image for the .Net SDK, you will get errors at the `dotnet restore` or other .Net CLI command steps in the Dockerfile because it needs to have .Net installed in the Docker environment in order to run the CLI commands

## Build your Docker image from the Dockerfile and push to your Azure container registry
- Open a VSCode integrated Terminal and show the 'Output' tab
- Right click on the Dockerfile in VSCode and among the options you'll see 'Build image in Azure'
- Click on that and, in the prompt at the top of the screen ('Tag image as...'), select the name matching your project.
- Then in the next prompt for a container registy for it to live in, select the container registry you made earlier in Azure
- The Output tab of the VSCode Terminal will show:
    - Docker building the container image from your instructions in the Dockerfile
    - Docker pushing the newly built image to your specified Azure container registry

## Deploy your ASP.Net app to a container instance from the pushed container image
- In Azure, create a new resource > Containers > Container Instances
- Azure container registry
- Select the container registry you made earlier
- It should autopopulate the next bit with the container image you've just pushed to the registry
- Make sure u got da free plan :money:
- Create! Now you can navigate to the url of the newly created resource and your ASP.Net app is out there :rocket:
