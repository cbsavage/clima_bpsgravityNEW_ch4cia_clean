PROGRAM HW6_EXAMPLE

Implicit None

real:: TEFF, SEFF, ALBEDO, FTSOL, FTIR
integer, parameter :: rows = 24
integer :: i,j, inner1, inner2
dimension:: TEFF(rows), SEFF(rows), ALBEDO(rows), FTSOL(rows), FTIR(rows)


inner1 = 3
open(unit= inner1, file = 'inneredge_Fig8.txt')
inner2 = 4
open(unit= inner2, file = 'inneredge_Fig8clone.txt')

  read(inner1,*) ! skips one line

  write(inner2,40)

  do i = 1, rows
    read(inner1,*)TEFF(i), SEFF(i), ALBEDO(i), FTSOL(i), FTIR(i)
    write(inner2,50)TEFF(i), SEFF(i), ALBEDO(i), FTSOL(i), FTIR(i)
  enddo

40  format('TEFF     SEFF   ALBEDO     FTSOL      FTIR')
50  format(f6.1,1x, f7.4, 1x, f7.4, 4x, f7.2, 4x, f7.2)



END PROGRAM
