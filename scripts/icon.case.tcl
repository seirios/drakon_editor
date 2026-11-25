
namespace eval mv {

proc case.switch { } {
	return ""
}

proc case.create { item_id diagram_id x y } {
	return [ list insert items				\
		item_id				$item_id		\
		diagram_id		$diagram_id	\
		type					'case'		\
		text					case		\
		selected				1					\
		x						$x					\
		y						$y					\
		w						60					\
		h						20					\
		a						60					\
		b						0		 ]
}

proc case.lines { x y w h a b } {
	return {}
}

proc case.fit { tw th tw2 th2 x y w h a b } {
	return [ action.fit $tw $th 0 0 $x $y $w $h $a $b ]
}

proc case.box { x y w h a b } {
	return [ branch.box $x $y $w $h $a $b ]
}


proc case.icons { text text2 color x y w h a b } {
	lassign [ get_colors $color $colors::case_bg ] fg bg tc
	set h2 [ expr { $h / 1.5 } ]
	set middle [ expr { $y + $h - $h2 } ]
	set left [ expr { $x - $w } ]
	set right [ expr { $x + $w } ]
	set top [ expr { $y - $h } ]
	set bottom [ expr { $y + $h } ]
	set coords [ list $left $middle  $left $top  $right $top  $right $middle  $x $bottom  $left $middle ]
	set rect_coords [ make_rect $x $y $w $h ]
	set cdbox [ add_handle_border $rect_coords ]
	set rect [ make_prim main polygon $coords "" $fg $bg $cdbox ]
	set ty [ expr { $top + ( $middle - $top ) / 2 } ]
	set hline [ make_line hline $left $middle $right $middle $fg ]
	set text_prim [ create_text $x $ty $text $tc ]
	return [ list $rect $hline $text_prim ]
}


proc case.handles { x y w h a b } {
	return [ action.handles $x $y $w $h $a $b ]
}

proc case.nw { dx dy x y w h a b } {
	return [ action.nw $dx $dy $x $y $w $h $a $b ]
}

proc case.n { dx dy x y w h a b } {
	return [ action.n $dx $dy $x $y $w $h $a $b ]
}

proc case.ne { dx dy x y w h a b } {
	return [ action.ne $dx $dy $x $y $w $h $a $b ]
}

proc case.e { dx dy x y w h a b } {
	return [ action.e $dx $dy $x $y $w $h $a $b ]
}

proc case.sw { dx dy x y w h a b } {
	return [ action.sw $dx $dy $x $y $w $h $a $b ]
}

proc case.s { dx dy x y w h a b } {
	return [ action.s $dx $dy $x $y $w $h $a $b ]
}

proc case.se { dx dy x y w h a b } {
	return [ action.se $dx $dy $x $y $w $h $a $b ]
}

proc case.w { dx dy x y w h a b } {
	return [ action.w $dx $dy $x $y $w $h $a $b ]
}

}
