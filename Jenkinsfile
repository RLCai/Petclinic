pipeline {
  agent any
  stages {
    stage('Checkout') {
       steps {
               git 'https://github.com/SubhashiniPenumatsa/Petclinic'
          }
     }
    stage('Build Api') {
      steps {
        sh "nohup mvn spring-boot:run &"
        sleep(20)
      }
    } 
    stage('Build Angular') {
      steps {
        sh "nohup python -m http.server 4200 &"
        sleep(3)
      }
     
  }
     stage('Robot') {
            steps {
                sh 'cd spring-petclinic-angular/Tests robot --variable BROWSER:headlesschrome -d spring-petclinic-angular/Tests/Results spring-petclinic-angular/Tests'
                
            }
            post {
                always {
                    script {
                        step(
                            [
                                $class                  :   'RobotPublisher',
                                outputPath              :   'Petclinic/spring-petclinic-angular/Tests/Results',
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
                sh 'newman run Restful_Booker.postman_collection.json --environment Restful_Booker.postman_environment.json --reporters junit'
            }
            post {
                always {
                        junit '**/*xml'
                    }
                }
        }
 }
}
