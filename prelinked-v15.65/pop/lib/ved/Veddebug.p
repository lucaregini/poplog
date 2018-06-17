/* --- Copyright University of Birmingham 2011. All rights reserved. ------
 > File:            $usepop/pop/lib/ved/Veddebug.p
 > Compare: 		LIB veddebug
 > Purpose:			Modify veddebug to have debugging as control variable
 >					and not to require a string
 > Author:          Aaron Sloman, Dec 25 1995 (see revisions)
 > Documentation:   Below. See also HELP veddebug
 > Related Files:
 */

/*
This is more useful than is suggested by the Purpose line in the
original header file for lib veddebug (shown below).

It is convenient during debugging of other things than VED programs
to have a lot of intermediate results displayed on the VED status
line.

This version allows Veddebug to be turned off if the global variable
debugging is false. This allows rapid switching on and off of debug tests
during development.

Also it does not require its input to be a string, as any other input
is converted to a suitable string format, e.g.
	Veddebug([foo ^foo]);

to show the value of the variable foo.
Aaron Sloman
 1 Jan 1996
*/

/*  --- Copyright University of Sussex 1986.  All rights reserved. ---------
 >	File:			C.all/lib/ved/veddebug.p
 >	Purpose:		Used for debugging and testing editor system procedures.
 >	Author:			A.Sloman, 44 BC? (see revisions)
 >	Documentation:	HELP * VEDPROCS
 >	Related Files:
 */

;;; The input should be a string. It is printed out on the status line
;;; The system pauses until a character is typed. If it is RETURN, then
;;; programs continue running, otherwise popready is called.
section;

global vars debugging = true;

;;; in case LIB ved_autosave is in use.
global vars vedautosaving;

define global Veddebug(x);
	lvars x, file;
	returnunless(debugging);
	dlocal
		;;; in case LIB ved_autosave is in use.
		vedautosaving = false,
		vedautowrite = false,
		vedediting=true, vedwiggletimes = 1;
	vedscr_flush_output();
	vedscreenbell();
	unless isstring(x) then x sys_>< nullstring -> x endunless;
	vedputmessage(x);
	vedwiggle(vedline,vedcolumn);
	vedinascii() -> x;
	unless x == `\r` then
		pr('VEDDEBUG:\n');
		valof("popready")();
		false -> vedprintingdone;
		vedscreenraw();
		1000 ->> vedscreenline -> vedscreencolumn;
		vedrestorewindows();
	endunless;
enddefine;

endsection;

/*  --- Revision History ---------------------------------------------------
--- Aaron Sloman, Dec 31 2011
		Transferred from local directory to main system.
--- Aaron Sloman, Aug  6 2002
		Turned off autosaving and autowrite
--- Aaron Sloman, Nov 23 1998
	Made it flush output.
--- Aaron Sloman, Aug 28 1988
	Altered to make it restore the screen properly after calling
	popready.
	Altered to make cursor wiggle at current line and current column
	Postpones compilation of popready until needed.
--- Aaron Sloman, Apr 27 1986
	Altered to make vedediting true locally - otherwise doesn't work.
 */
