pipeline {
    agent { kubernetes { yamlFile 'ci/jenkins/agent-pod.yaml' } }
    parameters {
        string(name: 'SERVICE',  defaultValue: 'all', description: 'Service name or "all"')
        string(name: 'GIT_REF',  defaultValue: 'main')
    }
    options { timeout(time: 90, unit: 'MINUTES') ; disableConcurrentBuilds() }
    environment {
        REGISTRY = 'harbor.riskshield.internal'
    }
    stages {
        stage('Checkout') { steps { checkout scm } }
        stage('Detect changes') {
            steps {
                script {
                    env.SERVICES = (params.SERVICE == 'all'
                        ? sh(script: "find src -mindepth 2 -maxdepth 2 -type d", returnStdout: true).trim().split('\n').join(',')
                        : "src/" + params.SERVICE)
                }
            }
        }
        stage('Build') {
            steps {
                sh '''#!/usr/bin/env bash
                set -euo pipefail
                IFS=, read -ra SVCS <<< "$SERVICES"
                for s in "${SVCS[@]}"; do
                    echo "::: building $s"
                    (cd "$s" && make build)
                done
                '''
            }
        }
        stage('Pricing engine (Haskell purity check)') {
            when { changeset 'src/actuarial/pricing-engine/**' }
            steps {
                sh 'cd src/actuarial/pricing-engine && cabal build && cabal test --test-show-details=direct'
                sh 'cd src/actuarial/pricing-engine && cabal exec -- ghc-options="-Werror -Wall -Wincomplete-patterns"'
            }
        }
        stage('Actuarial R scripts (testthat)') {
            when { changeset 'src/actuarial/**' }
            steps {
                sh 'cd src/actuarial && Rscript -e "testthat::test_dir(\\"tests\\", reporter=\\"summary\\", stop_on_failure=TRUE)"'
            }
        }
        stage('Test') { steps { sh 'make test' } }
        stage('Scan') { steps { sh 'make scan-images' } }
        stage('Sign') { steps { sh 'cosign sign --yes ${REGISTRY}/riskshield/${SERVICE}:${GIT_COMMIT}' } }
        stage('Push') { steps { sh 'make push' } }
    }
    post {
        failure { slackSend channel: '#riskshield-ci', message: "Build failed: ${env.BUILD_URL}" }
    }
}
