{{- define "medical-provider.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "medical-provider.labels" -}}
app.kubernetes.io/name: medical-provider
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: riskshield
riskshield.io/domain: third-party
{{- end -}}

{{- define "medical-provider.selectorLabels" -}}
app.kubernetes.io/name: medical-provider
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
