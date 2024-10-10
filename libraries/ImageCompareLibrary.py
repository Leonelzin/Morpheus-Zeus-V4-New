from PIL import Image
import imagehash
from robot.api.deco import keyword
from robot.libraries.BuiltIn import logger


class ImageCompareLibrary:
    @keyword("Images are similar")
    def images_are_similar(self, img1_path, img2_path):
        hash0 = imagehash.average_hash(Image.open(img1_path))
        hash1 = imagehash.average_hash(Image.open(img2_path))
        cutoff = 10  # maximum bits that could be different between the hashes
        if hash0 - hash1 > cutoff:
            raise AssertionError("Images are not similar.")
