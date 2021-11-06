/* user and group to drop privileges to */
static const char *user = "jasper";
static const char *group = "jasper";

/* colors */
static const char *colorname[NUMCOLS] = {
  [INIT] = "#1C1C1C", /* after initialization */
  [INPUT] = "#005FD7", /* during input */
  [FAILED] = "#FF0000", /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;

/* enable blur */
#define BLUR
/* set blur radius */
static const int blurRadius = 20;

/* enable pixelation */
/*#define PIXELATION*/
/* set pixelation radius */
/*static const int pixelsize=0;*/

/* time in seconds before the monitor shuts down */
static const int monitortime = 60;
