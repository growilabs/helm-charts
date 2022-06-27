# panope

A Helm chart for Panope, use Spot VMs/Preemptible VMs in GKE to reduce infrastructure costs while high availability tool

![Version: 0.7.1](https://img.shields.io/badge/Version-0.7.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.7.0](https://img.shields.io/badge/AppVersion-v0.7.0-informational?style=flat-square)

## Prerequisites
*GKE 1.19+*
*Helm v3.0.0+*

## Installing the Chart

To install the chart with the release name `my-release`:

```console
$ helm repo add 7knot https://7knot.github.io/helm-charts
$ helm install my-release 7knot/panope
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| agent.affinity | object | `{}` | Affinity for scheduling the agent pods |
| agent.clusterRole.annotations | object | `{}` | Annotations to add to the cluster role |
| agent.clusterRole.labels | object | `{}` | Labels to add to the cluster role |
| agent.clusterRoleBinding.annotations | object | `{}` | Annotations to add to the cluster role binding |
| agent.clusterRoleBinding.labels | object | `{}` | Labels to add to the cluster role binding |
| agent.configMap.agentSubject | string | `""` | Configure NATS subject for agent to publish to NATS server |
| agent.configMap.annotations | object | `{}` | Annotations to add to the config map |
| agent.configMap.clusterNodeMaxSurge | string | `"25%"` | Configure the maximum number of nodes in the cluster as a percentage |
| agent.configMap.controllerSubject | string | `""` | Configure NATS subject for agent to subscribe to NATS server |
| agent.configMap.drainingTimeoutSec | string | `nil` | configure the timeout for draining pods from node. if not set, default value is 180 |
| agent.configMap.failoverEnabled | string | `"false"` | enable the failover feature |
| agent.configMap.healthCheckPort | string | `nil` | Configure the health check port. if not set, default value is 4444 |
| agent.configMap.labels | object | `{}` | Labels to add to the config map |
| agent.configMap.maxProcessedNodeCount | string | `"5"` | Configure the maximum number of nodes to be processed at the same time (cordoned or drained, etc.) |
| agent.configMap.metricsPort | string | `nil` | Configure the metrics port. if not set, default value is 2112 |
| agent.configMap.natsUri | string | `"wss://nats.panope.net:443"` | Configure the NATS URI to connect NATS server, currently, the only supported URI schema is `wss` |
| agent.configMap.rollingUpdateTimeoutSec | string | `nil` | Configure the timeout for rolling update of deployment. if not set, default value is 180 |
| agent.deployment.annotations | object | `{}` | Annotations to add to the deployment of agent |
| agent.deployment.labels | object | `{}` | Labels to add to the deployment of agent |
| agent.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy for the agent |
| agent.image.repository | string | `"gcr.io/panope/agent"` | Image repository to use for the agent |
| agent.image.tag | string | `nil` | Overrides the image tag whose default is the chart appVersion. |
| agent.imagePullSecrets | list | `[]` | If defined, uses a Secret to pull an image from a private Docker registry or repository. |
| agent.livenessProbe.failureThreshold | int | `5` | Minimum consecutive failures for the [probe] to be considered failed after having succeeded |
| agent.livenessProbe.httpGet.path | string | `"/health"` | Path to the health check endpoint |
| agent.livenessProbe.httpGet.port | int | `4444` | Port of health check endpoint |
| agent.livenessProbe.httpGet.scheme | string | `"HTTP"` | Schema of request |
| agent.livenessProbe.initialDelaySeconds | int | `5` | Number of seconds after the container has started before [probe] is initiated |
| agent.livenessProbe.periodSeconds | int | `10` | How often (in seconds) to perform the [probe] |
| agent.livenessProbe.successThreshold | int | `1` | Minimum consecutive successes for the [probe] to be considered successful after having failed |
| agent.livenessProbe.timeoutSeconds | int | `5` | Number of seconds after which the [probe] times out |
| agent.nodeSelector | object | `{}` | Node labels for scheduling the agent pods |
| agent.pdb.annotations | object | `{}` | Annotations to add to the pdb |
| agent.pdb.enabled | bool | `false` | Configure PodDisruptionBudget for the agent pods |
| agent.pdb.labels | object | `{}` | Labels to add to the pdb |
| agent.podAnnotations | object | `{}` | Annotations for the agent pods |
| agent.podLabels | object | `{}` | Labels for the agent pods |
| agent.podSecurityContext | object | `{}` | Security context for the agent pods |
| agent.priorityClassName | string | `""` | Priority class name for the agent pods |
| agent.readinessProbe.failureThreshold | int | `3` | Minimum consecutive failures for the [probe] to be considered failed after having succeeded |
| agent.readinessProbe.httpGet.path | string | `"/health"` | Path to the health check endpoint |
| agent.readinessProbe.httpGet.port | int | `4444` | Port of health check endpoint |
| agent.readinessProbe.httpGet.scheme | string | `"HTTP"` | Schema of request |
| agent.readinessProbe.initialDelaySeconds | int | `5` | Number of seconds after the container has started before [probe] is initiated |
| agent.readinessProbe.periodSeconds | int | `10` | How often (in seconds) to perform the [probe] |
| agent.readinessProbe.successThreshold | int | `1` | Minimum consecutive successes for the [probe] to be considered successful after having failed |
| agent.readinessProbe.timeoutSeconds | int | `5` | Number of seconds after which the [probe] times out |
| agent.replicaCount | int | `1` | The number of agent pods to run |
| agent.resources | object | `{}` | Resources requests/limits for the agent containers |
| agent.role.annotations | object | `{}` | Annotations to add to the role |
| agent.role.labels | object | `{}` | Labels to add to the role |
| agent.roleBinding.annotations | object | `{}` | Annotations to add to the role binding |
| agent.roleBinding.labels | object | `{}` | Labels to add to the role binding |
| agent.secret.annotations | object | `{}` | Annotations to add to the secret |
| agent.secret.googleServiceAccountKeyfileJson | string | `nil` | JSON key file for a GCP service account to authenticate agent to GCP |
| agent.secret.labels | object | `{}` | Labels to add to the secret |
| agent.secret.nats.credentials | string | `nil` | Configure the NATS credentials for agent to publish/subscribe to NATS server |
| agent.secret.valuesAreBase64Encoded | bool | `false` | If set to true the values are already base64 encoded when provided, otherwise the template performs the base64 encoding |
| agent.securityContext | object | `{}` | Security context for the agent containers |
| agent.service.annotations | object | `{}` | Annotations to add to the service |
| agent.service.labels | object | `{}` | Labels to add to the service |
| agent.serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| agent.serviceAccount.labels | object | `{}` | Labels to add to the service account |
| agent.serviceAccount.name | string | `""` | Service account name. if not set, panope.agent.fullname is used |
| agent.serviceMonitor.annotations | object | `{}` | Annotations to add to the service monitor |
| agent.serviceMonitor.enabled | bool | `false` | Configure the service monitor for Prometheus |
| agent.serviceMonitor.labels | object | `{}` | Labels to add to the service monitor |
| agent.tolerations | list | `[]` | Tolerations for scheduling the agent pods |
| fullnameOverride | string | `""` | Completely replaces the generated release name. |
| nameOverride | string | `""` | Replaces the name of the chart in the Chart.yaml file |
| observer.affinity | object | `{"nodeAffinity":{"requiredDuringSchedulingIgnoredDuringExecution":{"nodeSelectorTerms":[{"matchExpressions":[{"key":"cloud.google.com/gke-preemptible","operator":"Exists"}]},{"matchExpressions":[{"key":"cloud.google.com/gke-spot","operator":"Exists"}]},{"matchExpressions":[{"key":"panope.net/failover","operator":"Exists"}]}]}}}` | Affinity for scheduling the observer pods |
| observer.affinity.nodeAffinity | object | `{"requiredDuringSchedulingIgnoredDuringExecution":{"nodeSelectorTerms":[{"matchExpressions":[{"key":"cloud.google.com/gke-preemptible","operator":"Exists"}]},{"matchExpressions":[{"key":"cloud.google.com/gke-spot","operator":"Exists"}]},{"matchExpressions":[{"key":"panope.net/failover","operator":"Exists"}]}]}}` | Following affinity is required for the observer to work properly |
| observer.clusterRole.annotations | object | `{}` | Annotations to add to the cluster role |
| observer.clusterRole.labels | object | `{}` | Labels to add to the cluster role |
| observer.clusterRoleBinding.annotations | object | `{}` | Annotations to add to the cluster role binding |
| observer.clusterRoleBinding.labels | object | `{}` | Labels to add to the cluster role binding |
| observer.configMap.annotations | object | `{}` | Annotations to add to the config map |
| observer.configMap.controllerSubject | string | `""` | Configure NATS subject for the observer to subscribe |
| observer.configMap.healthCheckPort | string | `nil` | Configure the health check port. if not set, default value is 4444 |
| observer.configMap.labels | object | `{}` | Labels to add to the config map |
| observer.configMap.metricsPort | string | `nil` |  |
| observer.configMap.natsUri | string | `"wss://nats.panope.net:443"` | Configure NATS uri to connect to NATS server. currently, the only supported URI schema is `wss` |
| observer.configMap.observerSubject | string | `""` | Configure NATS subject for the observer to publish to NATS server |
| observer.daemonset.annotations | object | `{}` | Annotations to add to the deployment |
| observer.daemonset.labels | object | `{}` | Labels to add to the deployment |
| observer.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy for the observer |
| observer.image.repository | string | `"gcr.io/panope/observer"` | Image repository to use for the observer |
| observer.image.tag | string | `nil` | Overrides the image tag whose default is the chart appVersion |
| observer.imagePullSecrets | list | `[]` | If defined, uses a Secret to pull an image from a private Docker registry or repository |
| observer.livenessProbe.failureThreshold | int | `5` | Minimum consecutive failures for the [probe] to be considered failed after having succeeded |
| observer.livenessProbe.httpGet.path | string | `"/health"` | Path to the health check endpoint |
| observer.livenessProbe.httpGet.port | int | `4444` | Port of health check endpoint |
| observer.livenessProbe.httpGet.scheme | string | `"HTTP"` | Schema of request |
| observer.livenessProbe.initialDelaySeconds | int | `5` | Number of seconds after the container has started before [probe] is initiated |
| observer.livenessProbe.periodSeconds | int | `10` | How often (in seconds) to perform the [probe] |
| observer.livenessProbe.successThreshold | int | `1` | Minimum consecutive successes for the [probe] to be considered successful after having failed |
| observer.livenessProbe.timeoutSeconds | int | `5` | Number of seconds after which the [probe] times out |
| observer.podAnnotations | object | `{}` | Annotations for the agent pods |
| observer.podLabels | object | `{}` | Labels for the observer pods |
| observer.podSecurityContext | object | `{}` | Security context for the observer pods |
| observer.priorityClassName | string | `""` | Priority class name for the observer pods |
| observer.readinessProbe.failureThreshold | int | `3` | Minimum consecutive failures for the [probe] to be considered failed after having succeeded |
| observer.readinessProbe.httpGet.path | string | `"/health"` | Path to the health check endpoint |
| observer.readinessProbe.httpGet.port | int | `4444` | Port of health check endpoint |
| observer.readinessProbe.httpGet.scheme | string | `"HTTP"` | Schema of request |
| observer.readinessProbe.initialDelaySeconds | int | `5` | Number of seconds after the container has started before [probe] is initiated |
| observer.readinessProbe.periodSeconds | int | `10` | How often (in seconds) to perform the [probe] |
| observer.readinessProbe.successThreshold | int | `1` | Minimum consecutive successes for the [probe] to be considered successful after having failed |
| observer.readinessProbe.timeoutSeconds | int | `5` | Number of seconds after which the [probe] times out |
| observer.resources | object | `{}` | Resources requests/limits for the observer containers |
| observer.secret.annotations | object | `{}` | Annotations to add to the secret |
| observer.secret.labels | object | `{}` | Labels to add to the secret |
| observer.secret.nats.credentials | string | `nil` | Configure the NATS credentials for the observer to publish/subscribe to NATS server |
| observer.service.annotations | object | `{}` | Annotations to add to the service |
| observer.service.labels | object | `{}` | Labels to add to the service |
| observer.serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| observer.serviceAccount.labels | object | `{}` | Labels to add to the service account |
| observer.serviceAccount.name | string | `""` | Service account name. if not set, (panope.observer.fullname) is used |
| observer.serviceMonitor.annotations | object | `{}` | Annotations to add to the service monitor |
| observer.serviceMonitor.enabled | bool | `false` | Configure the service monitor for Prometheus |
| observer.serviceMonitor.labels | object | `{}` | Labels to add to the service monitor |
| observer.tolerations | list | `[]` | Tolerations for scheduling the observer pods |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.10.0](https://github.com/norwoodj/helm-docs/releases/v1.10.0)
