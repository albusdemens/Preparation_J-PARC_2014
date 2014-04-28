# AC, DTU, April 2014
# Code written in preparation of the J-PARC beamtime
# First step to locate blobs is adaptive equalization
# Source: http://scikit-image.org/docs/0.9.x/auto_examples/plot_equalize.html

import pyfits
import matplotlib.pyplot as plt
from scipy import misc
from scipy import ndimage
import numpy as np
import pylab as py
import matplotlib.cm as cm

from skimage import data, img_as_float
from skimage import exposure
from skimage.filter.rank import entropy
from skimage import data
from skimage.filter.rank import entropy
from skimage.morphology import disk
from skimage.util import img_as_ubyte

file = pyfits.open('/Users/Alberto/Desktop/Test_image_raw.fits')
image = file[0].data
med_denoised = ndimage.median_filter(image, 3)

p2, p98 = np.percentile(med_denoised, (2, 98))
img_rescale = exposure.rescale_intensity(med_denoised, in_range=(p2, p98))
plt.imshow(med_denoised)
plt.show()
