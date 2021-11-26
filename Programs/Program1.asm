.text
.global main

main:
 li $t0, -1
 li $t2, 10
 li $t3, 0
 li $t5, 0
 li $t6, 0

 addi $v0, $zero, 4
 la $a0, prompt
 syscall

 addi $v0, $zero, 5
 syscall
 move $t1, $v0

 bgt $t1, 0, loop
 
abs_: 
 mult $t1, $t0
 mflo $t1

loop:
 div $t1, $t2
 mfhi $t5
 mflo $t1
 add $t6, $t6, $t5   
 beq $t1, $t3, exit 
j loop
 
exit:
 addi $v0, $zero, 4
 la $a0, result
 syscall	
 li $v0, 1	
 la $a0, ($t6)
 syscall

.data
 prompt: .asciiz "Enter number: "
 result: .asciiz "Result: "
