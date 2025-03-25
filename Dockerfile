# Usar la imagen oficial de n8n
FROM n8nio/n8n:latest

# Actualizar Node.js a 20.x (si es necesario)
USER root
RUN apt update && apt install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt install -y nodejs

# Instalar el paquete de nodos personalizados
RUN npm install nerding-io/n8n-nodes-mcp

# Configurar variables de entorno
ENV NODES_PACKAGE_NAMES=n8n-nodes-mcp
ENV N8N_HOST=n8n-mcp-nodes-production.up.railway.app
ENV N8N_PROTOCOL=https
ENV N8N_TRUST_PROXY=true
ENV N8N_RUNNERS_ENABLED=true
ENV OFFLOAD_MANUAL_EXECUTIONS_TO_WORKERS=true

# Volver al usuario predeterminado
USER node
