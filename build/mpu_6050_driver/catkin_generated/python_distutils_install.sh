#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/ubuntu/htn_ws/src/smart_heal"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/ubuntu/htn_ws/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/ubuntu/htn_ws/install/lib/python2.7/dist-packages:/home/ubuntu/htn_ws/build/mpu_6050_driver/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/ubuntu/htn_ws/build/mpu_6050_driver" \
    "/usr/bin/python2" \
    "/home/ubuntu/htn_ws/src/smart_heal/setup.py" \
     \
    build --build-base "/home/ubuntu/htn_ws/build/mpu_6050_driver" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/ubuntu/htn_ws/install" --install-scripts="/home/ubuntu/htn_ws/install/bin"
