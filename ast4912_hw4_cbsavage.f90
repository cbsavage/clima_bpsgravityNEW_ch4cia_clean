! Catalina Savage
! AST 4912
! Homework 4
    
    
program clone_outer_edge_Fig6
    Implicit None
    ! read in this file: outer_edge_Fig6.322
    ! variables: #pCO2(bar), Seff, FTIR, FTSOL, ALBEDO
    ! note: "*" means FREE FORMAT
    
    character( len=100 ) :: header        ! data in each line in tables
    real               :: pCO2, Seff, FTIR, FTSOL, ALBEDO
    integer            :: i, j, inner1, inner2
    ! integer :: j
    integer, parameter :: rows  = 24 ! tried using 'data' as integer/parame but couldn't
    integer, parameter :: lines = 21
    dimension          :: pCO2(rows), Seff(rows), FTIR(rows), FTSOL(rows), ALBEDO(rows)
    
    ! dimension          :: pCO2(lines), Seff(lines), FTIR(lines), FTSOL(lines), ALBEDO(lines)
    
    ! unit numbers
    inner1 = 10
    inner2 = 20
    ! inner1 = 3
    ! inner2 = 4

    ! open file and make copy
    open( unit=inner1, file='outer_edge_Fig6.322.txt', action='read' )
    open( unit=inner2, file='outer_edge_Fig6.322blah.txt', action='write' )

    ! read( inner1, * ), skips 1 line
    ! write( inner2, 40 ) !40, 10  

    ! copy data into new file
    do i=1, rows
        do j=1, lines
            read( inner1, * ) pCO2, Seff, FTIR, FTSOL, ALBEDO ! header
            write( inner2, 50 ) pCO2, Seff, FTIR, FTSOL, ALBEDO ! header
            ! read( inner1, * ) pCO2(j), Seff(j), FTIR(j), FTSOL(j), ALBEDO(j)
            ! write( inner2, 50 ) pCO2(j), Seff(j), FTIR(j), FTSOL(j), ALBEDO(j)
        enddo
    enddo

    
    ! 10  format( ' ' )
    ! 30  format( '' )
    40  format( '#pCO2(bar)   Seff        FTIR            FTSOL        ALBEDO' )
    ! 50  format( f6.1, 1x, f7.4, 1x, f7.4, 4x, f7.2, 4x, f7.2 )
    50  format( f6.1, 1x, f12.9, 1x, es11.9, 1x, es11.9, 1x, es11.9 )
    ! f, floating
    ! e, exponent
    ! i, integer: i7, i9, i12
    ! 1x is spacing in between
    ! 1pe total-digits.digits-after-decimal
    ! FIND SECTION WHERE TO FORMAT EVERYTHING
        
    ! close( inner1 )
    ! close( inner2 )


    end program clone_outer_edge_Fig6
