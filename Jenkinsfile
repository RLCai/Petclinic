pipeline {
  agent any
  stages {
          
        stage('para') {
           parallel {
			stage('Build Api') {
			  steps {
				   sh 'cd spring-petclinic-rest && nohup mvn spring-boot:run &'
					
				  }
				} 
				stage ('Build') {
              steps {
                     sh 'cd spring-petclinic-rest && mvn compile'
                }
            }
     
     stage('Test') {
                steps {
                        sh 'cd spring-petclinic-rest && mvn test'
                     }
         post {
		 
			success{ gerritReview score:1}
			failure{ gerritReview score:-1}
			always {
			    junit '**/target/surefire-reports/TEST*.xml'
			}
           
           }
        }
			 
			stage('Build Angular') {
				steps {
					sh 'cd spring-petclinic-angular/static-content && curl https://jcenter.bintray.com/com/athaydes/rawhttp/rawhttp-cli/1.0/rawhttp-cli-1.0-all.jar -o rawhttp.jar && nohup java -jar ./rawhttp.jar serve . -p 4200 &'
					sleep(3)
				  }
				 
			  }
    
			stage('Robot') {
					steps {
					        catchError {
							    sleep(60)
							    sh 'robot --variable BROWSER:headlesschrome -d Tests/Results Tests'
					        }
							
						}
						post {
							always {
								script {
									step(
										[
											$class                  :   'RobotPublisher',
											outputPath              :   'Tests/Results',
											outputFileName          :   '**/output.xml',
											reportFileName          :   '**/report.html',
											logFileName             :   '**/log.html',
											disableArchiveOutput    :   false,
											passThreshold           :   100,
											unstableThreshold       :   40,
											otherFiles              :   "**/*.png,**/*.jpg",
										]
									)
								}
							}
						}
				 }
			   
				stage('newman') {
						steps {
						   sleep(20)
							sh 'newman run  petclinic.postman_collection.json --environment petclinic.postman_environment.json --reporters junit'
						}
						post {
							always {
									junit '**/*xml'
								}
							}
					}
		   		
			  
           		}
		}
    
 }
 
  post {
        always {
             emailext  to: 'subhashini.penumatsa@iths.se;mattias.hovde@iths.se;amer.rasheed@iths.se;likkaa.johar@iths.se;shilpa.srinivas@iths.se;ruiling.cai@iths.se;wasim.el.jomaa@iths.se',
                       subject: "Build Started: ${currentBuild.fullDisplayName}",
                       body: "${env.BUILD_URL} has result ${currentBuild.result}"
        }
        success {
             emailext  to: 'subhashini.penumatsa@iths.se;mattias.hovde@iths.se;amer.rasheed@iths.se;likkaa.johar@iths.se;shilpa.srinivas@iths.se;ruiling.cai@iths.se;wasim.el.jomaa@iths.se',
                       subject: "Build Succees: ${currentBuild.fullDisplayName}",
                       body: "${env.BUILD_URL} has result ${currentBuild.result}"
        }
        unstable {
             emailext  to: 'subhashini.penumatsa@iths.se;mattias.hovde@iths.se;amer.rasheed@iths.se;likkaa.johar@iths.se;shilpa.srinivas@iths.se;ruiling.cai@iths.se;wasim.el.jomaa@iths.se',
                       subject: "Build Unstable: ${currentBuild.fullDisplayName}",
                       body: "${env.BUILD_URL} has result ${currentBuild.result}"
        }
        failure {
             emailext  to: 'subhashini.penumatsa@iths.se;mattias.hovde@iths.se;amer.rasheed@iths.se;likkaa.johar@iths.se;shilpa.srinivas@iths.se;ruiling.cai@iths.se;wasim.el.jomaa@iths.se',
                       subject: "Build Failed: ${currentBuild.fullDisplayName}",
                       body: "${env.BUILD_URL} has result ${currentBuild.result}"
        }
        changed {
             emailext  to: 'subhashini.penumatsa@iths.se;mattias.hovde@iths.se;amer.rasheed@iths.se;likkaa.johar@iths.se;shilpa.srinivas@iths.se;ruiling.cai@iths.se;wasim.el.jomaa@iths.se',
                       subject: "Some changes in build: ${currentBuild.fullDisplayName}",
                       body: "${env.BUILD_URL} has result ${currentBuild.result}"
        }
    }
	
 
}
