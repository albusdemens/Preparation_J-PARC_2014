# AC, DTU, April 2014
# Code written in preparation of the J-PARC beamtime
# First step to locate blobs is adaptive equalization
# Source: http://scikit-image.org/docs/0.9.x/auto_examples/plot_equalize.html

import pyfits
import matplotlib
import matplotlib.pyplot as plt
import numpy as np
import pylab as py
import matplotlib.pyplot as plt
import matplotlib.cm as cm
from skimage import data, img_as_float
from skimage import exposure
from skimage.filter.rank import entropy

file = pyfits.open('/Users/Alberto/Desktop/Test_image_raw.fits')
img = file[0].data
img1 = ax1.imshow(entropy(img, disk(5)), cmap=plt.cm.jet)
# Conceptually, equalizing and rescaling exposure are the same thing
p2, p98 = np.percentile(img, (2, 98))
img_rescale = exposure.rescale_intensity(img, in_range=(p2, p98))
img_adapteq = exposure.equalize_adapthist(img_rescale, clip_limit=0.1)
#img_eq = exposure.equalize_hist(img_adapteq)
#print img_eq
plt.imshow(img1)
plt.show()
