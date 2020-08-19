.data  
#example input  
values:  .word   12, 45, 2, 41,31,10,2,6,4  #array contents
size:    .word 9 #size of the array
# Your code will be tested with various inputs
first: .word 2147483647
second: .word 2147483647
maxValue: .word 2147483647
massage: .asciiz "No second smallest"
.text
# write your code below

lw $s0 size
lw $s1 first
lw $s2 second
lw $s3 maxValue
add $t2 $zero 0x10010000

blt $s0 2 exit

addi $t0 $zero 0  # i = 0
loop: bge $t0 $s0 exit_loop  # if i is greater or equal size then exit loop
addi $t0 $t0 1               # increment i by 1
lw $t5 ($t2)
addi $t2 $t2 4
bge $t5 $s1 else
move $s2 $s1                # second = first
move $s1 $t5                # first = arr[i]
else:
bge $t5 $s2 loop
beq $t5 $s1 loop
move $s2 $t5
j loop
exit_loop:

beq $s2 $s3 exit            # if (second == Integer.MAX_VALUE)
li $v0 1
move $a0 $s2
syscall

add $v0 $zero 10
syscall


# if you find the second smallest print it 
# if all the numbers in the array are the same print "No second smallest"
exit:
 li $v0 4
 la $a0 massage
 syscall

