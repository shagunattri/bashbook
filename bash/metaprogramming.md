## Metaprogramming

Processes that surround the work you do but not programiing in itself

Build system -> sequence of commands lets you encode commands to run in order to build targets into a 
tool that does int for you and give dependencies information and there are many of these.


npm -> has built it tools for building dependencies

and is a build system

they have targets(paper.pdf,run tests) to build 

dependencies are neededto be build for the target to be built

and rule to define to go from the dependencies and produce the target.

rule is a sequence of commands to run to built the tagret from the dependencies.

$ make -> simple to medium programs
requires targets and makefile to execute.

make looks for makefile in the current dir.

```bash
# % means any string
paper.pdf: paper.tex plot-data.png
        pdflatex paper.tex
        # dat suffix for data file
plot-%.png:%.dat plot.py
        ./plot.py -i $*.dat -o $@

        # $* matches what the percentile file name
        # $@ target file name
```

make manages changes and on make generates the target for the changes made

make takes care of doing the minimal amount of work needed
and ease the build process

repositories for storage of libraries/files

- pypy 
- rubygems
- crates
- keybase
- apt
- pacman

Version numbers of software release enable to find support & its support 
version solve it

`Semantic versioning` gives meaning to updates and has a contract as to when an update to be made

64.              0.      20
|                |       |
major            minor   patch

backwards        lib     bug fixes
incompatible     update
change

Eg: python version (2 vs 3) as it is major and follows semantic versioning

`lock files` - to make sure you dont accidentally update some lib to make it faster and stop accidental update and ease builds
                signed binary and help in security where a particular lib is bugged
                enable freezing of builds and programs

`CI systems` - releasing libs,run test suites,check code styles and are
                event triggered actions
Eg:              Travis CI,azure pipeline,Github Actions

Add a `reciepe` file and contains instruction

EG:Dependabot,

Github-pages

Uses CI actions and produces websites.

Test suite

test running as a unit

- Unit test
self contained test testing a single feature (very particular)
- Integration Test
Mutiple subsystem tests
- Regression Test
checks for prev error test

## Mocking 
replace parts of a system to a dummy version of itself tat behaves in a way you control.

