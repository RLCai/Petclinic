         Structure of the Github Repositary
 

Petclinic website is to maintain the Pets , Pet Owners information, Pet treatments information and Pets Visit Information.
Pet clinic Project Repository contains  Angular And Rest project. Angular Project is to run the Front end of the application and Rest project contains the backend service programs  can be execute using Rest API. Test folder contains the Robot framework test suite to execute the UI test cases. REST Api test suite is available in the Petclinic folder, contains the test cases to execute backend test cases using REST Api.

Jenkinsfile under Petclinic contains the script with stages of execution script. In this file for each Stage is described with name of the stage and each stage contains the steps. Inside steps will metnion the script to be exucted in the step.
For Unix operating system step to be starts with SH command and For Windows Operating system step to be start with BAT command. Below are the details of each stage in the Jenkins file.

1) Stage - Build API - to  start the backend services which are exposed as Rest API in the project.
	Since spring-petclinic-rest is developed with Springboot and Maven, We have to use command  "mvn spring-boot:run" to 
	start the project.
2) Stage - Build Angular - To start the front end application to use in Web Browser.
	You have to use command "curl https://jcenter.bintray.com/com/athaydes/rawhttp/rawhttp-cli/1.0/rawhttp-cli-1.0-all.jar -o rawhttp.jar && nohup java -jar ./rawhttp.jar serve . -p 4200" to run the web application to run on port 4200.
3) Stage - Robot - to execute the front end test cases using browser
	You have to use the command "robot --variable BROWSER:headlesschrome -d Tests/Results Tests" to run with Chrome browswer. Robot Test results will be published in folder Tests/Results.
4) Stage - newman to run the Backend test cases using rest API.
	You have to use the command "newman run  petclinic.collection.json --environment petclinic.environment.json --reporters junit" to execute the Rest API test cases. 
5) Stage - Post is to post the test results reports of the test cases via email, even on success an failure.
	
	To Run the Petclinic with Jenkins pipeline, in Pipeline - Defnition section under SCM select the reposiotory GIT/SVN,
under Repositories - Repository URL, Provide the GIT/SVN URL where the sources are exists.
Under Script Path we have to mention the Jenkinsfile which contains the script to start the application and execute the test cases.





