{{/*
Expand the name of the chart.
*/}}
{{- define "panope.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "panope.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/* Fullname suffixed with agent */}}
{{- define "panope.agent.fullname" -}}
{{- printf "%s-agent" (include "panope.fullname" .) -}}
{{- end }}

{{/* Fullname suffixed with observer */}}
{{- define "panope.observer.fullname" -}}
{{- printf "%s-observer" (include "panope.fullname" .) -}}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "panope.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Labels of agent */}}
{{- define "panope.agent.labels" -}}
helm.sh/chart: {{ include "panope.chart" . }}
{{ include "panope.agent.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: {{ include "panope.name" . }}
{{- end }}

{{/* Labels of observer */}}
{{- define "panope.observer.labels" -}}
helm.sh/chart: {{ include "panope.chart" . }}
{{ include "panope.observer.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: {{ include "panope.name" . }}
{{- end }}

{{/* Selector labels of agent */}}
{{- define "panope.agent.selectorLabels" -}}
app.kubernetes.io/name: {{ include "panope.name" . }}-agent
app.kubernetes.io/component: panope-agent
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/* Selector labels of observer */}}
{{- define "panope.observer.selectorLabels" -}}
app.kubernetes.io/name: {{ include "panope.name" . }}-observer
app.kubernetes.io/component: panope-observer
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "panope.agent.serviceAccountName" -}}
{{- default (include "panope.agent.fullname" .) .Values.agent.serviceAccount.name }}
{{- end }}

{{- define "panope.observer.serviceAccountName" -}}
{{- default (include "panope.observer.fullname" .) .Values.observer.serviceAccount.name }}
{{- end }}
