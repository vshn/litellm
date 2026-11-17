{{/*
Common labels
*/}}
{{- define "litellm.labels" -}}
helm.sh/chart: {{ include "litellm.chart" . }}
{{ include "litellm.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
checksum/config-proxy-configmap: {{ include (print $.Template.BasePath "/configmap-litellm.yaml") . | sha256sum }}
checksum/runtime-env: {{ include (print $.Template.BasePath "/runtime-env.yaml") . | sha256sum }}
checksum/runtime-secrets: {{ include (print $.Template.BasePath "/runtime-secrets.yaml") . | sha256sum }}
{{- end }}
