FROM ubuntu:18.04

RUN apt update && apt -y --no-install-recommends install cmake make gcc g++-4.8 python wget && \
    rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/bin/g++-4.8 /usr/bin/g++

WORKDIR /tmp

RUN wget -q --no-check-certificate https://lear.inrialpes.fr/people/wang/download/OpenCV-2.4.2.tar.bz2 && \
    tar -xjf OpenCV-2.4.2.tar.bz2 && \
    cd OpenCV-2.4.2 && \
    cmake -D CMAKE_CXX_COMPILER=g++-4.8 . && \
    make -j8 && make install && \
    cd ../ && rm -rf OpenCV-2.4.2*

RUN wget -q --no-check-certificate https://lear.inrialpes.fr/people/wang/download/ffmpeg-0.11.1.tar.bz2 && \
    tar -xjf ffmpeg-0.11.1.tar.bz2 && \
    cd ffmpeg-0.11.1 && \
    ./configure --disable-yasm && \
    make -j8 && make install && \
    cd ../ && rm -rf ffmpeg-0.11.1*

# load installed opencv and ffmpeg share object library
RUN echo "/usr/local/lib" >> /etc/ld.so.conf && ldconfig -v

RUN wget -q --no-check-certificate https://lear.inrialpes.fr/people/wang/download/dense_trajectory_release_v1.2.tar.gz && \
    tar -xzf dense_trajectory_release_v1.2.tar.gz && \
    cd dense_trajectory_release_v1.2 && \
    make -j8 && \
    cd ../ && rm -rf dense_trajectory_release_v1.2.tar.gz && \
    mv dense_trajectory_release_v1.2 /dense_trajectory

WORKDIR /dense_trajectory

CMD ["bash"]
