Sorting project
===============

First term programming project, implemented in Free Pascal.
Consists of program, which implements several sorting algorithms and can output some information about their performance.

## Build

### General

```
fpc -ghl -Mobjfpc custypes.pas
fpc -ghl -Mobjfpc utils.pas
fpc -ghl -Mobjfpc sorts.pas
```

### Tests

```
fpc -ghl -Mobjfpc test_utils.pas
fpc -ghl -Mobjfpc test_sorts.pas
fpc -ghl -Mobjfpc -otest tests.pas
./test
```

### Task 14 point 1

```
fpc -ghl -Mobjfpc -omain kartashev_14_1.pas
./main
```
