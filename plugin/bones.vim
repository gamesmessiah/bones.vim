" ==============================================================================
" bones.vim
" Tagline: "Dammit Jim, I'm a doctor, not a web designer!"
" Description: Build the 'bones' (boilerplate and structure) of your HTML sites.
" File: bones.vim
" Version: 3.0
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

" Ensure commands and mappings only apply to HTML files
autocmd FileType html ++once call BonesInit()

" --- Initialization Function ---
function! BonesInit() abort
    command! BonesBoilerplate call BonesInsertBoilerplate()
    command! BonesLayoutLeft call BonesInsertLayoutLeft()
    command! BonesLayoutTop call BonesInsertLayoutTop()
    command! BonesParallax call BonesInsertParallax()

    vnoremap <buffer> <leader>w :<C-u>call BonesWrapTag()<CR>
    nnoremap <buffer> <leader>c :call BonesCommentToggle(visualmode() ==# 'V' ? 1 : 0)<CR>
    vnoremap <buffer> <leader>c :<C-u>call BonesCommentToggle(1)<CR>

    command! BonesComponentList call BonesComponentList()
    nnoremap <buffer> <leader>t :call BonesComponentList()<CR>
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
        \ '    <style>',
        \ '        body {',
        \ '            margin: 0;',
        \ '            font-family: system-ui, -apple-system, sans-serif;',
        \ '            line-height: 1.5;',
        \ '        }',
        \ '    </style>',
        \ '</head>',
        \ '<body>',
        \ '    <h1>Hello, World!</h1>',
        \ '</body>',
        \ '</html>'
        \ ]
    call setline(line('.'), l:boilerplate[0])
    call append(line('.'), l:boilerplate[1:])
    call cursor(line('.') + 15, 11)
endfunction

