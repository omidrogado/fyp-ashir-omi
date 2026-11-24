# ML Engine: Lafzio

This workspace contains the machine learning pipelines, datasets, and conversion scripts for:
1. **Sign Language Recognition (DTW / MediaPipe):**
   - MediaPipe hand landmark extraction (`hand_landmarker.task`)
   - Dynamic Time Warping (DTW) sequence comparison against baseline sign dictionaries.
2. **Audio Danger Detection (YAMNet):**
   - Audio classification for danger sounds (sirens, smoke alarms, honks, glass break) using MobileNet/YAMNet TFLite models.

## Folder Structure
- `sign_dictionary/`: Baseline landmark arrays for standardized signs (alphabet, numbers, common phrases).
- `scripts/`: Conversion, training, and testing scripts.
