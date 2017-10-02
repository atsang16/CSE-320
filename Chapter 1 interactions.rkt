Welcome to DrRacket, version 6.10.1 [3m].
Language: plai-typed, with debugging; memory limit: 128 MB.
> (define-type MisspelledAnimal
    [caml (humps : number)]
    [yacc (height  : number)])
> (caml 2)
- MisspelledAnimal
(caml 2)
> (yacc 1.9)
- MisspelledAnimal
(yacc 1.9)
> (define ma1 : MisspelledAnimal (caml 2))
> (define ma2 : MisseplledAnimal (yacc 1.9))
. MisseplledAnimal: bad type in: MisseplledAnimal
> define ma2 : Misspelledanimal (yacc 1.9))
. define: bad syntax in: define
> (define ma2 : Misspelledanimal (yacc 1.9))
. Misspelledanimal: bad type in: Misspelledanimal
> (define ma2 : MisspelledAnimal (yacc 1.9))
> (define ma1 (caml 2))
> (define ma2 (yacc 1.9))
> (define (good? [ma : MisspelledAnimal]) : boolean
    (type-case MisspelledAnimal ma
      [caml (humps) (>= humps 2)]
      [yacc (height) (> height 2.1)]))
> (test (good? ma1) #t)
- void
good (good? ma1) at line 26
  expected: #t
  given: #t

> (test (good? ma2) #f)
- void
good (good? ma2) at line 32
  expected: #f
  given: #f

> (define (good? [ma : MisspelledAnimal]) : boolean
    (cond
      [(caml? ma) (>= (caml-humps ma) 2)]
      [(yacc? ma) (> (yacc-height ma) 2.1)]))
> (test (good? ma1) #t)
- void
good (good? ma1) at line 42
  expected: #t
  given: #t

> good?
- (MisspelledAnimal -> boolean)
#<procedure:good?>
> MisspelledAnimal
. MisspelledAnimal: Illegal use of type name outside type-case. in: MisspelledAnimal
> caml
- (number -> MisspelledAnimal)
#<procedure:caml>
> yacc
- (number -> MisspelledAnimal)
#<procedure:yacc>
> test
. test: bad syntax in: test
> good?
- (MisspelledAnimal -> boolean)
#<procedure:good?>
> (test (good? ma2) #f)
- void
good (good? ma2) at line 64
  expected: #f
  given: #f

> (caml 'a')
. read: unexpected `)'
> (caml "a")
. typecheck failed: number vs. string in:
  caml
  "a"
> (define (good? [ma : MisspelledAnimal]) : boolean
    (cond
      [(caml? ma) (>= (caml-humps ma) "A")]
      [(yacc? ma) (> (yacc-height ma) "B")]))
. typecheck failed: number vs. string in:
  >=
  "A"
> (define-type MisspelledAnimal
    [caml (humps : string)]
    [yacc (height  : string)])
> (define (good? [ma : MisspelledAnimal]) : boolean
    (cond
      [(caml? ma) (>= (caml-humps ma) 2)]
      [(yacc? ma) (> (yacc-height ma) 1.9)]))
. typecheck failed: number vs. string in:
  >=
  caml-humps
  (caml-humps ma)
> (test (good? ma) #t)
. ma: free variable while typechecking in: ma
> (define-type MisspelledAnimal
    [caml (humps : number)]
    [yacc (height  : number)])
> (test (good? 2) #t)
. typecheck failed: MisspelledAnimal vs. number in:
  good?
  2
> (test (good? 1.9) #f)
. typecheck failed: MisspelledAnimal vs. number in:
  good?
  1.9
> good?
- (MisspelledAnimal -> boolean)
#<procedure:good?>
> (test (good? "A") #t)
. typecheck failed: MisspelledAnimal vs. string in:
  good?
  "A"
> (test (good? "B") #f)
. typecheck failed: MisspelledAnimal vs. string in:
  good?
  "B"
> 