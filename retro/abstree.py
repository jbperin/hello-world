def compute_r(a):
  [a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11] = a
  [r0, r1, r2, r3, r4, r5] = [0, 0, 0, 0, 0, 0]
  if (a8 == 0):
    if (a6 == 0):
      if (a10 == 0):
        if (a11 == 0):
          if (a7 == 0):
            if (a9 == 0):
              r5 = 1
              if (a4 == 0):
                if (a5 == 0):
                  if (a3 == 0):
                    r4 = 1
                    if (a2 == 0):
                      if (a1 == 0):
                        r3 = 1
                        r2 = 1
                        r1 = 1
                        r0 = 1
                      else:
                        if (a0 == 0):
                          r3 = 1
                          r1 = 1
                        else:
                          r2 = 1
                          r1 = 1
                          r0 = 1
                    else:
                      if (a1 == 0):
                        if (a0 == 0):
                          r2 = 1
                          r0 = 1
                        else:
                          r1 = 1
                          r0 = 1
                      else:
                        if (a0 == 0):
                          r1 = 1
                        else:
                          r0 = 1
                  else:
                    r3 = 1
                    if (a2 == 0):
                      r2 = 1
                      if (a1 == 0):
                        r1 = 1
                        r0 = 1
                      else:
                        if (a0 == 0):
                          r1 = 1
                        else:
                          r0 = 1
                    else:
                      if (a1 == 0):
                        r2 = 1
                      else:
                        r1 = 1
                        r0 = 1
                else:
                  if (a3 == 0):
                    if (a2 == 0):
                      r2 = 1
                      if (a1 == 0):
                        r0 = 1
                    else:
                      if (a0 == 0):
                        r2 = 1
                      else:
                        if (a1 == 0):
                          r2 = 1
                        else:
                          r1 = 1
                          r0 = 1
                  else:
                    r1 = 1
                    if (a2 == 0):
                      r0 = 1
              else:
                if (a5 == 0):
                  if (a3 == 0):
                    if (a2 == 0):
                      r3 = 1
                      if (a1 == 0):
                        r1 = 1
                      else:
                        r0 = 1
                    else:
                      if (a1 == 0):
                        r3 = 1
                      else:
                        if (a0 == 0):
                          r3 = 1
                        else:
                          r2 = 1
                          r1 = 1
                          r0 = 1
                  else:
                    r2 = 1
                    if (a2 == 0):
                      r1 = 1
                      if (a1 == 0):
                        r0 = 1
                    else:
                      if (a1 == 0):
                        r1 = 1
                      else:
                        r0 = 1
                else:
                  if (a3 == 0):
                    if (a2 == 0):
                      if (a1 == 0):
                        r1 = 1
                      else:
                        r0 = 1
                    else:
                      r0 = 1
                  else:
                    if (a2 == 0):
                      if (a0 == 0):
                        if (a1 == 0):
                          r0 = 1
            else:
              if (a5 == 0):
                if (a4 == 0):
                  if (a0 == 0):
                    if (a3 == 0):
                      if (a1 == 0):
                        if (a2 == 0):
                          r4 = 1
                        else:
                          r3 = 1
                          r2 = 1
                          r1 = 1
                          r0 = 1
                      else:
                        r3 = 1
                        r2 = 1
                        r1 = 1
                        r0 = 1
                    else:
                      r3 = 1
                      r2 = 1
                      r1 = 1
                      r0 = 1
                  else:
                    r3 = 1
                    r2 = 1
                    r1 = 1
                    r0 = 1
                else:
                  r3 = 1
                  r2 = 1
                  r1 = 1
                  r0 = 1
              else:
                r3 = 1
                r2 = 1
                r1 = 1
                r0 = 1
          else:
            if (a9 == 0):
              r4 = 1
              if (a5 == 0):
                r3 = 1
                if (a4 == 0):
                  if (a2 == 0):
                    r1 = 1
                  else:
                    if (a3 == 0):
                      r1 = 1
                    else:
                      r0 = 1
                else:
                  if (a3 == 0):
                    r0 = 1
                  else:
                    if (a2 == 0):
                      r0 = 1
                    else:
                      if (a0 == 0):
                        r0 = 1
                      else:
                        if (a1 == 0):
                          r0 = 1
              else:
                if (a4 == 0):
                  r3 = 1
                else:
                  if (a3 == 0):
                    if (a1 == 0):
                      r3 = 1
                    else:
                      if (a2 == 0):
                        r3 = 1
                      else:
                        r2 = 1
                        r1 = 1
                        r0 = 1
                  else:
                    r2 = 1
                    r1 = 1
                    r0 = 1
            else:
              r3 = 1
              r2 = 1
              if (a5 == 0):
                if (a4 == 0):
                  r1 = 1
                else:
                  if (a3 == 0):
                    r1 = 1
                  else:
                    if (a2 == 0):
                      if (a1 == 0):
                        if (a0 == 0):
                          r1 = 1
                        else:
                          r0 = 1
                      else:
                        r0 = 1
                    else:
                      r0 = 1
              else:
                r0 = 1
        else:
          if (a9 == 0):
            r2 = 1
            if (a7 == 0):
              r0 = 1
          else:
            r1 = 1
            r0 = 1
      else:
        if (a9 == 0):
          if (a11 == 0):
            r3 = 1
            if (a7 == 0):
              r1 = 1
            else:
              r0 = 1
          else:
            if (a7 == 0):
              r1 = 1
            else:
              r0 = 1
        else:
          if (a11 == 0):
            r2 = 1
            r1 = 1
            if (a7 == 0):
              r0 = 1
          else:
            if (a7 == 0):
              if (a5 == 0):
                if (a4 == 0):
                  r0 = 1
                else:
                  if (a3 == 0):
                    if (a0 == 0):
                      if (a2 == 0):
                        if (a1 == 0):
                          r0 = 1
    else:
      if (a11 == 0):
        if (a10 == 0):
          if (a9 == 0):
            r4 = 1
            if (a7 == 0):
              r3 = 1
              if (a5 == 0):
                r2 = 1
                if (a4 == 0):
                  r1 = 1
                  if (a3 == 0):
                    r0 = 1
                  else:
                    if (a0 == 0):
                      if (a2 == 0):
                        if (a1 == 0):
                          r0 = 1
                else:
                  if (a2 == 0):
                    if (a3 == 0):
                      r1 = 1
                    else:
                      r0 = 1
                  else:
                    if (a0 == 0):
                      r0 = 1
                    else:
                      if (a3 == 0):
                        r0 = 1
                      else:
                        if (a1 == 0):
                          r0 = 1
              else:
                if (a4 == 0):
                  if (a2 == 0):
                    r2 = 1
                  else:
                    if (a3 == 0):
                      r2 = 1
                    else:
                      r1 = 1
                      r0 = 1
                else:
                  r1 = 1
                  if (a3 == 0):
                    r0 = 1
                  else:
                    if (a2 == 0):
                      if (a0 == 0):
                        r0 = 1
                      else:
                        if (a1 == 0):
                          r0 = 1
            else:
              r2 = 1
              if (a5 == 0):
                r1 = 1
                if (a4 == 0):
                  if (a0 == 0):
                    r0 = 1
                  else:
                    if (a3 == 0):
                      r0 = 1
                    else:
                      if (a1 == 0):
                        r0 = 1
                      else:
                        if (a2 == 0):
                          r0 = 1
              else:
                if (a4 == 0):
                  if (a3 == 0):
                    r1 = 1
                  else:
                    if (a2 == 0):
                      if (a0 == 0):
                        r1 = 1
                      else:
                        if (a1 == 0):
                          r1 = 1
                        else:
                          r0 = 1
                    else:
                      r0 = 1
                else:
                  r0 = 1
          else:
            r3 = 1
            r2 = 1
            if (a7 == 0):
              r1 = 1
              if (a4 == 0):
                if (a3 == 0):
                  if (a5 == 0):
                    r0 = 1
            else:
              if (a4 == 0):
                r0 = 1
              else:
                if (a5 == 0):
                  r0 = 1
                else:
                  if (a3 == 0):
                    if (a2 == 0):
                      r0 = 1
                    else:
                      if (a0 == 0):
                        if (a1 == 0):
                          r0 = 1
        else:
          if (a9 == 0):
            r3 = 1
            if (a5 == 0):
              if (a7 == 0):
                if (a1 == 0):
                  r1 = 1
                else:
                  if (a3 == 0):
                    r1 = 1
                  else:
                    if (a2 == 0):
                      r1 = 1
                    else:
                      if (a4 == 0):
                        r1 = 1
                      else:
                        r0 = 1
              else:
                r0 = 1
            else:
              if (a4 == 0):
                r0 = 1
              else:
                if (a7 == 0):
                  r0 = 1
                else:
                  if (a3 == 0):
                    r0 = 1
                  else:
                    if (a0 == 0):
                      if (a2 == 0):
                        if (a1 == 0):
                          r0 = 1
          else:
            r2 = 1
            r1 = 1
            if (a7 == 0):
              if (a5 == 0):
                r0 = 1
              else:
                if (a4 == 0):
                  r0 = 1
                else:
                  if (a2 == 0):
                    if (a3 == 0):
                      if (a0 == 0):
                        r0 = 1
                      else:
                        if (a1 == 0):
                          r0 = 1
      else:
        if (a10 == 0):
          if (a9 == 0):
            r2 = 1
            if (a5 == 0):
              if (a7 == 0):
                if (a3 == 0):
                  r0 = 1
                else:
                  if (a4 == 0):
                    r0 = 1
                  else:
                    if (a2 == 0):
                      r0 = 1
                    else:
                      if (a1 == 0):
                        if (a0 == 0):
                          r0 = 1
          else:
            r1 = 1
            if (a7 == 0):
              r0 = 1
            else:
              if (a5 == 0):
                if (a4 == 0):
                  r0 = 1
                else:
                  if (a3 == 0):
                    r0 = 1
                  else:
                    if (a0 == 0):
                      if (a2 == 0):
                        if (a1 == 0):
                          r0 = 1
        else:
          if (a7 == 0):
            if (a5 == 0):
              if (a9 == 0):
                if (a4 == 0):
                  r1 = 1
                else:
                  if (a3 == 0):
                    r1 = 1
                  else:
                    if (a2 == 0):
                      if (a1 == 0):
                        r1 = 1
                      else:
                        r0 = 1
                    else:
                      r0 = 1
            else:
              if (a9 == 0):
                r0 = 1
          else:
            if (a9 == 0):
              r0 = 1
  else:
    if (a9 == 0):
      if (a11 == 0):
        if (a10 == 0):
          r4 = 1
          if (a7 == 0):
            if (a6 == 0):
              if (a4 == 0):
                r2 = 1
                if (a5 == 0):
                  if (a3 == 0):
                    r0 = 1
                  else:
                    if (a2 == 0):
                      r0 = 1
              else:
                if (a5 == 0):
                  r2 = 1
                else:
                  if (a0 == 0):
                    if (a3 == 0):
                      if (a1 == 0):
                        if (a2 == 0):
                          r2 = 1
                        else:
                          r1 = 1
                          r0 = 1
                      else:
                        r1 = 1
                        r0 = 1
                    else:
                      r1 = 1
                      r0 = 1
                  else:
                    r1 = 1
                    r0 = 1
            else:
              r1 = 1
              if (a5 == 0):
                if (a4 == 0):
                  r0 = 1
                else:
                  if (a3 == 0):
                    r0 = 1
                  else:
                    if (a2 == 0):
                      if (a0 == 0):
                        r0 = 1
                      else:
                        if (a1 == 0):
                          r0 = 1
          else:
            if (a4 == 0):
              if (a6 == 0):
                if (a5 == 0):
                  if (a3 == 0):
                    r1 = 1
                  else:
                    if (a2 == 0):
                      if (a1 == 0):
                        r1 = 1
                      else:
                        if (a0 == 0):
                          r1 = 1
                        else:
                          r0 = 1
                    else:
                      r0 = 1
                else:
                  r0 = 1
              else:
                if (a1 == 0):
                  if (a5 == 0):
                    if (a3 == 0):
                      if (a2 == 0):
                        r0 = 1
            else:
              if (a6 == 0):
                r0 = 1
        else:
          if (a7 == 0):
            r3 = 1
          else:
            if (a6 == 0):
              if (a5 == 0):
                r3 = 1
              else:
                if (a4 == 0):
                  if (a3 == 0):
                    r3 = 1
                  else:
                    if (a1 == 0):
                      if (a2 == 0):
                        r3 = 1
                      else:
                        r2 = 1
                        r1 = 1
                        r0 = 1
                    else:
                      r2 = 1
                      r1 = 1
                      r0 = 1
                else:
                  r2 = 1
                  r1 = 1
                  r0 = 1
            else:
              r2 = 1
              r1 = 1
              r0 = 1
      else:
        if (a10 == 0):
          if (a7 == 0):
            r2 = 1
          else:
            if (a5 == 0):
              if (a6 == 0):
                if (a4 == 0):
                  if (a3 == 0):
                    if (a1 == 0):
                      r2 = 1
                    else:
                      if (a2 == 0):
                        r2 = 1
                      else:
                        r1 = 1
                        r0 = 1
                  else:
                    r1 = 1
                    r0 = 1
                else:
                  r1 = 1
                  r0 = 1
              else:
                r1 = 1
                r0 = 1
            else:
              r1 = 1
              r0 = 1
        else:
          r0 = 1
    else:
      if (a10 == 0):
        if (a11 == 0):
          r3 = 1
          if (a7 == 0):
            if (a6 == 0):
              r2 = 1
            else:
              if (a5 == 0):
                if (a3 == 0):
                  r2 = 1
                else:
                  if (a1 == 0):
                    r2 = 1
                  else:
                    if (a4 == 0):
                      r2 = 1
                    else:
                      if (a2 == 0):
                        r2 = 1
                      else:
                        r1 = 1
                        r0 = 1
              else:
                r1 = 1
                r0 = 1
          else:
            r1 = 1
            if (a6 == 0):
              r0 = 1
            else:
              if (a5 == 0):
                if (a4 == 0):
                  r0 = 1
                else:
                  if (a3 == 0):
                    if (a2 == 0):
                      r0 = 1
                    else:
                      if (a1 == 0):
                        r0 = 1
        else:
          r1 = 1
      else:
        if (a11 == 0):
          r2 = 1
          if (a7 == 0):
            if (a6 == 0):
              r1 = 1
            else:
              if (a5 == 0):
                if (a4 == 0):
                  r1 = 1
                else:
                  if (a3 == 0):
                    r1 = 1
                  else:
                    r0 = 1
              else:
                r0 = 1
          else:
            r0 = 1
  r = [r0, r1, r2, r3, r4, r5]
  return r
