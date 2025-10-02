### Aanjhan Ranganathan <raanjhan@inf.ethz.ch>
### For Lab 8 Digital Technik 
### 2014

###   I/O addresses Reference
###  compatible to the compact modelling
###  0x00007FF0   LED output

#0x001e8484 original delay
#addi $s7 $0, 0x00000066
#sw $s7 0x00007ff4($0)

loop:   
    lw $s6, 0x7ff4($0)       # Load 8-bit value into $s6
    andi $t1, $s6, 0x0f      # Extract lower 4 bits (num2) -> $t1
    srl $t2, $s6, 4          # Extract upper 4 bits (num1) -> $t2

    addi $s0, $0, 0          # Initialize result ($s0 = 0)
    addi $t3, $0, 0          # Initialize loop counter ($t3 = 0)

multiply:
    beq $t3, $t1, end        # If $t3 == $t1, exit loop
    add $s0, $s0, $t2        # $s0 += $t2
    addi $t3, $t3, 1         # Increment loop counter ($t3++)
    j multiply               # Jump back to multiply

end:
    sw $s0, 0x7ff0($0)       # Store result at 0x7FF0
    j loop                   # Repeat loop
