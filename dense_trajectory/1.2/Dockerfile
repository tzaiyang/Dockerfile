FROM ubuntu:18.04

RUN apt update && apt -y install cmake make gcc g++-4.8 python wget

RUN mkdir /dense_trajectory
WORKDIR /dense_trajectory

RUN wget https://lear.inrialpes.fr/people/wang/download/OpenCV-2.4.2.tar.bz2 && \
    wget https://lear.inrialpes.fr/people/wang/download/ffmpeg-0.11.1.tar.bz2 && \
    wget https://lear.inrialpes.fr/people/wang/download/dense_trajectory_release_v1.2.tar.gz

RUN tar -xjvf OpenCV-2.4.2.tar.bz2 && tar -xjvf ffmpeg-0.11.1.tar.bz2 && tar -xzvf dense_trajectory_release_v1.2.tar.gz

RUN cd ffmpeg-0.11.1 && ./configure --disable-yasm && make -j8 && make install && cd ../

RUN cd OpenCV-2.4.2 && cmake -D CMAKE_CXX_COMPILER=g++-4.8 . && make -j8 && make install && cd ../

RUN ln -s /usr/bin/g++-4.8 /usr/bin/g++
RUN cd dense_trajectory_release_v1.2 && make -j8

RUN apt -y install vim
WORKDIR /dense_trajectory/dense_trajectory_release_v1.2/

CMD ["bash"]
