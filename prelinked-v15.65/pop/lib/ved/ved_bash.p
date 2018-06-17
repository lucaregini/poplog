/* --- Copyright University of Birmingham 2011. All rights reserved. ----------
 > File:            $usepop/pop/lib/ved/ved_bash.p
 > Purpose:			Run a BASH command, and read output into a VED buffer
 > Author:          Aaron Sloman, 27 Jul 2002 (see revisions)
 > Documentation:	HELP * PIPEUTILS, HELP * SHELL
 > Related Files:	SHOWLIB * VEDGENSHELL, * VEDPIPEIN, * PIPEIN
 >						LIB ved_sh, ved_csh,
 */
compile_mode :pop11 +strict;

/*
ved_bash
A VED command for running a bash shell command and reading the output
into a temporary VED file.

 <ENTER> bash <command>

Runs the /bin/bash with the <command> and reads in any output.

*/

section;

define vars ved_bash;
	vedgenshell('/bin/bash',copy(vedcommand));
enddefine;

endsection;

/* --- Revision History ---------------------------------------------------
--- Aaron Sloman, Nov 28 2011
		Installed in main poplog system
 */
