TEMPORARY VERSION 10 Oct 2015

Serious problems linking 32 bit poplog on 64 bit linux have been dealt with
in an unprincipled way by using a previously linked 32 bit basepop11 and
not attempting to re-link.

This seems to work, including allowing saved images to be created.
However, the option to run without motif or without X11 has been removed.
People who know enough to want to do that should be able to change the
linking process.

This file is
    $usepop/INSTALL/AREADME.txt

also online at
    http://www.cs.bham.ac.uk/research/projects/poplog/latest-poplog/current/INSTALL/AREADME.txt
    (The online version may be out of date)

THE POPLOG LINK SCRIPTS
=======================
Aaron Sloman

11 Feb 2015
Changed to use saved basepop11 in case new one does not work.

21 Oct 2014

Something has changed in the Ubuntu linker that stopped poplog linking
at least on 32 bit Ubuntu.

However the previously linked version seems to work.

So LINK_USING_NEWPOP has been altered to test for Ubuntu
and re-use the original pop11. A temporary hack

2 Oct 2010

The main INSTALL_BHAM_LINUX_POPLOG script (and 64 bit version) uses
scripts for various parts of the process in

    $usepop/INSTALL

which script is chosen depends on options taken.

For reasons that I don't remember, I found that simpler than
creating one large script with lots of conditionals. Partly that was
to enable some of the sub-scripts to be used on their own (with
$poplogroot set to /usr/local/poplog or something else as required).

This mechanism is not part of the original Sussex or ISL poplog
distribution.

I  hope that functions of most of the contents of the INSTALL
directory are obvious from their names, though some are probably
useless relics now.


    /home/staff/axs/.poplog/v15.6.4/v15.6.4/INSTALL/AREADME.txt

    CHECK_LINUX_FACILITIES
    CHECK_LINUX_FACILITIES_64bit


    poplog1
    poplog1.sh
    poplog2
    poplog2.sh
        These are used as parts of poplog and poplog.sh scripts
        created by the next command

    CREATE_SCRIPTS arg
        create startup scripts for poplog located at arg
        Assumes $poplocal has already been set
        This is normally run in the startup directory by installation
        scripts
        It creates poplog startup scripts for tcsh and bash users
            poplog
            poplog.sh
        by concatenating two portions of each with a bit in the
        middle added to give the location of $usepop.

    INSTALL.txt
    INSTALLATION-OVERVIEW.txt
        Some overview files explaining how things work and what to do

    INSTALL_BHAM_LINUX_POPLOG (or 64 bit version)
        Script that does everything assuming the tar file has been
        downloaded. Run it to find out the arguments.
        It probably needs to be improved to give more options.
        (E.g. install without X libraries)

    LINK_LIKE_BHAM
    LINK_LIKE_CORE
    LINK_MOTIF_POPLOG
    LINK_NOBHAM_POPLOG
    LINK_NOMOTIF_POPLOG
    LINK_USING_NEWPOP
        Various scripts invoked conditionally (possibly with
        arguments) at various stages of the process.

    USERLINK_BHAM_MOTIF_POPLOG
    USERLINK_BHAM_NOMOTIF_POPLOG
    USERLINK_ORIGINAL_MOTIF_POPLOG
    USERLINK_ORIGINAL_NOMOTIF_POPLOG
    USERLINK_ORIGINAL_NOX_POPLOG
        Various scripts to allow users to re-link after installation.

    tarcp
        Museum piece now made redundant by 'cp -a' and 'rsync'.


Some of the complexity here is a relic of the time when Bham poplog
had different defaults (e.g. in startup.psv) from the ISL/Sussex
poplog.

But everyone who has fetched poplog in the last 5 years or more has,
by default, had the bham options included. (E.g. with rclib and
objectclass and the new matcher prefix "!" in the startup saved
image.)

==
