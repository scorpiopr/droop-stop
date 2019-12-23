program droopstop
    use parameter
    implicit none
    integer :: i,j
    
    write(*,*)"输入节点自由度数"!
    read(*,*) N_e!
    allocate(M(N_e*(N+1),N_e*(N+1)),K(N_e*(N+1),N_e*(N+1)),                               &
             C(N_e*(N+1),N_e*(N+1)),F(N_e*(N+1)),IS(N_e*(N+1)),JS(N_e*(N+1)),             &
             d0_vector(N_e*(N+1)),v0_vector(N_e*(N+1)),a0_vector(N_e*(N+1)))
    allocate(M_e(N_e*2,N_e*2),K_e(N_e*2,N_e*2),C_e(N_e*2,N_e*2),F_e(N_e*2)!
    
    call Assemble
    call Boundary
    
    C=0.05*M+0.02*K
     
    write(*,*) "输入初始位移"
    read(*,*) d0_vector
    write(*,*) "输入初始速度"
    read(*,*) v0_vector
    write(*,*) "输入初始加速度"
    read(*,*) a0_vector
    
    Nstep=2000!
    dt=1d-2!
    
    call Newmark()
    
    deallocate(M,K,C,M_e(:,:),K_e(:,:),C_e(:,:),F_e(:),IS,JS,F,d0_vector,v0_vector,a0_vector)
    
    end
    