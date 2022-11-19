; relation name
(relation_decl
  (relation_list
    (IDENT) @function
  )
)

; rules
(rule_def
  (head
    (atom
      (identifier
        (IDENT) @macro
      )
    )
  )
)
(conjunction
  (term
    (atom
      (identifier
        (IDENT) @function
      )
    )
  )
)

; directives
(io_directive_list
  (io_relation_list
    (identifier
      (IDENT) @function
    )
  )
)
(io_directive_list
  (non_empty_key_value_pairs
    (IDENT) @variable.builtin
  )
)
(io_directive_list
  (non_empty_key_value_pairs
    (non_empty_key_value_pairs
      (IDENT) @variable.builtin
    )
  )
)
(io_directive_list
  (non_empty_key_value_pairs
    (non_empty_key_value_pairs
      (kvp_value
        (IDENT) @constant (#any-of? @constant "file" "stdin" "sqlite")
      )
    )
  )
)

; types
(type
  (IDENT) @type
)

(non_empty_attributes
  (identifier
    (IDENT) @type
  )
)

; keywords
[
 (TYPE)
 (DECL)
 (INPUT_DECL)
 (OUTPUT_DECL)
] @keyword

; strings
(STRING) @string

; comments
(COMMENT) @comment
