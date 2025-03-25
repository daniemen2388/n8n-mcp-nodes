# Usar la imagen oficial de n8n
FROM n8nio/n8n:latest

# Instalar Node.js 20.x manualmente
USER root
RUN curl -fsSL https://nodejs.org/dist/v20.15.1/node-v20.15.1-linux-x64.tar.xz -o node.tar.xz && \
    tar -xJf node.tar.xz -C /usr/local --strip-components=1 && \
    rm node.tar.xz

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
