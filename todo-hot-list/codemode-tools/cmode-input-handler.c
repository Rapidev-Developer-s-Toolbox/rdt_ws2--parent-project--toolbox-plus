#include <stdio.h>
#include <getopt.h>
#include <unistd.h>






int main (int argc, char* argv[]) {

  int next_option;

  char* const short_options[16] = "hvwp:";

  const struct option long_options[] = {
    
    { "help", 0, NULL, 'h'},
    { "version", 0, NULL, 'v'},   
    { "wordy", 0, NULL, 'w'},
    { "parent-dir", 1, NULL, 'p'},
    { NULL, 0, NULL, 0}

  };

  const char* output_filename = NULL;

  /* currently, only 0 and 1 are valid, but eventually it should be capable of 0-3, 
   and 'wordy' param will take an optional value which will set it.     */
  int verbose = 0;

  

}