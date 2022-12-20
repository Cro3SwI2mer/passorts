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

### Task 17 point 1

```
fpc -ghl -Mobjfpc -omain kartashev_17_1.pas
./main
```

## Tables

### Shuttle movements

| N  |       case                       | average |
| -- | ---- | ---- | ---- | ---- | ---- | ------- |
| -- | 1    | 2    | 3    | 4    | 5    | ------- |
| 20 |   92 |   68 |   96 |   88 |   99 |      89 |
| 99 | 2108 | 2598 | 2481 | 2319 | 2506 |    2402 |


### Quick movements

| N  |       case                  | average |
| -- | --- | --- | --- | --- | --- | ------- |
| -- | 1   | 2   | 3   | 4   | 5   | ------- |
| 20 |  24 |  24 |  26 |  29 |  24 |      25 |
| 99 | 186 | 177 | 178 | 180 | 179 |     180 |
