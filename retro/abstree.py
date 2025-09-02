def compute_r(a):
  [a0, a1, a2, a3, a4] = a
  [r0, r1, r2, r3, r4] = [0, 0, 0, 0, 0]
  r2 = 1
  if (a4 == 0):
    if (a3 == 0):
      r0 = 1
  r = [r0, r1, r2, r3, r4]
  return r
