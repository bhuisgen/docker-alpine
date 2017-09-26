pipeline {
    agent {
        dockerfile {
            label "x86_64"
        }
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
    }

    post {
        always {
            sh "make clean"
            deleteDir()
        }
    }
}
