" ==============================================================================
" bones.vim
" Tagline: "Dammit Jim, I'm a doctor, not a web designer!"
" Description: Build the 'bones' (boilerplate and structure) of your HTML sites.
" File: bones.vim
" Version: 2.0
" ==============================================================================
"
"         DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
"                     Version 2, December 2004
"
" Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>
"
" Everyone is permitted to copy and distribute verbatim or modified
" copies of this license document, and changing it is allowed as long
" as the name is changed.
"
"             DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
"   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
"
"  0. You just DO WHAT THE FUCK YOU WANT TO.
" ==============================================================================
" 
" INSTALLATION:
" 1. Create the plugin directory if it doesn't exist:
"      mkdir -p ~/.vim/plugin
" 2. Drop this file into ~/.vim/plugin/
" 3. Restart Vim or source the file (:source ~/.vim/plugin/bones.vim)
" 
" USAGE:
" - :BonesBoilerplate      : Inserts standard HTML5 structure.
" - :BonesLayoutLeft       : Inserts a layout with a left sidebar menu.
" - :BonesLayoutTop        : Inserts a layout with a top navigation menu.
" - :BonesParallax         : Inserts a 3D CSS parallax scrolling layout.
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
    command! BonesParallax call BonesInsertParallax()

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
        \ '<style>',
        \ '    body {',
        \ '        margin: 0;',
        \ '        padding: 0;',
        \ '    }',
        \ '',
        \ '    .container {',
        \ '        display: flex;',
        \ '        min-height: 100vh;',
        \ '    }',
        \ '',
        \ '    .sidebar {',
        \ '        width: 250px;',
        \ '        background: #333;',
        \ '        padding: 20px;',
        \ '        position: fixed;',
        \ '        height: 100vh;',
        \ '        box-sizing: border-box;',
        \ '    }',
        \ '',
        \ '    .nav-links {',
        \ '        list-style-type: none;',
        \ '        padding: 0;',
        \ '        margin: 0;',
        \ '    }',
        \ '',
        \ '    .nav-links a {',
        \ '        color: #fff;',
        \ '        text-decoration: none;',
        \ '        display: block;',
        \ '        padding: 10px 0;',
        \ '    }',
        \ '',
        \ '    .main-content {',
        \ '        flex: 1;',
        \ '        padding: 20px;',
        \ '        margin-left: 250px;',
        \ '    }',
        \ '</style>',
        \ '</head>',
        \ '<body>',
        \ '',
        \ '<div class="container">',
        \ '    <aside class="sidebar">',
        \ '        <nav>',
        \ '            <ul class="nav-links">',
        \ '                <li><a href="#">Dashboard</a></li>',
        \ '                <li><a href="#">Settings</a></li>',
        \ '                <li><a href="#">Profile</a></li>',
        \ '            </ul>',
        \ '        </nav>',
        \ '    </aside>',
        \ '',
        \ '    <main class="main-content">',
        \ '        <h1>Main Content Area</h1>',
        \ '        <p>Your content goes here...</p>',
        \ '    </main>',
        \ '</div>',
        \ '',
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
        \ '    <style>',
        \ '        header {',
        \ '            background: #333;',
        \ '            color: #fff;',
        \ '            padding: 1rem;',
        \ '            top: 0;',
        \ '            left: 0;',
        \ '            position: fixed;',
        \ '            width: 100%;',
        \ '            box-sizing: border-box;',
        \ '        }',
        \ '',
        \ '        nav {',
        \ '            display: flex;',
        \ '            justify-content: space-between;',
        \ '            align-items: center;',
        \ '        }',
        \ '',
        \ '        .nav-links {',
        \ '            display: flex;',
        \ '            list-style: none;',
        \ '            gap: 15px;',
        \ '            margin: 0;',
        \ '            padding: 0;',
        \ '        }',
        \ '',
        \ '        .nav-links a {',
        \ '            color: white;',
        \ '            text-decoration: none;',
        \ '        }',
        \ '',
        \ '        main {',
        \ '            padding: 2rem;',
        \ '            padding-top: 80px;',
        \ '        }',
        \ '    </style>',
        \ '</head>',
        \ '<body>',
        \ '',
        \ '<header>',
        \ '    <nav>',
        \ '        <div class="logo">Brand</div>',
        \ '        <ul class="nav-links">',
        \ '            <li><a href="#">Home</a></li>',
        \ '            <li><a href="#">About</a></li>',
        \ '            <li><a href="#">Contact</a></li>',
        \ '        </ul>',
        \ '    </nav>',
        \ '</header>',
        \ '',
        \ '<main>',
        \ '    <h1>Page Title</h1>',
        \ '    <p>Content goes here...</p>',
        \ '</main>',
        \ '',
        \ '</body>',
        \ '</html>'
        \ ]
    call setline(line('.'), l:layout[0])
    call append(line('.'), l:layout[1:])
endfunction

