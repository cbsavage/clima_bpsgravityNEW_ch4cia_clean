program newtons_method
    implicit none

    ! Variables
    real :: x_guess = 1.0  ! Initial guess
    real :: x_new        ! Updated value of x
    real :: del = 1.e-11  ! Acceptable error
    integer :: max_iter = 100  ! Maximum number of iterations
    integer :: iter  ! Iteration counter

    ! Initial guess
    print*, "Initial guess: ", x_guess

    ! Iterate using Newton's method
    do iter = 1, max_iter
        x_new = x_guess - f(x_guess) / fprime(x_guess)

        ! Check for convergence
        if (abs(f(x_new)) < del) then
            print*, "Converged to solution: ", x_new
            exit
        end if

        ! Update guess
        x_guess = x_new
    end do

    ! If max iterations reached
    print*, "Reached maximum iterations without convergence."

contains

    ! Function definition: f(x)
    real function f(x)
        real, intent(in) :: x
        f = x - 0.25 sin(x) + 5.0
    end function f

    ! Function definition: fprime(x)
    real function fprime(x)
        real, intent(in) :: x
        fprime = 1.0 - 0.25 * cos(x)
    end function fprime

    end program newtons_method

!!! NEW CODE BELOW !!!
    
program newtons_method
    implicit none

    ! Variables
    real :: x_guess = 1.0  ! Initial guess
    real :: x_new        ! Updated value of x
    real :: del = 1.e-11  ! Acceptable error
    integer :: max_iter = 100  ! Maximum number of iterations
    integer :: iter  ! Iteration counter

    ! Initial guess
    print*, "Initial guess: ", x_guess

    ! Iterate using Newton's method
    do iter = 1, max_iter
        x_new = x_guess - f(x_guess) / fprime(x_guess)

        ! Check for convergence
        if (abs(f(x_new)) < del) then
            print*, "Converged to solution: ", x_new
            exit
        end if

        ! Update guess
        x_guess = x_new
    end do

    ! If max iterations reached
    print*, "Reached maximum iterations without convergence."

contains

    ! Function definition: f(x)
    real function f(x)
        real, intent(in) :: x
        f = x - 0.25 * sin(x) + 5.0
    end function f

    ! Function definition: fprime(x)
    real function fprime(x)
        real, intent(in) :: x
        fprime = 1.0 - 0.25 * cos(x)
    end function fprime

    end program newtons_method
    ! room temperature iq

