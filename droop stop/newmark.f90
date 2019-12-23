subroutine Newmark() 
 
!Newmark法求解系统响应 
	
	use parameter
	
	 
	implicit none 
	integer :: i
	real(8) :: b1,b2,b3,b4,b5,b6,t                
	real(8) ::	K_eff(N_e,N_e), K_inv(N_e,N_e)
    real(8) :: f_eff(N_e), f_t(N_e)
    real(8) :: d1(N_e),v1(N_e),a1(N_e)
    real(8) :: d2(N_e),v2(N_e),a2(N_e),x(N_e),y(N_e)
	real(8) :: gamma,beta 
    
    gamma=0.5;beta=0.25
    !write(*,200) gamma, beta
 
    b1=1/beta/dt/dt;b2=-1/beta/dt;b3=1.0-0.5/beta;       &
    b4=gamma/beta/dt;b5=1-gamma/beta;b6=(1-gamma/2/beta)*dt
    
    write(*,"(6F10.2)") b1,b2,b3,b4,b5,b6
 
	K_eff = K + b1*M + b4*C !有效刚度矩阵
	call BRINV(K_eff,N_e,L,IS,JS) !求有效刚度矩阵的逆矩阵
    K_inv=K_eff
    
	d1=d0_vector; v1=v0_vector; a1=a0_vector !
	t=0.0
    
	do i=1,Nstep 
		t=t+dt
        
        if (t<5) then
		   f_t=(/100*sin(0.8*pi*t),0d0,0d0,0d0/) !
        else 
           f_t=0
        end if
        
        x=b1*d1-b2*v1-b3*a1;y=b4*d1-b5*v1-b6*a1
        
		f_eff=f_t+matmul(M,x)+matmul(C,y) !t+dt
		
        d2=matmul(K_inv,f_eff) 
		v2=b4*(d2-d1)+b5*v1+b6*a1
        a2=b1*(d2-d1)+b2*v1+b3*a1
		
        call write_to_file(t,d2(1))!

		d1=d2; v1=v2; a1=a2 
	end do 
 
200 format(4X,'gamma = ',f7.4,8X,'beta = ',f7.4) 
 
end subroutine Newmark