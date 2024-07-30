! Catalina Savage
! AST 4912
! Homework 4

program clone_outer_edge_Fig6
    Implicit None
    ! read in this file: outer_edge_Fig6.322
    ! variables: #pCO2(bar), Seff, FTIR, FTSOL, ALBEDO
  
    character(len=100) :: header  ! data in each line in tables
    real               :: pCO2, Seff, FTIR, FTSOL, ALBEDO
    integer            :: i, j
  
    ! Lines in the data (excluding headers)
    integer, parameter :: lines = 21
  
    ! Unit numbers
    integer             :: input_unit = 3
    integer             :: output_unit = 4
  
    ! Open file and make copy
    open(unit=input_unit, file='outer_edge_Fig6.322.txt')
    open(unit=output_unit, file='outer_edge_Fig6.322copy2.txt')
  
    ! Skip header lines (assuming there are two)
    read(input_unit, *)
    read(input_unit, *)
  
    ! Write header line to new file
    write(output_unit, 40)
  
    ! Loop to read and write data
    do i = 1, lines
      read(input_unit, 10) pCO2, Seff, FTIR, FTSOL, ALBEDO
      write(output_unit, 20) pCO2, Seff, FTIR, FTSOL, ALBEDO
    enddo
  
    close(input_unit)
    close(output_unit)
  
    ! Format statements
    10 format(a, 2x, f6.1, 1x, f7.5, 1x, f14.6, 1x, f14.6, 1x, f12.6)
    20 format('#', a, 2x, f6.1, 1x, f7.5, 1x, f14.6, 1x, f14.6, 1x, f12.6)
    40 format('#pCO2(bar)   Seff        FTIR            FTSOL        ALBEDO')
  
  end program clone_outer_edge_Fig6
  
