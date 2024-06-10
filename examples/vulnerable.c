#include <stdio.h>

extern int calculate_answer(const char *question);

int main() {
  int answer = calculate_answer("The answer to life, the universe, and everything");
  printf("The answer to life, the universe, and everything is %d\n", answer);
}

