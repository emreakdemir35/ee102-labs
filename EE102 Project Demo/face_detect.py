import face_recognition
import cv2

# Start the webcam
video_capture = cv2.VideoCapture(0)

print("Press 'q' to quit.")

while True:
    # Grab a single frame from the video
    ret, frame = video_capture.read()

    # Convert the image from BGR (OpenCV format) to RGB (face_recognition format)
    rgb_frame = frame[:, :, ::-1]

    # Detect face locations
    face_locations = face_recognition.face_locations(rgb_frame)

    # Draw rectangles and print coordinates
    for i, (top, right, bottom, left) in enumerate(face_locations):
        # Draw a box around the face
        cv2.rectangle(frame, (left, top), (right, bottom), (0, 255, 0), 2)

        # Print the coordinates in the console
        print(f"Face {i+1}: Top={top}, Right={right}, Bottom={bottom}, Left={left}")

        # Optionally, label the face number on the frame
        cv2.putText(frame, f"Face {i+1}", (left, top - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 255, 0), 1)

    # Display the resulting frame
    cv2.imshow('Real-Time Face Detection', frame)

    # Break loop on 'q' key press
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# Release resources
video_capture.release()
cv2.destroyAllWindows()
