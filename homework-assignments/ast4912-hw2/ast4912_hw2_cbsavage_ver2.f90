! Catalina Savage
! AST 4912
! Homework 2, Version 2
    
      
program newtons_method_v2
    ! has "do while enddo" loop
    Implicit None
    
    real    :: x, x_o, del    ! fx, fprimex, 
    integer :: iter, max_iter ! iteration values
    
    ! values
    x_o      = 5.0    ! initial guess
    del      = 1.e-11 ! some acceptable error
    iter     = 5.0    ! iterations 
    max_iter = 500    ! maximum iterations that occur

    print*, "My first guess: ", x_o
    
    
    do while ( iter <= max_iter ) ! Newton's Method iterations
        x = x_o - f(x_o) / fprime(x_o)
        
    ! converges when f(x_o) < del
        if ( abs(f(x)) < del ) then
            print*, "Converged to: ", x
            exit
        end if
        
        ! override new value to guess value
        x_o = x
        
    end do

    
contains
    real function f(x_1)
        real, intent(in) :: x_1
        f = x_1 - 0.25*sin(x_1) + 5.0
    end function f
    
    real function fprime(x_1)
        real, intent(in) :: x_1
        fprime = 1.0 - 0.25*cos(x_1)
    end function fprime
    

end program newtons_method_v2