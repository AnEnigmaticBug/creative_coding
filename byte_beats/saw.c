#include <math.h>
#include <stdio.h>

int main(int t) {
	t += 32000;
	int temp;
	while (1) {
		temp = (int)(sin(sqrt(t)) * 4) * 5;
		putchar((int)(temp > 0 ? temp : -temp) << (int)(cos(t*t) * 3));
		++t;
	}
}
