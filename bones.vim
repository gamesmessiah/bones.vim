" ==============================================================================
" bones.vim
" Tagline: "Dammit Jim, I'm a doctor, not a web designer!"
" Description: Build the 'bones' (boilerplate and structure) of your HTML sites.
" File: bones.vim
" Author: Your Name
" License: MIT
" 
" IMAGE REFERENCE:
" [Bones McCoy Picture: https://github.com/gamesmessiah/bones.vim/blob/main/images/bones0.jpg]
" 
" INSTALLATION:
" 1. Create the plugin directory if it doesn't exist:
    "    mkdir -p ~/.vim/plugin
    " 2. Drop this file into ~/.vim/plugin/
    " 3. Restart Vim or source the file (:source ~/.vim/plugin/bones.vim)
    " 
    " USAGE:
    " - :BonesBoilerplate      : Inserts standard HTML5 structure.
    " - <Leader>t              : Opens the tag selection poplist.
    " - <Leader>c              : Toggles HTML comments (Normal/Visual mode).
    " - <Leader>w              : Wraps selected text in a tag (Visual mode).
    " ==============================================================================
    
    " Ensure commands and mappings only apply to HTML files
    autocmd FileType html ++once call BonesInit()
    
    " --- Initialization Function ---
    function! BonesInit() abort
        " Set up mappings and commands specific to HTML filetype
    
        " 1. Command to Insert HTML5 Boilerplate
        " Usage: :BonesBoilerplate
        command! BonesBoilerplate call BonesInsertBoilerplate()
    
        " 2. Visual Mode Mapping for Tag Wrapping
        " Usage: Select text in Visual mode, then press <leader>w
        vnoremap <buffer> <leader>w :<C-u>call BonesWrapTag()<CR>
    
        " 3. Comment Toggling
        " Usage: In Normal or Visual mode, press <leader>c
        nnoremap <buffer> <leader>c :call BonesCommentToggle(visualmode() ==# 'V' ? 1 : 0)<CR>
        vnoremap <buffer> <leader>c :<C-u>call BonesCommentToggle(1)<CR>
    
        " 4. Tag Poplist
        " Usage: In Normal mode, press <leader>t
        command! BonesTagList call BonesTagList()
        nnoremap <buffer> <leader>t :call BonesTagList()<CR>
    endfunction
    
    
    " --- Boilerplate Function ---
    function! BonesInsertBoilerplate() abort
        let l:boilerplate = [
            \ '<!DOCTYPE html>',
            \ '<html lang="en">',
            \ '<head>',
            \ '    <meta charset="UTF-8">',
            \ '    <meta name="viewport" content="width=device-width, initial-scale=1.0">',
            \ '    <title>Document</title>',
            \ '</head>',
            \ '<body>',
            \ '    <h1>Hello, World!</h1>',
            \ '</body>',
            \ '</html>'
            \ ]
        call append(line('.'), l:boilerplate)
        call cursor(line('.') + 6, 11)
    endfunction
    
    
    " --- Tag Wrapping Function ---
    function! BonesWrapTag() abort
        let l:save_cursor = getcurpos()
        let l:start = getpos("'<")[1]
        let l:end = getpos("'>")[1]
    
        let l:tag = input("Wrap with tag: ")
    
        if !empty(l:tag)
            let l:selected_text = join(getline(l:start, l:end), "\n")
            let l:wrapped_text = printf('<%s>%s</%s>', l:tag, l:selected_text, l:tag)
            execute "normal! gvc" . l:wrapped_text
        endif
    
        call setpos('.', l:save_cursor)
    endfunction
    
    
    " --- Comment Toggling Function ---
    function! BonesCommentToggle(visual) abort
        let l:start_line = a:visual ? line("'<") : line('.')
        let l:end_line = a:visual ? line("'>") : line('.')
    
        let l:start_marker = "<!--"
        let l:end_marker = "-->"
    
        for l:i in range(l:start_line, l:end_line)
            let l:line = getline(l:i)
            if l:line =~ '\V' . escape(l:start_marker, '\') . '.*' . escape(l:end_marker, '\')
                let l:line = substitute(l:line, '\V' . escape(l:start_marker, '\'), '', '')
                let l:line = substitute(l:line, '\V' . escape(l:end_marker, '\') . '\s*$', '', '')
            else
                let l:line = l:start_marker . ' ' . l:line . ' ' . l:end_marker
            endif
            call setline(l:i, l:line)
        endfor
    endfunction
    
    
    " --- Tag Poplist Function ---
    function! BonesTagList() abort
        let l:tags = ['h1', 'p', 'div', 'ul', 'li', 'a', 'img', 'input', 'button', 'script', 'style']
        let l:tag_choices = ['Bones.vim - Select Tag:']
        let l:idx = 1
        for l:tag in l:tags
            call add(l:tag_choices, printf('%d. %s', l:idx, l:tag))
            let l:idx += 1
        endfor
    
        let l:choice = inputlist(l:tag_choices)
    
        if l:choice > 0
            let l:tag_name = l:tags[l:choice - 1] 
            if l:tag_name =~# '^\(img\|input\)$'
                call append(line('.'), printf('<%s>', l:tag_name))
                call cursor(line('.') + 1, 2 + len(l:tag_name))
            else
                call append(line('.'), [printf('<%s>', l:tag_name), printf('</%s>', l:tag_name)])
                call cursor(line('.') + 1, 1)
            endif
        endif
    endfunction