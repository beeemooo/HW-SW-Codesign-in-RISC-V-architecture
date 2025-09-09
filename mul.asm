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
    and $t0, $0, $0
    and $t1, $0, $0
    and $t2, $0, $0
    and $t3, $0, $0
    and $t4, $0, $0
    and $t5, $0, $0
    and $t6, $0, $0
    and $t7, $0, $0
    
    and $s0, $0, $0
    and $s1, $0, $0
    and $s2, $0, $0
    and $s3, $0, $0
    
    lw $s0, 0x7ff4($0)       # Load 8-bit value into $s6
    
    addi $t0, $0, 0x0f
    and $s1, $s0, $t0
    
    addi $t1, $0, 0x10
    and $t2, $s0, $t1
    beq $t2, $0, second
    
    add $t3, $s1, $0

second:
    addi $t4, $0, 0x20
    and $t5, $s0, $t4
    beq $t5, $0, third
    
    add $t3, $t3, $s1
    add $t3, $t3, $s1
    
third:
    addi $t6, $0, 0x40
    and $t7, $s0, $t6
    beq $t7, $0, fourth
    
    add $t3, $s1, $t3
    add $t3, $s1, $t3
    add $t3, $s1, $t3
    add $t3, $s1, $t3

fourth:
    add $t1, $0, $0
    add $t2, $0, $0
    addi $t1, $0, 0x80
    and $t2, $s0, $t1
    beq $t2, $0, last
    
    add $t3, $s1, $t3
    add $t3, $s1, $t3
    add $t3, $s1, $t3
    add $t3, $s1, $t3
    add $t3, $s1, $t3
    add $t3, $s1, $t3
    add $t3, $s1, $t3
    add $t3, $s1, $t3
    
last:
   sw $t3, 0x7ff0($0)
   j loop
