/* --- Copyright University of Birmingham 2011. All rights reserved. ------
 > File:			$usepop/pop/lib/lib/espeak_list.p
 > Purpose:			Using espeak on linux to 'say' the contents of a list                   	
 > Author:			Aaron Sloman, Nov 28 2011
 > Documentation:   See below
 > Related Files:   LIB ELIZAPROG.P
 */

/*

uses espeak_list

espeak_list([Hello everybody.], '')
espeak_list([Mary, to her surprise,  had a little lamb.], 'espeak -s 100 -k40 -v+m2 ')

*/


define espeak_list(list, params);

	if params = nullstring then

		 ;;; speed 120, female voice f2, accentuate capital letters

         'espeak -s 120 -k40 -v+f2 ' -> params;

	endif;

	sysobey(params >< ' ' >< list_to_string(list))

enddefine;
