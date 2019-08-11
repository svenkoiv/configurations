---------------------------
 V I M
---------------------------

** Opening files **

:args myfile* - if you want to open all files matching the pattern in subfolders

:args **/myfile* - This all assumes your current directory is the folder from wich you want to open files from. Prepend a directory to myfile if it's not.

:args - /yourfolder/myfile*

:args - /yourfolder/**/myfile*

** Editing files **

gd - Go to definition
CTRL + w - deletes the previous word in insert mode
CTRL + h - deletes the last character in insert mode
CTRL + o - backwards the jump in vim in normal mode
CTRL + i - forward the jump in vim in normal mode
CTRL + t - indents the current line in insert mode
CTRL + d - unindents the current line in insert mode
CTRL + m - insert a row below in insert mode
z + c - hide block in normal mode
z + o - show block in normal mode

** Text objects **

iw => "inner word" (works from anywhere in a word)
it => "inner tag" (the contents of an HTML tag)
i" => "inner quotes"
ip => "inner paragraph"
as => "a sentence"


c/wordtofind - from current position change everyting until that word
vim sort motion for sorting paragrahps
customer text object - indent very useful for identing blocks

** Incremental search highlighting **

:set incsearch - show the next match while searching

--------------------------
 L I N U X
--------------------------

** Greping **

grep -rl "string" /path
-r (or --recursive) option is used to traverse also all sub-directories of /path, whereas
-l (or --files-with-matches) option is used to only print filenames of matching files, and not the matching lines (this could also improve the speed, given that grep stop reading a file at first match with this option)

** Fast screenshot **
CTRL + ALT + PRINT - Create screenshot with an area and copy to clipboard

--------------------------
I N T E L L I J
--------------------------

CTRL + F12 - useful for seeing methods in the current file (Intellj)
ALT + 7 - useful for seeing methods in the current file (Intellij)
ALT + N, K B - for adding bookmark (Intellj)
ALT + N, S - for symbol search (Intellj)
ALT + E, F R - for advanced replace (Intellj)
ALT + R, R - rename (Intellj)
