#!/usr/bin/env bash
set -e

echo "🔧 Setting up paperless-gpt workspace..."

# Check for Go
if ! command -v go &> /dev/null; then
    echo "❌ Error: Go is not installed or not in PATH"
    echo "Please install Go from https://golang.org/dl/"
    exit 1
fi

echo "✅ Go $(go version | awk '{print $3}') found"

# Check for Node.js
if ! command -v node &> /dev/null; then
    echo "❌ Error: Node.js is not installed or not in PATH"
    echo "Please install Node.js from https://nodejs.org/"
    exit 1
fi

echo "✅ Node.js $(node --version) found"

# Check for npm
if ! command -v npm &> /dev/null; then
    echo "❌ Error: npm is not installed or not in PATH"
    echo "Please install npm (usually comes with Node.js)"
    exit 1
fi

echo "✅ npm $(npm --version) found"

# Install Go dependencies
echo "📦 Installing Go dependencies..."
go mod download

# Navigate to web-app and install frontend dependencies
echo "📦 Installing frontend dependencies..."
cd web-app
npm install

# Build the frontend
echo "🏗️  Building frontend..."
npm run build

echo "✨ Workspace setup complete!"
echo ""
echo "To run the application, click the 'Run' button in Conductor"
echo "or execute: go run ."
