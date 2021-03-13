.data
first: .asciiz "Input First Num: "
second: .asciiz "Input Second Num: "
command: .asciiz "Enter Operation (1~Add, 2~Sub, 3~Mul, 4~Div): " #commands such as add, sub, mul, div, exit/stop
result: .asciiz "The Result: "
end: .asciiz "The End"
checkAgain: .asciiz "ERROR: Cannot divide by 0 \n"
checkCont: .asciiz "Do you wish to continue?? (1~Yes, 2~No) \n"
space: .asciiz  "\n"

.text
main:
#Prompt user to get first number
      li  $v0, 4
      la  $a0, first
      syscall
#First number is loaded
      li  $v0, 5
      syscall
      move $s0, $v0 #store in register s0

#Prompt user to get second number
      li $v0, 4
      la $a0, second
      syscall
#Second number is loaded
      li $v0, 5
      syscall
      move $s1, $v0 #store in register s1

#Prompt user to get command key
      li $v0 , 4
      la $a0, command   #enter commands 1, 2, 3, 4, or 5
      syscall
#command key is loaded
      li $v0 , 5
      syscall
      move $s2, $v0 #store in register s2

      li $t1 , 1
      li $t2 , 2
      li $t3 , 3
      li $t4 , 4

      beq $s2, $t1, Add
      beq $s2, $t2, Sub
      beq $s2, $t3, Mul
      beq $s2, $t4, Div



check:
      li $v0, 4
      la $a0, checkCont
      syscall

      li $v0, 5
      syscall
      move $s3, $v0;

      li $t6,1
      li $t7,2

      beq $s3, $t6, main
      beq $s3, $t7, Exit


#Addition
Add:
      li $v0, 4    # print_string
      la $a0, result
      syscall

      add $a0, $s0, $s1
      li  $v0, 1
      syscall

      li $v0, 4
      la $a0, space
      syscall

      j  check
#subtraction
Sub:
      li $v0, 4    # print_string
      la $a0, result
      syscall

      sub $a0, $s0, $s1
      li  $v0, 1
      syscall

      li $v0, 4
      la $a0, space
      syscall

      j check
#multiplication
Mul:
      li $v0, 4    # print_string
      la $a0, result
      syscall

      mul $a0, $s0, $s1
      li $v0, 1
      syscall

      li $v0, 4
      la $a0, space
      syscall

      j check
#division
Div:
      beq $s1, $0, CheckAgain
      li $v0, 4    # print_string
      la $a0, result
      syscall

      div $a0, $s0, $s1
      li $v0, 1
      syscall

      li $v0, 4
      la $a0, space
      syscall

      j check

CheckAgain:
    li $v0, 4
    la $a0, checkAgain
    syscall

    j main

Exit:
      li $v0, 4    # print_string
      la $a0, end
      syscall

      li $v0, 10   #ends the program , so i will have to get set a condition
      syscall

# Cont:
#     li $v0, 4
#     la $a0, checkCont
#     syscall
