node {
    stage('Preparations') {
        //Using the Pretested integration plugin to checkout out any branch in the ready namespace
        checkout(
            [$class: 'GitSCM', 
            branches: [[name: '*/ready/**']], 
            doGenerateSubmoduleConfigurations: false, 
            extensions: [[$class: 'CleanBeforeCheckout'], 
            pretestedIntegration(gitIntegrationStrategy: squash(), 
            integrationBranch: 'master', 
            repoName: 'origin')], 
            submoduleCfg: [], 
            userRemoteConfigs: [[credentialsId: 'lauritsen', //remember to change credentials and url.
            url: 'git@github.com:lauritsen/ca-project.git']]])
    }
}

node('ubuntu-test') {
    stage('test') {
        sh 'docker run henriklauritsen/ca-project:1.0.0 python /usr/src/ca/tests.py > log.txt'
        archiveArtifacts 'log.txt'
    }
}

node {
    stage('Publish') {
        //This publishes the commit if the tests have run without errors
        pretestedIntegrationPublisher()
    }
}


