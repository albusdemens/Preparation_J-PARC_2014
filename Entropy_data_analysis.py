# AC, DTU, April 2014
# Code written in preparation of the J-PARC beamtime
# First step to locate blobs is adaptive equalization
# Source: http://scikit-image.org/docs/0.9.x/auto_examples/plot_equalize.html

import matplotlib.pyplot as plt
import pyfits

from skimage import data
from skimage.filter.rank import entropy
from skimage.morphology import disk
from skimage.util import img_as_ubyte

file = pyfits.open('/Users/Alberto/Desktop/Test_image_raw.fits')
image = file[0].data
fig, (ax0, ax1) = plt.subplots(ncols=2, figsize=(10, 4))

img0 = ax0.imshow(image, cmap=plt.cm.gray)
ax0.set_title('Image')
ax0.axis('off')
plt.colorbar(img0, ax=ax0)

img1 = ax1.imshow(entropy(image, disk(3)), cmap=plt.cm.jet)
ax1.set_title('Entropy')
ax1.axis('off')
plt.colorbar(img1, ax=ax1)

plt.show()
