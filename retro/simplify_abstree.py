import json

def read_abstree_from_json(input_json_path="retro/abstree.json"):
    with open(input_json_path, "r") as fic_in:
        abstree = json.load(fic_in)
    return abstree



def optimize_abstree(node):    
    """
    Optimise récursivement un nœud de l'arbre  
    en regroupant les tests de bits successifs univoques.
    """

    if "assigns" in node and "feature" not in node:
        # Noeud feuille avec des assigns mais pas de features
        return node
    if "feature" in node:
        if "left" in node and "right" in node: 
            # Cas: deux branches
            node["left"] = optimize_abstree(node["left"])
            node["right"] = optimize_abstree(node["right"])
            return node
        elif ("left" in node and "right" not in node) or ("right" in node and "left" not in node):
            # On regroupe les tests de bits successifs univoques
            features    = [] #[node["feature"], 0 if "left" in node else 1]
            current     = node
            assigns     = node.get("assigns", [])
            while ("feature" in current) and (("left" in current and "right" not in current) or ("right" in current and "left" not in current)):
                feature     = current["feature"]
                left        = current.get("left")
                right       = current.get("right")
                if left is not None and right is None:
                    features.append([feature, 0])
                    current = left
                elif right is not None and left is None:
                    features.append([feature, 1])
                    current = right
                else:
                    break
            # Quand on sort de la boucle: current est sur un test non univoque ou ne contient qu'assigns
            # Si on a qu'une seule feature dans la liste, on la remet en "feature"
            if len(features) == 1:
                return {k: v for k, v in node.items() if v is not None}
            else:
                # Si on a plusieurs features, on crée un noeud avec "features" qui regroupe les feature
                # Le sous arbre correspondant est dans "right"
                new_node = {
                    "assigns": assigns if assigns else None,
                    "features": features if features else None,
                    "right": optimize_abstree(current) if current else None
                }
                return {k: v for k, v in new_node.items() if v is not None}


if __name__ == "__main__":
    tree = read_abstree_from_json("retro/abstree.json")

    optimized = optimize_abstree(tree)
    print(json.dumps(optimized, indent=2))
