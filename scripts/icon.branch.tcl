
namespace eval mv {

proc branch.switch { } {
	return [ mc2 "Add/remove cycle mark" ]
}

proc branch.create { item_id diagram_id x y } {
	return [ list insert items				\
		item_id				$item_id		\
		diagram_id		$diagram_id	\
		type					'branch'		\
		text					branch		\
		selected				1					\
		x						$x					\
		y						$y					\
		w						60					\
		h						20					\
		a						60					\
		b						0		 ]
}

proc branch.lines { x y w h a b } {
	return {}
}

proc branch.fit { tw th tw2 th2 x y w h a b } {
	return [ address.fit $tw $th 0 0 $x $y $w $h $a $b ]
}

proc beginend.box { x y w h a b } {
	return [ action.box $x $y $w $h $a $b ]
}

proc branch.box { x y w h a b } {
	set left [ expr { $x - $w } ]
	set top [ expr { $y - $h } ]
	set right [ expr { $x + $w } ]
	set bottom [ expr { $y + $h * 1.5 } ]
	
	return [ list $left $top $right $bottom ]
}

proc branch.icons { text text2 color x y w h a b } {
	lassign [ get_colors $color $colors::action_bg ] fg bg tc
	set h2 [ expr { $h / 1.5 } ]
	set middle [ expr { $y + $h - $h2 } ]
	set left [ expr { $x - $w } ]
	set right [ expr { $x + $w } ]
	set top [ expr { $y - $h } ]
	set bottom [ expr { $y + $h } ]
	set coords [ list $left $middle  $left $top  $right $top  $right $middle  $x $bottom  $left $middle ]
	set rect_coords [ make_rect $x $y $w $h ]
	set cdbox [ add_handle_border $rect_coords ]
	set rect [ make_prim main polygon $coords "" $fg $colors::branch_bg $cdbox ]
	set ty [ expr { $top + ( $middle - $top ) / 2 } ]
	set text_prim [ create_text $x $ty $text $tc ]
	if { $b == 0 } {
		return [ list $rect $text_prim ]
	} else {
		set m2 [ expr { $middle + ($bottom - $middle) / 2.0 } ]
		set x1 [ expr { $x - $w / 2.0 } ]
		set x2 [ expr { $x + $w / 2.0 } ]
		set tri [ make_prim mark polygon [ list $x1 $m2 $x $bottom $x2 $m2 $x1 $m2 ] "" $fg $fg $cdbox ]
		return [ list $rect $tri $text_prim ]	
	}
}


proc branch.handles { x y w h a b } {
	return [ action.handles $x $y $w $h $a $b ]
}

proc branch.nw { dx dy x y w h a b } {
	return [ action.nw $dx $dy $x $y $w $h $a $b ]
}

proc branch.n { dx dy x y w h a b } {
	return [ action.n $dx $dy $x $y $w $h $a $b ]
}

proc branch.ne { dx dy x y w h a b } {
	return [ action.ne $dx $dy $x $y $w $h $a $b ]
}

proc branch.e { dx dy x y w h a b } {
	return [ action.e $dx $dy $x $y $w $h $a $b ]
}

proc branch.sw { dx dy x y w h a b } {
	return [ action.sw $dx $dy $x $y $w $h $a $b ]
}

proc branch.s { dx dy x y w h a b } {
	return [ action.s $dx $dy $x $y $w $h $a $b ]
}

proc branch.se { dx dy x y w h a b } {
	return [ action.se $dx $dy $x $y $w $h $a $b ]
}

proc branch.w { dx dy x y w h a b } {
	return [ action.w $dx $dy $x $y $w $h $a $b ]
}

}
