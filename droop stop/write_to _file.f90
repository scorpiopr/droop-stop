subroutine write_to_file(t,res)
    use parameter
    implicit none
    real(8) :: t,res
    
    open(unit=11,file='response.txt')!"unit=11"��������ļ����豸��Ϊ11
    write(11,100) t,res
100 format(f10.2,10X,f20.2)  !  
end subroutine