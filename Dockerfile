# Usar la imagen oficial de n8n
FROM n8nio/n8n:latest

# Instalar el paquete de nodos personalizados
USER root
RUN npm install nerding-io/n8n-nodes-mcp
ENV NODES_PACKAGE_NAMES=n8n-nodes-mcp

# Variables para resolver advertencias
ENV N8N_TRUST_PROXY=true
ENV N8N_RUNNERS_ENABLED=true
ENV OFFLOAD_MANUAL_EXECUTIONS_TO_WORKERS=true

# Volver al usuario predeterminado
USER node
