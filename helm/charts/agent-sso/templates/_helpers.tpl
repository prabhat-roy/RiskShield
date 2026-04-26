{{- define "agent-sso.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "agent-sso.labels" -}}
app.kubernetes.io/name: agent-sso
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: riskshield
riskshield.io/domain: identity
{{- end -}}

{{- define "agent-sso.selectorLabels" -}}
app.kubernetes.io/name: agent-sso
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
