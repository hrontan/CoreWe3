.min_caml_n_objects 0
.min_caml_objects 12
.min_caml_screen 72
.min_caml_viewpoint 75
.min_caml_light 78
.min_caml_beam 81
.min_caml_and_net 83
.min_caml_or_net 134
.min_caml_solver_dist 135
.min_caml_intsec_rectside 136
.min_caml_tmin 137
.min_caml_intersection_point 138
.min_caml_intersected_object_id 141
.min_caml_nvector 142
.min_caml_texture_color 145
.min_caml_diffuse_ray 148
.min_caml_rgb 151
.min_caml_image_size 154
.min_caml_image_center 156
.min_caml_scan_pitch 158
.min_caml_startp 159
.min_caml_startp_fast 162
.min_caml_screenx_dir 165
.min_caml_screeny_dir 168
.min_caml_screenz_dir 171
.min_caml_ptrace_dirvec 174
.min_caml_dirvecs 179
.min_caml_light_dirvec 247
.min_caml_reflections 254
.min_caml_n_reflections 434
	LDI	r2	0xf7fff	#init sp
	LDI	r1	0	#init hp
	JSUB	:_min_caml_init_gobals
	J	:_min_caml_start
:min_caml_print_global0
:min_caml_print_global1
:min_caml_print_global2
:min_caml_print_global3
:min_caml_print_global4
:min_caml_print_global5
:min_caml_print_global6
:min_caml_print_global7
:min_caml_print_global8
:min_caml_print_global9
:min_caml_print_global10
:min_caml_print_global11
:min_caml_print_global12
:min_caml_print_global13
:min_caml_print_global14
:min_caml_print_global15
:min_caml_print_global16
:min_caml_print_global17
:min_caml_print_global18
:min_caml_print_global19
:min_caml_print_global20
:min_caml_print_global21
:min_caml_print_global22
:min_caml_print_global23
:min_caml_print_global24
:min_caml_print_global25
:min_caml_print_global26
:min_caml_print_global27
:min_caml_print_global28
:min_caml_print_global29
	RET
