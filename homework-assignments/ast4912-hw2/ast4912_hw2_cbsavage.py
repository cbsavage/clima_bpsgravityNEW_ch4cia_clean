# Catalina Savage
# AST 4912
# Homework 2 - Plot Edition


# import necessary packages
import numpy as np
import matplotlib.pyplot as plt


hw2_dat = []

with open( 'homework-assignments/ast4912-hw2/ast4912_hw2_data.dat', 'r' ) as data:
    for line in data:
        iteration, value = map( float, line.split() )
        hw2_dat.append( (iteration, value) )

new_iter = [ d[0] for d in hw2_dat ]
new_val  = [ d[1] for d in hw2_dat ]


# plot Fortran data

plt.figure( figsize=(6,5) )
plt.plot( new_iter, new_val )

plt.xlabel( 'X', fontsize=12 )
plt.ylabel( 'Y', fontsize=12 )

plt.title( "Convergence by Newton's Method", fontsize=14 )

plt.show()