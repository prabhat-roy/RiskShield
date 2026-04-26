{{- define "link-analysis.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "link-analysis.labels" -}}
app.kubernetes.io/name: link-analysis
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: riskshield
riskshield.io/domain: fraud
{{- end -}}

{{- define "link-analysis.selectorLabels" -}}
app.kubernetes.io/name: link-analysis
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
