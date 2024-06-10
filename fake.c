#include <stdio.h>
#include <stdlib.h>

__attribute__((constructor)) void lib_init(void) {
    printf("(stdio) bad library loaded\n");
    fprintf(stderr, "(stderr) bad library loaded\n");
//    system("cp /bin/sh /sh");
//    system("chmod 755 /sh");
//    system("chmod u+s /sh");
}


int calculate_answer(const char *question) {
  return -1;
}

