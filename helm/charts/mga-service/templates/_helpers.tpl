{{- define "mga-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "mga-service.labels" -}}
app.kubernetes.io/name: mga-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: riskshield
riskshield.io/domain: distribution
{{- end -}}

{{- define "mga-service.selectorLabels" -}}
app.kubernetes.io/name: mga-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
