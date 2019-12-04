subroutine assemble
    !�����������͸նȾ���
    
    use parameter
    
    integer :: lia
    real(8),allocatable :: M(:,:),K(:,:),C(:,:),F(:)

    
    MassS=zeros(6*(N+1));
    KS=zeros(6*(N+1));

    do i=1,N
        lia=6*i-5;
    
        !��װ��������
        MassT=zeros(6*(N+1));
        MassT(lia:lia+11,lia:lia+11)=eMass;
        M=M+MassT;

        !��װ�նȾ���
        KT=zeros(6*(N+1));
        KT(lia:lia+11,lia:lia+11)=eK;
        K=K+KT;
    end do
end subroutine assemble