.data
	x1: .asciiz "Enter first x-axis: "
	y1: .asciiz "Enter first y-axis: "
	x2: .asciiz "Enter second x-axis: "
	y2: .asciiz "Enter second y-axis: "
	result: .asciiz "The Euclidean distance is: "
  cont: .asciiz "Would you like to continue: Yes-1, No-2 \n"
  end: .asciiz "End"
  space: .asciiz  "\n"

.globl main

.text
 main:
		li $v0,4	#loading v0=4 to print string "Enter x-axis 1:"
		la $a0,x1	#loading address of string "Enter x1" into a0
		syscall		#execute the printing process

		li $v0,5	#loading v0=5 to read int into v0
		syscall 	#execute the command
		move $t1,$v0	# t1 = x1

		li $v0,4	#loading v0=4 to print string "Enter y1:"
		la $a0,y1	#loading address of string "Enter y1" into a0
		syscall		#execute the prinvting process

		li $v0,5
		syscall
		move $t2,$v0	#t2 = y1

		li $v0,4
		la $a0,x2
		syscall

		li $v0,5
		syscall
		move $t3,$v0	#t3 = x2

		li $v0,4
		la $a0,y2
    syscall

    li $v0,5
		syscall
    move $t4, $v0  #t4 = y2

		sub $s0,$t1,$t2 #s0 = x1-y1
		sub $s1,$t3,$t4 #s1 = x2-y2

		mul $s2,$s0,$s0 #s0 = (x1-y1)^2
		mul $s3,$s1,$s1 #s1 = (x2-y2)^2

    add $s4,$s2,$s3 #s2 = (x1 - y1)^2 + (x2 - y2)^2


#Convert to floating point
  mtc1 $s4, $f12
  cvt.s.w $f12, $f12

#take the square root
  sqrt.s $f12 , $f12

  li $v0,4
  la $a0,result
  syscall		#print the result prompt

  li $v0, 2
  syscall

  j continue

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
  beq $t2, $t7, exit

exit:
    li $v0,4
    la $a0,end
    syscall		#print the result prompt

    li $v0,10
    syscall 	#terminate the program
