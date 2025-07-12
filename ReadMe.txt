
🌱 Raspberry Pi Grow Room Automation System

Overview

This project is a smart grow environment for a single cannabis 
plant using a tide-based hydroponic system. 
It uses a Raspberry Pi 3 to manage sensors and actuators, 
and exposes a REST API for frontend access from any device. 
The initial frontend will be a webpage that interacts with this API.

Goals
	•	Fully monitor and control the environment via a web interface.
	•	Log all environmental and system data locally.
	•	Build a modular backend to support future database and cloud integration.

Hardware Components
	•	Raspberry Pi 3
	•	12” touchscreen (can display local version of the web frontend if needed)
	•	Sanlight 270W LED (controlled by relay and 0–10V DAC)
    •   rohrventilator mit 5v pwm steuerung für abluft
	•	Gravity 2-channel DAC (DFR0971, analog control of light via i2c)
	•	Relay module (light on/off)
	•	2x BME280 sensors (temperature, humidity, pressure)
	•	MH-Z19 sensor (CO₂ monitoring)
	•	IO ADC Nuvoton MS51 microcontroller with inbuilt 12-bit ADC (pump/relay interface via i2c)
  	•   Grove - 8 Channel I2C Multiplexer/I2C Hub (TCA9548A)
	•	Tide-based hydro system

Software Architecture

Backend (on Raspberry Pi)
	•	Language: Python
	•	Responsibilities:
	•	Sensor polling & hardware control
	•	Tide system logic and scheduling
	•	Logging data to /data/log.csv
	•	Exposing a RESTful API using Flask or FastAPI
	•	API Endpoints:
	•	GET /status – return current readings and system state
	•	POST /light – control light power and intensity
	•	POST /pump – trigger or schedule tide pump
	•	GET /log – retrieve historical data
	•	More endpoints to come for calibration, settings, etc.

Frontend (web-based)
	•	Accessible from any device on the same network (or remotely in the future)
	•	Features:
	•	Real-time sensor dashboard (temp, humidity, CO₂, pressure)
	•	Light control UI (on/off, intensity slider)
	•	Simple valve and pump controll
	•	Graphs of recent environmental data
	•	Alert/status messages
	•	Initial implementation: Basic HTML/JS frontend hosted on the Pi or another device, calling the API.

Future Plans
	•	WebSocket support for live updates
	•	User authentication and remote access
	•	Cloud database logging for analytics
	•	Progressive Web App (PWA) capabilities

