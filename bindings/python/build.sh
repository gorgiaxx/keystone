#!/bin/bash
set -e -x

cd bindings/python
sudo rm /usr/bin/python && sudo ln -s /opt/python/cp27-cp27m/bin/python /usr/bin/python; python -V

# produce builds
if [ -f /opt/python/cp36-cp36m/bin/python ];then
  /opt/python/cp36-cp36m/bin/python setup.py build
else
  python3 setup.py build
fi
