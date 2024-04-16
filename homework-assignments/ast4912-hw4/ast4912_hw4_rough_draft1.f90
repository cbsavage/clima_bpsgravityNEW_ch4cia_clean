program clone_outer_edge_Fig6
    Implicit None
    ! read in this file: outer_edge_Fig6.322
    ! variables:
    ! #pCO2(bar), Seff, FTIR, FTSOL, ALBEDO
    
    ! **ChatGPT gave me this so we'll see how that works
    
    real                 :: pCO2, Seff, FTIR, FTSOL, ALBEDO
    ! integer, parameter   :: rows, lines
    ! integer              :: a, b, inner1, inner2, aerr
    integer              :: a, b, inner1, inner2, aerr, rows, lines
    ! character( len=100 ) :: new_table
    character( len=100 ) :: line ! was dimensions = yada-yada-yada
    
    ! rows   = 19
    inner1 = 10 ! first unit number
    inner2 = 20 ! second unit number
    
    rows   = 24
    lines  = 21
    
    
    ! open file
    open( unit=inner1, file='outer_edge_Fig6.322.txt' ) !, status='old', action='read', iostat=aerr )
    ! if ( ios /= 0 ) then
        ! print*, 'Cannot open file'
        ! stop
    ! end if
    
    ! make copy
    open( unit=inner2, file='outer_edge_Fig6.322copy.txt' ) !, status='replace', action='write' )
    
    do a = 1, rows
        do b = 1, lines
            read( inner1, '(A)' ) line  ! pCO2(a), SeFF(a), FTIR(a), FTSOL(a), ALBEDO(a)   ! still in the initial if loop
            write( inner2, '(A)' ) line ! pCO2(a), SeFF(a), FTIR(a), FTSOL(a), ALBEDO(a) ! still in the initial if loop
            ! table_num = table_num + 1
        enddo
    enddo
            
            ! write( row, '(A,IO,A)' ) 'table_', table_num
            ! write( rows, * ) 'table_', table_num
            
        !else if ( read_table ) then
            !read( line, * ) pCO2, SeFF, FTIR, FTSOL, ALBEDO
            ! write( row, '(4F10.2)' ) pCO2, SeFF, FTIR, FTSOL, ALBEDO
            !write( rows, * ) pCO2, SeFF, FTIR, FTSOL, ALBEDO
            
        !end if
    !end do
    
    ! if ( read_table ) close( unit=rows )
    ! close( 10 )
    ! close( 20 )
    close( inner1 )
    close( inner2 )    
        
        ! 40 format( '#pCO2(bar)   Seff        FTIR            FTSOL        ALBEDO' )
        ! 50 format( f6.1,1x, f7.4, 1x, f7.4, 4x, f7.2, 4x, f7.2 )


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