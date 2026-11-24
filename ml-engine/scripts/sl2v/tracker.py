import cv2
import mediapipe as mp
from mediapipe.tasks import python
from mediapipe.tasks.python import vision
import urllib.request
import os

# 1. Download the required model file automatically if it's missing
model_path = "hand_landmarker.task"
if not os.path.exists(model_path):
    print("Downloading the Hand Landmarker model file...")
    url = "https://storage.googleapis.com/mediapipe-models/hand_landmarker/hand_landmarker/float16/1/hand_landmarker.task"
    urllib.request.urlretrieve(url, model_path)
    print("Download complete!")

# 2. Hardcode the hand connections (since the old drawing utils were removed)
HAND_CONNECTIONS = [
    (0, 1), (1, 2), (2, 3), (3, 4),        # Thumb
    (0, 5), (5, 6), (6, 7), (7, 8),        # Index
    (0, 9), (9, 10), (10, 11), (11, 12),   # Middle
    (0, 13), (13, 14), (14, 15), (15, 16), # Ring
    (0, 17), (17, 18), (18, 19), (19, 20), # Pinky
    (5, 9), (9, 13), (13, 17)              # Palm base
]

# 3. Configure the modern Tasks API
base_options = python.BaseOptions(model_asset_path=model_path)
options = vision.HandLandmarkerOptions(
    base_options=base_options,
    num_hands=2,
    min_hand_detection_confidence=0.5,
    running_mode=vision.RunningMode.IMAGE
)

# 4. Run the tracking loop
cap = cv2.VideoCapture(0)

with vision.HandLandmarker.create_from_options(options) as landmarker:
    while cap.isOpened():
        success, frame = cap.read()
        if not success:
            continue

        frame = cv2.flip(frame, 1)
        rgb_frame = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
        
        # Convert to MediaPipe Image format
        mp_image = mp.Image(image_format=mp.ImageFormat.SRGB, data=rgb_frame)
        
        # Run detection
        result = landmarker.detect(mp_image)
        
        # Draw the results manually
        h, w = frame.shape[:2]
        if result.hand_landmarks:
            for hand_landmarks in result.hand_landmarks:
                # Convert normalized coordinates (0 to 1) to pixel coordinates
                pts = [(int(lm.x * w), int(lm.y * h)) for lm in hand_landmarks]
                
                # Draw lines
                for a, b in HAND_CONNECTIONS:
                    cv2.line(frame, pts[a], pts[b], (0, 255, 0), 2)
                    
                # Draw dots
                for pt in pts:
                    cv2.circle(frame, pt, 4, (0, 0, 255), -1)

        cv2.imshow('Modern Hand Tracking', frame)
        
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

cap.release()
cv2.destroyAllWindows()