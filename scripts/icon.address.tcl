
namespace eval mv {

proc address.switch { } {
	return [ mc2 "Add/remove cycle mark" ]
}

proc address.create { item_id diagram_id x y } {
	return [ list insert items				\
		item_id				$item_id		\
		diagram_id		$diagram_id	\
		type					'address'		\
		text					address		\
		selected				1					\
		x						$x					\
		y						$y					\
		w						60					\
		h						20					\
		a						60					\
		b						0		 ]
}

proc address.lines { x y w h a b } {
	return {}
}


proc address.fit { tw th tw2 th2 x y w h a b } {
	set result [ action.fit $tw $th 0 0 $x $y $w $h $a $b ]
	lassign $result x2 y2 w2 h2 a2 b2
	incr h2 10
	return [ list $x2 $y2 $w2 $h2 $a2 $b2 ]
}

proc address.box { x y w h a b } {
	set left [ expr { $x - $w } ]
	set top [ expr { $y - $h } ]
	set right [ expr { $x + $w } ]
	set bottom [ expr { $y + 1.5 * $h } ]
	
	return [ list $left $top $right $bottom ]
}


proc address.icons { text text2 color x y w h a b } {
	lassign [ get_colors $color $colors::action_bg ] fg bg tc
	set h2 [ expr { $h / 1.5 } ]
	set middle [ expr { $y - $h + $h2 } ]
	set left [ expr { $x - $w } ]
	set right [ expr { $x + $w } ]
	set top [ expr { $y - $h } ]
	set bottom [ expr { $y + $h } ]
	set coords [ list $left $middle  $x $top  $right $middle  $right $bottom $left $bottom  $left $middle ]
	set rect_coords [ make_rect $x $y $w $h ]
	set cdbox [ add_handle_border $rect_coords ]
	set rect [ make_prim main polygon $coords "" $fg $colors::branch_bg $cdbox ]
	set ty [ expr { $bottom - ( $bottom - $middle ) / 2 } ]
	set text_prim [ create_text $x $ty $text $tc ]
	if { $b == 0 } {
		return [ list $rect $text_prim ]
	} else {
		set m2 [ expr { $top + ($middle - $top) / 2.0 } ]
		set x1 [ expr { $x - $w / 2.0 } ]
		set x2 [ expr { $x + $w / 2.0 } ]
		set tri [ make_prim mark polygon [ list $x1 $m2 $x $top $x2 $m2 $x1 $m2 ] "" $fg $fg $cdbox ]
		return [ list $rect $tri $text_prim ]
	}
}


proc address.handles { x y w h a b } {
	return [ action.handles $x $y $w $h $a $b ]
}

proc address.nw { dx dy x y w h a b } {
	return [ action.nw $dx $dy $x $y $w $h $a $b ]
}

proc address.n { dx dy x y w h a b } {
	return [ action.n $dx $dy $x $y $w $h $a $b ]
}

proc address.ne { dx dy x y w h a b } {
	return [ action.ne $dx $dy $x $y $w $h $a $b ]
}

proc address.e { dx dy x y w h a b } {
	return [ action.e $dx $dy $x $y $w $h $a $b ]
}

proc address.sw { dx dy x y w h a b } {
	return [ action.sw $dx $dy $x $y $w $h $a $b ]
}

proc address.s { dx dy x y w h a b } {
	return [ action.s $dx $dy $x $y $w $h $a $b ]
}

proc address.se { dx dy x y w h a b } {
	return [ action.se $dx $dy $x $y $w $h $a $b ]
}

proc address.w { dx dy x y w h a b } {
	return [ action.w $dx $dy $x $y $w $h $a $b ]
}

}
