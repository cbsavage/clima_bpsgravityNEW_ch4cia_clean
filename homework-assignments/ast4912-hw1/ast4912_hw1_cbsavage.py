# Catalina Savage
# AST 4912
# Homework 1


# import necessary packages
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd



# read in data from Figures 6 & 8 with Pandas

# FIGURE 6
i_dat6 = pd.read_fwf( 'inner_edge_Fig6.325.txt', comment='=', skiprows=1 ) # inner edge
o_dat6 = pd.read_fwf( 'outer_edge_Fig6.322.txt', skiprows=1 )              # outer edge

# print inner Figure 6 data to show data read-in works
i_dat6


# FIGURE 8
i_dat8 = pd.read_fwf( 'inneredge_Fig8.txt' )  # inner edge
# i_dat8 = pd.read_csv( 'inneredge_Fig8.txt', sep='\t', skiprows=range(1,2) ) # tested this earlier, did not work
o_dat8 = pd.read_fwf( 'outer_edge_Fig8.txt' ) # outer edge

# print inner Figure 8 data to show data read-in works
i_dat8



# Organize data to plot

# remove NaNs
i_dat6 = i_dat6.dropna()
o_dat6 = o_dat6.dropna()

# empty lists separate tables
i_sepdat = []
o_sepdat = []

# list of start-end lines for data frames
i_skip = [ 0, 174, 319, 464, 667 ]
o_skip = [ 0, 114, 209, 304, 437 ]


# inner and outer edge columns repeat 5 times, therefore loop over 5 times

for i in range( len(i_skip) ):
    idxi = i_skip[ i ]                         # inner initial index
    idxj = i_skip[ i ] + 27                    # inner final index
    i_subdat = i_dat6.iloc[ idxi:(idxj+1), : ] # remove subset for inner column/row set
    i_sepdat.append( i_subdat )                # append inner subsets to list

for o in range( len(o_skip) ):
    idxo = o_skip[ o ]                         # outer initial index
    idxp = o_skip[ o ] + 17                    # outer final index
    o_subdat = o_dat6.iloc[ idxo:(idxp+1), : ] # remove subset for outer column/row set
    o_sepdat.append( o_subdat )                # append outer subsets to list


# effective temperatures derived from Kopparapu et al

# inner edge
Teff0 = i_sepdat[ 0 ] # 2600 K
Teff1 = i_sepdat[ 1 ] # 3800 K
Teff2 = i_sepdat[ 2 ] # 4800 K
Teff3 = i_sepdat[ 3 ] # 5800 K
Teff4 = i_sepdat[ 4 ] # 7200 K

# outer edge
Teff5 = o_sepdat[ 0 ] # 2600 K
Teff6 = o_sepdat[ 1 ] # 3800 K
Teff7 = o_sepdat[ 2 ] # 4800 K
Teff8 = o_sepdat[ 3 ] # 5800 K
Teff9 = o_sepdat[ 4 ] # 7200 K



# 1) Recreate both planetary albedo plots (with labels) from Figure 6


# Surface Temperature vs Planetary Albedo

plt.figure( figsize=(6,5) )

# plot planetary albedo as a function of temperature
plt.plot( Teff0['TGO'].astype(float), Teff0['PALB'].astype(float), label='$T_{eff}$ = 2600 K' )
plt.plot( Teff1['TGO'].astype(float), Teff1['PALB'].astype(float), label='$T_{eff}$ = 3800 K' )
plt.plot( Teff2['TGO'].astype(float), Teff2['PALB'].astype(float), label='$T_{eff}$ = 4800 K' )
plt.plot( Teff3['TGO'].astype(float), Teff3['PALB'].astype(float), label='$T_{eff}$ = 5800 K' )
plt.plot( Teff4['TGO'].astype(float), Teff4['PALB'].astype(float), label='$T_{eff}$ = 7200 K' )
# .dtype() didn't work, object wasn't callable

# axes parameters
plt.xlabel( 'Surface Temperature (K)' )
plt.ylabel( 'Planetary Albedo' )

plt.xticks( np.arange(200, 2201, 200) )
# plt.yticks( np.arange(0, 0.40, 0.05) )

plt.xlim( [200, 2201] )
plt.ylim( [0, 0.40] )

plt.title( 'Inner Edge, Pt. 1' )

plt.legend( loc='upper right', reverse=True )

plt.show()


# Partial Pressure of CO2 vs. Planetary Albedo

plt.figure( figsize=(6,5) )

# plot planetary albedo as a function of CO2 partial pressure
plt.plot( Teff5['#pCO2(bar)'].astype(float), Teff5['ALBEDO'].astype(float), label='$T_{eff}$ = 2600 K' )
plt.plot( Teff6['#pCO2(bar)'].astype(float), Teff6['ALBEDO'].astype(float), label='$T_{eff}$ = 3800 K' )
plt.plot( Teff7['#pCO2(bar)'].astype(float), Teff7['ALBEDO'].astype(float), label='$T_{eff}$ = 4800 K' )
plt.plot( Teff8['#pCO2(bar)'].astype(float), Teff8['ALBEDO'].astype(float), label='$T_{eff}$ = 5800 K' )
plt.plot( Teff9['#pCO2(bar)'].astype(float), Teff9['ALBEDO'].astype(float), label='$T_{eff}$ = 7200 K' )

