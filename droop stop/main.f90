program test
    use parameter
    implicit none
    integer :: i,j
    
    
    write(*,*)"输入单元自由度数"
    read(*,*) N_e
    allocate(M(N_e,N_e),K(N_e,N_e),                           &
             C(N_e,N_e),IS(N_e),JS(N_e),F(N_e),             &
             d0_vector(N_e),v0_vector(N_e),a0_vector(N_e))!
    !a=reshape((/1,2,2,1/),(/2,2/));
    !write(*,*) ""
    !read(*,*)((M(i,j),j=1,N_e),i=1,N_e)
    !write(*,*) ""
    ! read(*,*)((K(i,j),j=1,N_e),i=1,N_e)
    !write(*,*) ""
    !read(*,*)((C(i,j),j=1,N_e),i=1,N_e)
    
    M=RESHAPE((/1d0,0d0,0d0,0d0,0d0,2d0,0d0,0d0,0d0,0d0,3d0,0d0,0d0,0d0,0d0,4d0/),(/4,4/))
    K=RESHAPE((/8d2,-8d2,0d0,0d0,-8d2,2.4d3,-1.6d3,0d0,0d0,-1.6d3,4.8d3,-3.2d3,0d0,0d0,-3.2d3,8d3/),(/4,4/))
    C=0.05*M+0.02*K
     
    write(*,*) "输入初始位移"
    read(*,*) d0_vector
    write(*,*) "输入初始速度"
    read(*,*) v0_vector
    write(*,*) "输入初始加速度"
    read(*,*) a0_vector
    
    nstep=2000!
    dt=1d-2!
    
    call Newmark()
    
    deallocate(M,K,C,M_e(:,:),K_e(:,:),C_e(:,:),F_e(:),IS,JS,F,d0_vector,v0_vector,a0_vector)
    
    end
    