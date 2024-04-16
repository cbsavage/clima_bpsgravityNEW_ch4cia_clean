! Catalina Savage
! AST 4912
! Homework 4
    
    
program clone_outer_edge_Fig6
    Implicit None
    ! read in this file: outer_edge_Fig6.322
    ! variables: #pCO2(bar), Seff, FTIR, FTSOL, ALBEDO
    
    real                 :: pCO2, Seff, FTIR, FTSOL, ALBEDO
    integer              :: i, j, inner1, inner2
    integer, parameter   :: tables = 24 ! tried using 'data' as integer/parame but couldn't
    integer, parameter   :: info = 21
    character( len=100 ) :: line        ! data in each line in tables
    
    ! unit numbers
    inner1 = 10
    inner2 = 20

    ! open file and make copy
    open( unit=inner1, file='outer_edge_Fig6.322.txt' )
    open( unit=inner2, file='outer_edge_Fig6.322copy.txt' )
    
    ! copy data into new file
    do i = 1, tables
        do j = 1, info
            read( inner1, '(A)' )  line
            write( inner2, '(A)' ) line
        enddo
    enddo


    end program clone_outer_edge_Fig6
