{{- define "cession-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "cession-service.labels" -}}
app.kubernetes.io/name: cession-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: riskshield
riskshield.io/domain: reinsurance
{{- end -}}

{{- define "cession-service.selectorLabels" -}}
app.kubernetes.io/name: cession-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
