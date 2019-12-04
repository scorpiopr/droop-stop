MODULE parameter
    implicit none
    
    !N_e    单元自由度数
    !Nstep  迭代步数
    !EIy	挥舞刚度	(N/m2)
    !Imy	剖面绕y轴惯量	(kg/m2)
    ! L_e	单元段长度	(m)
    ! LLe	单元段局部坐标系径向位置	(m)
    ! mm	线密度	(kg/m)
    ! omega   旋翼转速	(rad/s)
    !N      桨叶段数
    
    integer :: N_e,Nstep,L,N
    integer,allocatable :: IS(:),JS(:)
    real(8) :: dt,pi=3.14,EIy=,Imy,L_e,LLe,mm,omega
    real(8),allocatable :: d0_vector(:),v0_vector(:),a0_vector(:)
    real(8),allocatable :: M(:,:),K(:,:),C(:,:),F(:)
    real(8),allocatable :: M_e(:,:),K_e(:,:),C_e(:,:),F_e(:)
END
    