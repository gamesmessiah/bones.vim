bones.vim 🦴
============

![alt text](https://github.com/gamesmessiah/bones.vim/blob/main/images/bones0.jpg)

**"Dammit Jim, I'm a doctor, not a web designer!"**

bones.vim is a lightweight, surgical Vim plugin designed for developers who want to build the "bones" (boilerplate and structure) of HTML projects without the overhead of heavy IDEs. It provides essential structural tools while maintaining the speed and simplicity of the Vim workflow.

🚀 Key Features
---------------

### 1. Boilerplate Generation

Instantly inject a modern HTML5 skeleton. Logic in v3.0 ensures zero trailing empty lines and sets your cursor directly inside the title tag for immediate editing.

### 2. Structural Layouts (New in v1.2)

Scaffold common UI architectures instantly. Generate flexbox-based layouts like left-sidebars, top-navigation headers, or a full 3D Parallax Scrolling template with a single command.

### 3. Smart Component Injection (New in v3.0)

The new :BonesComponentList feature allows you to inject modular UI elements (Headers, Cards, Footers) into an existing file. Unlike simple snippets, this feature uses an Asset Injection Engine that automatically places the necessary CSS inside your style tags while placing the HTML at your current cursor position.

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

        :BonesBoilerplate		Inserts a full HTML5 boilerplate.
        :BonesLayoutLeft		Inserts flexbox layout with a fixed left sidebar.
        :BonesLayoutTop			Inserts flexbox layout with a top nav bar.
        :BonesParallax			Generates a 3D CSS parallax scrolling template.
        :BonesParallax			Opens a menu to inject UI components (Cards, Headers, etc.).

Mappings

	Visual Mode 	<leader>w: Wrap selection in a custom tag.
	Normal/Visual 	<leader>c: Toggle HTML comments.
	Normal Mode 	<leader>t: Quick-access to the Component List.

🩺 About the Name

-----------------

The name bones.vim reflects the core philosophy of the plugin: providing the essential structural elements of a website. It also pays homage to the legendary Dr. Leonard "Bones" McCoy. We believe in getting the job done without unnecessary "technobabble."

