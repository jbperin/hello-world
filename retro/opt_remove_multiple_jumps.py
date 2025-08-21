def opt_remove_double_jumps(instructions):
    """Exemple : supprime les 'jmp' qui pointent directement sur un autre 'jmp'."""
    new_instrs = []
    for i, instr in enumerate(instructions):
        if instr["type"] == "terminal_jmp":
            # vérifier si le label visé est immédiatement un autre jmp
            if i + 1 < len(instructions):
                next_instr = instructions[i + 1]
                if next_instr["type"] == "terminal_jmp":
                    # on saute celui-ci
                    continue
        new_instrs.append(instr)
    return new_instrs
