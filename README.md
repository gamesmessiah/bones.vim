bones.vim 🦴
============

![alt text](https://github.com/gamesmessiah/bones.vim/blob/main/images/bones0.jpg)

**"Dammit Jim, I'm a doctor, not a web designer!"**

bones.vim is a lightweight, surgical Vim plugin designed for developers who want to build the "bones" (boilerplate and structure) of HTML projects without the overhead of heavy IDEs. It provides essential structural tools while maintaining the speed and simplicity of the Vim workflow.

🚀 Key Features
---------------

### 1. Boilerplate Generation

Instantly inject a modern HTML5 skeleton. Logic in v1.2 ensures zero trailing empty lines, and sets your cursor directly inside the `<title>` tag for immediate editing.

### 2. Structural Layouts (New in v1.2)

Scaffold common UI architectures instantly. Generate flexbox-based layouts like left-sidebars or top-navigation headers with a single command to save minutes of manual styling.

### 3. Tag Poplist

Access a numbered menu of the most common HTML tags (div, p, h1, ul, li, etc.). Simply select a number to insert the corresponding opening and closing tags at your cursor. Smart logic handles self-closing tags like <img> automatically.

### 4. Visual Tag Wrapping

A powerful utility for structural editing. Select any block of text in Visual Mode, trigger the command, and type the tag name you want to wrap the selection in (e.g., wrap a sentence in <strong> or a list in <div>).

### 5. Smart Commenting

Toggle standard HTML comments <!-- --> with ease. It supports single-line toggling in Normal Mode and block-level commenting for visual selections, with built-in escaping for internal markers.

📦 Installation
---------------

### Manual Installation

1.  Create the plugin directory if it doesn't exist:
    
        mkdir -p ~/.vim/plugin
    
2.  Download `bones.vim` and move it into that directory.
3.  Restart Vim or source the file:
    
        :source ~/.vim/plugin/bones.vim
    

### Using a Plugin Manager (Recommended)

If you use [vim-plug](https://github.com/junegunn/vim-plug), add the following to your `init.vim` or `.vimrc`:

    Plug 'gamesmessiah/bones.vim'

Then run `:PlugInstall` within Vim.

⌨️ Usage & Vitals
-----------------

![alt text](https://github.com/gamesmessiah/bones.vim/blob/main/images/bones.gif)

The plugin automatically activates for any file with an .html extension.

Inserts a full HTML5 boilerplate.
:BonesBoilerplate

(v1.2) Inserts flexbox layout with a left sidebar.
    
        :BonesLayoutLeft

(v1.2) Inserts flexbox layout with a top nav bar.

        :BonesLayoutTop

(v1.2) To create a basic Parallax template.

        :BonesParallax

Opens the numbered tag insertion menu.

        :BonesLayoutList

🩺 About the Name
-----------------

The name bones.vim reflects the core philosophy of the plugin: providing the essential structural elements of a website. It also pays homage to the legendary Dr. Leonard "Bones" McCoy. We believe in getting the job done without unnecessary "technobabble."


