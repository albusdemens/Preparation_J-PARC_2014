# AC, 28 April 2014
# DTU Fysik, alcer@fysik.dtu.dk
# This script selects a section of the intensity histogram and plots it
# histogram found using Histogram_2D.py

import pyfits
from scipy import ndimage
import numpy as np
from numpy import *
from matplotlib import pyplot as plt
from skimage import viewer
from skimage.viewer.plugins import lineprofile
import pylab as pl

file = pyfits.open('/Users/Alberto/Desktop/Test_image_raw.fits')
img = file[0].data
size = 512
img_filtered = ndarray((size, size), int)
for i in range(0,size):
  for j in range(0, size):
    if img[i,j] in range(50, 110):
      img_filtered[i,j] = img[i,j]
    else:
      img_filtered[i,j] = 0
plt.imshow(img_filtered)
plt.show()
