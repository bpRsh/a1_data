#!/usr/bin/env python3
# -*- coding: utf-8 -*-#
#
# Author      : Bhishan Poudel; Physics Graduate Student, Ohio University
# Date        : Dec 14, 2016
# Last update :
# Est time    :


def increase_filenumber(infile):
    """increase filenumber by 100.

    e.g.
    tmp/f606w_gal0.fits ==>  tmp/f606w_gal100.fits
    tmp/f814w_gal0.fits ==>  tmp/f814w_gal100.fits

    Caveat: We must increase number in decreasing order.
    Otherwise, file1.fits ==> file102.fits will replace existing file.

    """
    import os
    import glob
    import re
    from natsort import natsorted
    oldfiles = glob.glob(infile)
    oldfiles = natsorted(oldfiles)
    oldfiles = oldfiles[::-1]
    for oldfile in oldfiles:
        try:
            # line = tmp/f814w_gal1.fits
            pre = re.search('(.+?)(\d+)(\.\w*)', oldfile).group(1)
            num = re.search('(.+?)(\d+)(\.\w*)', oldfile).group(2)
            pst = re.search('(.+?)(\d+)(\.\w*)', oldfile).group(3)
            newnum = int(num) + 101
            newfile = pre + str(newnum) + pst
            # print(oldfile, "==> ", newfile)
            os.rename(oldfile, newfile)

        except:
            pass


if __name__ == "__main__":
    infile = 'galaxies/*.fits'
    increase_filenumber(infile)
