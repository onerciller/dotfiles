lvim.leader = "space"

lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"
lvim.keys.visual_mode["J"] = ":m '>+1<CR>gv=gv"
lvim.keys.visual_mode["K"] = ":m '<-2<CR>gv=gv"
lvim.keys.normal_mode["<leader><leader>"] = ":Telescope buffers<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.insert_mode["jk"] = "<ESC>"
lvim.keys.normal_mode["<leader>b"] = "<cmd>:Flote<CR>"

 -- search and replace
lvim.keys.normal_mode["<leader>sw"] = "<cmd>lua require('spectre').open_visual({select_word=true})<CR>"
lvim.keys.normal_mode["<leader>sf"] = "viw:lua require('spectre').open_file_search()<cr>"

lvim.keys.normal_mode["<leader>t"] = "<cmd>TroubleToggle<CR>"
lvim.keys.normal_mode["<leader>o"] = "<cmd>SymbolsOutline<CR>"
lvim.keys.normal_mode["<C-d>"] = "<cmd>ZenMode<CR>"
