set(SRCS
 x264.c
 input/input.c
 input/timecode.c
 input/raw.c
 input/y4m.c
 output/raw.c
 output/matroska.c
 output/matroska_ebml.c
 output/flv.c
 output/flv_bytestream.c
 filters/filters.c
 filters/video/video.c
 filters/video/source.c
 filters/video/internal.c
 filters/video/resize.c
 filters/video/cache.c
 filters/video/fix_vfr_pts.c
 filters/video/select_every.c
 filters/video/crop.c
 filters/video/depth.c
 input/avs.c
 input/thread.c
 common/mc.c
 common/predict.c
 common/pixel.c
 common/macroblock.c
 common/frame.c
 common/dct.c
 common/cpu.c
 common/cabac.c
 common/common.c
 common/osdep.c
 common/rectangle.c
 common/set.c
 common/quant.c
 common/deblock.c
 common/vlc.c
 common/mvpred.c
 common/bitstream.c
 encoder/analyse.c
 encoder/me.c
 encoder/ratecontrol.c
 encoder/set.c
 encoder/macroblock.c
 encoder/cabac.c
 encoder/cavlc.c
 encoder/encoder.c
 encoder/lookahead.c
 common/threadpool.c
 common/win32thread.c
 common/x86/mc-c.c
 common/x86/predict-c.c
 common/opencl.c
 encoder/slicetype-cl.c)
 
 set(CMAKE_C_FLAGS_RELEASE "-O2 /MT")
 
 SET_SOURCE_FILES_PROPERTIES(common/osdep.c PROPERTIES COMPILE_FLAGS -DSYS_WINDOWS)
 SET_SOURCE_FILES_PROPERTIES(encoder/analyse.c PROPERTIES COMPILE_FLAGS -DHAVE_INTERLACED)
 SET_SOURCE_FILES_PROPERTIES(encoder/set.c PROPERTIES COMPILE_FLAGS -DHAVE_GPL)
 SET_SOURCE_FILES_PROPERTIES(common/threadpool.c PROPERTIES COMPILE_FLAGS -DHAVE_THREAD)
 SET_SOURCE_FILES_PROPERTIES(common/win32thread.c PROPERTIES COMPILE_FLAGS -DHAVE_WIN32THREAD)
 SET_SOURCE_FILES_PROPERTIES(common/opencl.c PROPERTIES COMPILE_FLAGS -DHAVE_OPENCL)
 
 set(ASM
 const-a
 cabac-a
 dct-a
 deblock-a
 mc-a
 mc-a2
 pixel-a
 predict-a
 quant-a
 cpu-a
 dct-64
 bitstream-a
 sad-a
 trellis-64)
 
 find_program(YASM_EXE NAMES yasm)
 set(YASM_ARGS -I${CMAKE_SOURCE_DIR}/ -I${CMAKE_SOURCE_DIR}// -DARCH_X86_64=1 -I${CMAKE_SOURCE_DIR}/common/x86/ -f win64 -Worphan-labels -DSTACK_ALIGNMENT=16 -DHIGH_BIT_DEPTH=0 -DBIT_DEPTH=8)
 foreach(assembly ${ASM})
	add_custom_command(OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/common/x86/${assembly}.obj COMMAND ${YASM_EXE} ARGS ${YASM_ARGS} -o ${CMAKE_CURRENT_BINARY_DIR}/common/x86/${assembly}.obj ${CMAKE_CURRENT_SOURCE_DIR}/common/x86/${assembly}.asm)
 endforeach(assembly)
 
 set(ASM_OBJS)
 foreach(assembly ${ASM})
    set(ASM_OBJS ${CMAKE_CURRENT_BINARY_DIR}/common/x86/${assembly}.obj ${ASM_OBJS})
 endforeach(assembly)
 
 include_directories(${CMAKE_CURRENT_SOURCE_DIR} "${CMAKE_CURRENT_SOURCE_DIR}/msys64/usr/local/include")
 #add_definitions(-DSYS_WINDOWS -DHAVE_INTERLACED -DHAVE_GPL -DHAVE_THREAD -DHAVE_WIN32THREAD -DHAVE_OPENCL)
 add_library(libx264 STATIC ${SRCS} ${ASM_OBJS})
 
 add_library(libx264-shared SHARED example.c)
 target_compile_options(libx264-shared PRIVATE -DSHARED_X264_BUILD -DX264_SHARED_EXPORTS)
 target_link_libraries(libx264-shared libx264)
 
 add_executable(x264test test/x264test.c)
 target_link_libraries(x264test libx264-shared)
 