The naming convention(s) used for CoFE development have been given
insufficient consideration and have been applied inconsistently thus
for. I'm using this opportunity to improve thing by picking a
convention. The current codebase does not obey this convention yet.

The convention is modified from the Java convention suggested by \[Sun
Microsystems, Inc.\](
http://www.oracle.com/technetwork/java/codeconventions-135099.html
https://dx.doi.org/10.2514/1.C033171)

+-----------------------+-----------------------+-----------------------+
| Category              | Naming Convention     | Examples              |
+=======================+=======================+=======================+
| Folders               | Use snake\_case with  | cofe\_toolbox         |
|                       | all lowercase         |                       |
|                       | letters.              |                       |
+-----------------------+-----------------------+-----------------------+
| Classes               | Use UpperCamelCase.   | InputFile;            |
|                       | Test rebuild. Class   |                       |
|                       | names should be       | Beam;                 |
|                       | nouns, in mixed case  |                       |
|                       | with the first letter |                       |
|                       | of each internal word |                       |
|                       | capitalized. Try to   |                       |
|                       | keep your class names |                       |
|                       | simple and            |                       |
|                       | descriptive. Use      |                       |
|                       | whole words-avoid     |                       |
|                       | acronyms and          |                       |
|                       | abbreviations (unless |                       |
|                       | the abbreviation is   |                       |
|                       | much more widely used |                       |
|                       | than the long form,   |                       |
|                       | such as URL or HTML). |                       |
+-----------------------+-----------------------+-----------------------+
| Functions             | Use lowerCamelCase.   | run();                |
|                       | Functions should be   |                       |
|                       | verbs, in mixed case  | runFast();            |
|                       | with the first letter |                       |
|                       | lowercase, with the   | getBackground();      |
|                       | first letter of each  |                       |
|                       | internal word         |                       |
|                       | capitalized.          |                       |
+-----------------------+-----------------------+-----------------------+
| Variables             | Use lowerCamelCase.   | I; c; myWidth         |
|                       | Variables including   |                       |
|                       | class instances       |                       |
|                       | (objects) should be   |                       |
|                       | mixed case with a     |                       |
|                       | lowercase first       |                       |
|                       | letter. Internal      |                       |
|                       | words start with      |                       |
|                       | capital letters.      |                       |
|                       | Variable names should |                       |
|                       | not start with        |                       |
|                       | underscore \_.        |                       |
|                       | Variable names should |                       |
|                       | be short yet          |                       |
|                       | meaningful. The       |                       |
|                       | choice of a variable  |                       |
|                       | name should be        |                       |
|                       | mnemonic- that is,    |                       |
|                       | designed to indicate  |                       |
|                       | to the casual         |                       |
|                       | observer the intent   |                       |
|                       | of its use.           |                       |
|                       | One-character         |                       |
|                       | variable names should |                       |
|                       | be avoided except for |                       |
|                       | temporary             |                       |
|                       | \"throwaway\"         |                       |
|                       | variables. Common     |                       |
|                       | names for temporary   |                       |
|                       | variables             |                       |
|                       | arei, j, k, m,        |                       |
|                       | and n for             |                       |
|                       | integers; c, d,       |                       |
|                       | and e for characters. |                       |
+-----------------------+-----------------------+-----------------------+
| Constants             | The names of          | MIN\_WIDTH = 4;       |
|                       | variables declared    | MAX\_WIDTH = 999;     |
|                       | class constants       | GET\_THE\_CPU = 1;    |
|                       | should be all         |                       |
|                       | uppercase with words  |                       |
|                       | separated by          |                       |
|                       | underscores (\"\_\"). |                       |
+-----------------------+-----------------------+-----------------------+
