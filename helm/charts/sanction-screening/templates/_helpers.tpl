{{- define "sanction-screening.name" -}}{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}{{- end -}}
{{- define "sanction-screening.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}{{- end -}}
{{- end -}}
{{- define "sanction-screening.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}{{- include "sanction-screening.fullname" . -}}
{{- else -}}{{- default "default" .Values.serviceAccount.name -}}{{- end -}}
{{- end -}}
{{- define "sanction-screening.labels" -}}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" }}
app.kubernetes.io/name: {{ include "sanction-screening.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: riskshield
riskshield.io/domain: compliance
{{- end -}}
{{- define "sanction-screening.selectorLabels" -}}
app.kubernetes.io/name: {{ include "sanction-screening.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
