#-------------------------------------------------------------------------------
# Name:        module1
# Purpose:
#
# Author:      tbpk7658
#
# Created:     19/06/2019
# Copyright:   (c) tbpk7658 2019
# Licence:     <your licence>
#-------------------------------------------------------------------------------


from scipy.stats import chi2
import matplotlib.pyplot as plt
import numpy as np

def main():
    fig, ax = plt.subplots(1, 1)
    df = 5
    loc = 7
    scale = 2

    mean, var, skew, kurt = chi2.stats(df, moments='mvsk')
    #x = np.linspace(chi2.ppf(0.01, df, loc, scale),chi2.ppf(0.99, df, loc, scale), 20)
    valmax = int(chi2.ppf(0.99, df, loc, scale)) + 1
    if (valmax % 2 !=0): valmax = valmax + 1
    valmax= 46
    x = np.linspace(0 , valmax, valmax +1)

    print (x)
    proba = chi2.pdf(x, df, loc, scale)
    vs = map(repr, proba.tolist())
    print (" ".join(list(vs)).replace (".",","))
    #print (" ".join(proba.tolist()))
    #print (" ".join().replace(".",","))
    ax.plot(x, proba,'r-', lw=5, alpha=0.6, label='chi2 pdf')

    #rv = chi2(df, loc, scale)
    #ax.plot(x, rv.pdf(x), 'k-', lw=2, label='frozen pdf')
    #vals = chi2.ppf([0.001, 0.5, 0.999], df, loc, scale)
    #np.allclose([0.001, 0.5, 0.999], chi2.cdf(vals, df, loc, scale))
    #r = chi2.rvs(df,  loc = loc, scale = scale ,  size=1000)
    #ax.hist(r, density=True, histtype='stepfilled', alpha=0.2)
    #ax.legend(loc='best', frameon=False)

    plt.show()


if __name__ == '__main__':
    main()
