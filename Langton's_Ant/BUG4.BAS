SCREEN 12: CLS : KEY OFF

DATA 160,120,-1,0
DATA 480,120,0,-1
DATA 160,360,0,1
DATA 480,360,1,0
FOR a = 1 TO 4: READ x(a), y(a), dx(a), dy(a): NEXT a

'FOR a = 1 TO 500: PSET (RND * 640, RND * 480), RND * 14: NEXT a

DO
 FOR a = 1 TO 4
   x = x(a): y = y(a): dx = dx(a): dy = dy(a)
   x = x + dx: y = y + dy: PT = POINT(x, y)
   IF PT < 7 THEN PSET (x, y), 7 + PT: EX = -dy: EY = dx: dx = EX: dy = EY
   IF PT > 6 THEN PSET (x, y), PT - 7: EX = dy: EY = -dx: dx = EX: dy = EY
   x(a) = x: y(a) = y: dx(a) = dx: dy(a) = dy
 NEXT a
LOOP UNTIL INKEY$ <> ""


