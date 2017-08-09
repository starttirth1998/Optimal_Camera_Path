
->  First convert the video into frames using ffmpeg.

->  Frames are splitted so that load can be distributed.

Files to be used in order.

1.  image_store.m
->  This file stores the features and image of all the frames.

2.  find_transform.m
->  This file finds out the transform between each consecutive frames.

3.  merge.m
->  This file is used to merge all the transforms found using distributed frames.
->  From here we have only 1 mat file.

4.  ncum_transform.m
->  This file converts our discrete transform between consecutive frames to cummulative movement of camera.

5.  optimize.m
->  This file optimize x,y and theta parameter.

6.  plotting_cum.m
->  Debugging file to check the optimized path and the orignal camera path.

6.  nnew_transform.m
->  This file finds the transform needed to convert our original camera path to optimized camera path.

7.  smooth_transform.m
->  This file is used to convert all the frames to get new optimized frames.

8.  crop_image.m
->  This file crops the center 80% of the original frame.
->  We can change the value of p to change the size of cropped image.

9.  check.m
->  This file is used to save all the image frames.

->  Using ffmpeg once again we can generate the video of this new optimized frame.
