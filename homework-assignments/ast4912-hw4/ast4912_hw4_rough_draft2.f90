program clone_outer_edge_Fig6
    Implicit None
    ! read in this file: outer_edge_Fig6.322
    ! variables:
    ! #pCO2(bar), Seff, FTIR, FTSOL, ALBEDO
    
    ! **ChatGPT gave me this so we'll see how that works
    
    real                 :: pCO2, Seff, FTIR, FTSOL, ALBEDO
    ! integer, parameter   :: rows
    ! integer              :: a, b, inner1, inner2
    integer              :: rows, a, b, inner1, inner2, table_num
    ! dimension            :: pCO2(rows), Seff(rows), FTIR(rows), FTSOL(rows), ALBEDO(rows)
    ! character( len=100 ) :: marker       ! **
    character( len=100 ) :: lin_space      ! **
    logical              :: read_table     ! **
    
    ! rows   = 19
    inner1 = 10 ! first unit number
    inner2 = 80 ! 2nd unit number
    ! lin_space = '#' ! **
    table_num = 0
    
    ! open file and make copy
    open( unit=inner1, file='outer_edge_Fig6.322.txt', status='old', action='read' )
    ! open( unit=inner2, file='outer_edge_Fig6.322copy.txt' )
    
        ! read( inner1, * )   ! skip one line
        ! write( inner2, 40 )
        
        ! do a = 1, rows
            ! read( inner1, * )pCO2(a), SeFF(a), FTIR(a), FTSOL(a), ALBEDO(a)
            ! write( inner2, 50 )pCO2(a), SeFF(a), FTIR(a), FTSOL(a), ALBEDO(a)
        ! enddo
        
        ! 40 format( '#pCO2(bar)   Seff        FTIR            FTSOL        ALBEDO' )
        ! 50 format( f6.1,1x, f7.4, 1x, f7.4, 4x, f7.2, 4x, f7.2 )
    
        do
            read( inner1, * ) lin_space
            if ( index( marker, '#' ), == 1 ) then
                read( inner1, * )   ! skip one line
                read( inner1, * )   ! skip one line
                table_num = table_num + 1

            end program clone_outer_edge_Fig6