bits 64
section .rodata
global _%_start
global _%_end
global _%_size
_%_start: incbin src/maps/worldMap.map
_%_end:
_%_size: dd _%_start