" --- Layout: Left Sidebar Menu ---
function! BonesInsertLayoutLeft() abort
    let l:layout = [
        \ '<!DOCTYPE html>',
        \ '<html lang="en">',
        \ '<head>',
        \ '    <meta charset="UTF-8">',
        \ '    <meta name="viewport" content="width=device-width, initial-scale=1.0">',
        \ '    <title>Sidebar Layout</title>',
        \ '    <style>',
        \ '        body {',
        \ '            margin: 0;',
        \ '            padding: 0;',
        \ '            font-family: system-ui, sans-serif;',
        \ '        }',
        \ '        .container {',
        \ '            display: flex;',
        \ '            min-height: 100vh;',
        \ '        }',
        \ '        .sidebar {',
        \ '            width: 250px;',
        \ '            background: #1a1a1a;',
        \ '            color: #fff;',
        \ '            padding: 2rem;',
        \ '            position: fixed;',
        \ '            height: 100vh;',
        \ '            box-sizing: border-box;',
        \ '        }',
        \ '        .nav-links {',
        \ '            list-style: none;',
        \ '            padding: 0;',
        \ '            margin: 2rem 0;',
        \ '        }',
        \ '        .nav-links li {',
        \ '            margin-bottom: 1rem;',
        \ '        }',
        \ '        .nav-links a {',
        \ '            color: #ccc;',
        \ '            text-decoration: none;',
        \ '            transition: color 0.2s;',
        \ '        }',
        \ '        .nav-links a:hover {',
        \ '            color: #fff;',
        \ '        }',
        \ '        .main-content {',
        \ '            flex: 1;',
        \ '            padding: 3rem;',
        \ '            margin-left: 250px;',
        \ '        }',
        \ '    </style>',
        \ '</head>',
        \ '<body>',
        \ '    <div class="container">',
        \ '        <aside class="sidebar">',
        \ '            <nav>',
        \ '                <h2>Menu</h2>',
        \ '                <ul class="nav-links">',
        \ '                    <li><a href="#">Dashboard</a></li>',
        \ '                    <li><a href="#">Settings</a></li>',
        \ '                    <li><a href="#">Profile</a></li>',
        \ '                </ul>',
        \ '            </nav>',
        \ '        </aside>',
        \ '        <main class="main-content">',
        \ '            <h1>Main Content Area</h1>',
        \ '            <p>Your content goes here...</p>',
        \ '        </main>',
        \ '    </div>',
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
        if l:line =~ '\V' . escape(l:start_marker, '\')
            let l:line = substitute(l:line, '\V' . escape(l:start_marker, '\') . '\s*', '', '')
            let l:line = substitute(l:line, '\s*\V' . escape(l:end_marker, '\') . '\s*$', '', '')
        else
            let l:line = l:start_marker . ' ' . l:line . ' ' . l:end_marker
        endif
        call setline(l:i, l:line)
    endfor
endfunction

" --- Asset Injection Helper ---
function! BonesInjectAssets(css_list, html_list) abort
    let l:style_start = search('<style>', 'wn')
    if l:style_start > 0
        call append(l:style_start, a:css_list)
    endif
    call append(line('.') - 1, a:html_list)
endfunction

" --- Component List Function ---
function! BonesComponentList() abort
    let l:choices = ['Bones.vim - Select Component:', '1. Header', '2. Card', '3. Footer']
    let l:choice = inputlist(l:choices)
    if l:choice == 1
        call BonesInsertHeader()
    elseif l:choice == 2
        call BonesInsertCard()
    elseif l:choice == 3
        call BonesInsertFooter()
    endif
endfunction

" --- Header Component ---
function! BonesInsertHeader() abort
    let l:css = [
        \ '        .site-header {',
        \ '            background: #333;',
        \ '            color: #fff;',
        \ '            padding: 1.5rem;',
        \ '            display: flex;',
        \ '            justify-content: space-between;',
        \ '            align-items: center;',
        \ '        }',
        \ ]
    let l:html = [
        \ '<header class="site-header">',
        \ '    <div class="logo">Header</div>',
        \ '</header>'
        \ ]
    call BonesInjectAssets(l:css, l:html)
endfunction

" --- Card Component ---
function! BonesInsertCard() abort
    let l:css = [
        \ '        .card {',
        \ '            background: #fff;',
        \ '            border: 1px solid #ddd;',
        \ '            border-radius: 8px;',
        \ '            box-shadow: 0 2px 4px rgba(0,0,0,0.05);',
        \ '            max-width: 350px;',
        \ '            overflow: hidden;',
        \ '            margin: 1rem auto;',
        \ '        }',
        \ '        .card-content {',
        \ '            padding: 1.5rem;',
        \ '        }',
        \ '        .card-title {',
        \ '            font-size: 1.25rem;',
        \ '            margin: 0 0 1rem 0;',
        \ '        }',
        \ '        .card-text {',
        \ '            color: #666;',
        \ '            font-size: 0.95rem;',
        \ '            margin-bottom: 1.5rem;',
        \ '        }',
        \ '        .card-btn {',
        \ '            display: block;',
        \ '            text-align: center;',
        \ '            background: #007bff;',
        \ '            color: #fff;',
        \ '            padding: 0.75rem;',
        \ '            text-decoration: none;',
        \ '            border-radius: 4px;',
        \ '            transition: background 0.2s;',
        \ '        }',
        \ '        .card-btn:hover {',
        \ '            background: #0056b3;',
        \ '        }'
        \ ]
    let l:html = [
        \ '<div class="card">',
        \ '    <div class="card-content">',
        \ '        <h3 class="card-title">Card Heading</h3>',
        \ '        <p class="card-text">Quickly build content blocks with this utility card component.</p>',
        \ '        <a href="#" class="card-btn">Read More</a>',
        \ '    </div>',
        \ '</div>'
        \ ]
    call BonesInjectAssets(l:css, l:html)
endfunction

" --- Footer Component ---
function! BonesInsertFooter() abort
    let l:css = [
        \ '        .site-footer {',
        \ '            background: #333;',
        \ '            color: #fff;',
        \ '            padding: 3rem 1rem;',
        \ '            text-align: center;',
        \ '            position: fixed;',
        \ '            bottom: 0;',
        \ '            left: 0;',
        \ '            width: 100%;',
        \ '        }',
        \ '        .site-footer p {',
        \ '            margin: 0;',
        \ '            font-size: 0.875rem;',
        \ '        }'
        \ ]
    let l:html = [
        \ '<footer class="site-footer">',
        \ '    <p>&copy; ' . strftime("%Y") . ' Company Name. Built with Bones.vim</p>',
        \ '</footer>'
        \ ]
    call BonesInjectAssets(l:css, l:html)
endfunction