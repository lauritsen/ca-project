node {
    stage('Preparations') {
        checkout scm
    }

    stage('test') {
        sh 'docker run -i -p --rm 5000:5000 ca-project-image python /usr/src/ca/tests.py > log.txt'
        archiveArtifacts 'log.txt'
    }

}