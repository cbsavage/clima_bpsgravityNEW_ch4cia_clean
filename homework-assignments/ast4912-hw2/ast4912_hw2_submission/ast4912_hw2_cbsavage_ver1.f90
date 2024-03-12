! Catalina Savage
! AST 4912
! Homework 2, Version 1
    
    
program newtons_method_v1
    ! has "do enddo" loop
    Implicit None
    
    real    :: x, x_o, del    ! fx, fprimex
    integer :: iter, max_iter ! iteration values
    
    ! values
    x_o      = 5.0    ! initial guess
    del      = 1.e-11 ! some acceptable error
    max_iter = 100    ! maximum iterations that occur
    
    print*, "My first guess: ", x_o
    
    ! open file titled "ast4912_hw2_data.dat"
    ! open( unit=10, file='ast4912_hw2_data.dat', status='replace', action='write', form='formatted' )
    
    
    do iter = 1, max_iter ! iterations of Newton's Method
        x = x_o - f(x_o) / fprime(x_o)
        
        ! write iterations into data file
        ! write( 10, '(I6,F10.6)' ) iter, x
        
    ! converges when f(x_o) < del
        if ( abs(f(x)) < del ) then
            print*, "Converged to: ", x
            exit
        end if
        
        ! override new value to guess value
        x_o = x
        
    end do
    
    ! close data file
    ! close( 10 )
    
    
contains
    real function f(x_1)
        real, intent(in) :: x_1
        f = x_1 - 0.25*sin(x_1) + 5.0
    end function f
    
    real function fprime(x_1)
        real, intent(in) :: x_1
        fprime = 1.0 - 0.25*cos(x_1)
    end function fprime
    

end program newtons_method_v1