#!/bin/bash

# Cloudflare Memory MCP Server Wrapper
# This script connects to the MCP Memory server

# Use mcp-remote to connect to the already running memory server
# The memory server should be running and accessible
npx -y mcp-remote http://127.0.0.1:3001/sse 