! Catalina Savage
! AST 4912
! Homework 4

program clone_outer_edge_Fig6
    Implicit None
  
    ! Data types for variables
    character(len=100) :: header, line   ! Character arrays to hold data lines
    real               :: pCO2, Seff, FTIR, FTSOL, ALBEDO
  
    ! Loop counters and file unit numbers
    integer            :: i, j
    integer, parameter :: inner1 = 3, inner2 = 4
  
    ! Number of data rows and columns (excluding header)
    integer, parameter :: rows = 24, lines = 5
  
    ! Open the input and output files
    open(unit=inner1, file='outer_edge_Fig6.322.txt')
    open(unit=inner2, file='outer_edge_Fig6.322copy1.txt')
  
    ! Skip header lines in the input file
    do i = 1, 2
      read(inner1, *)
    end do
    write(inner2, 40) ! Write header to the output file using format 40
  
    ! Read and write data lines with formatting
    do i = 1, rows
      read(inner1, 50) line
      write(inner2, 50) line
    end do
  
    ! Close the files
    close(inner1)
    close(inner2)
  
    end program clone_outer_edge_Fig6
  
  ! Format statements
  10 format(*)  ! Blank line format (optional) - not used in this example
  20 format(a)   ! Format for reading/writing a single character string
  40 format('#pCO2(bar)   Seff        FTIR            FTSOL        ALBEDO')  ! Header format
  50 format(f6.1, 1x, f7.5, 1x, f14.6, 1x, f14.6, 1x, f12.6) ! Data format
  