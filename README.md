# Toy Robot Simulator

## Use cases

- Read from stdin

```bash
$> bin/console
> PLACE 1, 1, NORTH
> MOVE
> LEFT
> RIGHT
> REPORT
        |-----|
        |-----|
        |-ʌ---|
        |-----|
        |-----|

```

- Read from file

```bash
$>  bin/console tests.txt
> place 0, 0, north
position: (x: 0, y: 0), facing: north
> move
position: (x: 0, y: 1), facing: north
> move
position: (x: 0, y: 2), facing: north
> report
        |-----|
        |-----|
        |ʌ----|
        |-----|
        |-----|

```
