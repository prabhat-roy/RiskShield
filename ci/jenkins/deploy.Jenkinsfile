pipeline {
    agent { kubernetes { yamlFile 'ci/jenkins/agent-pod.yaml' } }
    parameters {
        choice(name: 'CLOUD',    choices: ['aws','gcp','azure'])
        choice(name: 'ENV',      choices: ['dev','staging','prod'])
        string(name: 'SERVICE',  defaultValue: 'all')
        string(name: 'VERSION',  defaultValue: 'latest')
        choice(name: 'STRATEGY', choices: ['blue-green','canary','rolling'])
    }
    options { timeout(time: 45, unit: 'MINUTES') }
    stages {
        stage('Configure kubeconfig') {
            steps {
                script {
                    if (params.CLOUD == 'aws') {
                        sh 'aws eks update-kubeconfig --name riskshield-${ENV} --region eu-west-1'
                    } else if (params.CLOUD == 'gcp') {
                        sh 'gcloud container clusters get-credentials riskshield-${ENV} --region europe-west2 --project riskshield-${ENV}'
                    } else {
                        sh 'az aks get-credentials --resource-group riskshield-${ENV} --name riskshield-${ENV}'
                    }
                }
            }
        }
        stage('Helm upgrade') {
            steps {
                sh '''#!/usr/bin/env bash
                set -euo pipefail
                CHART_DIRS=$([ "$SERVICE" = "all" ] && find helm/charts -mindepth 1 -maxdepth 1 -type d || echo "helm/charts/$SERVICE")
                # CLAUDE.md rule: blue-green for policy-admin and claims-settlement; canary elsewhere.
                for chart in $CHART_DIRS; do
                    name=$(basename "$chart")
                    case "$name" in
                        policy-admin|settlement-service) STRAT=blue-green ;;
                        *) STRAT=${STRATEGY} ;;
                    esac
                    echo "::: deploying $name to $CLOUD/$ENV via $STRAT"
                    helm upgrade --install "$name" "$chart" \
                        --namespace riskshield \
                        --create-namespace \
                        -f "$chart/values.yaml" \
                        -f "$chart/values-${CLOUD}.yaml" \
                        --set image.tag=${VERSION} \
                        --set rollout.strategy=${STRAT}
                done
                '''
            }
        }
        stage('Sanction-screening smoke test') {
            steps {
                sh 'kubectl exec -n riskshield deploy/sanction-screening -- curl -fsS http://localhost:8080/healthz/sanctions'
            }
        }
        stage('Verify') {
            steps {
                sh 'kubectl get pods -n riskshield'
                sh 'make k8s-validate'
            }
        }
    }
}
