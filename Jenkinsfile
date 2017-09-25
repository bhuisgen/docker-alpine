pipeline {
    agent {
        dockerfile true
    }

    stages {
        stage("Build") {
            steps {
                sh "./configure"
                sh "make build"
            }
        }

        stage("Test") {
            steps {
                sh "/bin/true"
            }
        }

        stage("Deploy") {
            when {
                branch "master"
            }

            steps {
                sh "make push"
            }
        }

        stage("Cleanup") {
            steps {
                sh "make clean"
            }
        }
    }

    post {
        always {
            deleteDir()
        }
    }

}
