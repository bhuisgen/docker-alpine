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
    }
}
