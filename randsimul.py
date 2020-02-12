#-------------------------------------------------------------------------------
# Name:        module1
# Purpose:
#
# Author:      tbpk7658
#
# Created:     11/02/2020
# Copyright:   (c) tbpk7658 2020
# Licence:     <your licence>
#-------------------------------------------------------------------------------

from scipy import stats
import matplotlib.pyplot as plt
import numpy as np
from scipy.stats import chi2

def main():

##    xk = np.arange(7)
##    pk = (0.1, 0.2, 0.3, 0.1, 0.1, 0.0, 0.2)
##    custm = stats.rv_discrete(name='custm', values=(xk, pk))
##
##    fig, ax = plt.subplots(1, 1)
##    ax.plot(xk, custm.pmf(xk), 'ro', ms=12, mec='r')
##    ax.vlines(xk, 0, custm.pmf(xk), colors='r', lw=4)
##    plt.show()
    df = 6
    rv = chi2(df)
    r = chi2.rvs(df, size=100)
    fig, ax = plt.subplots(1, 1)
    ax.hist(r, density=True) #, histtype='stepfilled', alpha=0.2
    plt.show()
    #print (r)


if __name__ == '__main__':
    main()
