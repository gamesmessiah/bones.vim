bones.vim 🦴
============

![alt text](https://github.com/gamesmessiah/bones.vim/blob/main/images/bones0.jpg)

**"Dammit Jim, I'm a doctor, not a web designer!"**

`bones.vim` is a lightweight, surgical Vim plugin designed for developers who want to build the "bones" (boilerplate and structure) of HTML projects without the overhead of heavy IDEs. It provides essential structural tools while maintaining the speed and simplicity of the Vim workflow.

🚀 Key Features
---------------

### 1\. Boilerplate Generation

Instantly inject a modern HTML5 skeleton. It includes the `<!DOCTYPE>`, responsive viewport meta tags, and sets your cursor directly inside the `<title>` tag for immediate editing.

### 2\. Tag Poplist

Access a numbered menu of the most common HTML tags (div, p, h1-h6, ul, li, etc.). Simply select a number to insert the corresponding opening and closing tags at your cursor.

### 3\. Visual Tag Wrapping

A powerful utility for structural editing. Select any block of text in Visual Mode, trigger the command, and type the tag name you want to wrap the selection in (e.g., wrap a sentence in `<strong>` or a list in `<div>`).

### 4\. Smart Commenting

Toggle standard HTML comments `<!-- -->` with ease. It supports single-line toggling in Normal Mode and block-level commenting for visual selections.

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

    Plug 'yourusername/bones.vim'

Then run `:PlugInstall` within Vim.

⌨️ Usage & Vitals
-----------------

The plugin automatically activates for any file with an `.html` extension.

Command

Mapping

Mode

Description

`:BonesBoilerplate`

N/A

Normal

Inserts a full HTML5 boilerplate.

`:BonesTagList`

`<Leader>t`

Normal

Opens the numbered tag insertion menu.

N/A

`<Leader>w`

Visual

Wraps selection in a custom tag.

N/A

`<Leader>c`

Normal

Toggles comment on current line.

N/A

`<Leader>c`

Visual

Toggles comments on selection.

_\*Note: The default <Leader> key in Vim is \\ (backslash)._

🩺 About the Name
-----------------

The name **bones.vim** reflects the core philosophy of the plugin: providing the essential structural elements of a website. It also pays homage to the legendary Dr. Leonard "Bones" McCoy. We believe in getting the job done without unnecessary "technobabble."

📜 License
----------

This project is licensed under the MIT License.
