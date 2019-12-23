subroutine ElementMatrix()
    use parameter
    
    M_e=RESHAPE((/mm*L_e*13/35+6*Imy/5/L_e,mm*L_e**2*11/210+Imy/10,mm*L_e*9/70-6*Imy/5/L_e,-mm*L_e**2*13/420+Imy/10,        &
                mm*L_e**2*11/210+Imy/10,mm*L_e**3/105+Imy*L_e*2/15,mm*L_e**2*13/420-Imy/10,-mm*L_e**3/140-Imy*L_e/30,       &
                mm*L_e*9/70-6*Imy/5/L_e,mm*L_e**2*13/420-Imy/10,mm*L_e*13/35+6*Imy/5/L_e,-mm*L_e**2*11/210-Imy/10,          &
                -mm*L_e**2*13/420+Imy/10,-mm*L_e**3/140-Imy*L_e/30,-mm*L_e**2*11/210-Imy/10,mm*L_e**3/105+Imy*L_e*2/15/),(/N_e*2,N_e*2/))
                
    K_e=RESHAPE((/EIy*12/L_e**3,EIy*6/L_e**2,-EIy*12/L_e**3,EIy*6/L_e**2,                                                   &
                EIy*6/L_e**2,EIy*4/L_e,-EIy*6/L_e**2,EIy*2/L_e,                                                             &
                -EIy*12/L_e**3,-EIy*6/L_e**2,EIy*12/L_e**3,-EIy*6/L_e**2,                                                   &
                EIy*6/L_e**2,EIy*2/L_e,-EIy*6/L_e**2,EIy*4/L_e/),(/N_e*2,N_e*2/))   
end subroutine ElementMatrix