; preprocessor directives
(preproc_include
  (["#include"]) @keyword
  (path_spec) @preproc
)

(preproc_define
  (["#define"]) @keyword
  (preproc_macro) @preproc
)

(preproc_ifdef
  (["#ifdef"]) @keyword
  (identifier) @preproc
)

(preproc_ifndef
  (["#ifndef"]) @keyword
  (identifier) @preproc
)

(preproc_endif) @keyword

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

(directive
  [(input_kw) (output_kw)]
  (qualified_name) @function.call
)

; type declarations
(type_decl
  (eq_type_decl
    (abstract_data_type
      (adt_branch
        (identifier) @type
        (attribute
          (attribute_name) @parameter
          (type_name) @type
        )
      )
    )
  )
)

(type_decl
  (identifier) @type)

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

; atoms
(atom
  (qualified_name) @function
)

(argument
  (constant) @constant
)

(argument
  (variable) @parameter
)

(branch_init
  (qualified_name) @type
)

(intrinsic_functor_name) @function.builtin

; strings
(string_literal) @string

; comments
(block_comment) @comment
(line_comment) @comment
