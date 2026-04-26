{{- define "ecm-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "ecm-service.labels" -}}
app.kubernetes.io/name: ecm-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: riskshield
riskshield.io/domain: document
{{- end -}}

{{- define "ecm-service.selectorLabels" -}}
app.kubernetes.io/name: ecm-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
