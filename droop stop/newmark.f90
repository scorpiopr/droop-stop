subroutine Newmark() 
 
!Newmark�����ϵͳ��Ӧ 
	
	use parameter
	
	 
	implicit none 
	integer :: i
	real(8) :: b1,b2,b3,b4,b5,b6,t                
	real(8) ::	K_eff(nsize,nsize), K_inv(nsize,nsize)
    real(8) :: f_eff(nsize), f_t(nsize)
    real(8) :: d1(nsize),v1(nsize),a1(nsize)
    real(8) :: d2(nsize),v2(nsize),a2(nsize),x(nsize),y(nsize)
	real(8) :: gamma,beta 
    
    gamma=0.5;beta=0.25
    !write(*,200) gamma, beta
 
    b1=1/beta/dt/dt;b2=-1/beta/dt;b3=1.0-0.5/beta;       &
    b4=gamma/beta/dt;b5=1-gamma/beta;b6=(1-gamma/2/beta)*dt
    
    write(*,"(6F10.2)") b1,b2,b3,b4,b5,b6
 
	K_eff = K_matrix + b1*M_matrix + b4*C_matrix !��Ч�նȾ���
	call BRINV(K_eff,nsize,L,IS,JS) !����Ч�նȾ���������
    K_inv=K_eff
    
	d1=d0_vector; v1=v0_vector; a1=a0_vector !
	t=0.0
    
	do i=1,nstep 
		t=t+dt
        
        if (t<5) then
		   f_t=(/100*sin(0.8*pi*t),0d0,0d0,0d0/) !
        else 
           f_t=0
        end if
        
        x=b1*d1-b2*v1-b3*a1;y=b4*d1-b5*v1-b6*a1
        
		f_eff=f_t+matmul(M_matrix,x)   & 
                   +matmul(C_matrix,y) !t+dt
		
        d2=matmul(K_inv,f_eff) 
		v2=b4*(d2-d1)+b5*v1+b6*a1
        a2=b1*(d2-d1)+b2*v1+b3*a1
		
        call write_to_file(t,d2(1))!

		d1=d2; v1=v2; a1=a2 
	end do 
 
200 format(4X,'gamma = ',f7.4,8X,'beta = ',f7.4) 
 
end subroutine Newmark