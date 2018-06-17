From Aaron Sloman Tue Nov  8 04:11:06 GMT 2011
Bcc: Will Price <will.price94@gmail.com>
Subject: Proposed fix for Ved scrolling problems

In the past various people have found that linux terminal programs that
claim to emulate xterm screen handling fail to do it properly, including
gnome-terminal, and urxvt rxvt etc. (Though the very latest
gnome-terminal in Fedora 15 is now fixed, and an Arch linux user has
reported that the latest Arch urxvt is fixed. It isn't in Fedora 15).

The failures caused Ved (not XVed) to mess up the screen when scrolling,
and also breaking lines.

Unfortunately Ved's source code is so tangled and so short on
documentation that finding what to change is tricky.

However, I have now found an unexported variable in the Ved sources

    terminal_can_scroll

used in vdscreen.p, which gets set to 1 when $TERM = xterm which causes
ved to attempt to optimise screen scrolling. That used to be highly
desirable 30 years ago, but isn't now, except when using Ved remotely
with a very slow connection.

I have tried introducing an exported active variable
    ved_terminal_can_scroll

which reports and sets the value of that hidden variable, and I have
altered the default initialisation process so that it sets

    terminal_can_scroll

false in all cases. The user can override that using the new active
variable, giving it value 1, or true.

On my tests so far (with a couple of terminal programs that used to
cause problems), Ved seems to work perfectly. The slight loss in speed
is not noticeable, even when I tried using it logged in remotely to a
linux virtual machine running poplog.

I plan to install this into the default linux poplog in the next few
days if I hear no objections.

If you want to work out what it effects use

    grep terminal_can_scroll $usepop/pop/ved/src/*

If you wish to try 32 bit executables with this compiled in

    cd $popsys

    ## save basepop11* (NB don't use 'mv')
    mkdir saved
    cp -p basepop11* saved

    # get tar file with new executable
    # about 760 kbytes
    wget http://www.cs.bham.ac.uk/research/projects/poplog/fixed/pop/newpop11.tar.gz

    # unpack the four files in it (AREADME.txt newpop11, newpop11.map newpop11.stb)
    # The AREADME.txt file is the one you are reading now
    # the last one is empty.

    tar xfz newpop11.tar.gz

    ## test the newpop11

    ./newpop11 %noinit

    # if it allows you to run Ved it should be OK
    teach define

    ## exit with CTRL-d
    ## if you have a recent poplog it should have a script
    ## copybasepop11. Run it

    source copybasepop11

    ## or do
    cp -p newpop11 basepop11
    cp -p newpop11.map basepop11.map
    cp -p newpop11.stb basepop11.stb

Now rebuild the saved images you use (in $popsavelib)

    mkstartup
    mkxved
    mkplog
    mkclisp
    mkpml
    mkeliza

Only the first is essential. The scripts are all in
$usepop/pop/com

Try using Ved in your favourite terminal. When ved starts if it doesn't
recognize the value of $TERM, it will ask you. Try giving "xterm"

A simple test after that is to try breaking lines and scrolling up
and down in a half or full window, e.g. using a teach file.

If you meet any problems, or any noticeable loss of speed please let me
know. Check first that this

    ved_terminal_can_scroll =>

is defined and gives

    ** <false>

If not set it false.

If the system is  unusable you can restore the previous state by doing

    cd $popsys/saved

    cp -p basepop11* ..

then rebuild saved images as above.

Alternatively, before starting save the contents of
    $usepop/pop/lib/psv/*.psv

somewhere else. You can then restore without rebuilding.

Of course, my change may interact with something in your vedinit.p file.

Aaron
http://www.cs.bham.ac.uk/~axs
