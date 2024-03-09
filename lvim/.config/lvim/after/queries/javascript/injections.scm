(lexical_declaration
  (variable_declarator
    name:(identifier)
    value: (template_string ) @injection.content 
        (#set! injection.content.language "html") 
        (#set! injection.combined)))
