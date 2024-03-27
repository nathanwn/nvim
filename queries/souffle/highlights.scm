; preprocessor directives
(preproc_include
  (["#include"]) @preproc
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
(init_kw) @keyword
(input_kw) @keyword
(output_kw) @keyword
(type_kw) @keyword
(decl_kw) @keyword
(type_decl
  (identifier) @type)

(directive
  (qualified_name) @function
  (directive_attribute_assignment
    (identifier) @parameter
  )
)

(directive
  (input_kw)
  (directive_attribute_assignment
    (identifier) @parameter (#eq? @parameter "IO")
    (directive_value) @constant (#any-of? @constant "file" "stdin" "sqlite")
  )
)

; rules
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

; strings
(string_literal) @string

; comments
(block_comment) @comment
(line_comment) @comment
