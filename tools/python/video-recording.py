import pyautogui
import numpy as np
import cv2
import keyboard
# pip install opencv-python
# pip install pyautogui
# pip install keyboard
# pip install numpy


def Screen_Recording():
    while True:
        # Press R to Start Recording
        if keyboard.is_pressed('r'):
            print("Recording Has been Started...")
            # resolution
            capture_area = (1920, 1080)

            codec = cv2.VideoWriter_fourcc(*'mp4v')
            filename = "Your_Recording.mp4"

            # Frame per Second
            fps = 60.0
            output_video = cv2.VideoWriter(filename, codec, fps, capture_area)
            while True:
                image = pyautogui.screenshot()
                Image_frame = np.array(image)
                Image_frame = cv2.cvtColor(Image_frame, cv2.COLOR_BGR2RGB)
                output_video.write(Image_frame)
                cv2.waitKey(1)
                # Press Q button to Stop recording
                if keyboard.is_pressed('q'):
                    print("Recording Has been Stopped...")
                    break


output_video.release()
cv2.destroyAllWindows()
Screen_Recording()
