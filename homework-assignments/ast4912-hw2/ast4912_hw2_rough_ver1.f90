! Catalina Savage
! AST 4912
! Homework 2, Version 1
    
program newtons_method_v1
    ! has "do enddo" loop
    ! ALL versions have "Implicit None" at the top of the program
    ! This is so goddamn confusing
    
    Implicit None
    real    :: x, x_o, del    ! fx, fprimex, 
    integer :: iter, max_iter ! iteration values

    
    ! values
    x_o      = 5.0    ! initial guess
    del      = 1.e-11 ! some acceptable error
    max_iter = 100    ! maximum iterations that occur
    ! fx = 0
    
    ! equations
    ! x = x_o - f(x_o) / fprime(x_o)
    ! x = x_o - fx/fprimex
    ! x = x_o - f(x) / fprime(x)
    ! f(x_o)      = x_1 - 0.25*sin(x_1) + 5.0
    ! fprime(x_o) = 1.0 - 0.25*cos(x_1)
    
    
    print*, "My first guess: ", x_o
    
    ! gonna attempt to open a .dat file to save my data :p
    open(unit=10, file='ast4912_hw2_data.dat', status='replace', action='write', access='sequential', form='formatted')
    ! should i use 'unknown' instead of replace?? idk the difference honestly :s
    
    
    ! "do enddo" version
    do iter = 1, max_iter ! Newton's Method iterations
        x = x_o - f(x_o) / fprime(x_o)
        
        write(10, '(I6, F10.6)') iter, x
        
    ! converges when f(x_o) < del
        if (abs(f(x)) < del) then
            print*, "Converged to: ", x
            ! write(10, '(A)') 'Converged to: ', x
            exit
        end if
        
        ! guess value becomes new value
        x_o = x
        ! x = x_o
    end do
    
    ! print*, "With maximum number of iterations, solution cannot be converged."
    ! print*, "The solution converged to: ", x
    close(10) ! close .dat file
    
contains
    real function f(x_1)
        real, intent(in) :: x_1
        f = x_1 - 0.25*sin(x_1) + 5.0
    end function f
    
    real function fprime(x_1)
        real, intent(in) :: x_1
        fprime = 1.0 - 0.25*cos(x_1)
    end function fprime
    
    
! gonna attempt to save data into a .txt file :p
    ! do iter = 1, max_iter ! Newton's Method iterations
        ! write(10, '(F6.2)') x
    ! end do
    
    ! close(10) ! close .dat file
    

end program newtons_method_v1