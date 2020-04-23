# Required:

## libfreenect2:
git clone https://github.com/OpenKinect/libfreenect2.git
cd libfreenect2
sudo apt-get install build-essential cmake pkg-config
sudo apt-get install libusb-1.0-0-dev

<!-- (Ubuntu 14.04 to 16.04) -->
sudo apt-get install libturbojpeg libjpeg-turbo8-dev
<!-- (Debian/Ubuntu 17.10 and newer)  -->
sudo apt-get install libturbojpeg0-dev

sudo apt-get install libglfw3-dev
mkdir build && cd build
cmake .. -DCMAKE_INSTALL_PREFIX=$HOME/freenect2
make
make install

## pylibfreenect2
(Using python 2)
pip install pylibfreenect2
- set LIBFREENECT2_INSTALL_PREFIX environmental variable
- confirm that ${LIBFREENECT2_INSTALL_PREFIX}include/libfreenect2/config.h exists
- If you have installed libfreenect2 in your custom path (e.g. ~/freenect2), make sure that freenect2/lib is in your library search path (LD_LIBRARY_PATH for linux).