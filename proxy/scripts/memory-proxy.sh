#!/bin/bash

# Memory (Cloudflare) MCP Server Proxy
# Port: 8084
# Note: This connects directly to the Cloudflare Worker

export PATH="$PATH:/Users/zollicoff/.local/bin"

LOG_FILE="/Users/zollicoff/Github/mcp_servers/proxy/logs/memory.log"
PID_FILE="/Users/zollicoff/Github/mcp_servers/proxy/pids/memory.pid"
mkdir -p "$(dirname "$LOG_FILE")" "$(dirname "$PID_FILE")"

echo "$(date): Starting Memory MCP Proxy on port 8084" >> "$LOG_FILE"

# Connect directly to the Cloudflare Worker using mcp-remote
exec mcp-proxy \
    --port 8084 \
    --host 127.0.0.1 \
    --allow-origin '*' \
    -- npx -y mcp-remote https://mcp-memory.zollicoff.workers.dev/15FB52E3-491C-474D-A75F-961AC7147A20/sse \
    2>&1 | tee -a "$LOG_FILE" 