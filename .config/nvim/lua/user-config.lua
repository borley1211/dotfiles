-- init.lua - Converted from init.vim

-- [Initial Config for Encoding]
vim.opt.encoding = "utf-8"
vim.scriptencoding = "utf-8"

-- [ファイル入出力における文字コード設定]
vim.opt.fileencoding = "utf-8" -- 保存時の文字コード
vim.opt.fileencodings = "utf-8,iso-2022-jp,euc-jp,sjis,cp932" -- 読込時の文字コードの自動判別(左側優先)
vim.opt.fileformats = "unix,dos,mac" -- 改行コードの自動判別(左側優先)
-- vim.opt.ambiwidth = 'double' -- 絵文字等が崩れる問題を解決

-- -- [Python]
-- -- Neovim 0.5以降では多くの場合、Pythonホストの自動検出が改善されているため、
-- -- この設定は不要な場合があります。
-- local python_path
-- if vim.fn.has("win32") == 1 then
-- 	python_path = vim.fn.trim(vim.fn.system("where python.exe"))
-- else
-- 	python_path = vim.fn.trim(vim.fn.system("which python"))
-- end
--
-- local pyenv_root = os.getenv("PYENV_ROOT")
-- if pyenv_root then
-- 	python_path = pyenv_root .. "/shims/python"
-- end
--
-- if python_path and not python_path:find("not found") then
-- 	vim.g.python_host_prog = python_path
-- 	vim.g.python3_host_prog = python_path
-- end

-- [dein.vim]
-- Install dein.vim
-- local cache_dir = vim.fn.expand("~/.cache")
-- if vim.fn.isdirectory(cache_dir) == 0 then
-- 	vim.fn.mkdir(cache_dir, "p")
-- end

-- local dein_dir = cache_dir .. "/dein/repos/github.com/Shougo/dein.vim"
-- if vim.fn.isdirectory(dein_dir) == 0 then
-- 	vim.fn.system("git clone https://github.com/Shougo/dein.vim " .. dein_dir)
-- end
-- vim.opt.runtimepath:prepend(dein_dir)

-- -- Ward off unexpected things that your distro might have made, as
-- -- well as sanely reset options when re-sourcing .vimrc
-- vim.opt.nocompatible = true

-- -- Set dein base path (required)
-- local dein_base = vim.fn.expand("~/.cache/dein/")

-- -- Call dein initialization (required)
-- if vim.fn["dein#begin"](dein_base) == 1 then
-- 	-- Let dein manage itself
-- 	vim.fn["dein#add"](dein_dir)

-- 	-- Your plugins go here:
-- 	-- Load TOML
-- 	local dotpath = os.getenv("DOTPATH") or "." -- 環境変数 DOTPATH がなければカレントディレクトリを仮定
-- 	vim.fn["dein#load_toml"](dotpath .. "/dein.toml")
-- 	vim.fn["dein#load_toml"](dotpath .. "/dein_lazy.toml", { lazy = 1 })

-- 	-- Finish dein initialization (required)
-- 	vim.fn["dein#end"]()

-- 	-- Attempt to determine the type of a file based on its name and possibly its
-- 	-- contents. Use this to allow intelligent auto-indenting for each filetype,
-- 	-- and for plugins that are filetype specific.
-- 	vim.cmd("filetype indent plugin on")

-- 	-- Enable syntax highlighting
-- 	if vim.fn.has("syntax") == 1 then
-- 		vim.cmd("syntax on")
-- 	end

-- 	-- Uncomment if you want to install not-installed plugins on startup.
-- 	if vim.fn["dein#check_install"]() == 1 then
-- 		vim.fn["dein#install"]()
-- 	end
-- end
--End dein Scripts-------------------------

-- [Transparency]
vim.opt.termguicolors = true
-- vim.opt.pumblend = 20
-- vim.opt.winblend = 10

-- [ステータス表示]
vim.opt.title = true
vim.opt.titlelen = 70
vim.o.titleold = vim.fn.getcwd()
vim.opt.showmode = true
vim.opt.showcmd = true
vim.opt.wildmenu = true
vim.opt.modeline = true

-- [括弧/タグジャンプ]
vim.opt.showmatch = true
-- vim.cmd('source $VIMRUNTIME/macros/matchit.vim') -- Vimの「%」を拡張

-- [カーソル]
vim.opt.whichwrap = "b,s,h,l,<,>,[,]"
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.number = true

-- [検索設定]
vim.opt.incsearch = true
-- vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
-- vim.keymap.set("n", "<Esc><Esc>", "<Cmd>set nohlsearch!<CR>", { silent = true, noremap = true })

-- [インデント/タブ]
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.shiftround = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
-- show break-points
vim.opt.showbreak = "↳"
-- for linewrapping
vim.opt.textwidth = 0
vim.opt.colorcolumn = "89" -- for PEP8

-- [マウス有効化]
if vim.fn.has("mouse") == 1 then
	vim.opt.mouse = "a"
end

-- [ファイル処理]
vim.opt.confirm = true
vim.opt.autoread = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.hidden = true

-- [バックスペースキー有効化]
vim.opt.backspace = "indent,eol,start"

-- [カット/コピー/ペースト]
vim.keymap.set("i", "{", "{}<Left>", { noremap = true })
vim.keymap.set("i", "{<CR>", "{}<Left><CR><Esc><S-o>", { noremap = true })
vim.keymap.set("i", "(", "()<ESC>i", { noremap = true })
vim.keymap.set("i", "(<CR>", "()<Left><CR><Esc><S-o>", { noremap = true })

vim.keymap.set({ "n", "i" }, "<F5>", "<Cmd>set paste!<CR>", { silent = true, noremap = true })

-- [IME]
vim.opt.iminsert = 0
vim.opt.imsearch = 0

-- on fcitx
-- 「日本語入力固定モード」の動作設定
vim.g.IM_CtrlMode = 6
-- 「日本語入力固定モード」切替キー
vim.keymap.set("i", "<C-j>", function()
	return vim.fn.IMState("FixMode")
end, { silent = true, expr = true })
-- <ESC>押下後のIM切替開始までの反応が遅い場合はttimeoutlenを短く設定してみてください(ミリ秒)
vim.opt.timeout = true
vim.opt.timeoutlen = 3000
vim.opt.ttimeoutlen = 50

-- コマンドラインの高さを2に
vim.opt.cmdheight = 2

-- 矢印キーでなら行内を動けるように
vim.keymap.set("n", "<Down>", "gj", { noremap = true })
vim.keymap.set("n", "<Up>", "gk", { noremap = true })

-- [カラースキーマ]
-- vim.g.molokai_original = 1
-- vim.cmd('colorscheme molokai')

-- -- [coc.nvim]
-- vim.opt.updatetime = 300
-- vim.opt.shortmess:append("c")
-- vim.opt.signcolumn = "yes"
-- vim.opt.statusline:prepend('%{coc#status()}%{get(b:,"coc_current_function","")}')
--
-- -- [for dein-ui.vim]
-- vim.opt.modifiable = true

-- [for Terminal Mode]
-- 通常モードにEscで戻る
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
-- 現在のウィンドウ下部にTerminalを開く
vim.api.nvim_create_user_command("T", "split | wincmd j | resize 20 | terminal <args>", { nargs = "*" })
-- Terminal起動時のデフォルトを入力モードに
vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*",
	command = "startinsert",
})
