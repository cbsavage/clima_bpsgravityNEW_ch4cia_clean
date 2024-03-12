import numpy as np
import matplotlib.pyplot as plt

skip = [3,195, 355, 515, 739]

for i in range(len(skip)):


    name = ['inner_edge_Fig6.325']
    A = np.genfromtxt(name[0],dtype='float32',skip_header = skip[i], max_rows=28)

    Teff = A[:,0]
    Seff = A[:,1]
    PALB = A[:,2]
    FH2O = A[:,3]
    FTIR = A[:,4]
    FTSO = A[:,5]


# PALB vs Temp for 2600, 3800 4800, 5800, 7200 K

    plt.subplot(121)
    plt.plot(Teff, PALB)
    plt.xlabel('Surface Temperature (K)')
    plt.ylabel('Planetary Albedo')
    plt.axis([200, 2200, 0, 0.4])
    
    plt.subplot(122)
    plt.plot(Teff, Seff)
    plt.xlabel('Surface Temperature (K)')
    plt.ylabel('S_${EFF}$')
    plt.axis([200, 2200, 0.3, 1.6])