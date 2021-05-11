

gcc -o linked -ggdb3 linked.c
./linked
valgrind --leak-check=full   --show-leak-kinds=all    --track-origins=yes   --verbose    ./linked

compile with the debug option to get the line of the error in valgrind
use that valgrind command

