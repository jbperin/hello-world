def compute_r(a):
  [a0, a1, a2, a3] = a
  [r0, r1, r2, r3] = [0, 0, 0, 0]
  if (a3 == 0):
    if (a2 == 0):
      if (a1 == 0):
        if (a0 != 0):
          r0 = 1
      else:
        if (a0 == 0):
          r0 = 1
        else:
          r1 = 1
    else:
      r1 = 1
      if (a1 != 0):
        if (a0 != 0):
          r0 = 1
  else:
    if (a2 == 0):
      r1 = 1
      r0 = 1
    else:
      if (a0 == 0):
        if (a1 == 0):
          r1 = 1
          r0 = 1
        else:
          r2 = 1
      else:
        r2 = 1
  r = [r0, r1, r2, r3]
  return r
