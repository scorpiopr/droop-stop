program test
    use parameter
    implicit none
    integer :: i,j
    
    
    write(*,*)"输入矩阵行数"
    read(*,*) nsize
    allocate(M_matrix(nsize,nsize),K_matrix(nsize,nsize),                           &
             C_matrix(nsize,nsize),IS(nsize),JS(nsize),F_matrix(nsize),             &
             d0_vector(nsize),v0_vector(nsize),a0_vector(nsize))!
    !a=reshape((/1,2,2,1/),(/2,2/));
    !write(*,*) ""
    !read(*,*)((M_matrix(i,j),j=1,nsize),i=1,nsize)
    !write(*,*) ""
    ! read(*,*)((K_matrix(i,j),j=1,nsize),i=1,nsize)
    !write(*,*) ""
    !read(*,*)((C_matrix(i,j),j=1,nsize),i=1,nsize)
    
    M_matrix=RESHAPE((/1d0,0d0,0d0,0d0,0d0,2d0,0d0,0d0,0d0,0d0,3d0,0d0,0d0,0d0,0d0,4d0/),(/4,4/))
    K_matrix=RESHAPE((/8d2,-8d2,0d0,0d0,-8d2,2.4d3,-1.6d3,0d0,0d0,-1.6d3,4.8d3,-3.2d3,0d0,0d0,-3.2d3,8d3/),(/4,4/))
    C_matrix=0.05*M_matrix+0.02*K_matrix
     
    write(*,*) "输入初始位移"
    read(*,*) d0_vector
    write(*,*) "输入初始速度"
    read(*,*) v0_vector
    write(*,*) "输入初始加速度"
    read(*,*) a0_vector
    
    nstep=2000!
    dt=1d-2!
    
    call Newmark()
    
    deallocate(M_matrix,K_matrix,C_matrix,IS,JS,F_matrix,d0_vector,v0_vector,a0_vector)
    
    end
    