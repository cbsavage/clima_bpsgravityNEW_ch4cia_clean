! Catalina Savage
! AST 4912
! Homework 4

! program clone_outer_edge_Fig6
!     Implicit None
!     ! read in this file: outer_edge_Fig6.322
!     ! variables: #pCO2(bar), Seff, FTIR, FTSOL, ALBEDO

!     ! character( len=100 ) :: header
!     real                 :: pCO2, Seff, FTIR, FTSOL, ALBEDO
!     integer              :: i, j, outer_i, outer_j, err_i
!     integer, parameter   :: rows  = 24
!     integer, parameter   :: lines = 21
!     integer, parameter   :: tables = 20
!     dimension            :: pCO2( rows,lines ), Seff( rows,lines ), FTIR( rows,lines ), FTSOL( rows,lines ), ALBEDO( rows,lines )


!     outer_i = 3
!     outer_j = 4

!     open( unit=outer_i, file='outer_edge_Fig6.322.txt' )
!     open( unit=outer_j, file='outer_edge_Fig6.322copy.txt' )

    ! read( outer_i, * )
    ! write( outer_j, 40 )

    ! ! 60 format( f8.2, 2x, f8.5, 2x, e12.5, 2x, e12.5, 2x, f8.5 )
    ! ! can comment out if doesn't work

    ! do i=1, rows
    !     do j=1, lines
    !         if ( EOF( outer_i ) ) exit
    !         read( outer_i, * ) pCO2( i,j ), Seff( i,j ), FTIR( i,j ), FTSOL( i,j ), ALBEDO( i,j )
    !         ! if ( err/=0 ) then
    !         !     print *, 'ERROR: Could not read file'
    !         !     stop
    !         ! endif
    !         ! read( outer_i, 60 ) pCO2( i,j ), Seff( i,j ), FTIR( i,j ), FTSOL( i,j ), ALBEDO( i,j )
    !         write( outer_j, 50 ) pCO2( i,j ), Seff( i,j ), FTIR( i,j ), FTSOL( i,j ), ALBEDO( i,j )
    !     enddo
    ! enddo

    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!     ! 30 format( ' # B45' )
!     40 format( '#pCO2(bar)   Seff        FTIR            FTSOL        ALBEDO' )
!     50 format( f8.2, 2x, f8.5, 2x, e12.5, 2x, e12.5, 2x, f8.5 )
!     ! 50 format( f6.1,1x, f7.4, 1x, f7.4, 4x, f7.2, 4x, f7.2 ), from HW4_example.f90

!     close( outer_i )
!     close( outer_j )

! endprogram clone_outer_edge_Fig6


PROGRAM HW6_EXAMPLE
    Implicit None

    REAL :: pCO2, Seff, ALBEDO, FTSOL, FTIR
    INTEGER, PARAMETER :: rows = 24
    INTEGER :: i, j, inner1, inner2
    ! DIMENSION :: pCO2(rows), Seff(rows), ALBEDO(rows), FTSOL(rows), FTIR(rows)
    CHARACTER(LEN=100) :: line

    inner1 = 3
    open( unit=inner1, file='outer_edge_Fig6.322.txt' )
    inner2 = 4
    open( unit=inner2, file='outer_edge_Fig6.322copy.txt' )

    read( inner1, * ) ! skips one line

    write( inner2, 40 )

    do i=1, rows
        read( inner1, * ) line
        if ( line(1:1) == '#' ) then
            write( inner2, '(A)' ) trim(line)
        else
            read( line, * ) pCO2(i), Seff(i), ALBEDO(i), FTSOL(i), FTIR(i)
            write( inner2, 50 ) pCO2(i), Seff(i), ALBEDO(i), FTSOL(i), FTIR(i)
        endif
    enddo

    40  FORMAT( 'pCO2(bar)   Seff        FTIR            FTSOL        ALBEDO' )
    50  FORMAT( F6.1, 4X, F7.5, 4X, E12.5, 4X, E12.5, 4X, F7.5 )

END PROGRAM HW6_EXAMPLE