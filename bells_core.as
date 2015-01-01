; ----------------------------------------------------------
; bells - The watch-night bell(Joya no kane) program
; Copyright (c) 2011,2015 sharkpp All rights reserved.
; This source code is under the MIT License.
; and bells.bmp, bells.png and bells.wav is under CC BY 4.0.
; ----------------------------------------------------------

#ifndef BG_IMAGE
bells_hsp.hsp ‚à‚µ‚­‚Í bells_dish.hsp ‚©‚çƒRƒ“ƒpƒCƒ‹‚µ‚Ä‚­‚¾‚³‚¢
#endif

mmload CHIME_SOUND, 1, 0

gsel 0, 1

if wx * BG_IMAGE_SY < wy * BG_IMAGE_SX {
	zx = wx * BG_IMAGE_SY / BG_IMAGE_SX
	zy = wx * BG_IMAGE_SY / BG_IMAGE_SX
} else {
	zx = wy * BG_IMAGE_SX / BG_IMAGE_SY
	zy = wy * BG_IMAGE_SX / BG_IMAGE_SY
}
px = (wx - zx) / 2
py = (wy - zy) / 2

*main
	redraw 0
	boxf
	pos px, py
	gzoom zx, zy, 2, 0, 0, BG_IMAGE_SX, BG_IMAGE_SY
	redraw 1

	await 33

	stick k,0
	if k & 256 : gosub *click

	goto *main

*click
	mmplay 1
	wait 200
	return

