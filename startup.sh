#!/bin/bash
set -e

# Create necessary directories for data storage
mkdir -p /var/data/_cache/characters
mkdir -p /var/data/_storage
mkdir -p /var/data/_uploads
mkdir -p /var/data/_webpack

# Start the application
npm start
