Changes inserted by Aaron Sloman

Note: these files are terribly badly documented/commented

CONTENTS

 -- 4 May 2012 Changes made to allow 32 bit poplog to be compiled and linked on 64 bit linux
 -- -- In asmout.p
 -- -- In os_comms.p
 -- 2007
 -- -- In os_comms.p Aaron Sloman, Sep 10 2007
 -- 2005
 -- -- In os_comms.p Aaron Sloman, Jan  4 2005
 -- 2004
 -- -- In os_comms.p Dec 31 2004 [No longer needed ??]

=======================================================================

-- 4 May 2012 Changes made to allow 32 bit poplog to be compiled and linked on 64 bit linux
(Assumes all required 32 bit libraries have been installed)

-- -- In asmout.p
    cc_link_command_header
    ;;; Altered A.S 19 Feb 2012 to insert --no-as-needed
        (to override new Ubuntu linker default)
    ;;; Altered A.S. 4 May 2012 to insert -m32-bit for 32 bit system.
    ;;; Altered A.S. 15 May 2012 to -m32 for 32 bit system.

-- -- In os_comms.p
    Inserted -m32 before -lpop
    nl_printf('-m32 -lpop');

-- 2007
-- -- In os_comms.p Aaron Sloman, Sep 10 2007
        Altered to create a bash script header instead of sh for $popsys/poplink_cmnd

-- 2005
-- -- In os_comms.p Aaron Sloman, Jan  4 2005
        Changed gen_link_command to produce a version of $popsys/poplink_cmnd
        that uses 'sh' syntax rather than 'csh', because not all linux systems
        now come with csh or tcsh installed, which prevents re-linking.

-- -- In sysdefs_linux_elf.p
    ;;; changed by A.S. 6 Jan 2005, on advice from Robert Duncan
    set C_FLOAT_RESULT_SINGLE = false,
    to fix bug in invocations of external programs returning single
    float results. See also $popsrc/fields.p where it proved necessary to alter
    Convert_func_*spec

-- 2005
-- -- In poplink_main.p
--- Aaron Sloman, Jan  4 2005
        Removed last change. The fix for getting unexpanded $popobjlib into
        $popsys/poplink_cmnd turned out to be in
            $popsys/pglink
--- Aaron Sloman, 1 Nov 2003
        added to the main procedure
            pop_translate_envvars = false,
        Replaced sysfileok('$popexternlib/') with '$popexternlib/'

-- -- In files.p

--- Aaron Sloman, Jan  4 2005
define is_dir_path(fname);
    ;;; changed by A.Sloman
    ;;; added dlocal expression
    dlocal pop_translate_envvars = false;

    2004 comment about this not fully working is now out of date. Getting
        $popsys/poplink_cmnd to be generated without '$popobjlib' being
        expanded required changes to the script $popsys/pglink
        as well as the change using pop_translate_envvars
--- Aaron Sloman, Dec 31 2004
    Changed is_dir_path(fname) and new_fname_extn(fname, new_extn)
        to make pop_translate_envvars false, so that files created don't
        have hard-wired file names. (Not fully working yet).

-- 2004
-- -- In os_comms.p Dec 31 2004 [No longer needed ??]
        Altered gen_link_command so that if motif is included it uses a link to
        the appropriate file  made in
            $popexternlib/libXm.so
        e.g. in case there is not a libXm.so link in /usr/X11R6/lib
        This requires the installation scripts to insert the link in
        $popexternlib
