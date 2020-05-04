pipeline {
   agent any

   tools {
      maven "mvn"
      jdk "jdk8"
   }

   stages {
      stage('SCM Checkout') {
         steps {
            println "============= SCM Checkout =============="
          }
      }
      stage('Build, Package & JUnit'){
          steps {
            println "============== Build, Package & JUnit ================"
            sh "mvn clean install -Dmaven.test.failure.ignore=true"
            sh "docker build --tag sample ."
            sh "docker tag sample gcr.io/concrete-crow-244606/gke-test-app:latest"
         }
         post {
            success {
               junit '**/target/surefire-reports/TEST-*.xml'
               archiveArtifacts 'target/*.jar'
            }
         }
      }
      stage('Push Image to GCR'){
          steps {
            println "============== Push Image to GCR =================="
            withCredentials([file(credentialsId: "gcp-key", variable: 'GOOGLE_APPLICATION_CREDENTIALS')])
        	{
        		sh("gcloud auth activate-service-account --key-file=$GOOGLE_APPLICATION_CREDENTIALS")
        		sh("gcloud docker -- push gcr.io/concrete-crow-244606/gke-test-app:latest")
        		
        	}
         }
      }
      stage('Infra Creation'){
          steps {
            println "=========== Infra Creation ==============="
            sh("sh terraform.sh")
         }
      }
      stage('Application Deployment'){
          steps {
            println "=========== Application Deployment ==============="
            withCredentials([file(credentialsId: "gcp-key", variable: 'GOOGLE_APPLICATION_CREDENTIALS')])
                {
                        sh("gcloud auth activate-service-account --key-file=$GOOGLE_APPLICATION_CREDENTIALS")
                        sh("sh script.sh")
                }
         }
      }
   }
}