" --- Layout: Parallax Scrolling ---
function! BonesInsertParallax() abort
    let l:layout = [
        \ '<!DOCTYPE html>',
        \ '<html lang="en">',
        \ '<head>',
        \ '    <meta charset="UTF-8">',
        \ '    <meta name="viewport" content="width=device-width, initial-scale=1.0">',
        \ '    <title>Parallax Fixed</title>',
        \ '    <style>',
        \ '        /* Basic Reset */',
        \ '        * { margin: 0; padding: 0; box-sizing: border-box; }',
        \ '',
        \ '        body {',
        \ '            background-color: #1a1a1a;',
        \ '            overflow: hidden; /* Prevents double scrollbars */',
        \ '        }',
        \ '',
        \ '        .parallax-wrapper {',
        \ '            height: 100vh;',
        \ '            overflow-x: hidden;',
        \ '            overflow-y: auto;',
        \ '            /* perspective defines the viewer distance */',
        \ '            perspective: 300px; ',
        \ '            scroll-behavior: smooth;',
        \ '        }',
        \ '',
        \ '        /* Group container for layers */',
        \ '        .parallax-group {',
        \ '            position: relative;',
        \ '            height: 100vh;',
        \ '            transform-style: preserve-3d;',
        \ '            z-index: 1; /* Creates a stacking context for the 3D layers */',
        \ '        }',
        \ '',
        \ '        /* Common layer styling */',
        \ '        .layer {',
        \ '            position: absolute;',
        \ '            top: 0;',
        \ '            left: 0;',
        \ '            right: 0;',
        \ '            bottom: 0;',
        \ '            display: flex;',
        \ '            align-items: center;',
        \ '            justify-content: center;',
        \ '            color: white;',
        \ '            font-family: sans-serif;',
        \ '            /* Improves rendering performance in Chrome */',
        \ '            backface-visibility: hidden;',
        \ '        }',
        \ '',
        \ '        .background {',
        \ '            background: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.3)), ',
        \ '                        url(''https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?auto=format&fit=crop&w=1920&q=80'');',
        \ '            background-size: cover;',
        \ '            background-position: center;',
        \ '            ',
        \ '            /* Scale(2.1) instead of 2.0 fixes the white line artifact ',
        \ '               by ensuring the image bleeds slightly off-screen.',
        \ '            */',
        \ '            transform: translateZ(-300px) scale(2.1);',
        \ '            z-index: -1;',
        \ '        }',
        \ '',
        \ '        /* Foreground sits at normal depth */',
        \ '        .foreground {',
        \ '            transform: translateZ(0);',
        \ '            pointer-events: none; ',
        \ '            z-index: 1;',
        \ '        }',
        \ '',
        \ '        .foreground h1 {',
        \ '            font-size: 4rem;',
        \ '            text-shadow: 0 5px 15px rgba(0,0,0,0.5);',
        \ '            letter-spacing: 10px;',
        \ '        }',
        \ '',
        \ '        /* The Fix: High z-index and position: relative ',
        \ '           forces Chrome to paint this section ABOVE the 3D depth of the header.',
        \ '        */',
        \ '        .content {',
        \ '            min-height: 100vh;',
        \ '            background: #1a1a1a;',
        \ '            color: #ccc;',
        \ '            display: flex;',
        \ '            flex-direction: column;',
        \ '            align-items: center;',
        \ '            justify-content: center;',
        \ '            padding: 4rem 2rem;',
        \ '            font-family: sans-serif;',
        \ '            position: relative;',
        \ '            z-index: 10; ',
        \ '        }',
        \ '',
        \ '        .content h2 { margin-bottom: 1.5rem; color: #fff; font-size: 2.5rem; }',
        \ '        .content p { line-height: 1.8; max-width: 700px; text-align: center; font-size: 1.1rem; }',
        \ '',
        \ '    </style>',
        \ '</head>',
        \ '<body>',
        \ '',
        \ '    <div class="parallax-wrapper">',
        \ '        ',
        \ '        <header class="parallax-group">',
        \ '            <div class="layer background"></div>',
        \ '            <div class="layer foreground">',
        \ '                <h1>PARALLAX</h1>',
        \ '            </div>',
        \ '        </header>',
        \ '',
        \ '        <main class="content">',
        \ '            <h2>Main Content Area</h2>',
        \ '            <p>',
        \ '                Your content goes here...',
        \ '            </p>',
        \ '        </main>',
        \ '',
        \ '    </div>',
        \ '',
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
    let l:tags = ['h1', 'p', 'div', 'ul', 'li', 'a', 'img', 'input', 'button', 'script', 'style', 'header', 'footer', 'main', 'section']
    let l:tag_choices = ['Bones.vim - Select Tag:']
    let l:idx = 1
    for l:tag in l:tags
        call add(l:tag_choices, printf('%d. %s', l:idx, l:tag))
        let l:idx += 1
    endfor

    let l:choice = inputlist(l:tag_choices)

    if l:choice > 0
        let l:tag_name = l:tags[l:choice - 1] 
        
        " Special handling for attribute-heavy self-closing tags
        if l:tag_name ==# 'img'
            call append(line('.'), '<img src="" alt="">')
            call cursor(line('.') + 1, 11) " Position cursor inside src quotes
        elseif l:tag_name ==# 'a'
            call append(line('.'), ['<a href="">', '</a>'])
            call cursor(line('.') + 1, 10) " Position cursor inside href quotes
        elseif l:tag_name ==# 'input'
            call append(line('.'), '<input type="text" value="">')
            call cursor(line('.') + 1, 28)
        elseif l:tag_name =~# '^\(script\|style\)$'
            call append(line('.'), [printf('<%s>', l:tag_name), printf('</%s>', l:tag_name)])
            call cursor(line('.') + 1, 1)
        else
            " Standard block tags
            call append(line('.'), [printf('<%s>', l:tag_name), printf('</%s>', l:tag_name)])
            call cursor(line('.') + 1, 1)
        endif
    endif
endfunction