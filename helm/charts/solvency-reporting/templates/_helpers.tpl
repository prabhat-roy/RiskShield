{{- define "solvency-reporting.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "solvency-reporting.labels" -}}
app.kubernetes.io/name: solvency-reporting
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: riskshield
riskshield.io/domain: compliance
{{- end -}}

{{- define "solvency-reporting.selectorLabels" -}}
app.kubernetes.io/name: solvency-reporting
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
