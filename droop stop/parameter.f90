MODULE parameter
    implicit none
    integer :: nsize,nstep,L
    integer,allocatable :: IS(:),JS(:)
    real(8) :: dt,pi=3.14
    real(8),allocatable :: d0_vector(:),v0_vector(:),a0_vector(:)
    real(8),allocatable :: M_matrix(:,:),K_matrix(:,:),C_matrix(:,:),F_matrix(:)
END
    