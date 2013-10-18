replace-all.vim
===============

Replace-in-all-files vim plugin

Installation:
-------------

Add this line to your vimrc:

```vim
Bundle 'elentok/replace-all.vim'
```

Usage:
------

First, find the text you want to change:

```vim
:FindAll {expr}
```

for example:

```vim
:FindAll myFunction
```

to search only in .js files:

```vim
:FindAll myFunction -G js$
```

This will open a file with the search results:


```
{filename}:{linenumber}:{text}
```

Make the changes you want and then run ```:ReplaceAll```

