
import bpy
import os
import json

scene = bpy.context.scene
frame_current = scene.frame_current

frame_start = bpy.context.scene.frame_start
frame_end = bpy.context.scene.frame_end


def jsonToFile(filepath, data):
    with open(filepath, 'w') as json_file:
        json_file.write(json.dumps(data, indent=4, sort_keys=True))


def MakeEmpty(Name):
    e = None
    for i in bpy.data.objects:
        if i.name == Name: e = i
    if e == None:
        bpy.ops.object.add(type='EMPTY')
        e = bpy.context.active_object
        e.name = Name
    return(e)

def runThroughBones (bone_name, indent):
    my_children = children[bone_name]
    bone = arm.bones[bone_name]
    indent_str = "\t" * indent
    pose_bone = obj.pose.bones[bone_name]
    loc = bone.head_local
    
    #file.write("%s%s %s\n"%(indent_str, bone_name, loc))
    #if (bone_name == children[None][0]):
    #    print ("ICI")
    #    global_location = obj.matrix_world @ pose_bone.location
    #else:
    if (bone_name == children[None][0]):
        
        global_location = pose_bone.matrix.to_translation() # obj.matrix_world @ pose_bone.matrix @ pose_bone.location
        #global_location = [glob_location[]]
        #print (bone_name, global_location)
    else:
        global_location = obj.matrix_world @ pose_bone.matrix @ pose_bone.location
    print("%s%s %s\n%s\n"%(indent_str, bone_name, loc, global_location))
    node_locations[bone_name] = loc
    new_obj = bpy.ops.object.empty_add(type='ARROWS', align='WORLD', location=(global_location[0], global_location[1], global_location[2]))
    bpy.context.active_object.name = 'em_'+bone_name
    bpy.context.active_object.parent = obj
    bpy.context.active_object.parent_type = 'BONE'
    bpy.context.active_object.parent_bone = bone_name
    #if (bone_name != children[None][0]):
    glob_matrix = obj.matrix_world @ pose_bone.matrix
    bpy.context.active_object.matrix_parent_inverse = glob_matrix.inverted()
    #bpy.context.active_object.matrix_parent_inverse = obj.matrix_world.inverted()
    #p = bpy.context.active_pose_bone  # Our pose bone
    #o = bpy.context.object            # Our armature object
    
    #, keep_transform=True
    #print (dir(new_obj))
    #new_obj.parent_set(type='BONE', xmirror=False, keep_transform=False)
    
    #bpy.ops.object.parent_set(type='BONE')
    #new_obj.parent_bone = bone_name
    #bpy.ops.object.posemode_toggle()
    
    #pose_bone.select = True
    
    #bpy.ops.outliner.item_activate(extend=False, deselect_all=True)
    #bpy.ops.outliner.item_activate(extend=False, deselect_all=True)
    

    #bpy.context.scene.objects.link(new_obj)
    #em = MakeEmpty('em_'+bone_name)

#    if indent:
#        file.write("%sJOINT %s\n" % (indent_str, bone_name))
#    else:
#        file.write("%sROOT %s\n" % (indent_str, bone_name))

    
    if my_children:
        # store the location for the children
        # to get their relative offset

        # Write children
        for child_bone in my_children:
            #serialized_names.append(child_bone)
            runThroughBones(child_bone, indent + 1)

    else:
        # Write the bone end.
        loc = bone.tail_local # - node_locations[bone_name]
        print ("%s %s\n" % (indent_str, loc))
#        file.write("%s %s\n" % (indent_str, loc))


bpy.ops.import_anim.bvh(
    filepath="C:\\Users\\tbpk7658\\Downloads\\cmuconvert-daz-01-09\\02\\02_01.bvh", 
    use_fps_scale=False, 
    update_scene_fps=True, 
    update_scene_duration=True,
    )

frame_start = bpy.context.scene.frame_start
frame_end = bpy.context.scene.frame_end

scene.frame_set(frame_start)
serialized_names = []

node_locations = {}

#obj = bpy.context.object
#arm = obj.data
obj = bpy.data.objects['02_01']
arm = obj.data
children = {None: []}
for bone in arm.bones:
    children[bone.name] = []

for bone in arm.bones:
    children[getattr(bone.parent, "name", None)].append(bone.name)

if len(children[None]) == 1:
    key = children[None][0]
    #serialized_names.append(key)
    indent = 0

    runThroughBones(key, indent)
   
frame_values = []

for frame in range(frame_start, frame_end + 1):
    scene.frame_set(frame)
    print ("frame %d"%(frame))
    frame_value = {'frame_id' : frame}
    
    for bone in arm.bones:
        em_name = "em_"+bone.name
        posi = bpy.data.objects[em_name].matrix_world.to_translation()
        print ("\tbone %s %s "%(em_name, str(posi)))
#        bpy.data.objects[em_name].location 
        frame_value[em_name[3:]+"_X"] = posi[0]
        frame_value[em_name[3:]+"_Y"] = posi[1]
        frame_value[em_name[3:]+"_Z"] = posi[2]
    frame_values.append (frame_value)
scene.frame_set(frame_start)

print (frame_values)
basedir = os.path.dirname(bpy.data.filepath)
if not basedir:
    raise Exception("Blend file is not saved")

filepath = os.path.join(basedir, 'output.json')

jsonToFile(filepath, frame_values)
#with open(filepath, "w", encoding="utf8", newline="\n") as ficout:
#    ficout.write (str(frame_values))

