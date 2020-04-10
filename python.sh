#!/usr/bin/env bash

# Install few common python packages using pip3
PYTHON_PKGS=(
    PyScaffold
    sphinx
    sphinx-autobuild
)
for pkg in "${PYTHON_PKGS[@]}"
do
    [[ -z $(pip3 list | grep "$pkg") ]] \
        && pip3 install $pkg \
        || echo "Python package '${pkg}' is already installed."
done