:_min_caml_init_gobals
	ADDI	r2	r2	-6	#make stack frame
	ST	r31	r2	6	#save link register
	LDI	r3	1
	ADDI	r4	r0	0	#Mr
	JSUB	:min_caml_create_array		#r3 := min_caml_create_array(r3, r4)
	JSUB	:min_caml_print_global0		#r0 := min_caml_print_global0(r3)
	ADDI	r3	r0	0	#Mr
	FADD	f1	f0	f0	#FMr
	JSUB	:min_caml_create_float_array		#r3 := min_caml_create_float_array(r3, f1)
	LDI	r29	60
	ADDI	r4	r1	0	#Mr
	ST	r3	r4	10
	ST	r3	r4	9
	ST	r3	r4	8
	ST	r3	r4	7
	ST	r0	r4	6
	ST	r3	r4	5
	ST	r3	r4	4
	ST	r0	r4	3
	ST	r0	r4	2
	ST	r0	r4	1
	ST	r0	r4	0
	ADDI	r1	r1	11
	ADDI	r3	r29	0	#Mr
	JSUB	:min_caml_create_array		#r3 := min_caml_create_array(r3, r4)
	JSUB	:min_caml_print_global1		#r0 := min_caml_print_global1(r3)
	LDI	r3	3
	FADD	f1	f0	f0	#FMr
	JSUB	:min_caml_create_float_array		#r3 := min_caml_create_float_array(r3, f1)
	JSUB	:min_caml_print_global2		#r0 := min_caml_print_global2(r3)
	LDI	r3	3
	FADD	f1	f0	f0	#FMr
	JSUB	:min_caml_create_float_array		#r3 := min_caml_create_float_array(r3, f1)
	JSUB	:min_caml_print_global3		#r0 := min_caml_print_global3(r3)
	LDI	r3	3
	FADD	f1	f0	f0	#FMr
	JSUB	:min_caml_create_float_array		#r3 := min_caml_create_float_array(r3, f1)
	JSUB	:min_caml_print_global4		#r0 := min_caml_print_global4(r3)
	VFLDI	f1	0x437f0000	#2.550000e+02
	LDI	r3	1
	JSUB	:min_caml_create_float_array		#r3 := min_caml_create_float_array(r3, f1)
	JSUB	:min_caml_print_global5		#r0 := min_caml_print_global5(r3)
	LDI	r4	-1
	LDI	r3	1
	JSUB	:min_caml_create_array		#r3 := min_caml_create_array(r3, r4)
	ADDI	r4	r3	0	#Mr
	LDI	r3	50
	JSUB	:min_caml_create_array		#r3 := min_caml_create_array(r3, r4)
	ST	r3	r2	1	#Save stk_568
	JSUB	:min_caml_print_global6		#r0 := min_caml_print_global6(r3)
	LD	r29	r2	1	#Restore stk_568
	LD	r4	r29	0
	LDI	r3	1
	JSUB	:min_caml_create_array		#r3 := min_caml_create_array(r3, r4)
	ADDI	r4	r3	0	#Mr
	LDI	r3	1
	JSUB	:min_caml_create_array		#r3 := min_caml_create_array(r3, r4)
	JSUB	:min_caml_print_global7		#r0 := min_caml_print_global7(r3)
	LDI	r3	1
	FADD	f1	f0	f0	#FMr
	JSUB	:min_caml_create_float_array		#r3 := min_caml_create_float_array(r3, f1)
	JSUB	:min_caml_print_global8		#r0 := min_caml_print_global8(r3)
	LDI	r3	1
	ADDI	r4	r0	0	#Mr
	JSUB	:min_caml_create_array		#r3 := min_caml_create_array(r3, r4)
	JSUB	:min_caml_print_global9		#r0 := min_caml_print_global9(r3)
	VFLDI	f1	0x4e6e6b28	#1.000000e+09
	LDI	r3	1
	JSUB	:min_caml_create_float_array		#r3 := min_caml_create_float_array(r3, f1)
	JSUB	:min_caml_print_global10		#r0 := min_caml_print_global10(r3)
	LDI	r3	3
	FADD	f1	f0	f0	#FMr
	JSUB	:min_caml_create_float_array		#r3 := min_caml_create_float_array(r3, f1)
	JSUB	:min_caml_print_global11		#r0 := min_caml_print_global11(r3)
	LDI	r3	1
	ADDI	r4	r0	0	#Mr
	JSUB	:min_caml_create_array		#r3 := min_caml_create_array(r3, r4)
	JSUB	:min_caml_print_global12		#r0 := min_caml_print_global12(r3)
	LDI	r3	3
	FADD	f1	f0	f0	#FMr
	JSUB	:min_caml_create_float_array		#r3 := min_caml_create_float_array(r3, f1)
	JSUB	:min_caml_print_global13		#r0 := min_caml_print_global13(r3)
	LDI	r3	3
	FADD	f1	f0	f0	#FMr
	JSUB	:min_caml_create_float_array		#r3 := min_caml_create_float_array(r3, f1)
	JSUB	:min_caml_print_global14		#r0 := min_caml_print_global14(r3)
	LDI	r3	3
	FADD	f1	f0	f0	#FMr
	JSUB	:min_caml_create_float_array		#r3 := min_caml_create_float_array(r3, f1)
	JSUB	:min_caml_print_global15		#r0 := min_caml_print_global15(r3)
	LDI	r3	3
	FADD	f1	f0	f0	#FMr
	JSUB	:min_caml_create_float_array		#r3 := min_caml_create_float_array(r3, f1)
	JSUB	:min_caml_print_global16		#r0 := min_caml_print_global16(r3)
	LDI	r3	2
	ADDI	r4	r0	0	#Mr
	JSUB	:min_caml_create_array		#r3 := min_caml_create_array(r3, r4)
	JSUB	:min_caml_print_global17		#r0 := min_caml_print_global17(r3)
	LDI	r3	2
	ADDI	r4	r0	0	#Mr
	JSUB	:min_caml_create_array		#r3 := min_caml_create_array(r3, r4)
	JSUB	:min_caml_print_global18		#r0 := min_caml_print_global18(r3)
	LDI	r3	1
	FADD	f1	f0	f0	#FMr
	JSUB	:min_caml_create_float_array		#r3 := min_caml_create_float_array(r3, f1)
	JSUB	:min_caml_print_global19		#r0 := min_caml_print_global19(r3)
	LDI	r3	3
	FADD	f1	f0	f0	#FMr
	JSUB	:min_caml_create_float_array		#r3 := min_caml_create_float_array(r3, f1)
	JSUB	:min_caml_print_global20		#r0 := min_caml_print_global20(r3)
	LDI	r3	3
	FADD	f1	f0	f0	#FMr
	JSUB	:min_caml_create_float_array		#r3 := min_caml_create_float_array(r3, f1)
	JSUB	:min_caml_print_global21		#r0 := min_caml_print_global21(r3)
	LDI	r3	3
	FADD	f1	f0	f0	#FMr
	JSUB	:min_caml_create_float_array		#r3 := min_caml_create_float_array(r3, f1)
	JSUB	:min_caml_print_global22		#r0 := min_caml_print_global22(r3)
	LDI	r3	3
	FADD	f1	f0	f0	#FMr
	JSUB	:min_caml_create_float_array		#r3 := min_caml_create_float_array(r3, f1)
	JSUB	:min_caml_print_global23		#r0 := min_caml_print_global23(r3)
	LDI	r3	3
	FADD	f1	f0	f0	#FMr
	JSUB	:min_caml_create_float_array		#r3 := min_caml_create_float_array(r3, f1)
	JSUB	:min_caml_print_global24		#r0 := min_caml_print_global24(r3)
	LDI	r3	3
	FADD	f1	f0	f0	#FMr
	JSUB	:min_caml_create_float_array		#r3 := min_caml_create_float_array(r3, f1)
	JSUB	:min_caml_print_global25		#r0 := min_caml_print_global25(r3)
	ADDI	r3	r0	0	#Mr
	FADD	f1	f0	f0	#FMr
	JSUB	:min_caml_create_float_array		#r3 := min_caml_create_float_array(r3, f1)
	ADDI	r4	r3	0	#Mr
	ST	r4	r2	2	#Save stk_695
	ADDI	r3	r0	0	#Mr
	JSUB	:min_caml_create_array		#r3 := min_caml_create_array(r3, r4)
	ADDI	r4	r1	0	#Mr
	ST	r3	r4	1
	LD	r29	r2	2	#Restore stk_695
	ST	r29	r4	0
	ADDI	r1	r1	2
	ADDI	r3	r0	0	#Mr
	JSUB	:min_caml_create_array		#r3 := min_caml_create_array(r3, r4)
	ADDI	r4	r3	0	#Mr
	LDI	r3	5
	JSUB	:min_caml_create_array		#r3 := min_caml_create_array(r3, r4)
	JSUB	:min_caml_print_global26		#r0 := min_caml_print_global26(r3)
	ADDI	r3	r0	0	#Mr
	FADD	f1	f0	f0	#FMr
	JSUB	:min_caml_create_float_array		#r3 := min_caml_create_float_array(r3, f1)
	ST	r3	r2	3	#Save stk_711
	LDI	r3	3
	FADD	f1	f0	f0	#FMr
	JSUB	:min_caml_create_float_array		#r3 := min_caml_create_float_array(r3, f1)
	ST	r3	r2	4	#Save stk_714
	LD	r4	r2	3	#Restore stk_711
	LDI	r3	60
	JSUB	:min_caml_create_array		#r3 := min_caml_create_array(r3, r4)
	ADDI	r29	r3	0	#Mr
	ADDI	r3	r1	0	#Mr
	ST	r29	r3	1
	LD	r29	r2	4	#Restore stk_714
	ST	r29	r3	0
	ADDI	r1	r1	2
	JSUB	:min_caml_print_global27		#r0 := min_caml_print_global27(r3)
	ADDI	r3	r0	0	#Mr
	FADD	f1	f0	f0	#FMr
	JSUB	:min_caml_create_float_array		#r3 := min_caml_create_float_array(r3, f1)
	ADDI	r4	r3	0	#Mr
	ST	r4	r2	5	#Save stk_719
	ADDI	r3	r0	0	#Mr
	JSUB	:min_caml_create_array		#r3 := min_caml_create_array(r3, r4)
	ADDI	r28	r1	0	#Mr
	ST	r3	r28	1
	LD	r29	r2	5	#Restore stk_719
	ST	r29	r28	0
	ADDI	r1	r1	2
	LDI	r3	180
	ADDI	r4	r1	0	#Mr
	FST	f0	r4	2
	ST	r28	r4	1
	ST	r0	r4	0
	ADDI	r1	r1	3
	JSUB	:min_caml_create_array		#r3 := min_caml_create_array(r3, r4)
	JSUB	:min_caml_print_global28		#r0 := min_caml_print_global28(r3)
	LDI	r3	1
	ADDI	r4	r0	0	#Mr
	JSUB	:min_caml_create_array		#r3 := min_caml_create_array(r3, r4)
	LD	r31	r2	6	#restore link register
	ADDI	r2	r2	6	#delete stack frame
	J	:min_caml_print_global29		#r0 := min_caml_print_global29(r3)
