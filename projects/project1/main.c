#include <unistd.h>
#include <getopt.h>

#define BUF_SIZE 2048

static char buf[BUF_SIZE];
static unsigned int rc = 0;

int main()
{
  while ((rc = read(STDIN_FILENO, buf, BUF_SIZE * sizeof(char))) > 0)
    if (write(STDOUT_FILENO, buf, rc * sizeof(char)) < 0)
      return -1;
  return 0;
}
