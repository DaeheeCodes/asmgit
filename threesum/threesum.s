.section .data

prompt: .asciz "Hi there! Please type in three integer values (seperated by a space): "

response: .asciz "You enter %d, %d, and %d. The sum of the three numbers is %d\n"

pattern: .asciz "%d %d %d"

value1: .word 0
value2: .word 0
value3: .word 0
printsum: .word 0
.section .text
.global main
main:
	push {lr}		

    	ldr r0, =prompt		
    	bl printf		

    	ldr r0, =pattern 	
    	ldr r1, =value1  	
		ldr r2, =value2	
		ldr r3, =value3
    	bl scanf           
next:
	ldr r1, =value1	
	ldr r1, [r1]		
	ldr r2, =value2
	ldr r2, [r2]
	ldr r3, =value3
	ldr r3, [r3]
	
	add r5, r1, r2
	add r5, r5, r3
	ldr r4, =printsum
	str r5, [r4] //store value of r5 to memory r4
	push {r4}
	add sp, #4

print:
	ldr r0, =response
	ldr r1, =value1	
	ldr r1, [r1]		
	ldr r2, =value2
	ldr r2, [r2]
	ldr r3, =value3
	ldr r3, [r3]
	ldr r4, =printsum
	ldr r4, [r4]
	push {r4}
	bl printf	
	add sp, #4

	mov r0, #0		
pop {pc}	
