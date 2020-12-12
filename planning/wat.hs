
-- WASM functions wrapping the add instructions
(func $i32_add (; pure inline ;) (param $0 i32) (param $1 i32) (result i32)
	(i32.add
		(get_local $0)
		(get_local $1)
	)
)
(func $i64_add (; pure inline ;) (param $0 i64) (param $1 i64) (result i64)
	(i64.add
		(get_local $0)
		(get_local $1)
	)
)

-- Using the above wasm functions to define an overloaded + operator
{ $b = $a =
	b type I32 ==
	a type I32 == &&
} {
	i32_add
} $+ fun

{ $b = $a =
	b type I64 ==
	a type I64 == &&
} {
	i64_add
} $+ fun