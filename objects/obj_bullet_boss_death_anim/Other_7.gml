// Makes it so at the end of this animation. Goes to the next room (End Card Room) 
instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_transition);
instance_destroy();