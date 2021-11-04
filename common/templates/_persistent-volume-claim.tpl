{{- define "common.persistentVolumeClaim.tpl" -}}
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: {{ include "common.fullname" . }}
  namespace: {{ include "common.namespace" . }}
  labels:
    {{ include "common.labels" . | nindent 4 }}
spec:
  storageClassName: ""
  volumeName: {{ include "common.fullname" . }}
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 20Gi
{{- end -}}
{{- define "common.persistentVolumeClaim" -}}
{{- include "common.util.merge" (append . "common.persistentVolumeClaim.tpl") -}}
{{- end -}}