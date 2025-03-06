SCREEN 12: CLS : KEY OFF
x = 320: y = 240: DX = -1: DY = 0
DO
x = x + DX: y = y + DY

IF x > 639 THEN x = 0
IF x < 0 THEN x = 639
IF y > 479 THEN y = 0
IF y < 0 THEN y = 479
pt = POINT(x, y)

IF pt < 7 THEN PSET (x, y), 8 + pt: EX = -DY: EY = DX: DX = EX: DY = EY
IF pt > 6 THEN PSET (x, y), pt - 7: EX = DY: EY = -DX: DX = EX: DY = EY
LOOP UNTIL INKEY$ <> ""


