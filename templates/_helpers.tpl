{{/*
Expand the name of the chart.
*/}}
{{- define "helm-mediaserver.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "helm-mediaserver.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "helm-mediaserver.labels" -}}
helm.sh/chart: {{ include "helm-mediaserver.chart" . }}
app.kubernetes.io/name: {{ include "helm-mediaserver.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{/*
Build image field from repository and tag
*/}}
{{- define "helm-mediaserver.image" -}}
{{- $tag := default "latest" .tag }}
{{- printf "%s:%s" .image $tag }}
{{- end }}

{{/*
Set imagePullPolicy depending on tag
*/}}
{{- define "helm-mediaserver.imagePullPolicy" -}}
{{- if ( or (empty .tag) (eq .tag "latest")) }}
{{- print "Always" }}
{{- else }}
{{- print "IfNotPresent" }}
{{- end }}
{{- end }}