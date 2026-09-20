create_project object_detection_npu ./object_detection_npu -part xc7vx485tffg1157-1
add_files [glob ./rtl/*.v]
add_files -fileset sim_1 [glob ./sim/*.v]
set_property top object_detection_npu_top [current_fileset]
set_property top object_detection_npu_tb [get_filesets sim_1]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1
