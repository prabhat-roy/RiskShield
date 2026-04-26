{{- define "agent-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "agent-service.labels" -}}
app.kubernetes.io/name: agent-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: riskshield
riskshield.io/domain: distribution
{{- end -}}

{{- define "agent-service.selectorLabels" -}}
app.kubernetes.io/name: agent-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
