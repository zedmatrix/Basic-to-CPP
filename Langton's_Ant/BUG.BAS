SCREEN 12: CLS : KEY OFF
X = 320: Y = 240: DX = -1: DY = 0
DO
X = X + DX: Y = Y + DY: PT = POINT(X, Y)
IF PT < 8 THEN PSET (X, Y), 8 + PT: EX = -DY: EY = DX: DX = EX: DY = EY
IF PT > 7 THEN PSET (X, Y), PT - 8: EX = DY: EY = -DX: DX = EX: DY = EY
LOOP UNTIL INKEY$ <> ""


