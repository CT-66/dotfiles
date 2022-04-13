#include "logos/arch_small.h"
//define colors
#define BLACK  "\e[1;30m"
#define RED    "\e[1;31m"
#define GREEN  "\e[1;32m"
#define YELLOW "\e[1;33m"
#define BLUE   "\e[1;34m"
#define PURPLE "\e[1;35m"
#define CYAN   "\e[1;36m"
#define WHITE  "\e[1;37m"


//define display colors
#define COLOR BLUE
#define LOGOCOLOR CYAN
#define TITLECOLOR PURPLE

#define CONFIG \
{ \
   /* name            function                 cached */\
    { "",            get_title,               false }, \
    { "os     ",         get_os,                  true  }, \
    { "host   ",       get_host,                true  }, \
    { "kernel ",     get_kernel,              true  }, \
    { "uptime ",     get_uptime,              false }, \
    { "pkgs   ",       get_packages_pacman,     false }, \
    { "memory ",     get_memory,              false }, \
}

#define CPU_CONFIG \
{ \
   REMOVE("(R)"), \
   REMOVE("(TM)"), \
   REMOVE("Dual-Core"), \
   REMOVE("Quad-Core"), \
   REMOVE("Six-Core"), \
   REMOVE("Eight-Core"), \
   REMOVE("Core"), \
   REMOVE("CPU"), \
}

#define GPU_CONFIG \
{ \
    REMOVE("Corporation"), \
    REMOVE("Controller"), \
    REMOVE("Graphics"), \
    REMOVE("Integrated"), \
}
