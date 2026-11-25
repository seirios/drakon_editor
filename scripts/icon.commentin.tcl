
namespace eval mv {

proc commentin.switch { } {
	return ""
}

proc commentin.create { item_id diagram_id x y } {
	return [ list insert items				\
		item_id				$item_id		\
		diagram_id		$diagram_id	\
		type					'commentin'	\
		text					comment-in	\
		selected				1					\
		x						$x					\
		y						$y					\
		w						60					\
		h						20					\
		a						60					\
		b						0		 ]
}

proc commentin.lines { x y w h a b } {
	return {}
}

proc commentin.fit { tw th tw2 th2 x y w h a b } {
	set tmp [ action.fit $tw $th 0 0 $x $y $w $h $a $b ]
	lassign $tmp x2 y2 w2 h2 a2 b2
	incr w2 8
	return [ list $x2 $y2 $w2 $h2 $a2 $b2 ]
}


proc commentin.icons { text text2 color x y w h a b } {
	lassign [ get_colors $color $colors::action_bg ] fg bg tc
	set radius 12
	set number 8
	set margin [ expr { $radius / 2 } ]
	
	set left [ expr { $x - $w + $margin } ]
	set right [ expr { $x + $w - $margin } ]
	set top [ expr { $y - $h + $margin } ]
	set bottom [ expr { $y + $h - $margin } ]
	set hh [ expr { $radius * 2 } ]
	set tt [ expr { $bottom - $hh } ]
	set width [ expr { $right - $left } ]
	
	set x1 [ expr { $left + $radius } ]
	set x2 [ expr { $right - $radius } ]
	set y1 [ expr { $top + $radius } ]
	set y2 [ expr { $bottom - $radius } ]
	
	set nw [ arc_nw $left $top $hh $number ]
	set ne [ arc_ne $left $top $width $hh $number ]
	set se [ arc_se $left $tt $width $hh $number ]	
	set sw [ arc_sw $left $tt $hh $number ]

	set coords [ concat $nw [ list $x1 $top ] $ne [ list $right $y1 ] $se [ list $x2 $bottom ] $sw [ list $left  $y2 ] ]
	
	set rect1_coords [ make_rect $x $y $w $h ]
	set cdbox [ add_handle_border $rect1_coords ]
	set rect1 [ make_prim main rectangle $rect1_coords "" $fg $colors::comment_bg $cdbox ]
	set screen [ make_prim screen polygon $coords "" $fg $bg $cdbox ]
	
	set text_prim [ create_text $x $y $text $colors::syntax_comment ]
	return [ list $rect1 $screen $text_prim ]
}

proc commentin.box { x y w h a b } {
	return [ action.box $x $y $w $h $a $b ]
}

proc commentin.handles { x y w h a b } {
	return [ action.handles $x $y $w $h $a $b ]
}

proc commentin.nw { dx dy x y w h a b } {
	return [ action.nw $dx $dy $x $y $w $h $a $b ]
}

proc commentin.n { dx dy x y w h a b } {
	return [ action.n $dx $dy $x $y $w $h $a $b ]
}

proc commentin.ne { dx dy x y w h a b } {
	return [ action.ne $dx $dy $x $y $w $h $a $b ]
}

proc commentin.e { dx dy x y w h a b } {
	return [ action.e $dx $dy $x $y $w $h $a $b ]
}

proc commentin.sw { dx dy x y w h a b } {
	return [ action.sw $dx $dy $x $y $w $h $a $b ]
}

proc commentin.s { dx dy x y w h a b } {
	return [ action.s $dx $dy $x $y $w $h $a $b ]
}

proc commentin.se { dx dy x y w h a b } {
	return [ action.se $dx $dy $x $y $w $h $a $b ]
}

proc commentin.w { dx dy x y w h a b } {
	return [ action.w $dx $dy $x $y $w $h $a $b ]
}

}
