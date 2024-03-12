program clone_outer_edge_Fig6
    Implicit None
    ! read in this file: outer_edge_Fig6.322
    ! variables:
    ! #pCO2(bar), Seff, FTIR, FTSOL, ALBEDO
    
    real               :: pCO2(bar), Seff, FTIR, FTSOL, ALBEDO
    integer, parameter :: rows
    integer            :: a, b, inner1, inner2
    dimension          :: pCO2(bar)(rows), Seff(rows), FTIR(rows), FTSOL(rows), ALBEDO(rows)
    
    rows   = 19
    inner1 = 3
    inner2 = 4
    
    ! open file and make copy
    open( unit=inner1, file='outer_edge_Fig6.322.txt' )
    open( unit=inner2, file='outer_edge_Fig6.322copy.txt' )
    
        read( inner1, * )
        write( inner2, 40 )
        
        do a = 1, rows
            read( inner1, * )pCO2(i), SeFF(i), FTIR(i), FTSOL(i), ALBEDO(i)
            write( inner2, 50 )pCO2(i), SeFF(i), FTIR(i), FTSOL(i), ALBEDO(i)
        enddo
        
        40 format( '#pCO2(bar)   Seff        FTIR            FTSOL        ALBEDO' )
        50 format( f6.1,1x, f7.4, 1x, f7.4, 4x, f7.2, 4x, f7.2 )

    end program clone_outer_edge_Fig6
    
    ! This Fortran 90 program reads data from a file, processes it, and writes the processed data to another file. Here's a step-by-step breakdown of what the program does:

        ! 1. **Variable Declaration**: The program declares several variables. `TEFF`, `SEFF`, `ALBEDO`, `FTSOL`, and `FTIR` are arrays of 
        ! real numbers with `rows` elements. `rows` is a constant integer set to 24. `i`, `j`, `inner1`, and `inner2` are integer variables.

        ! 2. **File Opening**: The program opens two files. The first file, 'inneredge_Fig8.txt', is opened for reading with the unit number
        ! `inner1` (3). The second file, 'inneredge_Fig8clone.txt', is opened for writing with the unit number `inner2` (4).

        ! 3. **Data Reading and Writing**: The program enters a loop that runs `rows` times. In each iteration of the loop, it reads a line 
        ! from the first file into the arrays `TEFF`, `SEFF`, `ALBEDO`, `FTSOL`, and `FTIR`. It then writes these values to the second file in a specific format.

        ! The `format` statements (40 and 50) specify the format in which data is written to the second file. The `read` statement with a `*` skips one 
        ! line from the first file before the loop starts.

    ! In summary, this program reads data from 'inneredge_Fig8.txt', skips the first line, and then writes the remaining data to 'inneredge_Fig8clone.txt' in a specific format. The data represents different parameters (`TEFF`, `SEFF`, `ALBEDO`, `FTSOL`, `FTIR`) for each of the 24 rows.
    ! The specific meaning of these parameters would depend on the context in which this program is used.