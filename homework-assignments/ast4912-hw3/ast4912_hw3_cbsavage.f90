! Catalina Savage
! AST 4912
! Homework 3
    
    
program newtons_method
    Implicit None
    
    real    :: x, x_o, del    ! fx, fprimex
    integer :: iter, max_iter ! iteration values
    
    ! values
    x_o      = 75.0   ! initial guess
    del      = 1.e-11 ! some acceptable error
    max_iter = 100    ! maximum iterations that occur
    
    print*, "My first guess: ", x_o
    
    open( unit=80 )
    
    do iter = 1, max_iter ! Newton's Method iterations
        x = x_o - f(x_o) / fprime(x_o)
        write( 80, * ) iter, x
        
    ! converges when f(x_o) < del
        if ( abs(f(x)) < del ) then
            print*, "Converged to: ", x
            exit
        end if
        
        ! override new value to guess value
        x_o = x 
    end do
    
    close( 80 ) ! close file
    
    contains
    ! function
    real function f(x_1)
        real, intent(in) :: x_1
        f = x_1 - 0.25*sin(x_1) + 5.0
    end function f
    
    ! derivative of function
    real function fprime(x_1)
        real, intent(in) :: x_1
        fprime = 1.0 - 0.25*cos(x_1)
    end function fprime
    

end program newtons_method