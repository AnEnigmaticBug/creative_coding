#include <stdio.h>

int main(t) {
	while (1) {
		putchar((t&t>>4)-(t>>13&t));
		++t;
	}
}
