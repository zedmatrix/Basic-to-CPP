SCREEN 12: CLS : KEY OFF
DIM x(8), y(8), dx(8), dy(8), col(16)
'data
DATA 160,120,-1,0
DATA 480,120,0,-1
DATA 160,360,0,1
DATA 480,360,1,0
'read data
FOR a = 1 TO 4
  READ x(a), y(a), dx(a), dy(a)
NEXT a
FOR a = 5 TO 8
  x(a) = x(a - 4)
  y(a) = y(a - 4)
  dx(a) = dx(a - 4)
  dy(a) = dy(a - 4)
NEXT a
'main program
Top:
FOR a = 1 TO 4
  x = x(a): y = y(a): dx = dx(a): dy = dy(a)
  x = x + dx: y = y + dy: pt = POINT(x, y)
  IF pt < 7 THEN
    c = 8 + pt: col(c + 1) = col(c + 1) + 1: col(pt + 1) = col(pt + 1) - 1
    PSET (x, y), c
    EX = -dy: EY = dx: dx = EX: dy = EY
  ELSEIF pt > 6 THEN
    c = pt - 7: col(c + 1) = col(c + 1) + 1: col(pt + 1) = col(pt + 1) - 1
    PSET (x, y), c
    EX = dy: EY = -dx: dx = EX: dy = EY
  END IF
  x(a) = x: y(a) = y: dx(a) = dx: dy(a) = dy
NEXT a
FOR a = 5 TO 8
  x = x(a): y = y(a): dx = dx(a): dy = dy(a)
  x = x + dx: y = y + dy: pt = POINT(x, y)
  IF pt < 7 THEN
    c = 7 + pt: col(c + 1) = col(c + 1) + 1: col(pt + 1) = col(pt + 1) - 1
    PSET (x, y), c
    EX = -dy: EY = dx: dx = EX: dy = EY
  ELSEIF pt > 6 THEN
    c = pt - 7: col(c + 1) = col(c + 1) + 1: col(pt + 1) = col(pt + 1) - 1
    PSET (x, y), c
    EX = dy: EY = -dx: dx = EX: dy = EY
  END IF
  x(a) = x: y(a) = y: dx(a) = dx: dy(a) = dy
NEXT a
i$ = INKEY$: IF i$ = " " THEN GOTO Save
GOTO Top
Save:

'open file
OPEN "o", 1, "c:\bug.dat"
'save screen
FOR y = 0 TO 480
  FOR x = 0 TO 640
    pt = POINT(x, y)
    PRINT #1, pt;
  NEXT x
  LINE (0, y)-(640, y), 1
NEXT y
CLOSE

'print stats
SCREEN 0: t = 0
FOR a = 0 TO 16: c = a - 1: IF c = 0 OR c = -1 THEN c = 15
  COLOR 7: LOCATE a + 1, 1: PRINT USING "## --> "; a - 1;
  COLOR c: LOCATE a + 1, 7: PRINT USING " ###,###"; col(a);
  t = t + col(a)
NEXT a
LOCATE 18: PRINT USING "Total=###,###"; t;
Inky: i$ = INKEY$: IF i$ = "" THEN GOTO Inky
SCREEN 12
PAINT (0, 0), 1, 1

'open file
OPEN "i", 1, "c:\bug.dat"
'restore screen
FOR y = 0 TO 480
  FOR x = 0 TO 640
    INPUT #1, pt
    PSET (x, y), pt
  NEXT x
NEXT y
CLOSE

'return to top
WHILE INKEY$ <> "": WEND
GOTO Top

