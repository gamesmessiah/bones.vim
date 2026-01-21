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
"     mkdir -p ~/.vim/plugin
" 2. Drop this file into ~/.vim/plugin/
" 3. Restart Vim or source the file (:source ~/.vim/plugin/bones.vim)
" 
" USAGE:
" - :BonesBoilerplate      : Inserts standard HTML5 structure.
" - :BonesLayoutLeft       : Inserts a layout with a left sidebar menu.
" - :BonesLayoutTop        : Inserts a layout with a top navigation menu.
" - <Leader>t              : Opens the tag selection poplist.
" - <Leader>c              : Toggles HTML comments (Normal/Visual mode).
" - <Leader>w              : Wraps selected text in a tag (Visual mode).
" ==============================================================================

" Ensure commands and mappings only apply to HTML files
autocmd FileType html ++once call BonesInit()

" --- Initialization Function ---
function! BonesInit() abort
    " Set up mappings and commands specific to HTML filetype

    " 1. Boilerplate Commands
    command! BonesBoilerplate call BonesInsertBoilerplate()
    command! BonesLayoutLeft call BonesInsertLayoutLeft()
    command! BonesLayoutTop call BonesInsertLayoutTop()

    " 2. Visual Mode Mapping for Tag Wrapping
    vnoremap <buffer> <leader>w :<C-u>call BonesWrapTag()<CR>

    " 3. Comment Toggling
    nnoremap <buffer> <leader>c :call BonesCommentToggle(visualmode() ==# 'V' ? 1 : 0)<CR>
    vnoremap <buffer> <leader>c :<C-u>call BonesCommentToggle(1)<CR>

    " 4. Tag Poplist
    command! BonesTagList call BonesTagList()
    nnoremap <buffer> <leader>t :call BonesTagList()<CR>
endfunction


" --- Standard Boilerplate Function ---
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
    " Set the current line to the first line of boilerplate, then append the rest
    call setline(line('.'), l:boilerplate[0])
    call append(line('.'), l:boilerplate[1:])
    call cursor(line('.') + 6, 11)
endfunction

" --- Layout: Left Sidebar Menu ---
function! BonesInsertLayoutLeft() abort
    let l:layout = [
        \ '<!DOCTYPE html>',
        \ '<html lang="en">',
        \ '<head>',
        \ '    <meta charset="UTF-8">',
        \ '    <meta name="viewport" content="width=device-width, initial-scale=1.0">',
        \ '    <title>Document</title>',
        \ '</head>',
        \ '<body>',
        \ '<div style="display: flex; min-height: 100vh;">',
        \ '    <aside style="width: 250px; background: #f4f4f4; padding: 20px;">',
        \ '        <nav>',
        \ '            <ul>',
        \ '                <li><a href="#">Dashboard</a></li>',
        \ '                <li><a href="#">Settings</a></li>',
        \ '                <li><a href="#">Profile</a></li>',
        \ '            </ul>',
        \ '        </nav>',
        \ '    </aside>',
        \ '    <main style="flex: 1; padding: 20px;">',
        \ '        <h1>Main Content Area</h1>',
        \ '        <p>Your content goes here...</p>',
        \ '    </main>',
        \ '</div>',
        \ '</body>',
        \ '</html>'
        \ ]
    call setline(line('.'), l:layout[0])
    call append(line('.'), l:layout[1:])
endfunction

" --- Layout: Top Navigation Menu ---
function! BonesInsertLayoutTop() abort
    let l:layout = [
        \ '<!DOCTYPE html>',
        \ '<html lang="en">',
        \ '<head>',
        \ '    <meta charset="UTF-8">',
        \ '    <meta name="viewport" content="width=device-width, initial-scale=1.0">',
        \ '    <title>Document</title>',
        \ '</head>',
        \ '<body>',
        \ '<header style="background: #333; color: #fff; padding: 1rem;">',
        \ '    <nav style="display: flex; justify-content: space-between; align-items: center;">',
        \ '        <div class="logo">Brand</div>',
        \ '        <ul style="display: flex; list-style: none; gap: 15px; margin: 0;">',
        \ '            <li><a href="#" style="color: white; text-decoration: none;">Home</a></li>',
        \ '            <li><a href="#" style="color: white; text-decoration: none;">About</a></li>',
        \ '            <li><a href="#" style="color: white; text-decoration: none;">Contact</a></li>',
        \ '        </ul>',
        \ '    </nav>',
        \ '</header>',
        \ '<main style="padding: 2rem;">',
        \ '    <h1>Page Title</h1>',
        \ '    <p>Content goes here...</p>',
        \ '</main>',
        \ '</body>',
        \ '</html>'
        \ ]
    call setline(line('.'), l:layout[0])
    call append(line('.'), l:layout[1:])
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