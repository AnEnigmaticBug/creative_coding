#include <math.h>
#include <stdio.h>

int main(int t) {
	while (1) {
		putchar((int)sqrt(t) >> (int)(sin(t*t*t) * 3 + 2));
		++t;
	}
}
