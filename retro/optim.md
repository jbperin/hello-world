
Proposes-moi une fonction qui transforme ce code:

```
              ; if (a5 == 0):
              lda tmp0 : and #BIT_5: .(:beq skip: jmp lbl_373: skip:.):
                ; if (a1 != 0):
                lda tmp0 : and #BIT_1: .(:bne skip: jmp lbl_374: skip:.):
                  ; if (a2 != 0):
                  lda tmp0 : and #BIT_2: .(:bne skip: jmp lbl_375: skip:.):
                    ; if (a0 != 0):
                    lda tmp0 : and #BIT_0: .(:bne skip: jmp lbl_376: skip:.):
                      ; if (a4 != 0):
                      lda tmp0 : and #BIT_4: .(:bne skip: jmp lbl_377: skip:.):
                        ; if (a3 != 0):
                        lda tmp0 : and #BIT_3: .(:bne skip: jmp lbl_378: skip:.):
                          ; r0 = 1
                          lda tmp7: ora #BIT_0: sta tmp7
                        jmp _unefonctionDone
lbl_378:
                      jmp _unefonctionDone
lbl_377:
                    jmp _unefonctionDone
lbl_376:
                  jmp _unefonctionDone
lbl_375:
                jmp _unefonctionDone
lbl_374:
              jmp _unefonctionDone
lbl_373:

```

en ça:

```
              ; if (a5 == 0) and (a1 != 0) and (a2 != 0) and (a0 != 0) and (a4 != 0) and (a3 != 0):
              lda tmp0: and #BIT_5+BIT_1+BIT_2+BIT_0+BIT_4+BIT3: cmp #BIT_1+BIT_2+BIT_0+BIT_3: .(:beq skip: jmp lbl_373: skip:.)
                ; r0 = 1
                lda tmp7: ora #BIT_0: sta tmp7
lbl_373:
              jmp _unefonctionDone  
```


```python
def fuse_nested_ifs(instrs):
    """
    Transforme une séquence imbriquée de comment_if + and_bit_branch
    en un seul comment_multi_if + and_multi_bit_branch.
    """
    new_instrs = []
    i = 0

    while i < len(instrs):
        instr = instrs[i]

        # détecter début séquence imbriquée
        if instr["type"] == "comment_if":
            conditions = []
            and_bits = []
            cmp_bits = []
            var = None
            main_label = None
            indent = instr["indent"]

            # explorer la séquence imbriquée
            while i < len(instrs) and instrs[i]["type"] in ("comment_if", "and_bit_branch"):
                if instrs[i]["type"] == "comment_if":
                    conditions.append({
                        "reg": instrs[i]["reg"],
                        "op": instrs[i]["op"],
                        "value": instrs[i]["value"]
                    })
                elif instrs[i]["type"] == "and_bit_branch":
                    var = instrs[i]["var"]
                    and_bits.append(instrs[i]["bit"])
                    if instrs[i]["cmp_bit"] != 0:  # si on compare à 1, alors ce bit doit être présent
                        cmp_bits.append(instrs[i]["cmp_bit"])
                    if main_label is None:
                        main_label = instrs[i]["label"]
                i += 1

            # créer les nouvelles instructions compactes
            new_instrs.append({
                "type": "comment_multi_if",
                "conditions": conditions,
                "indent": indent
            })
            new_instrs.append({
                "type": "and_multi_bit_branch",
                "var": var,
                "and_bits": and_bits,
                "cmp_bits": cmp_bits,
                "label": main_label,
                "indent": indent
            })

        else:
            # recopier tel quel
            new_instrs.append(instr)
            i += 1

    return new_instrs
```