plt.xlabel( '$CO_{2}$ Partial Pressure (bar)' )
plt.ylabel( 'Planetary Albedo' )

plt.xscale( 'log' )
plt.yticks( np.arange(0.1, 0.61, 0.1) )

plt.xlim( [10**0, 10**2] )
plt.ylim( [0.1, 0.7] )

plt.legend( loc='upper right', reverse=True )

plt.title( 'Outer Edge, Pt. 1' ) 

plt.show()
# note to self: made this observation before, but plt.show() seems to make a difference



# 2) Recreate both SEFF plots from Figure 6

# note to self: S_eff is effective solar flux

# Surface Temperature vs Effective Solar Flux

plt.figure( figsize=(6,5) )

plt.plot( Teff0['TGO'].astype(float), Teff0['SEFF'].astype(float), label='$T_{eff}$ = 2600 K' )
plt.plot( Teff1['TGO'].astype(float), Teff1['SEFF'].astype(float), label='$T_{eff}$ = 3800 K' )
plt.plot( Teff2['TGO'].astype(float), Teff2['SEFF'].astype(float), label='$T_{eff}$ = 4800 K' )
plt.plot( Teff3['TGO'].astype(float), Teff3['SEFF'].astype(float), label='$T_{eff}$ = 5800 K' )
plt.plot( Teff4['TGO'].astype(float), Teff4['SEFF'].astype(float), label='$T_{eff}$ = 7200 K' )

plt.xlabel( 'Surface Temperature (K)' )
plt.ylabel( '$S_{eff}$' )

plt.xticks( np.arange(200, 2201, 200) )

plt.xlim( [200, 2200] )
plt.ylim( [0.2, 1.6] )

plt.legend( loc='lower right', reverse=True )

plt.title( 'Inner Edge, Pt. 2' )

plt.show()


# Partial Pressure of CO2 vs. Effective Solar Flux

plt.figure( figsize=(6,5) )

plt.plot( Teff5['#pCO2(bar)'].astype(float), Teff5['Seff'].astype(float), label='$T_{eff}$ = 2600 K' )
plt.plot( Teff6['#pCO2(bar)'].astype(float), Teff6['Seff'].astype(float), label='$T_{eff}$ = 3800 K' )
plt.plot( Teff7['#pCO2(bar)'].astype(float), Teff7['Seff'].astype(float), label='$T_{eff}$ = 4800 K' )
plt.plot( Teff8['#pCO2(bar)'].astype(float), Teff8['Seff'].astype(float), label='$T_{eff}$ = 5800 K' )
plt.plot( Teff9['#pCO2(bar)'].astype(float), Teff9['Seff'].astype(float), label='$T_{eff}$ = 7200 K' )

plt.xlabel( '$CO_{2}$ Partial Pressure (bar)' )
plt.ylabel( '$S_{eff}$' )

plt.xscale( 'log' )
plt.yticks( np.arange(0.15, 0.56, 0.05) )

plt.xlim( [10**0, 10**2] )
plt.ylim( [0.15, 0.60] )

plt.legend( loc='upper right', reverse=True )

plt.title( 'Outer Edge, Pt. 2' )

plt.show()



# All plots together, as shown in Kopparapu et al


# inner edge

# make subplot
i_fig, ( i_ax1, i_ax2 ) = plt.subplots( 1, 2, figsize=(10,5) )

# Surface Temperature vs Planetary Albedo
i_ax1.plot( Teff0['TGO'].astype(float), Teff0['PALB'].astype(float), label='$T_{eff}$ = 2600 K' )
i_ax1.plot( Teff1['TGO'].astype(float), Teff1['PALB'].astype(float), label='$T_{eff}$ = 3800 K' )
i_ax1.plot( Teff2['TGO'].astype(float), Teff2['PALB'].astype(float), label='$T_{eff}$ = 4800 K' )
i_ax1.plot( Teff3['TGO'].astype(float), Teff3['PALB'].astype(float), label='$T_{eff}$ = 5800 K' )
i_ax1.plot( Teff4['TGO'].astype(float), Teff4['PALB'].astype(float), label='$T_{eff}$ = 7200 K' )

i_ax1.set_xlabel( 'Surface Temperature (K)' )
i_ax1.set_ylabel( 'Planetary Albedo' )

i_ax1.set_xticks( np.arange(200, 2201, 200) ) #, fontsize=4 )
# i_ax1.set_yticks( np.arange(0, 0.40, 0.05) ) #, fontsize=4 )

i_ax1.set_xlim( [200, 2201] )
i_ax1.set_ylim( [0, 0.40] )

i_ax1.legend( loc='upper right' )

