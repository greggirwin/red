Red/System [
	Title:   "Ref! datatype runtime functions"
	Author:  "Vladimir Vasilyev"
	File: 	 %ref.reds
	Tabs:	 4
	Rights:  "Copyright (C) 2020 Red Foundation. All rights reserved."
	License: {
		Distributed under the Boost Software License, Version 1.0.
		See https://github.com/red/red/blob/master/BSL-License.txt
	}
]

ref: context [
	verbose: 0
	
	mold: func [
		ref     [red-ref!]
		buffer  [red-string!]
		only?   [logic!]
		all?    [logic!]
		flat?   [logic!]
		arg     [red-value!]
		part    [integer!]
		indent  [integer!]
		return: [integer!]
		/local
			size [integer!]
	][
		#if debug? = yes [if verbose > 0 [print-line "ref/mold"]]
		
		size: string/rs-length? buffer
		part: file/mold as red-file! ref buffer only? all? flat? arg part indent
		string/overwrite-char GET_BUFFER(buffer) size as integer! #"@"
		
		part
	]
	
	init: does [
		datatype/register [
			TYPE_REF
			TYPE_STRING
			"ref!"
			;-- General actions --
			INHERIT_ACTION	;make
			null			;random
			null			;reflect
			null			;to
			null			;form
			:mold
			null			;eval-path
			null			;set-path
			null			;compare
			;-- Scalar actions --
			null			;absolute
			null			;add
			null			;divide
			null			;multiply
			null			;negate
			null			;power
			null			;remainder
			null			;round
			null			;subtract
			null			;even?
			null			;odd?
			;-- Bitwise actions --
			null			;and~
			null			;complement
			null			;or~
			null			;xor~
			;-- Series actions --
			null			;append
			INHERIT_ACTION	;at
			INHERIT_ACTION	;back
			INHERIT_ACTION	;change
			INHERIT_ACTION	;clear
			INHERIT_ACTION	;copy
			INHERIT_ACTION	;find
			INHERIT_ACTION	;head
			INHERIT_ACTION	;head?
			INHERIT_ACTION	;index?
			INHERIT_ACTION	;insert
			INHERIT_ACTION	;length?
			INHERIT_ACTION	;move
			INHERIT_ACTION	;next
			INHERIT_ACTION	;pick
			INHERIT_ACTION	;poke
			null			;put
			INHERIT_ACTION	;remove
			INHERIT_ACTION	;reverse
			INHERIT_ACTION	;select
			null			;sort
			INHERIT_ACTION	;skip
			INHERIT_ACTION	;swap
			INHERIT_ACTION	;tail
			INHERIT_ACTION	;tail?
			INHERIT_ACTION	;take
			null			;trim
			;-- I/O actions --
			null			;create
			null			;close
			null			;delete
			null			;modify
			null			;open
			null			;open?
			null			;query
			null			;read
			null			;rename
			null			;update
			null			;write
		]
	]
]
