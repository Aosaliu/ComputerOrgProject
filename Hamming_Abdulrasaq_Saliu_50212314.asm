.data
firstStr: .asciiz "First Input: "
secondStr: .asciiz "Second Input: "
cont: .asciiz "Would you like to continue: Yes ~ 1 , No ~ 2 \n"
result: .asciiz "The count: "
end: .asciiz "End"
space: .asciiz  "\n"

.text

.globl main
main:
#Prompt user to get first string
      li  $v0, 4
      la  $a0, firstStr
      syscall
#First string is loaded
      li  $v0, 5
      syscall
      move $s0, $v0 #store in register s0

#Prompt user to get second string
      li  $v0, 4
      la  $a0, secondStr
      syscall
#second string is loaded
      li  $v0, 5
      syscall
      move $s1, $v0 #store in register s0

#initialize count
      addi $s3, $zero, 0 #count = 0
      addi $s4, $zero, 10 #s4 = 10

      j operation

operation:
     divu $s0, $s4
     mfhi $t0
     mflo $t1

     divu $s1, $s4
     mfhi $t2
     mflo $t3

     beq  $t0, $t2, increment # if$t0 == $t2, jump to increment to check next pair of numbers

     addi $s3, $s3, 1   #Increase count by 1 if two values not the same

     j increment

print:
     li $v0, 4    # print_string
     la $a0, result
     syscall      #system call

     add $a0, $0, $s3   #count final value
     li  $v0, 1
     syscall

     j continue

increment:
      beq  $t1, $t3, print  #if $t1 == $t3, jump to print

      addi $s3, $s3, 1    #increase count by 1

      j print

continue:
    li $v0, 4
    la $a0, space
    syscall

     li $v0, 4    #print_string
     la $a0, cont
     syscall

     li $v0, 5
     syscall
     move $t2, $v0

     li $t6,1
     li $t7,2

     beq $t2, $t6, main
     beq $t2, $t7, quit

quit:
    li $v0, 4    # print_string
    la $a0, end
    syscall

    li $v0, 10   #ends the program , so i will have to get set a condition
    syscall
