{{/* Create chart name and version as used by the chart label. */}}
{{- define "common.chart" -}}
  {{- $globalChartOverride := " " -}}
  {{- if hasKey .Values "global" -}}
    {{- $globalChatOverride = (default $globalChartOverride .Values.global.chart) -}}
  {{- end -}}
  {{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}
