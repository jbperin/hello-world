import json


def remove_pass_and_empty(d):
    if isinstance(d, dict):
        # Remove 'value': 'pass' at this level
        d = {k: v for k, v in d.items() if not (k == 'value' and v == 'pass')}
        # Recursively process sub-dictionaries
        d = {k: remove_pass_and_empty(v) for k, v in d.items()}
        # Remove keys with empty dicts
        d = {k: v for k, v in d.items() if not (isinstance(v, dict) and len(v) == 0)}
        return d
    elif isinstance(d, list):
        return [remove_pass_and_empty(item) for item in d]
    else:
        return d
def abstree_cleaned_to_python_code(abstree, indent=0):
    code_lines = []
    ind = '  ' * indent
    # Si on a une valeur (affectation)
    if 'value' in abstree:
        code_lines.append(f"{ind}{abstree['value']}")
    # Si on a un sous-arbre
    if 'subtree' in abstree:
        code_lines += abstree_cleaned_to_python_code(abstree['subtree'], indent)
    # Si on a un test de feature
    if 'feature' in abstree:
        var = f"a{abstree['feature']}"
        code_lines.append(f"{ind}if ({var} == 0):")
        code_lines += abstree_cleaned_to_python_code(abstree['left'], indent + 1)
        code_lines.append(f"{ind}else:")
        code_lines += abstree_cleaned_to_python_code(abstree['right'], indent + 1)
    return code_lines
if __name__ == "__main__":
    with open("retro/abstree.json", "r") as f:
        data = json.load(f)
    cleaned = remove_pass_and_empty(data)
    with open("retro/abstree_cleaned.json", "w") as f:
        json.dump(cleaned, f, indent=2)
    for line in abstree_cleaned_to_python_code(cleaned):
        print (line)
    print("Cleaned dictionary saved to retro/abstree_cleaned.json")
