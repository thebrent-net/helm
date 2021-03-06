{{- define "common.certificate.tpl" -}}
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: {{ include "common.fullname" . }}
  namespace: {{ include "common.namespace" . }}
  labels:
    {{ include "common.labels" . | nindent 4 }}
spec:
  secretName: {{ include "common.fullname" . }}-tls
  issuerRef:
    kind: ClusterIssuer
    name: letsencrypt
  commonName: {{ .Values.certificate.commonName }}
  dnsNames: {{ .Values.certificate.hostnames }}
{{- end -}}
{{- define "common.certificate" -}}
{{- include "common.util.merge" (append . "common.certificate.tpl") -}}
{{- end -}}
