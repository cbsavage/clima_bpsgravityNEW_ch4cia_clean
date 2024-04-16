# import necessary packages
import numpy as np
import matplotlib.pyplot as plt


# hw3_dat = []

# # with open( 'homework-assignments/ast4912-hw3/ast4912-hw3-submission/fort.80', 'r' ) as fort:
# with open( 'fort.80', 'r' ) as fort:
#     for line in fort:
#         itertn, val = map( float, line.split() )
#         hw3_dat.append( (itertn, val) )

# new_iter = [ f[0] for f in hw3_dat ]
# new_val  = [ f[1] for f in hw3_dat ]

nwt = np.loadtxt( 'fort.80' )

num  = nwt[ :, 0 ]
conv = nwt[ :, 1 ]


# plot Fortran data

plt.figure( figsize=(6,5) )
plt.plot( num, conv )

plt.xlabel( 'X', fontsize=10 )
plt.ylabel( 'Y', fontsize=10 )

# plt.ylim( [-6.0,-4.0] )
# plt.ylim( [-30,-3.0] )

plt.title( "Convergence by Newton's Method" ) # - Fort 80 Edition", fontsize=12 )

plt.show()