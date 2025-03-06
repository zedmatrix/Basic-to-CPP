SCREEN 12: CLS : KEY OFF
nb = 100: DIM x(nb), y(nb), dx(nb), dy(nb)
wide = 640: height = 480
'WINDOW (0, 0)-(wide, height)
'throw on random dots
FOR a = 0 TO 100: PSET (RND * wide, RND * height), 7: NEXT a
'1st half of bugs
FOR a = 0 TO nb / 2: x(a) = INT(RND * wide): y(a) = INT(RND * height)
dx(a) = -1: dy(a) = 0: NEXT a
'2nd half of bugs
FOR a = nb / 2 TO nb: x(a) = INT(RND * wide): y(a) = INT(RND * height)
dx(a) = 0: dy(a) = -1: NEXT a

DO
 FOR a = 0 TO nb
   x = x(a): y = y(a): dx = dx(a): dy = dy(a)
   x = x + dx: y = y + dy: PT = POINT(x, y)
   IF PT < 7 THEN PSET (x, y), 7 + PT: EX = -dy: EY = dx: dx = EX: dy = EY
   IF PT > 6 THEN PSET (x, y), PT - 7: EX = dy: EY = -dx: dx = EX: dy = EY
   x(a) = x: y(a) = y: dx(a) = dx: dy(a) = dy
 NEXT a
LOOP UNTIL INKEY$ <> ""


