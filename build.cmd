cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Fox264.obj x264.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Foinput\input.obj input\input.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Foinput\timecode.obj input\timecode.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Foinput\raw.obj input\raw.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Foinput\y4m.obj input\y4m.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Fooutput\raw.obj output\raw.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Fooutput\matroska.obj output\matroska.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Fooutput\matroska_ebml.obj output\matroska_ebml.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Fooutput\flv.obj output\flv.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Fooutput\flv_bytestream.obj output\flv_bytestream.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Fofilters\filters.obj filters\filters.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Fofilters\video\video.obj filters\video\video.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Fofilters\video\source.obj filters\video\source.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Fofilters\video\internal.obj filters\video\internal.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Fofilters\video\resize.obj filters\video\resize.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Fofilters\video\cache.obj filters\video\cache.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Fofilters\video\fix_vfr_pts.obj filters\video\fix_vfr_pts.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Fofilters\video\select_every.obj filters\video\select_every.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Fofilters\video\crop.obj filters\video\crop.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Fofilters\video\depth.obj filters\video\depth.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Foinput\avs.obj input\avs.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Foinput\thread.obj input\thread.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Focommon\mc.obj common\mc.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Focommon\predict.obj common\predict.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Focommon\pixel.obj common\pixel.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Focommon\macroblock.obj common\macroblock.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Focommon\frame.obj common\frame.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Focommon\dct.obj common\dct.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Focommon\cpu.obj common\cpu.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Focommon\cabac.obj common\cabac.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Focommon\common.obj common\common.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -DSYS_WINDOWS -c /Focommon\osdep.obj common\osdep.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Focommon\rectangle.obj common\rectangle.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Focommon\set.obj common\set.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Focommon\quant.obj common\quant.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Focommon\deblock.obj common\deblock.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Focommon\vlc.obj common\vlc.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Focommon\mvpred.obj common\mvpred.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Focommon\bitstream.obj common\bitstream.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -DHAVE_INTERLACED -c /Foencoder\analyse.obj encoder\analyse.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Foencoder\me.obj encoder\me.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Foencoder\ratecontrol.obj encoder\ratecontrol.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -DHAVE_GPL -c /Foencoder\set.obj encoder\set.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Foencoder\macroblock.obj encoder\macroblock.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Foencoder\cabac.obj encoder\cabac.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Foencoder\cavlc.obj encoder\cavlc.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Foencoder\encoder.obj encoder\encoder.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Foencoder\lookahead.obj encoder\lookahead.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -DHAVE_THREAD -c /Focommon\threadpool.obj common\threadpool.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -DHAVE_WIN32THREAD -c /Focommon\win32thread.obj common\win32thread.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Focommon\x86\mc-c.obj common\x86\mc-c.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Focommon\x86\predict-c.obj common\x86\predict-c.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -DHAVE_OPENCL -c /Focommon\opencl.obj common\opencl.c
cl -I. -I"C:\workspace\windows\msys64\usr\local\include" /O2 -c /Foencoder\slicetype-cl.obj encoder\slicetype-cl.c
yasm -I. -I. -DARCH_X86_64=1 -I./common/x86/ -f win64 -Worphan-labels -DSTACK_ALIGNMENT=16 -DHIGH_BIT_DEPTH=0 -DBIT_DEPTH=8 -o common/x86/const-a.obj common/x86/const-a.asm
yasm -I. -I. -DARCH_X86_64=1 -I./common/x86/ -f win64 -Worphan-labels -DSTACK_ALIGNMENT=16 -DHIGH_BIT_DEPTH=0 -DBIT_DEPTH=8 -o common/x86/cabac-a.obj common/x86/cabac-a.asm
yasm -I. -I. -DARCH_X86_64=1 -I./common/x86/ -f win64 -Worphan-labels -DSTACK_ALIGNMENT=16 -DHIGH_BIT_DEPTH=0 -DBIT_DEPTH=8 -o common/x86/dct-a.obj common/x86/dct-a.asm
yasm -I. -I. -DARCH_X86_64=1 -I./common/x86/ -f win64 -Worphan-labels -DSTACK_ALIGNMENT=16 -DHIGH_BIT_DEPTH=0 -DBIT_DEPTH=8 -o common/x86/deblock-a.obj common/x86/deblock-a.asm
yasm -I. -I. -DARCH_X86_64=1 -I./common/x86/ -f win64 -Worphan-labels -DSTACK_ALIGNMENT=16 -DHIGH_BIT_DEPTH=0 -DBIT_DEPTH=8 -o common/x86/mc-a.obj common/x86/mc-a.asm
yasm -I. -I. -DARCH_X86_64=1 -I./common/x86/ -f win64 -Worphan-labels -DSTACK_ALIGNMENT=16 -DHIGH_BIT_DEPTH=0 -DBIT_DEPTH=8 -o common/x86/mc-a2.obj common/x86/mc-a2.asm
yasm -I. -I. -DARCH_X86_64=1 -I./common/x86/ -f win64 -Worphan-labels -DSTACK_ALIGNMENT=16 -DHIGH_BIT_DEPTH=0 -DBIT_DEPTH=8 -o common/x86/pixel-a.obj common/x86/pixel-a.asm
yasm -I. -I. -DARCH_X86_64=1 -I./common/x86/ -f win64 -Worphan-labels -DSTACK_ALIGNMENT=16 -DHIGH_BIT_DEPTH=0 -DBIT_DEPTH=8 -o common/x86/predict-a.obj common/x86/predict-a.asm
yasm -I. -I. -DARCH_X86_64=1 -I./common/x86/ -f win64 -Worphan-labels -DSTACK_ALIGNMENT=16 -DHIGH_BIT_DEPTH=0 -DBIT_DEPTH=8 -o common/x86/quant-a.obj common/x86/quant-a.asm
yasm -I. -I. -DARCH_X86_64=1 -I./common/x86/ -f win64 -Worphan-labels -DSTACK_ALIGNMENT=16 -DHIGH_BIT_DEPTH=0 -DBIT_DEPTH=8 -o common/x86/cpu-a.obj common/x86/cpu-a.asm
yasm -I. -I. -DARCH_X86_64=1 -I./common/x86/ -f win64 -Worphan-labels -DSTACK_ALIGNMENT=16 -DHIGH_BIT_DEPTH=0 -DBIT_DEPTH=8 -o common/x86/dct-64.obj common/x86/dct-64.asm
yasm -I. -I. -DARCH_X86_64=1 -I./common/x86/ -f win64 -Worphan-labels -DSTACK_ALIGNMENT=16 -DHIGH_BIT_DEPTH=0 -DBIT_DEPTH=8 -o common/x86/bitstream-a.obj common/x86/bitstream-a.asm
yasm -I. -I. -DARCH_X86_64=1 -I./common/x86/ -f win64 -Worphan-labels -DSTACK_ALIGNMENT=16 -DHIGH_BIT_DEPTH=0 -DBIT_DEPTH=8 -o common/x86/sad-a.obj common/x86/sad-a.asm
yasm -I. -I. -DARCH_X86_64=1 -I./common/x86/ -f win64 -Worphan-labels -DSTACK_ALIGNMENT=16 -DHIGH_BIT_DEPTH=0 -DBIT_DEPTH=8 -o common/x86/trellis-64.obj common/x86/trellis-64.asm
lib /out:libx264.lib common/mc.obj common/predict.obj common/pixel.obj common/macroblock.obj common/frame.obj common/dct.obj common/cpu.obj common/cabac.obj common/common.obj common/osdep.obj common/rectangle.obj common/set.obj common/quant.obj common/deblock.obj common/vlc.obj common/mvpred.obj common/bitstream.obj encoder/analyse.obj encoder/me.obj encoder/ratecontrol.obj encoder/set.obj encoder/macroblock.obj encoder/cabac.obj encoder/cavlc.obj encoder/encoder.obj encoder/lookahead.obj common/threadpool.obj common/win32thread.obj common/opencl.obj encoder/slicetype-cl.obj common/x86/const-a.obj common/x86/cabac-a.obj common/x86/dct-a.obj common/x86/deblock-a.obj common/x86/mc-a.obj common/x86/mc-a2.obj common/x86/pixel-a.obj common/x86/predict-a.obj common/x86/quant-a.obj common/x86/cpu-a.obj common/x86/dct-64.obj common/x86/bitstream-a.obj common/x86/sad-a.obj common/x86/trellis-64.obj common/x86/mc-c.obj common/x86/predict-c.obj