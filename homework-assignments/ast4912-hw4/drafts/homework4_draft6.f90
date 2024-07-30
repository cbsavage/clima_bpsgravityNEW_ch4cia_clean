program copy_outer_edge_Fig6
    implicit None
    !  real                    :: pCO2, Seff, FTIR, FTSOL, ALBEDO
     integer                 :: inner1, inner2, i, j
     integer, parameter      :: rows = 24
     integer, parameter      :: cols = 21
     real, dimension( rows ) :: pCO2, Seff, FTIR, FTSOL, ALBEDO
     character( len=100 ) :: line

     inner1 = 10
     open( unit=inner1, file='outer_edge_Fig6.322.txt', status='old', action='read' )
     inner2 = 20
     open( unit=inner2, file='outer_edge_Fig6.322c.txt', status='replace', action='write' )

    !  do i = 1, 3
        ! read( inner1, * ) pCO2(i), Seff(i), FTIR(i), FTSOL(i), ALBEDO(i)
    !  enddo
    !  write( inner2, 40 ) pCO2(i), Seff(i), FTIR(i), FTSOL(i), ALBEDO(i) ! fmt='(A)' ) '#pCO2(bar)   Seff        FTIR            FTSOL        ALBEDO'
     
     read( inner1, * ) line ! pCO2(i), Seff(i), FTIR(i), FTSOL(i), ALBEDO(i)
     write( inner2, 40 ) line ! pCO2(i), Seff(i), FTIR(i), FTSOL(i), ALBEDO(i) ! fmt='(A)' ) '#pCO2(bar)   Seff        FTIR            FTSOL        ALBEDO'


    !  do while ( read( inner1, fmt='(:)', advance='no', char=line ) )
     do ! i = 1, rows
        if ( index(line,'#') .eq. 0 ) then
            cycle
        endif
        do i = 1, rows
            read( inner1, * ) line !pCO2(i), Seff(i), FTIR(i), FTSOL(i), ALBEDO(i)
            write( inner2, 50 ) line !pCO2(i), Seff(i), FTIR(i), FTSOL(i), ALBEDO(i)
        enddo

     ! do i = 1, rows
        ! do j = 1, cols
            ! read( inner1, * ) line ! pCO2(i), Seff(i), FTIR(i), FTSOL(i), ALBEDO(i)
            ! write( inner2, 50 ) line ! pCO2(i), Seff(i), FTIR(i), FTSOL(i), ALBEDO(i)
        ! enddo
    enddo

    ! close( inner1 )
    ! close( inner2 )

    40 format( '#pCO2(bar)   Seff        FTIR            FTSOL        ALBEDO' )
    ! 50 format( f6.1, 1x, f12.9, 1x, e11.9, 1x, e11.9, 1x, e11.9 )
    50 format( f6.1, 1x, f12.9, 1x, f12.9, 1x, f12.9, 1x, f12.9 )
    ! 50  format( f6.1, 1x, f7.4, 1x, f7.4, 4x, f7.2, 4x, f7.2 )

end program copy_outer_edge_Fig6