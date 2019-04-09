You can open them from within vim using

:args myfile*
or if you want to open all files matching the pattern in subfolders

:args **/myfile*
This all assumes your current directory is the folder from wich you want to open files from. Prepend a directory to myfile if it's not.

:args /yourfolder/myfile*
:args /yourfolder/**/myfile*
Edit (cudo's to romainl)

To open all the files found in tabs, you can use

:argdo tabe
wich essentially goes like this:

argdo: for each file in the argument list
tabe : open a new tabpage and edit the file


-------------------
Paste
-------------------

Ctrl+Shift+V

-------------------
How to yank to the end of file
-------------------
You should yank the text to the * or + registers:

gg"*yG

Explanation:

gg to get the cursor to the first character of the file
"*y to start a yank command to the register * from the first line, until...
G to go the end of the file


Do make upper caret which goes to the beginning of the file in vim:
ALTGR + ä = ^


grep -rl "string" /path

-r (or --recursive) option is used to traverse also all sub-directories of /path, whereas
-l (or --files-with-matches) option is used to only print filenames of matching files, and not the matching lines (this could also improve the speed, given that grep stop reading a file at first match with this option).


gd - Go to definition, it's same as like CTRL + B in intellij.
CTRL + W - deletes the last word in insert mode
CTRL + H deletes the last character in insert mode
CTRL + O backwards the jump in vim.
CTRL - I forward the jump in vim.
CTRL - M In insert mode move row below
CTRL + F12 useful for seeing methods in file, ALT + 7
SHIFT + ALT + 7 Recent changes
CTRL + J for isnerting live templates
ALT + N, K B for adding bookmark
ALT + N, S to symbol search
ALT + E, F R to replace
ALT + R, R to rename
zc in vim hide the block
zo show the block

VIM

ct{ - changes to the start of curly and then eneters into insert mode dosent include {
df. - delets until dot and includes it

@@@@@@@ UBUNTU
CTRL + ALT + PRINT - Create screenshot with an area and copy to clipboard
SUPER + L - Locks the screen

