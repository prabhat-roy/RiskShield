{{- define "ifrs17-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "ifrs17-service.labels" -}}
app.kubernetes.io/name: ifrs17-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: riskshield
riskshield.io/domain: actuarial
{{- end -}}

{{- define "ifrs17-service.selectorLabels" -}}
app.kubernetes.io/name: ifrs17-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
