
def spaceStruct(currStruct):

    newStruct = {}
    
    for key, value in currStruct.items():
        print (key, value)
        already_used_points = []
        newStruct[key] = {}
        newStruct[key]["soluce"]=value["soluce"]
        newStruct[key]["points"]=value["points"].copy()

        newStruct[key]["segments"]=[]
        for seg in value["segments"]:
            # print (seg)
            [pointIdx1, pointIdx2] = seg
            newSeg = []
            for pointIdx in [pointIdx1, pointIdx2]:
                if pointIdx in already_used_points:
                    # on crée un nouveau point
                    newPoint =  value["points"][pointIdx].copy()
                    newStruct[key]["points"].append(newPoint)
                    idxNewPoint = len(newStruct[key]["points"])-1
                    newSeg.append (idxNewPoint)
                else:
                    already_used_points.append(pointIdx)
                    newSeg.append (pointIdx)

            newStruct[key]["segments"].append(newSeg)
        
        newStruct[key]["faces"]=[]
        for fac in value["faces"]:
            # print (fac)
            [pointIdx1, pointIdx2, pointIdx3, dull] = fac
            newFac = []
            for pointIdx in [pointIdx1, pointIdx2, pointIdx3]:
                if pointIdx in already_used_points:
                    # on crée un nouveau point
                    newPoint =  value["points"][pointIdx].copy()
                    newStruct[key]["points"].append(newPoint)
                    idxNewPoint = len(newStruct[key]["points"])-1
                    newFac.append (idxNewPoint)
                else:
                    already_used_points.append(pointIdx)
                    newFac.append (pointIdx)
            newFac.append(dull)
            newStruct[key]["faces"].append(newFac)

    return (newStruct)


currStruct = {"boat":{"points":[[46, 19, 0], [48, 94, 0], [81, 93, 0], [80, 16, 0], [49, 82, 0], [74, 72, 0], [81, 77, 0], [114, 65, 0]], 
    "segments":[[0, 1], [3, 2]], 
    "faces":[[0, 4, 5, 0], [3, 6, 7, 0]],  
    "soluce" : [-80, 6, 0, -3, 0]}
}

def main ():

    print (spaceStruct(currStruct))

if __name__ == '__main__':
    main()