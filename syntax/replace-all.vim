if exists("b:current_syntax")
  finish
endif

syntax match ReplaceAllFile '^[^:]\+:[0-9]\+:'

highlight default link ReplaceAllFile Function

let b:current_syntax = "replace-all"
