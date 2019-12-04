MODULE parameter
    implicit none
    
    !N_e    ��Ԫ���ɶ���
    !Nstep  ��������
    !EIy	����ն�	(N/m2)
    !Imy	������y�����	(kg/m2)
    ! L_e	��Ԫ�γ���	(m)
    ! LLe	��Ԫ�ξֲ�����ϵ����λ��	(m)
    ! mm	���ܶ�	(kg/m)
    ! omega   ����ת��	(rad/s)
    !N      ��Ҷ����
    
    integer :: N_e,Nstep,L,N
    integer,allocatable :: IS(:),JS(:)
    real(8) :: dt,pi=3.14,EIy=,Imy,L_e,LLe,mm,omega
    real(8),allocatable :: d0_vector(:),v0_vector(:),a0_vector(:)
    real(8),allocatable :: M(:,:),K(:,:),C(:,:),F(:)
    real(8),allocatable :: M_e(:,:),K_e(:,:),C_e(:,:),F_e(:)
END
    