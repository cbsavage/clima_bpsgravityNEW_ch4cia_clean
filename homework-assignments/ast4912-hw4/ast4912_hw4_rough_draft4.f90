! Catalina Savage
! AST 4912
! Homework 4
    
    
program clone_outer_edge_Fig6
    Implicit None
    ! read in this file: outer_edge_Fig6.322
    ! variables: #pCO2(bar), Seff, FTIR, FTSOL, ALBEDO
    
    real                 :: pCO2, Seff, FTIR, FTSOL, ALBEDO
    integer              :: i, j, inner1, inner2
    ! integer, parameter   :: rows, lines
    integer, parameter   :: rows  = 24 ! tried using 'data' as integer/parame but couldn't
    integer, parameter   :: lines = 21
    ! character( len=100 ) :: line        ! data in each line in tables
    
    ! unit numbers
    ! inner1 = 10
    ! inner2 = 20
    inner1 = 3
    inner2 = 4
    
    ! parameters
    ! rows  = 24
    ! lines = 21

    ! open file and make copy
    open( unit= inner1, file='outer_edge_Fig6.322.txt' )
    open( unit= inner2, file='outer_edge_Fig6.322copy.txt' )
    
        read(inner1, * ) ! skips header lines
        ! write( inner2, 40 )
        write(inner2, '(A)' ) "#pCO2(bar)   Seff        FTIR            FTSOL        ALBEDO"
        
        ! copy data into new file
        do i = 1, rows * lines
            read(inner1, * )  pCO2, SeFF, FTIR, FTSOL, ALBEDO
            write(inner2, '(f6.1, 1x, f7.5, 1x, f14.6, 1x, f14.6, 1x, f12.6)' ) pCO2, SeFF, FTIR, FTSOL, ALBEDO
            ! write(inner2, '(F6.1, 1X, F7.5, 1X, E14.6, 1X, E14.6, 1X, F12.6)') pCO2, Seff, FTIR, FTSOL, ALBEDO
        enddo
        ! do i = 1, rows
            ! do j = 1, lines
                ! read( inner1, '(A)' )  line
                ! write( inner2, '(A)' ) line
            !enddo
        ! enddo
        
    ! 40  format( '#pCO2(bar)   Seff        FTIR            FTSOL        ALBEDO' )
    ! 50  format( f6.1, 1x, f7.5, 1x, f14.6, 1x, f14.6, 1x, f12.6 )
    ! 1pe total-digits.digits-after-decimal
        
        close( unit= inner1 )
        close( unit= inner2 )


    end program clone_outer_edge_Fig6
