
namespace eval mv {

variable loop_add 8

proc loopstart.switch { } {
	return ""
}

proc loopstart.create { item_id diagram_id x y } {
	return [ list insert items				\
		item_id				$item_id		\
		diagram_id		$diagram_id	\
		type					'loopstart'		\
		text					loopstart		\
		selected				1					\
		x						$x					\
		y						$y					\
		w						60					\
		h						20					\
		a						60					\
		b						0		 ]
}

proc loopstart.lines { x y w h a b } {
	return {}
}

proc loopstart.fit { tw th tw2 th2 x y w h a b } {
	return [ action.fit $tw $th 0 0 $x $y $w $h $a $b ]
}

proc loopstart.box { x y w h a b } {
	return [ action.box $x $y $w $h $a $b ]
}


proc loopstart.icons { text text2 color x y w h a b } {
	variable loop_add
	set w [ expr { $w + $loop_add } ]
	lassign [ get_colors $color $colors::for_bg ] fg bg tc
	set h2 [ expr { $h / 1.5 } ]
	set middle [ expr { $y - $h + $h2 } ]
	set x0 [ expr { $x - $w } ]
	set x1 [ expr { $x0 + $h2 } ]
	if { $x1 > $x } { set x1 $x }
	set x3 [ expr { $x + $w } ]
	set x2 [ expr { $x3 - $h2 } ]
	if { $x2 < $x } { set x2 $x }
	set top [ expr { $y - $h } ]
	set bottom [ expr { $y + $h } ]
	set coords [ list $x0 $middle  $x1 $top  $x2 $top  $x3 $middle  $x3 $bottom  $x0 $bottom $x0 $middle ]
	set rect_coords [ make_rect $x $y $w $h ]
	set cdbox [ add_handle_border $rect_coords ]
	set rect [ make_prim main polygon $coords "" $fg $bg $cdbox ]
	set text_prim [ create_text $x $y $text $tc ]
	return [ list $rect $text_prim ]
}


proc loopstart.handles { x y w h a b } {
	return [ action.handles $x $y $w $h $a $b ]
}

proc loopstart.nw { dx dy x y w h a b } {
	return [ action.nw $dx $dy $x $y $w $h $a $b ]
}

proc loopstart.n { dx dy x y w h a b } {
	return [ action.n $dx $dy $x $y $w $h $a $b ]
}

proc loopstart.ne { dx dy x y w h a b } {
	return [ action.ne $dx $dy $x $y $w $h $a $b ]
}

proc loopstart.e { dx dy x y w h a b } {
	return [ action.e $dx $dy $x $y $w $h $a $b ]
}

proc loopstart.sw { dx dy x y w h a b } {
	return [ action.sw $dx $dy $x $y $w $h $a $b ]
}

proc loopstart.s { dx dy x y w h a b } {
	return [ action.s $dx $dy $x $y $w $h $a $b ]
}

proc loopstart.se { dx dy x y w h a b } {
	return [ action.se $dx $dy $x $y $w $h $a $b ]
}

proc loopstart.w { dx dy x y w h a b } {
	return [ action.w $dx $dy $x $y $w $h $a $b ]
}

}
