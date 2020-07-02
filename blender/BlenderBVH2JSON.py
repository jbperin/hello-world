import bpy
import os, json, ntpath

INPUT_FILEPATH = "C:\\Users\\tbpk7658\\Downloads\\cmuconvert-daz-01-09\\02\\02_01.bvh"

ARMATURE_OBJECTNAME = ntpath.basename(INPUT_FILEPATH).split('.')[:-1][0]
OUTPUT_FILEPATH = "C:\\Users\\tbpk7658\\Documents\\Projets\\hello-world\\retro\\oric\\skeleton\\%s.json"%(ARMATURE_OBJECTNAME)

def jsonToFile(filepath, data):
    with open(filepath, 'w') as json_file:
        json_file.write(json.dumps(data, indent=4, sort_keys=True))


def createAttachedEmpties(armobjname):


    def runThroughBones (bone_name, indent):
        my_children = children[bone_name]
        pose_bone = obj.pose.bones[bone_name]
        
        if (bone_name == children[None][0]):        
            global_location = pose_bone.matrix.to_translation() 
        else:
            global_location = obj.matrix_world @ pose_bone.matrix @ pose_bone.location

        bpy.ops.object.empty_add(type='ARROWS', align='WORLD', location=(global_location[0], global_location[1], global_location[2]))
        bpy.context.active_object.name = 'em_'+bone_name
        bpy.context.active_object.parent = obj
        bpy.context.active_object.parent_type = 'BONE'
        bpy.context.active_object.parent_bone = bone_name

        glob_matrix = obj.matrix_world @ pose_bone.matrix
        bpy.context.active_object.matrix_parent_inverse = glob_matrix.inverted()
        
        if my_children:
            for child_bone in my_children:
                runThroughBones(child_bone, indent + 1)

    obj = bpy.data.objects[armobjname]
    arm = obj.data
    children = {None: []}
    for bone in arm.bones:
        children[bone.name] = []

    for bone in arm.bones:
        children[getattr(bone.parent, "name", None)].append(bone.name)

    if len(children[None]) == 1:
        key = children[None][0]
        runThroughBones(key, 0)

def main ():

    bpy.ops.import_anim.bvh(
        filepath=INPUT_FILEPATH, 
        use_fps_scale=False, 
        update_scene_fps=True, 
        update_scene_duration=True,
        )

    scene = bpy.context.scene

    createAttachedEmpties(ARMATURE_OBJECTNAME)

    frame_start = scene.frame_start
    frame_end = scene.frame_end

    scene.frame_set(frame_start)

    arm = bpy.data.objects[ARMATURE_OBJECTNAME].data

    frame_values = []

    for frame in range(frame_start, frame_end + 1):
        scene.frame_set(frame)
        print ("frame %d"%(frame))
        frame_value = {'frame_id' : frame}
        
        for bone in arm.bones:
            em_name = "em_"+bone.name
            posi = bpy.data.objects[em_name].matrix_world.to_translation()
            frame_value[em_name[3:]+"_X"] = posi[0]
            frame_value[em_name[3:]+"_Y"] = posi[1]
            frame_value[em_name[3:]+"_Z"] = posi[2]
        frame_values.append (frame_value)
    scene.frame_set(frame_start)

    #basedir = os.path.dirname(bpy.data.filepath)
    #if not basedir:
    #    raise Exception("Blend file is not saved")
    #filepath = os.path.join(basedir, OUTPUT_FILENAME)

    jsonToFile(OUTPUT_FILEPATH, frame_values)

if __name__ == "__main__":
	main()

