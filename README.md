# Pear’dev Aircraft Assessment App

## Overview
The Pear'dev Aircraft Assessment App for Apple Vision Pro leverages mixed reality (MR) technology to provide an educational tool for aircraft inspections, self-directed embodied learning, and online assessments. This application transforms the way assessments are conducted by integrating voice memos in an immersive MR environment.

## Key Features
* Voice Memos for Next Steps: Record voice memos and transcribe in real-time during inspections to document next steps and action items for specific aircraft parts.
* Mixed Reality Inspections: Overlay scenario-relevant text and images directly on the aircraft using MR.
* 3D Component Visualization: Interact with 3D models of aircraft components to better understand their condition

## Step-by-Step Pear'dev Aircraft Assessment App User Guide
Welcome to the Pear'dev Aircraft Assessment App!
This guide will help you get started with the Pear'dev Aircraft Assessment App, ensuring you make the most out of its features and capabilities.

#### 1. Launching the App
- **Power on** your Apple Vision Pro and locate the Pear'dev Aircraft Assessment App in your apps menu.
- **Calibration**: Remember to follow the on-screen instructions to calibrate the app with your current environment in the Vision Pro before beginning. This ensures optimal mixed reality (MR) performance.
- **Open the app** by selecting the Aircraft Assessment App icon.

#### 2. Initial Setup
- **Permissions**: Allow the app to access the necessary permissions for voice memos, camera, and microphone.

#### 3. Main Menu
Once the app is launched, you'll be greeted by the main menu with the following options:
- **Turn on to show aircraft model:** This toggle will activate the 3D model of the aircraft to begin the session
- **On-Ground / In-flight:** This slider will allow you to switch between different models to simulate the aircraft in different scenarios
- **Scale:**: This slider will allow you to control the size of the 3D model shown.

#### 4. Starting an Inspection
- **Toggle the button on the right of "Turn on to show aircraft model"** from the main menu.

#### 5. Conducting the Inspection
- **Interactive Points**: Various points of interest (POIs) will appear on the aircraft. These are all parts which may require inspection, depending on the scenario.
- **Text and Images**: Scenario-relevant text and images will overlay on the aircraft parts. For example, click on the "Cockpit" frame to view the cockpit image and related scenario information.
- **Voice Memos**: To document your inspection, record voice memos. On the "Cockpit" frame, click the "Start Recording" button and the app will start recording. Speak your observations and action items. Once you click "Stop Recording" after you are done, the app will automatically transcribe the memo in real-time and display the corresponding transcript on the frame. You may redo the recording as many times as you like within the overall session.

#### 6. Completing the Assessment
- **Assessment**: The assessor can review all transcripts across the scenario after the session is over. In the future, these transcripts could also be stored and accessed online to facilitate remote assessments.

## References & Imports
* Terrain and Point of Interest Tags: Referenced from the Apple Diorama Sample App
* Fighter Jet Model: https://assetstore.unity.com/packages/3d/vehicles/air/fighter-jet-low-poly-264680 
* Speech-to-Text Module: Utilized from Apple SpeechRecognizer
* Cockpit Image: https://upload.wikimedia.org/wikipedia/commons/5/54/F-15_Eagle_Cockpit.jpg
* Bird Strike Image: https://upload.wikimedia.org/wikipedia/commons/d/de/F16_after_bird_strike.jpg
* App Icon Image: AI-generated from OpenAI ChatGPT
* Audio (Wind at base & Engine in flight): AI-generated from https://huggingface.co/spaces/haoheliu/audioldm2-text2audio-text2music
