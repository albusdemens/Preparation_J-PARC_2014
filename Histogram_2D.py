# AC, 28 April 2014
# DTU Fysik, alcer@fysik.dtu.dk
# The code below plots the intensity histogram for a fits image file
# !!! RUNS ON UBUNTU !!!

import pyfits
import numpy as np
from matplotlib import pyplot as plt
from skimage import viewer
from skimage.viewer.plugins import lineprofile
import pylab as pl

file = pyfits.open('/home/albus/Downloads/Test_image_raw.fits')
img = file[0].data
plt.hist(img,256,[0,256])
plt.hist(img, bins=np.logspace(0.1,2,50))
plt.yscale('log', nonposy='clip')
plt.show()
#new_viewer = viewer.ImageViewer(img)
#new_viewer += lineprofile.LineProfile()
#new_viewer.show()
