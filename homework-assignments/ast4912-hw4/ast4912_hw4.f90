program copy_outer_edge_fig6
    implicit none
    character( len=100 ) :: header
    real    :: pCO2, Seff, FTIR, FTSOL, ALBEDO
    integer :: i, j, inner1, inner2
    real, parameter :: rows=24
    real, parameter :: lines=21
    
    
    inner1=3
    inner2=4
    
    open( unit=inner1, file='outer_edge_Fig6.322.txt' )
    open( unit=inner2, file='outer_edge_Fig6.322.copy.txt' )
    
    read( inner1, * )
    write( inner2, 50 ) ! 40
    
    do i=1, rows
        read( inner1, * )
        write( inner2, 50 )
    enddo
    
40  format()
50 format()    