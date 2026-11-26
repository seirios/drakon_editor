
namespace eval mv {

proc blockend.switch { } {
	return ""
}

proc blockend.create { item_id diagram_id x y } {
	return [ list insert items			\
		item_id			$item_id	\
		diagram_id		$diagram_id	\
		type			'blockend'	\
		text			blockend	\
		selected		1		\
		x			$x		\
		y			$y		\
		w			60		\
		h			20		\
		a			60		\
		b			0		 ]
}

proc blockend.lines { x y w h a b } {
	return {}
}

proc blockend.fit { tw th tw2 th2 x y w h a b } {
	return [ loopstart.fit $tw $th 0 0 $x $y $w $h $a $b ]
}

proc blockend.box { x y w h a b } {
	return [ action.box $x $y $w $h $a $b ]
}


proc blockend.icons { text text2 color x y w h a b } {
	variable block_add
	lassign [ get_colors $color $colors::branch_bg ] fg bg tc
	set rect_coords [ make_rect $x $y $w $h ]
	set cdbox [ add_handle_border $rect_coords ]
	set rect [ make_prim main rectangle $rect_coords "" $fg $bg $cdbox ]

	set x0 [ expr { $x - $w } ]
	set x1 [ expr { $x + $w } ]
	set top [ expr { $y + $h } ]
	set bottom [ expr { $y - $h } ]

	set top1 [ expr { $top - $block_add } ]
	set bottom1 [ expr { $bottom - $block_add } ]
	set dx 0.12
	set x0left  [ expr { $x0 - (2 + $dx) * $block_add } ]
	set x1left  [ expr { $x0 - (1 - $dx) * $block_add } ]
	set x0right [ expr { $x1 + (1 - $dx) * $block_add } ]
	set x1right [ expr { $x1 + (2 + $dx) * $block_add } ]
	set coords [ list $x0 $bottom1  $x0left $bottom1  $x1left $top  $x0right $top  \
		$x1right $bottom1  $x1 $bottom1  $x1 $top1  $x0 $top1  $x0 $bottom1 ]
	set bracket [ make_prim decoration polygon $coords "" $fg $bg "" ]
	set y1 [ expr { $y - $block_add / 2 } ]
	set text_prim [ create_text $x $y1 $text $tc ]
	return [ list $rect $bracket $text_prim ]
}


proc blockend.handles { x y w h a b } {
	return [ action.handles $x $y $w $h $a $b ]
}

proc blockend.nw { dx dy x y w h a b } {
	return [ action.nw $dx $dy $x $y $w $h $a $b ]
}

proc blockend.n { dx dy x y w h a b } {
	return [ action.n $dx $dy $x $y $w $h $a $b ]
}

proc blockend.ne { dx dy x y w h a b } {
	return [ action.ne $dx $dy $x $y $w $h $a $b ]
}

proc blockend.e { dx dy x y w h a b } {
	return [ action.e $dx $dy $x $y $w $h $a $b ]
}

proc blockend.sw { dx dy x y w h a b } {
	return [ action.sw $dx $dy $x $y $w $h $a $b ]
}

proc blockend.s { dx dy x y w h a b } {
	return [ action.s $dx $dy $x $y $w $h $a $b ]
}

proc blockend.se { dx dy x y w h a b } {
	return [ action.se $dx $dy $x $y $w $h $a $b ]
}

proc blockend.w { dx dy x y w h a b } {
	return [ action.w $dx $dy $x $y $w $h $a $b ]
}

}
