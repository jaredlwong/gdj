NB. ,:y -----------------------------------------------------------------

(,t)-:,:t=:1
(,t)-:,:t=:'a'
(,t)-:,:t=:4
(,t)-:,:t=:3.45
(,t)-:,:t=:1j3
(,t)-:,:t=:<'abc'

((1,$t)$,t) -: ,:t=:(?(?7)$7)$1 0 1
((1,$t)$,t) -: ,:t=:(?(?7)$7)$'abc'
((1,$t)$,t) -: ,:t=:(?(?7)$7)$3 4 5
((1,$t)$,t) -: ,:t=:(?(?7)$7)$o.i.12
((1,$t)$,t) -: ,:t=:(?(?7)$7)$^0j1*?5$5
((1,$t)$,t) -: ,:t=:(?(?7)$7)$'cogito';3 4

7 (($,:) -: (>@# <)) ?3 1 4$2
7 (($,:) -: (>@# <)) a{~?3 1 4$#a=:'astringent bailiwick'
7 (($,:) -: (>@# <)) ?3 4$100
7 (($,:) -: (>@# <)) <"0?2 3 4$100


NB. ,:"r y --------------------------------------------------------------

f =: 3 : ',:y'

(,:"0 -: f"0) x=:?2 3 4$1e5
(,:"1 -: f"1) x=:a.{~?2 3 4$#a.
(,:"2 -: f"2) x=:o.?2 3 4$1e5
(,:"3 -: f"3) x=:(?2 3 4$#y){y=:;:'Cogito, ergo sum. ipso facto 1 2'


NB. x,:y ----------------------------------------------------------------

f =: ,. -: ,:/
f 0 1
f 'ab'
f 3 4
f 1 _4.5
f 3 4j5

NB. numeric
t=:i.4 3 2
(1, (1,$t)$,t) -: 1,: t
(1,~(1,$t)$,t) -: 1,:~t
(99 13, (1,$t)$,t) -: 99 13,: t
(99 13,~(1,$t)$,t) -: 99 13,:~t
((|.2{t), (1,$t)$,t) -: (|.2{t),: t
((|.2{t),~(1,$t)$,t) -: (|.2{t),:~t
((|.t), (1,$t)$,t) -: (|.t),: t
((|.t),~(1,$t)$,t) -: (|.t),:~t

NB. literal
t=:a.{~96+i.4 3 2
('&', (1,$t)$,t) -: '&',: t
('&',~(1,$t)$,t) -: '&',:~t
('-+', (1,$t)$,t) -: '-+',: t
('-+',~(1,$t)$,t) -: '-+',:~t
((|.2{t), (1,$t)$,t) -: (|.2{t),: t
((|.2{t),~(1,$t)$,t) -: (|.2{t),:~t
((|.t), (1,$t)$,t) -: (|.t),: t
((|.t),~(1,$t)$,t) -: (|.t),:~t

NB. box
t=:4 3 2$;:'((a.{~66+i.3 2),~(1,$t)$,t) -: (a.{~66+i.3 2),:~t'
((<'&'), (1,$t)$,t) -: (<'&'),: t
((<'&'),~(1,$t)$,t) -: (<'&'),:~t
((2 3;'+'), (1,$t)$,t) -: (2 3;'+'),: t
((2 3;'+'),~(1,$t)$,t) -: (2 3;'+'),:~t
((|.2{t), (1,$t)$,t) -: (|.2{t),: t
((|.2{t),~(1,$t)$,t) -: (|.2{t),:~t
((|.t), (1,$t)$,t) -: (|.t),: t
((|.t),~(1,$t)$,t) -: (|.t),:~t

'domain error' -: 3 4 ,: etx 'abc'
'domain error' -: 3 4 ,:~etx 'abc'
'domain error' -: 'ab',: etx 'a';3
'domain error' -: 'ab',:~etx 'a';3
'domain error' -: 3 4 ,: etx 'a';3
'domain error' -: 3 4 ,:~etx 'a';3


NB. x,:"r y -------------------------------------------------------------

f =: 4 : 'x,:y'

x=: ?3 4$1e6
y=: ?3 4$1e6

x (,:"0 -: f"0) y
x (,:"1 -: f"1) y
x (,:"1 -: f"1) 0{y
x (,:"2 -: f"2) y
x (,:"0 2 -: f"0 2) y

lam=: 4 : 'x,:y'
x (,:"1 -: lam"1) y [ x=:     ?3$2    [ y=: ?5 4 3$2
y (,:"1 -: lam"1) x
x (,:"1 -: lam"1) y [ x=:     ?3$100  [ y=: ?5 4 3$1e6
y (,:"1 -: lam"1) x
x (,:"1 -: lam"1) y [ x=: a.{~?3$#a.  [ y=: a.{~?5 4 3$#a.
y (,:"1 -: lam"1) x
x (,:"1 -: lam"1) y [ x=: j./?2 3$100 [ y=: j./?2 5 4 3$1e6
y (,:"1 -: lam"1) x


4!:55 ;:'a f lam t x y'

