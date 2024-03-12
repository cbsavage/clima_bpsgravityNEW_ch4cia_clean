! Catalina Savage
! AST 4912
! Homework 3
    
program newtons_method
    ! has "do enddo" loop
    ! ALL versions have "Implicit None" at the top of the program
    ! This is so goddamn confusing
    
    Implicit None
    integer, parameter :: max_iter = 100 ! iteration values
    integer            :: iter    
    real               :: x, x_o, del ! fx, fprimex

    ! integer :: i, max_i
    
    ! values
    x_o      = 75.0    ! initial guess
    del      = 1.e-11 ! some acceptable error
    ! max_iter = 100    ! maximum iterations that occur
    ! max_i = 100
    ! fx = 0
    
    ! equations
    ! x = x_o - f(x_o) / fprime(x_o)
    ! x = x_o - fx/fprimex
    ! x = x_o - f(x) / fprime(x)
    ! f(x_o)      = x_1 - 0.25*sin(x_1) + 5.0
    ! fprime(x_o) = 1.0 - 0.25*cos(x_1)
    
    
    ! print*, "My first guess: ", x_o
    
    ! gonna attempt to open a .dat file to save my data :p
    open( unit=80 ) !, file='fort.80', status='replace', action='write', access='sequential', form='formatted' )
    ! should i use 'unknown' instead of replace?? idk the difference honestly :s
    
    ! x_o = x
    do iter = 1, max_iter ! Newton's Method iterations
        x = x_o - f(x_o) / fprime(x_o)
        write( 80, * ) iter, x
        
    ! converges when f(x_o) < del
        if ( abs(f(x) ) < del ) then
        ! if ( abs( x - x_o ) < del ) then
            print*, "Converged to: ", x
            ! write( 80, * ) iter, x
        ! else
            ! print*, "With maximum number of iterations, solution cannot be converged."
            exit
        end if
        ! guess value becomes new value
        x_o = x
    end do
    
    ! print*, "The solution converged to: ", x
    close( 80 ) ! close .dat file
    
contains
    real function f(x_1)
        real, intent(in) :: x_1
        f = x_1 - 0.25*sin(x_1) + 5.0
    end function f
    
    real function fprime(x_1)
        real, intent(in) :: x_1
        fprime = 1.0 - 0.25*cos(x_1)
    end function fprime
    
    
    ! open( 80, file='ast4912_hw3_data.dat' )
    ! open( unit=80, file='ast4912_hw3_data.dat' )
    
    ! do i = 1, max_i
        ! write( 80, * ) i, x
    ! end do
    
    !close( 80 ) ! close .dat file
    
end program newtons_method