# Surface Temperature vs Effective Solar Flux
i_ax2.plot( Teff0['TGO'].astype(float), Teff0['SEFF'].astype(float), label='$T_{eff}$ = 2600 K' )
i_ax2.plot( Teff1['TGO'].astype(float), Teff1['SEFF'].astype(float), label='$T_{eff}$ = 3800 K' )
i_ax2.plot( Teff2['TGO'].astype(float), Teff2['SEFF'].astype(float), label='$T_{eff}$ = 4800 K' )
i_ax2.plot( Teff3['TGO'].astype(float), Teff3['SEFF'].astype(float), label='$T_{eff}$ = 5800 K' )
i_ax2.plot( Teff4['TGO'].astype(float), Teff4['SEFF'].astype(float), label='$T_{eff}$ = 7200 K' )

i_ax2.set_xlabel( 'Surface Temperature (K)' )
i_ax2.set_ylabel( '$S_{eff}$' )

i_ax2.set_xticks( np.arange(200, 2201, 200) )
# i_ax2.set_yticks( np.arange(0,0.41,0.05) )

i_ax2.set_xlim( [200, 2200] )
i_ax2.set_ylim( [0.2, 1.6] )
# i_ax2.set_ylim( np.arange(0, 0.41, 0.05) )

i_ax2.legend( loc='lower right', reverse=True )

plt.show()


# outer edge

o_fig, ( o_ax1, o_ax2 ) = plt.subplots( 1, 2, figsize=(10,5) )

# CO2 Partial Pressure vs Planetary Albedo
o_ax1.plot( Teff5['#pCO2(bar)'].astype(float), Teff5['ALBEDO'].astype(float), label='$T_{eff}$ = 2600 K' )
o_ax1.plot( Teff6['#pCO2(bar)'].astype(float), Teff6['ALBEDO'].astype(float), label='$T_{eff}$ = 3800 K' )
o_ax1.plot( Teff7['#pCO2(bar)'].astype(float), Teff7['ALBEDO'].astype(float), label='$T_{eff}$ = 4800 K' )
o_ax1.plot( Teff8['#pCO2(bar)'].astype(float), Teff8['ALBEDO'].astype(float), label='$T_{eff}$ = 5800 K' )
o_ax1.plot( Teff9['#pCO2(bar)'].astype(float), Teff9['ALBEDO'].astype(float), label='$T_{eff}$ = 7200 K' )

o_ax1.set_xlabel( '$CO_{2}$ Partial Pressure (bar)' )
o_ax1.set_ylabel( 'Planetary Albedo' )

o_ax1.set_xscale( 'log' )
o_ax1.set_yticks( np.arange(0.1, 0.61, 0.1) )

o_ax1.set_xlim( [10**0, 10**2] )
o_ax1.set_ylim( [0.1, 0.7] )

o_ax1.legend( loc='upper right', reverse=True )

# CO2 Partial Pressure vs Effective Solar Flux
o_ax2.plot( Teff5['#pCO2(bar)'].astype(float), Teff5['Seff'].astype(float), label='$T_{eff}$ = 2600 K' )
o_ax2.plot( Teff6['#pCO2(bar)'].astype(float), Teff6['Seff'].astype(float), label='$T_{eff}$ = 3800 K' )
o_ax2.plot( Teff7['#pCO2(bar)'].astype(float), Teff7['Seff'].astype(float), label='$T_{eff}$ = 4800 K' )
o_ax2.plot( Teff8['#pCO2(bar)'].astype(float), Teff8['Seff'].astype(float), label='$T_{eff}$ = 5800 K' )
o_ax2.plot( Teff9['#pCO2(bar)'].astype(float), Teff9['Seff'].astype(float), label='$T_{eff}$ = 7200 K' )

o_ax2.set_xlabel( '$CO_{2}$ Partial Pressure (bar)' )
o_ax2.set_ylabel( '$S_{eff}$' )

o_ax2.set_xscale( 'log' )
o_ax2.set_yticks( np.arange(0.15, 0.56, 0.05) )

o_ax2.set_xlim( [10**0, 10**2] )
o_ax2.set_ylim( [0.15, 0.60] )

o_ax2.legend( loc='upper right', reverse=True )

plt.show()



# 3) Also, recreate the habitable zone plot with labels, similar to Figure 8 (please do not worry about adding the green shaded color).
# For now just add the curves, do not worry about adding the planet points or legend.

plt.figure( figsize=(6,5) )

# plot effective stellar temperature as a function of effective flux
plt.plot( i_dat8['SEFF'], i_dat8['TEFF'], label='Runaway greenhouse' )
plt.plot( o_dat8['SEFF'], o_dat8['TEFF'], label='Early Mars' )

plt.xlabel( 'Effective flux incident on the planet (S/$S_{O}$)' )
plt.ylabel( 'Steller effective temperature $T_{eff}$(K)' )

plt.xticks( np.arange(0, 2.21, 0.2) )
plt.yticks( np.arange(3000, 7001, 500) )

plt.xlim( [2.2, 0] )
plt.ylim( [2550, 7250] )

plt.legend( loc='lower left' ) #, reverse=True )

plt.title( 'Our Habitable Zone' ) 

plt.show()
