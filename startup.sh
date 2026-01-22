#!/bin/bash
set -e

# Create necessary directories for data storage
mkdir -p ./data/_cache/characters
mkdir -p ./data/_storage
mkdir -p ./data/_uploads
mkdir -p ./data/_webpack

# Start the application
npm start
