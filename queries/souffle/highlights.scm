; preprocessor
(preproc_include
  (path_spec) @string
)

; relation
(relation_decl
  (identifier) @function
  (attribute
    (attribute_name) @parameter
    (type_name) @type
  )
)

; directives
; (io_directive_list
;   (io_relation_list
;     (identifier
;       (IDENT) @function
;     )
;   )
; )
; (io_directive_list
;   (non_empty_key_value_pairs
;     (IDENT) @variable.builtin
;   )
; )
; (io_directive_list
;   (non_empty_key_value_pairs
;     (non_empty_key_value_pairs
;       (IDENT) @variable.builtin
;     )
;   )
; )
; (io_directive_list
;   (non_empty_key_value_pairs
;     (non_empty_key_value_pairs
;       (kvp_value
;         (IDENT) @constant (#any-of? @constant "file" "stdin" "sqlite")
;       )
;     )
;   )
; )
;

(rule
  (rule_head
    (atom
      (qualified_name) @function.call
    )
  )
  (disjunction
    (conjunction
      (atom
        (qualified_name) @function.call
      )
    )
  )
)

(directive
  (input_kw) @keyword)

(directive
  (output_kw) @keyword)

(type_decl
  (type_kw) @keyword)

(relation_decl
  (decl_kw) @keyword)

(type_decl
  (identifier) @type)

; parameters
(directive
  (directive_attribute_assignment
    (identifier) @parameter
  )
)

; strings
(string_literal) @string

; comments
(block_comment) @comment
(line_comment) @comment
