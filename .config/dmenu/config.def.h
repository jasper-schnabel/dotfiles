/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

/* -b option; if 0, dmenu appears at bottom */
static int topbar = 1;

/* -p option; if 1, prompt uses SchemeSel, otherwise SchemeNorm */
static int colorprompt = 1;

/* -F option; if 0, dmenu doesn't use fuzzy matching */
static int fuzzy = 1;

/* -c option; centers dmenu on screen */
static int centered = 0;

/* minimum width when centered */
static int min_width = 500;

/* maximum width when centered */
static int max_width = 500;

/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
  "Inconsolata Nerd Font:size=10"
};

/* -p option; prompt to the left of input field */
static const char *prompt = NULL;

/* colors */
static const char *colors[SchemeLast][2] = {
  /*     fg         bg       */
  [SchemeNorm] = { "#EFF0EB", "#1C1C1C" },
  [SchemeSel] = { "#1C1C1C", "#005FD7" },
  [SchemeSelHighlight] = { "#1C1C1C", "#005FD7" },
  [SchemeNormHighlight] = { "#005FD7", "#1C1C1C" },
  [SchemeOut] = { "#1C1C1C", "#005FD7" },
};

/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines = 0;

/* -h option; minimum height of a menu line */
static unsigned int lineheight = 30;
static unsigned int min_lineheight = 30;

/* characters not considered part of a word while deleting words
 * for example: " /?\"&[]" */
static const char worddelimiters[] = " ";

/* -n option; preselected item starting from 0 */
static unsigned int preselected = 0;

/* size of the window border */
static unsigned int border_width = 0;
