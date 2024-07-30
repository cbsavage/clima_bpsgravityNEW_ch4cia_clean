    ! OPEN(UNIT=10, FILE='output.txt', STATUS='UNKNOWN')
  
    ! DO i = 1, 2
    !   WRITE(10, '(A)') '# ' // tableID(i)
    !   WRITE(10, '(A)') '#pCO2(bar)   Seff        FTIR            FTSOL        ALBEDO'
    !   WRITE(10, '(1X,F5.1,1X,F8.5,1X,E13.5,1X,E13.5,1X,F10.5)') (pCO2(j), Seff(i, j), FTIR(i, j), FTSOL(i, j), ALBEDO(i, j), j = 1, 18)
    ! END DO