import pyfits
import numpy as np
from matplotlib import pyplot as plt
from skimage import viewer
from skimage.viewer.plugins import lineprofile

img = pyfits.open('/Users/Alberto/Desktop/Test_image_raw.fits')
#plt.hist(img,256,[0,256]); plt.show()
new_viewer = viewer.ImageViewer(img)
new_viewer += lineprofile.LineProfile()
new_viewer.show()
