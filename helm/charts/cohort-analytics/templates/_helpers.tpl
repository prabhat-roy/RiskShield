{{- define "cohort-analytics.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "cohort-analytics.labels" -}}
app.kubernetes.io/name: cohort-analytics
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: riskshield
riskshield.io/domain: analytics
{{- end -}}

{{- define "cohort-analytics.selectorLabels" -}}
app.kubernetes.io/name: cohort-analytics
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
