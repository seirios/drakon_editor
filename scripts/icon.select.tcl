
namespace eval mv {

proc select.switch { } {
	return ""
}

proc select.create { item_id diagram_id x y } {
	return [ list insert items				\
		item_id				$item_id		\
		diagram_id		$diagram_id	\
		type					'select'		\
		text					select		\
		selected				1					\
		x						$x					\
		y						$y					\
		w						60					\
		h						20					\
		a						60					\
		b						0		 ]
}

proc select.lines { x y w h a b } {
	return {}
}

proc select.fit { tw th tw2 th2 x y w h a b } {
	set result [ action.fit $tw $th 0 0 $x $y $w $h $a $b ]
	lassign $result x2 y2 w2 h2 a2 b2
	set w2 [ expr { $w2 + $h2 / 2 } ]
	return [ list $x2 $y2 $w2 $h2 $a2 $b2 ]
}

proc select.box { x y w h a b } {
	return [ action.box $x $y $w $h $a $b ]
}


proc select.icons { text text2 color x y w h a b } {
	lassign [ get_colors $color $colors::case_bg ] fg bg tc
	set h2 [ expr { $h / 2 } ]
	set x0 [ expr { $x - $w } ]
	set x1 [ expr { $x0 + $h2 } ]
	if { $x1 > $x } { set x1 $x }
	set x3 [ expr { $x + $w } ]
	set x2 [ expr { $x3 - $h2 } ]
	if { $x2 < $x } { set x2 $x }
	set top [ expr { $y - $h } ]
	set bottom [ expr { $y + $h } ]
	set coords [ list $x0 $bottom  $x1 $top  $x3 $top  $x2 $bottom  $x0 $bottom ]
	set rect_coords [ make_rect $x $y $w $h ]
	set cdbox [ add_handle_border $rect_coords ]
	set rect [ make_prim main polygon $coords "" $fg $bg $cdbox ]
	set text_prim [ create_text $x $y $text $tc ]
	return [ list $rect $text_prim ]
}


proc select.handles { x y w h a b } {
	return [ action.handles $x $y $w $h $a $b ]
}

proc select.nw { dx dy x y w h a b } {
	return [ action.nw $dx $dy $x $y $w $h $a $b ]
}

proc select.n { dx dy x y w h a b } {
	return [ action.n $dx $dy $x $y $w $h $a $b ]
}

proc select.ne { dx dy x y w h a b } {
	return [ action.ne $dx $dy $x $y $w $h $a $b ]
}

proc select.e { dx dy x y w h a b } {
	return [ action.e $dx $dy $x $y $w $h $a $b ]
}

proc select.sw { dx dy x y w h a b } {
	return [ action.sw $dx $dy $x $y $w $h $a $b ]
}

proc select.s { dx dy x y w h a b } {
	return [ action.s $dx $dy $x $y $w $h $a $b ]
}

proc select.se { dx dy x y w h a b } {
	return [ action.se $dx $dy $x $y $w $h $a $b ]
}

proc select.w { dx dy x y w h a b } {
	return [ action.w $dx $dy $x $y $w $h $a $b ]
}

}
