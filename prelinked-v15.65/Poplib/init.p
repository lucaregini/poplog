;;; Default user startup file for Poplog
;;; Aaron Sloman 17 Sep 2000
;;; Revised 26 Nov 2011
;;; increased popmemlim, changed pop_charin_escapes


;;; Possibly increase this default? (number is in words, not bytes)
max(popmemlim, 5000000) -> popmemlim;


;;; Handle rxvt type terminals like xterms
lvars TERM = systranslate('TERM');

if member(TERM, ['rxvt' 'urxvt' 'rxvt-unicode' 'rxvt-unicode-256color']) then
        'xterm' -> systranslate('TERM')
endif;

;;; 26 Nov 2011 no longer needed. System default can cause problems
[] -> pop_charin_escapes;


vars
	popmaxtraceindent = 30,		;;; limits depth of tracing
	pop_mishap_doing_lim = 30,	;;; limits depth of callstack in error messages
;

/*
;;; Uncomment this section if you have a poplib directory for autoloading

;;; add owner's poplib directory to popautolist (and therefore popuseslist)
lvars ownerlib=sysfileok('~/Poplib');

if sys_file_exists(ownerlib) then

	unless member(ownerlib,popautolist) then
		;;; May have been set up in a saved image
		[^ownerlib ^^popautolist] -> popautolist;
	endunless;

endif;

*/

vars initfiledone = true;
