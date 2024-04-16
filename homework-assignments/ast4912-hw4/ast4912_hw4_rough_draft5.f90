program clone_outer_edge_Fig6
    implicit none
    
    real :: pCO2, Seff, FTIR, FTSOL, ALBEDO
    integer :: i, inner1, inner2
    integer, parameter :: rows = 24
    integer, parameter :: lines = 21
    
    ! unit numbers
    inner1 = 3
    inner2 = 4
    
    ! open file and make copy
    open(unit=inner1, file='outer_edge_Fig6.322.txt')
    open(unit=inner2, file='outer_edge_Fig6.322fakecopy.txt')
    
    ! skip the header line in the input file
    read(inner1, *)
    
    ! header for the copied file
    write(inner2, '(A)') "#pCO2(bar)   Seff        FTIR            FTSOL        ALBEDO"
        
    ! copy data into new file
    do i = 1, rows * lines
        read(inner1, *) pCO2, Seff, FTIR, FTSOL, ALBEDO
        write(inner2, '(F6.1, 1X, F7.5, 1X, E14.6, 1X, E14.6, 1X, F12.6)') pCO2, Seff, FTIR, FTSOL, ALBEDO
    end do

    ! Close files
    close(unit=inner1)
    close(unit=inner2)

end program clone_outer_edge_Fig6
