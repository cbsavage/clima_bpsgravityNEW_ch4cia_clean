!Reef Collins
!Homework 2
Program newtonMethod
    implicit none
    
    real :: x, x_0, del
    integer :: iter, max_iter
    
    x_0 = 99
    del = 1.e-11
    max_iter = 100
    
    print*, "The First Guess I got was",x_0
    
    open(unit = 80)
    
    !do while (iter <= max_iter)
    do iter = 1, max_iter
        x = x_0 - f_int(x_0)/f_final(x_0)
        write(80,*)iter,x
        
        if(abs(f_int(x)) < del) then
                print*,"Converged to: ", x
                exit
        end if
        x_0 = x
    end do
      
    close(80)
    
    contains
    real function f_int(x_1)
        real, intent(in) :: x_1
        f_int = x_1 - 0.25*sin(x_1) + 5.0
    end function f_int
        
    real function f_final(x_1)
        real, intent(in) :: x_1
        f_final = 1.0 - 0.25*cos(x_1)
    end function f_final

      End Program newtonMethod
