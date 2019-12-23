subroutine Assemble()
    !�����������͸նȾ���
    
    use parameter
    implicit none
    
    integer :: lia
    real(8),allocatable :: M_t(:,:),K_t(:,:)
    
    allocate(M_t(N_e*(N+1),N_e*(N+1)),K_t(N_e*(N+1),N_e*(N+1)))
    
    call ElementMatrix

    do i=1,N
        lia=6*i-5
    
        !��װ��������
        M_t=0
        M_t(lia:lia+N_e*2,lia:lia+N_e*2)=M_e
        M=M+M_t

        !��װ�նȾ���
        K_t=0
        K_t(lia:lia+N_e*2,lia:lia+N_e*2)=K_e
        K=K+K_t
    end do
end subroutine Assemble