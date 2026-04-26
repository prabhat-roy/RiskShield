{{- define "agent-bff.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "agent-bff.labels" -}}
app.kubernetes.io/name: agent-bff
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: riskshield
riskshield.io/domain: platform
{{- end -}}

{{- define "agent-bff.selectorLabels" -}}
app.kubernetes.io/name: agent-bff
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
