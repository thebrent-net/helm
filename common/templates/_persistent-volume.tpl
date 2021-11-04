{{- define "common.persistentVolume.tpl" -}}
apiVersion: v1
kind: PersistentVolume
metadata:
  name: {{ include "common.fullname" . }}
  namespace: {{ include "common.namespace" . }}
  labels:
    {{ include "common.labels" . | nindent 4 }}
spec:
  capacity:
    storage: 20Gi
  accessModes:
    - ReadWriteOnce
  glusterfs:
    endpointsNamespace: glusterfs
    endpoints: glusterfs-storage
    path: {{ .Values.volume.storagePath }}
    readOnly: false
  persistentVolumeReclaimPolicy: Retain
{{- end -}}
{{- define "common.persistentVolume" -}}
{{- include "common.util.merge" (append . "common.persistentVolume.tpl") -}}
{{- end -}}
