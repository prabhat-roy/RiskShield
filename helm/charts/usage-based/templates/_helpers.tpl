{{- define "usage-based.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "usage-based.labels" -}}
app.kubernetes.io/name: usage-based
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: riskshield
riskshield.io/domain: telematics
{{- end -}}

{{- define "usage-based.selectorLabels" -}}
app.kubernetes.io/name: usage-based
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
