# Catalina Savage
# AST 4912
# Homework 2 - Plot Edition


# import necessary packages
import numpy as np
import matplotlib.pyplot as plt
# import pandas as pd
# from scipy import *
import os


# PLOTTING SHIT FROM FORTRAN AHHHHHHHHHHHH

# read in data from file with np
# hw2_dat = np.loadtxt( 'homework-assignments/ast4912-hw2/ast4912_hw2_data.dat' )
hw2_dat = []
with open( 'homework-assignments/ast4912-hw2/ast4912_hw2_data.dat', 'r' ) as data:
    for line in data:
        iteration, value = map( float, line.split() )
        hw2_dat.append( (iteration, value) )
    
# hw2_dat = pd.read_csv( 'ast4912_hw2_data.txt' )
# print( hw2_dat )

new_iter = [ d[0] for d in hw2_dat ]
new_val  = [ d[1] for d in hw2_dat ]


# plot Fortran data
plt.figure( figsize=(8,6) )
plt.plot( new_iter, new_val )
# plt.savefig( 'rough_dat2.pdf' )
# PDF plot didn't save the title and axes labels in it

plt.xlabel( 'Convergence data', fontsize=12 )
plt.ylabel( 'some y-axis', fontsize=12 )

plt.title( "Convergence by Newton's Method" )

plt.show()












