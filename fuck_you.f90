PROGRAM HW6_EXAMPLE

Implicit None

real:: pCO2, Seff, FTIR, FTSOL, ALBEDO
integer, parameter :: rows = 24
integer :: i,j, inner1, inner2
character(len=80) :: line
dimension:: pCO2(rows), Seff(rows), FTIR(rows), FTSOL(rows), ALBEDO(rows)


inner1 = 3
open(unit= inner1, file = 'outer_edge_Fig6.322.txt')
inner2 = 4
open(unit= inner2, file = 'outer_edge_Fig6.322.clone.txt')

  do while (.true.)
!    read(inner1, *, advance='no') line
    if (line(1:3) .eq. '#B45') then
      write(inner2, *) line
      read(inner1) ! Read the header line
    else
      exit
    endif
  enddo

  write(inner2,40)

  do i = 1, rows
    read(inner1,*)pCO2(i), Seff(i), FTIR(i), FTSOL(i), ALBEDO(i)
    write(inner2,50)pCO2(i), Seff(i), FTIR(i), FTSOL(i), ALBEDO(i)
  enddo

40  format('#pCO2(bar)   Seff        FTIR            FTSOL        ALBEDO')
50  format(f6.1,1x, f7.4, 1x, f7.4, 4x, f7.2, 4x, f7.2)



END PROGRAM

