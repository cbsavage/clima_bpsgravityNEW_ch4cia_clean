program HW4_EXAMPLE

Implicit None

real :: pCO2, Seff, FTIR, FTSOL, ALBEDO
integer, parameter :: rows = 24 !, lines
! integer, parameter :: lines = 21
integer :: i,j, inner1, inner2
dimension:: pCO2(rows), Seff(rows), FTIR(rows), FTSOL(rows), ALBEDO(rows)
! character( len=100 ) ::

! rows = 24
! lines = 21

inner1 = 10
! inner1 = 3
open( unit= inner1, file='outer_edge_Fig6.322.txt' )
inner2 = 20
! inner2 = 4
open( unit= inner2, file='outer_edge_Fig6_crap_copy.322.txt' )

  read( inner1, * ) ! skips one line
  write( inner2, 10 ) !40

  do i = 1, rows
      ! do j = 1, lines
      read( inner1, * )pCO2(i), Seff(i), FTIR(i), FTSOL(i), ALBEDO(i)
      write( inner2, 20 )pCO2(i), Seff(i), FTIR(i), FTSOL(i), ALBEDO(i)
      ! enddo !50
  enddo

10  format( '#pCO2(bar)   Seff        FTIR            FTSOL        ALBEDO' )
20  format( f6.1,1x, f7.4, 1x, f7.4, 4x, f7.2, 4x, f7.2 )
    ! 1petotal-digits.digits-after-decimal

close( inner1 ) !40
close( inner2 ) !50

end program HW4_EXAMPLE
