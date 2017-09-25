node {
    stage "Prepare environment"
        checkout scm

        def environment = docker.build "jenkins-build:${env.BUILD_ID}"
        environment.inside {
            stage "Running configure"
            sh "./configure"

            stage "Running build"
            sh "make build"
        }

    stage "Cleanup"
        deleteDir()
}
