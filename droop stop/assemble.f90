subroutine assemble
    !计算总质量和刚度矩阵
    
    use parameter
    
    integer :: lia
    real(8),allocatable :: M(:,:),K(:,:),C(:,:),F(:)

    
    MassS=zeros(6*(N+1));
    KS=zeros(6*(N+1));

    do i=1,N
        lia=6*i-5;
    
        !组装质量矩阵
        MassT=zeros(6*(N+1));
        MassT(lia:lia+11,lia:lia+11)=eMass;
        M=M+MassT;

        !组装刚度矩阵
        KT=zeros(6*(N+1));
        KT(lia:lia+11,lia:lia+11)=eK;
        K=K+KT;
    end do
end subroutine assemble