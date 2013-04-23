numeric-file-sorter
===================

Small script that takes a folder containing many files only differing by a number and organize them into subfolders.

==
Usage:
./filesorter.pl folder_to_sort prefix_of_file [depth]
where depth defaults to 1, and is the depth sorting
will go, eg depth=2 will place files in 0/0/ - 9/9/

==
Example:
mkdir test
cd test
perl -e 'for ($i = 0; $i < 10; $i++) { for ($j = 0; $j < 10; $j++) { `touch prefix?=$i$j` ; }}'
cd ..
./filesorter.pl test "prefix?=" 2
would sort each file into test/0/0/prefix?=00, test/0/1/prefix?=01
