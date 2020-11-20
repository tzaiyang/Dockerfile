```bash
cd OpenCV-2.4.2
make build && cd build
cmake -D WITH_CUDA=OFF ../
vim OpenCV-2.4.2/modules/highgui/src/cap_ffmpeg_impl.hpp
# replace all "CodecID" to "AVCodecID"
make
```

```bash
cd ffmpeg-0.11.1
./configure --disable-yasm
make
make install
```

```bash
cd dense_trajectory_release_v1.2
vim Makefile
# Add "-L../OpenCV-2.4.2/build/lib/" to LDFLAGS
vim make/dep.py
# #!/usr/bin/env python2
```

Reference:
[dense_trajectories](https://lear.inrialpes.fr/people/wang/dense_trajectories)
[opencv_config_reference](https://docs.opencv.org/master/db/d05/tutorial_config_reference.html)
https://github.com/MTG/essentia/issues/207

