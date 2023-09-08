/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 0;                      /* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const int user_bh = 20;               /* add an defined amount of pixels to the bar height */

static const char *fonts[] = {
	"iosevka:size=10"
};
static const char *prompt      = "Run:";      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
	[SchemeNorm] = { "#5e6679", "#2e3440" },
	[SchemeSel] = { "#2e3440", "#a3be8c" },
	[SchemeSelHighlight] = { "#2e3440", "#a3be8c" },
	[SchemeNormHighlight] = { "#eceff4", "#2e3440" },
	[SchemePrompt] = { "#eceff4", "#2e3440" },
	[SchemeInput] = { "#b48ead", "#2e3440" },
	[SchemeNumbers] = { "#eceff4", "#2e3440" },
	[SchemeOut] = { "#000000", "#00ffff" },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";

static unsigned int border_width = 3;