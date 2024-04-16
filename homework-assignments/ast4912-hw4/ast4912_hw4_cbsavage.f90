! Catalina Savage
! AST 4912
! Homework 4
    
    
program clone_outer_edge_Fig6
    Implicit None
    ! read in this file: outer_edge_Fig6.322
    ! variables: #pCO2(bar), Seff, FTIR, FTSOL, ALBEDO
    
    character( len=100 ) :: header        ! data in each line in tables
    real               :: pCO2, Seff, FTIR, FTSOL, ALBEDO
    integer            :: i, j, inner1, inner2
    ! integer :: j
    integer, parameter :: rows  = 24 ! tried using 'data' as integer/parame but couldn't
    integer, parameter :: lines = 21
    
    dimension          :: pCO2(rows), SeFF(rows), FTIR(rows), FTSOL(rows), ALBEDO(rows)
    ! dimension          :: pCO2(lines), SeFF(lines), FTIR(lines), FTSOL(lines), ALBEDO(lines)
    
    ! unit numbers
    ! inner1 = 10
    ! inner2 = 20
    inner1 = 3
    inner2 = 4

    ! open file and make copy
    open( unit=inner1, file='outer_edge_Fig6.322.txt' )
    open( unit=inner2, file='outer_edge_Fig6.322copy.txt' )
    
    
    ! do
        !read( inner1, * ) header
        !write( inner2, 40 ) header
        
        ! if ( line( 1:2 ) /= '# ' ) then
        ! do i=1, rows
            ! read( inner1, * )  pCO2, SeFF, FTIR, FTSOL, ALBEDO
            ! write( inner2, 50 )  pCO2, SeFF, FTIR, FTSOL, ALBEDO
        ! enddo
        ! endif
        !else
            !exit
    ! enddo
                ! write( inner2, '(5f14.6)' )  pCO2, SeFF, FTIR, FTSOL, ALBEDO
        
    read( inner1, * ) ! skips header lines
    ! write( inner2, 40 )
        
    
    ! copy data into new file
    do i=1, rows
        do j=1, lines
            read( inner1, * )  pCO2(i), SeFF(i), FTIR(i), FTSOL(i), ALBEDO(i)
            write( inner2, 50 )  pCO2(i), SeFF(i), FTIR(i), FTSOL(i), ALBEDO(i)
        enddo
    enddo
        ! do j = 1, lines
            !read( inner1, * )  pCO2(i), SeFF(i), FTIR(i), FTSOL(i), ALBEDO(i)   ! still in the initial if loop
            ! write( inner2, 50 ) pCO2(i), SeFF(i), FTIR(i), FTSOL(i), ALBEDO(i)
            !read( inner1, * )  pCO2(i), SeFF(i), FTIR(i), FTSOL(i), ALBEDO(i)   ! still in the initial if loop
            !write( inner2, 50 ) pCO2(j), SeFF(j), FTIR(j), FTSOL(j), ALBEDO(j)
        !enddo
                ! read( inner1, '(A)' )  ! lines ! 
                ! write( inner2, '(A)' ) ! lines
                  ! still in the initial if loop
        !enddo
    !enddo
    
    40  format( '#pCO2(bar)   Seff        FTIR            FTSOL        ALBEDO' )
    50  format( f6.1, 1x, f7.5, 1x, f14.6, 1x, f14.6, 1x, f12.6 )
    ! 1pe total-digits.digits-after-decimal
        
    close( inner1 )
    close( inner2 )


    end program clone_outer_edge_Fig6
