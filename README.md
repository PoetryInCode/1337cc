# 1337C

This is a hacky C-transpiler that I threw together for as a joke.

It transpiles C code that is written in my brand of 1337 or 13375p34k and tries
its best to translate it into C. Because of how my brand of 1337 both `l` and `i`
map to a `1`, so it has to guess whether a `1` is an `l` or `i`. Which it does so
shockingly decent.

All integer constants must be represented in octal form. Why? I don't quite remember
why, I wrote this at 2:00am. Though I'm sure I had a good reason. The octal
constants are translated into binary literals because they are easy to fix with
regex.

This is the sample hello world program in [./m41n.c1337](./m41n.c1337).
```
#1nc1vd3 <57d10.|-|>

1n7
m41n()
{
  pv75("|-|3110 vv0r1d!");
  r37vrn 00;
}
```

Sadly, it doesn't support upper-case characters since my brand of 1337 also
doesn't care about casing. Who uses case in C anyways? All the Java and Go devs
can keep their casing (eww...).

## Usage

The script reads from stdin and will print the transpiled code to stdout. See
the [./Makefile](./Makefile)

```
./1337cc.pl <./m41n.c >main.c && gcc main.c -o main
./main
```
