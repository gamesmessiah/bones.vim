bones.vim 🦴

"Dammit Jim, I'm a doctor, not a web designer!"

bones.vim is a lightweight, efficient Vim plugin designed to help you build the "bones" (boilerplate and structure) of your HTML projects without the overhead of heavy IDEs.

🚀 Features

Boilerplate Generation: Quickly insert a modern HTML5 skeleton.

Tag Poplist: A simple, numbered menu to insert common HTML tags instantly.

Visual Tag Wrapping: Select any text and wrap it in the tag of your choice.

Smart Commenting: Toggle HTML comments on single lines or visual selections.

📦 Installation

Manual Installation

Create the plugin directory if it doesn't exist:

mkdir -p ~/.vim/plugin


Download bones.vim and drop it into that directory.

Restart Vim or source the file:

:source ~/.vim/plugin/bones.vim


Using a Plugin Manager (e.g., vim-plug)

Add this to your init.vim or .vimrc:

Plug 'yourusername/bones.vim'


⌨️ Usage

The plugin automatically activates when you open an .html file.

Command

Mapping

Mode

Description

:BonesBoilerplate

N/A

Normal

Inserts a full HTML5 boilerplate.

:BonesTagList

<Leader>t

Normal

Opens a numbered list of common tags to insert.

N/A

<Leader>w

Visual

Wraps the selected text in a custom tag.

N/A

<Leader>c

Normal/Visual

Toggles <!-- --> comments on the current line or selection.

Note: The default <Leader> key is \.

🩺 About the Name

The name bones.vim reflects the core philosophy of the plugin: providing the essential structural elements of a website. It also pays homage to the legendary Dr. Leonard "Bones" McCoy. Because sometimes, you just want to get the job done without the extra "technobabble."

📜 License

MIT
