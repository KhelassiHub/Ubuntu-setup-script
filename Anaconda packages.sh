#!/bin/bash

# (base) environment auto appearing in the terminal
conda config --set auto_activate_base False

# Update
conda update conda
conda update anaconda

# Packages
conda install beautifulsoup4 notebook numpy matplotlib seaborn pandas scikit-learn
