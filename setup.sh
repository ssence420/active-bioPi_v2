#!/bin/bash

# ───────────────────────────────────────────────
# 🌱 Smart Growroom Project - Setup Script
# Bootstraps system dependencies, Python env, and folders
# ───────────────────────────────────────────────

# Exit on error
set -e

echo "🛠️  Setting up Growroom Project..."

# 1. Update and install OS-level packages
echo "🔄 Updating system packages..."
sudo apt update && sudo apt upgrade -y
sudo apt install -y \
    python3 \
    python3-pip \
    python3-venv \
    git \
    i2c-tools \
    unzip \
    curl \
    libatlas-base-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libhdf5-dev \
    libblas-dev \
    liblapack-dev \
    libffi-dev \
    build-essential \
    libssl-dev

# 2. Enable I2C interface
echo "🔌 Enabling I2C..."
sudo raspi-config nonint do_i2c 0

# 3. Create project directories
echo "📁 Creating folders..."
mkdir -p /data/logs
mkdir -p /data/images
mkdir -p /data/config

# 4. Set up Python virtual environment
echo "🐍 Creating virtual environment..."
python3 -m venv .venv
source .venv/bin/activate

# 5. Upgrade pip and install Python dependencies
echo "📦 Installing Python packages..."
pip install --upgrade pip

pip install \
    flask \
    fastapi \
    uvicorn \
    pandas \
    adafruit-circuitpython-bme280 \
    mh-z19 \
    smbus2 \
    RPi.GPIO

# 6. Done
echo "✅ Setup complete. Activate with: source .venv/bin/activate"
