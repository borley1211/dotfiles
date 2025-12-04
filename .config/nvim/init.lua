--[[ 

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '"""""""""""'  '"""""""""""'  '"""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

What is Kickstart?

  Kickstart.nvim is *not* a distribution.

  Kickstart.nvim is a starting point for your own configuration.
    The goal is that you can read every line of code, top-to-bottom, understand
    what your configuration is doing, and modify it to suit your needs.

    Once you've done that, you can start exploring, configuring and tinkering to
    make Neovim your own! That might mean leaving Kickstart just the way it is for a while
    or immediately breaking it into modular pieces. It's up to you!

    If you don't know anything about Lua, I recommend taking some time to read through
    a guide. One possible example which will only take 10-15 minutes:
      - https://learnxinyminutes.com/docs/lua/

    After understanding a bit more about Lua, you can use `:help lua-guide` as a
    reference for how Neovim integrates Lua.
    - :help lua-guide
    - (or HTML version): https://neovim.io/doc/user/lua-guide.html

Kickstart Guide:

  TODO: The very first thing you should do is to run the command `:Tutor` in Neovim.

    If you don't know what this means, type the following:
      - <escape key>
      - :
      - Tutor
      - <enter key>

    (If you already know the Neovim basics, you can skip this step.)

  Once you've completed that, you can continue working through **AND READING** the rest
  of the kickstart init.lua.

  Next, run AND READ `:help`.
    This will open up a help window with some basic information
    about reading, navigating and searching the builtin help documentation.

    This should be the first place you go to look when you're stuck or confused
    with something. It's one of my favorite Neovim features.

    MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
    which is very useful when you're not exactly sure of what you're looking for.

  I have left several `:help X` comments throughout the init.lua
    These are hints about where to find more information about the relevant settings,
    plugins or Neovim features used in Kickstart.

   NOTE: Look for lines like this

    Throughout the file. These are for you, the reader, to help you understand what is happening.
    Feel free to delete them once you know what you're doing, but they should serve as a guide
    for when you are first encountering a few different constructs in your Neovim config.

If you experience any errors while trying to install kickstart, run `:checkhealth` for more info.

I hope you enjoy your Neovim journey,
- TJ

P.S. You can delete this when you're done too. It's your config now! :)
--]]
--[[ 

=====================================================================
=============== 続きを読む前にこちらをお読みください ================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

Kickstartとは何ですか？

  Kickstart.nvimはディストリビューションでは*ありません*。

  Kickstart.nvimは、あなた自身の設定の出発点です。
    その目標は、あなたがコードのすべての行を上から下まで読み、
    あなたの設定が何をしているのかを理解し、あなたのニーズに合わせてそれを変更できるようにすることです。

    それができたら、探検し、設定し、いじくり回して、
    Neovimをあなた自身のものにすることができます！それは、しばらくKickstartをそのままにしておくことかもしれないし、すぐにモジュール式の部分に分解することかもしれません。それはあなた次第です！

    Luaについて何も知らない場合は、時間をかけてガイドを
    読むことをお勧めします。10〜15分しかかからない可能性のある例の1つ：
      - https://learnxinyminutes.com/docs/lua/

    Luaについてもう少し理解したら、`:help lua-guide`を
    NeovimがLuaをどのように統合するかのリファレンスとして使用できます。
    - :help lua-guide
    -（またはHTMLバージョン）：https://neovim.io/doc/user/lua-guide.html

Kickstartガイド：

  TODO: あなたが最初にすべきことは、Neovimで`:Tutor`コマンドを実行することです。

    これが何を意味するかわからない場合は、次のように入力します。
      - <escapeキー>
      - :
      - Tutor
      - <enterキー>

    （すでにNeovimの基本を知っている場合は、この手順をスキップできます。）

  それが完了したら、残りのkickstart init.luaを**読みながら**
  作業を続けることができます。

  次に、`:help`を実行して読みます。
    これにより、組み込みのヘルプドキュメントの読み取り、ナビゲート、および検索
    に関するいくつかの基本的な情報を含むヘルプウィンドウが開きます。

    これは、何かに詰まったり混乱したりしたときに最初に見るべき場所です。
    これは私の好きなNeovimの機能の1つです。

    最も重要なことは、ヘルプドキュメントを[s]earch（検索）するためのキーマップ「<space>sh」を
    提供していることです。これは、探しているものが正確にわからない場合に非常に便利です。

  init.lua全体にいくつかの`:help X`コメントを残しました。
    これらは、Kickstartで使用されている関連設定、
    プラグイン、またはNeovim機能に関する詳細情報を見つける場所に関するヒントです。

  注: このような行を探してください

    ファイル全体。これらは、読者であるあなたが何が起こっているのかを理解するのを助けるためのものです。
    何をしているのかわかったら自由に削除してかまいませんが、Neovim構成で
    いくつかの異なる構造に最初に遭遇するときのガイドとして役立つはずです。

kickstartのインストール中にエラーが発生した場合は、詳細について`:checkhealth`を実行してください。

Neovimの旅をお楽しみください。
- TJ

P.S. あなたも終わったらこれを削除できます。それは今あなたの設定です！ :)
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
--
-- <space>をリーダーキーとして設定します
-- `:help mapleader` を参照してください
--  注: プラグインがロードされる前に実行する必要があります（そうしないと、間違ったリーダーが使用されます）
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
-- Nerd Fontをインストールしてターミナルで選択している場合は、trueに設定します
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`
-- [[ オプションの設定 ]]
-- `:help vim.o` を参照してください
-- 注：これらのオプションは自由に変更できます！
--  その他のオプションについては、`:help option-list` を参照してください

-- Make line numbers default
-- 行番号をデフォルトにします
vim.o.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
-- vim.o.relativenumber = true
-- ジャンプに役立つように、相対行番号を追加することもできます。
--  気に入るかどうか、自分で試してみてください！
vim.o.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
-- マウスモードを有効にします。たとえば、スプリットのサイズ変更に便利です！
vim.o.mouse = "a"

-- Don't show the mode, since it's already in the status line
-- モードはすでにステータスラインにあるため、表示しません
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- OSとNeovim間でクリップボードを同期します。
--  起動時間が増加する可能性があるため、`UiEnter`の後に設定をスケジュールします。
--  OSのクリップボードを独立させたい場合は、このオプションを削除してください。
--  `:help 'clipboard'` を参照してください
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

-- Enable break indent
-- breakindentを有効にします
vim.o.breakindent = true

-- Save undo history
-- undo履歴を保存します
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
-- \Cまたは検索語に1つ以上の大文字が含まれていない限り、大文字と小文字を区別しない検索
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
-- signcolumnをデフォルトでオンにしておきます
vim.o.signcolumn = "yes"

-- Decrease update time
-- 更新時間を短縮します
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
-- マップされたシーケンスの待ち時間を短縮します
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
-- 新しいスプリットをどのように開くかを設定します
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
-- エディタで特定の空白文字をneovimがどのように表示するかを設定します。
--  `:help 'list'` を参照してください
--  および `:help 'listchars'` を参照してください
--
--  listcharsが`vim.o`ではなく`vim.opt`を使用して設定されていることに注意してください。
--  これは`vim.o`と非常によく似ていますが、テーブルと便利に対話するためのインターフェースを提供します。
--   `:help lua-options` を参照してください
--   および `:help lua-options-guide` を参照してください
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
-- 入力中に置換をライブプレビューします！
vim.o.inccommand = "split"

-- Show which line your cursor is on
-- カーソルがある行を表示します
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
-- カーソルの上と下に保持する画面の最小行数。
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
-- バッファ内の未保存の変更のために失敗する操作（`:q`など）を実行する場合、
-- 代わりに現在のファイルを保存するかどうかを尋ねるダイアログを表示します
-- `:help 'confirm'` を参照してください
vim.o.confirm = true

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
-- [[ 基本的なキーマップ ]]
--  `:help vim.keymap.set()` を参照してください

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
-- ノーマルモードで<Esc>を押すと、検索のハイライトをクリアします
--  `:help hlsearch` を参照してください
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
-- 診断キーマップ
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- 組み込みターミナルでターミナルモードを終了するための、人々が発見しやすいショートカット。
-- そうでなければ、通常は<C-\><C-n>を押す必要がありますが、これは
-- 少し経験がないと誰も推測できません。
--
-- 注：これはすべてのターミナルエミュレータ/tmux/などで機能するわけではありません。独自の
-- マッピングを試すか、<C-\><C-n>を使用してターミナルモードを終了してください
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
-- ヒント：ノーマルモードで矢印キーを無効にする
-- vim.keymap.set('n', '<left>', '<cmd>echo "hを使って移動してください!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "lを使って移動してください!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "kを使って移動してください!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "jを使って移動してください!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- スプリットナビゲーションを簡単にするためのキーバインド。
--  CTRL+<hjkl>を使用してウィンドウ間を切り替えます
--
--  すべてのウィンドウコマンドのリストについては、`:help wincmd`を参照してください
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })
-- 注：一部のターミナルでは、キーマップが衝突したり、個別のキーコードを送信できない場合があります
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "ウィンドウを左に移動" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "ウィンドウを右に移動" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "ウィンドウを下げる" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "ウィンドウを上げる" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
-- [[ 基本的な自動コマンド ]]
--  `:help lua-guide-autocommands` を参照してください

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
-- テキストをヤンク（コピー）したときにハイライトします
--  ノーマルモードで`yap`で試してみてください
--  `:help vim.hl.on_yank()` を参照してください
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
-- [[ `lazy.nvim` プラグインマネージャーのインストール ]]
--    詳細については `:help lazy.nvim.txt` または https://github.com/folke/lazy.nvim を参照してください
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
-- [[ プラグインの設定とインストール ]]
--
--  プラグインの現在のステータスを確認するには、次を実行します
--    :Lazy
--
--  このメニューで `?` を押すとヘルプが表示されます。ウィンドウを閉じるには `:q` を使用します
--
--  プラグインを更新するには、次を実行します
--    :Lazy update
--
-- 注：ここにプラグインをインストールします。
require("lazy").setup({
	-- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
	-- 注：プラグインはリンク（またはgithubリポジトリの場合は「owner/repo」リンク）で追加できます。
	"NMAC427/guess-indent.nvim", -- Detect tabstop and shiftwidth automatically
	-- "NMAC427/guess-indent.nvim", -- タブストップとシフト幅を自動的に検出します

	-- NOTE: Plugins can also be added by using a table,
	-- with the first argument being the link and the following
	-- keys can be used to configure plugin behavior/loading/etc.
	--
	-- Use `opts = {}` to automatically pass options to a plugin's `setup()` function, forcing the plugin to be loaded.
	--

	-- Alternatively, use `config = function() ... end` for full control over the configuration.
	-- If you prefer to call `setup` explicitly, use:
	--    {
	--        'lewis6991/gitsigns.nvim',
	--        config = function()
	--            require('gitsigns').setup({
	--                -- Your gitsigns configuration here
	--            })
	--        end,
	--    }
	--
	-- Here is a more advanced example where we pass configuration
	-- options to `gitsigns.nvim`.
	--
	-- See `:help gitsigns` to understand what the configuration keys do
	-- 注：プラグインは、テーブルを使用して追加することもできます。
	-- 最初の引数はリンクで、その後の
	-- キーを使用してプラグインの動作/読み込みなどを設定できます。
	--
	-- `opts = {}` を使用すると、オプションがプラグインの `setup()` 関数に自動的に渡され、プラグインが強制的にロードされます。
	--

	-- または、`config = function() ... end` を使用して、設定を完全に制御します。
	-- `setup` を明示的に呼び出す場合は、次のようにします。
	--    {
	--        'lewis6991/gitsigns.nvim',
	--        config = function()
	--            require('gitsigns').setup({
	--                -- ここにgitsignsの設定を記述
	--            })
	--        end,
	--    }
	--
	-- これは、`gitsigns.nvim` に設定
	-- オプションを渡す、より高度な例です。
	--
	-- 設定キーの機能については、`:help gitsigns` を参照してください
	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		-- ガターにgit関連の記号を追加し、変更を管理するためのユーティリティも追加します
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},

	-- NOTE: Plugins can also be configured to run Lua code when they are loaded.
	--
	-- This is often very useful to both group configuration, as well as handle
	-- lazy loading plugins that don't need to be loaded immediately at startup.
	--
	-- For example, in the following configuration, we use:
	--  event = 'VimEnter'
	--
	-- which loads which-key before all the UI elements are loaded. Events can be
	-- normal autocommands events (`:help autocmd-events`).
	--
	-- Then, because we use the `opts` key (recommended), the configuration runs
	-- after the plugin has been loaded as `require(MODULE).setup(opts)`.
	-- 注：プラグインは、ロード時にLuaコードを実行するように設定することもできます。
	--
	-- これは、設定をグループ化するだけでなく、起動時にすぐに
	-- ロードする必要のないプラグインの遅延ロードを処理するのに非常に便利です。
	--
	-- たとえば、次の設定では、次を使用します。
	--  event = 'VimEnter'
	--
	-- これにより、すべてのUI要素がロードされる前にwhich-keyがロードされます。イベントは
	-- 通常の自動コマンドイベント（`:help autocmd-events`）にすることができます。
	--
	-- 次に、`opts`キー（推奨）を使用するため、設定はプラグインが
	-- `require(MODULE).setup(opts)`としてロードされた後に実行されます。

	{ -- Useful plugin to show you pending keybinds.
		-- 保留中のキーバインドを表示するのに便利なプラグイン。
		"folke/which-key.nvim",
		event = "VimEnter", -- Sets the loading event to 'VimEnter'
		-- event = "VimEnter", -- ロードイベントを「VimEnter」に設定します
		opts = {
			-- delay between pressing a key and opening which-key (milliseconds)
			-- this setting is independent of vim.o.timeoutlen
			-- キーを押してからwhich-keyを開くまでの遅延（ミリ秒）
			-- この設定はvim.o.timeoutlenとは無関係です
			delay = 0,
			icons = {
				-- set icon mappings to true if you have a Nerd Font
				-- Nerd Fontを使用している場合は、アイコンマッピングをtrueに設定します
				mappings = vim.g.have_nerd_font,
				-- If you are using a Nerd Font: set icons.keys to an empty table which will use the
				-- default which-key.nvim defined Nerd Font icons, otherwise define a string table
				-- Nerd Fontを使用している場合：icons.keysを空のテーブルに設定すると、
				-- デフォルトのwhich-key.nvimで定義されたNerd Fontアイコンが使用されます。それ以外の場合は、文字列テーブルを定義します
				keys = vim.g.have_nerd_font and {} or {
					Up = "<Up> ",
					Down = "<Down> ",
					Left = "<Left> ",
					Right = "<Right> ",
					C = "<C-…> ",
					M = "<M-…> ",
					D = "<D-…> ",
					S = "<S-…> ",
					CR = "<CR> ",
					Esc = "<Esc> ",
					ScrollWheelDown = "<ScrollWheelDown> ",
					ScrollWheelUp = "<ScrollWheelUp> ",
					NL = "<NL> ",
					BS = "<BS> ",
					Space = "<Space> ",
					Tab = "<Tab> ",
					F1 = "<F1>",
					F2 = "<F2>",
					F3 = "<F3>",
					F4 = "<F4>",
					F5 = "<F5>",
					F6 = "<F6>",
					F7 = "<F7>",
					F8 = "<F8>",
					F9 = "<F9>",
					F10 = "<F10>",
					F11 = "<F11>",
					F12 = "<F12>",
				},
			},

			-- Document existing key chains
			-- 既存のキーチェーンを文書化する
			spec = {
				{ "<leader>s", group = "[S]earch" },
				{ "<leader>t", group = "[T]oggle" },
				{ "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
			},
		},
	},

	-- NOTE: Plugins can specify dependencies.
	--
	-- The dependencies are proper plugin specifications as well - anything
	-- you do for a plugin at the top level, you can do for a dependency.
	--
	-- Use the `dependencies` key to specify the dependencies of a particular plugin
	-- 注：プラグインは依存関係を指定できます。
	--
	-- 依存関係も適切なプラグイン仕様です。トップレベルでプラグインに対して行うことは
	-- すべて、依存関係に対しても行うことができます。
	--
	-- 特定のプラグインの依存関係を指定するには、`dependencies`キーを使用します

	{ -- Fuzzy Finder (files, lsp, etc)
		-- Fuzzy Finder（ファイル、lspなど）
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ -- If encountering errors, see telescope-fzf-native README for installation instructions
				-- エラーが発生した場合は、telescope-fzf-nativeのREADMEでインストール手順を確認してください
				"nvim-telescope/telescope-fzf-native.nvim",

				-- `build` is used to run some command when the plugin is installed/updated.
				-- This is only run then, not every time Neovim starts up.
				-- `build`は、プラグインがインストール/更新されたときにコマンドを実行するために使用されます。
				-- これは、Neovimが起動するたびではなく、そのときにのみ実行されます。
				build = "make",

				-- `cond` is a a condition used to determine whether this plugin should be
				-- installed and loaded.
				-- `cond`は、このプラグインをインストールしてロードするかどうかを決定するために使用される条件です。
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },

			-- Useful for getting pretty icons, but requires a Nerd Font.
			-- きれいなアイコンを取得するのに便利ですが、Nerd Fontが必要です。
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			-- Telescope is a fuzzy finder that comes with a lot of different things that
			-- it can fuzzy find! It's more than just a "file finder", it can search
			-- many different aspects of Neovim, your workspace, LSP, and more!
			--
			-- The easiest way to use Telescope, is to start by doing something like:
			--  :Telescope help_tags
			--
			-- After running this command, a window will open up and you're able to
			-- type in the prompt window. You'll see a list of `help_tags` options and
			-- a corresponding preview of the help.
			--
			-- Two important keymaps to use while in Telescope are:
			--  - Insert mode: <c-/>
			--  - Normal mode: ?
			--
			-- This opens a window that shows you all of the keymaps for the current
			-- Telescope picker. This is really useful to discover what Telescope can
			-- do as well as how to actually do it!
			-- Telescopeは、あいまい検索できるものがたくさん付属しているファジーファインダーです！
			-- 単なる「ファイルファインダー」ではなく、Neovim、ワークスペース、LSPなどの
			-- さまざまな側面を検索できます。
			--
			-- Telescopeを使用する最も簡単な方法は、次のようなことを行うことから始めることです。
			--  :Telescope help_tags
			--
			-- このコマンドを実行すると、ウィンドウが開き、
			-- プロンプトウィンドウに入力できます。`help_tags`オプションのリストと
			-- ヘルプの対応するプレビューが表示されます。
			--
			-- Telescopeにいる間に使用する2つの重要なキーマップは次のとおりです。
			--  - 挿入モード：<c-/>
			--  - ノーマルモード：?
			--
			-- これにより、現在のTelescopeピッカーのすべてのキーマップを示すウィンドウが開きます。
			-- これは、Telescopeができることと、実際にそれを行う方法を発見するのに非常に役立ちます！

			-- [[ Configure Telescope ]]
			-- See `:help telescope` and `:help telescope.setup()`
			-- [[ Telescopeの設定 ]]
			-- `:help telescope`および`:help telescope.setup()`を参照してください
			require("telescope").setup({
				-- You can put your default mappings / updates / etc. in here
				--  All the info you're looking for is in `:help telescope.setup()`
				--
				-- defaults = {
				--   mappings = {
				--     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
				--   },
				-- },
				-- pickers = {}
				-- ここにデフォルトのマッピング/更新などを入れることができます
				--  探しているすべての情報は`:help telescope.setup()`にあります
				--
				-- defaults = {
				--   mappings = {
				--     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
				--   },
				-- },
				-- pickers = {}
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})

			-- Enable Telescope extensions if they are installed
			-- インストールされている場合はTelescope拡張機能を有効にします
			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			-- See `:help telescope.builtin`
			-- `:help telescope.builtin`を参照してください
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
			vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
			vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
			vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
			vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
			vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
			vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
			vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
			vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
			vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

			-- Slightly advanced example of overriding default behavior and theme
			-- デフォルトの動作とテーマをオーバーライドする少し高度な例
			vim.keymap.set("n", "<leader>/", function()
				-- You can pass additional configuration to Telescope to change the theme, layout, etc.
				-- Telescopeに追加の設定を渡して、テーマ、レイアウトなどを変更できます。
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[/] Fuzzily search in current buffer" })

			-- It's also possible to pass additional configuration options.
			--  See `:help telescope.builtin.live_grep()` for information about particular keys
			-- 追加の設定オプションを渡すことも可能です。
			--  特定のキーに関する情報については、`:help telescope.builtin.live_grep()`を参照してください
			vim.keymap.set("n", "<leader>s/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { desc = "[S]earch [/] in Open Files" })

			-- Shortcut for searching your Neovim configuration files
			-- Neovim設定ファイルを検索するためのショートカット
			vim.keymap.set("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[S]earch [N]eovim files" })
		end,
	},

	-- LSP Plugins
	-- LSPプラグイン
	{
		-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
		-- used for completion, annotations and signatures of Neovim apis
		-- `lazydev`は、Neovim設定、ランタイム、プラグイン用にLua LSPを設定します
		-- Neovim APIの補完、アノテーション、署名に使用されます
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				-- Load luvit types when the `vim.uv` word is found
				-- `vim.uv`という単語が見つかったときにluvit型をロードします
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		-- Main LSP Configuration
		-- メインLSP設定
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs and related tools to stdpath for Neovim
			-- Mason must be loaded before its dependents so we need to set it up here.
			-- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
			-- NeovimのstdpathにLSPと関連ツールを自動的にインストールします
			-- Masonはその依存関係の前にロードする必要があるため、ここで設定する必要があります。
			-- 注：`opts = {}`は`require('mason').setup({})`を呼び出すのと同じです
			{ "mason-org/mason.nvim", opts = {} },
			"mason-org/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			-- Useful status updates for LSP.
			-- LSPの便利なステータス更新。
			{ "j-hui/fidget.nvim", opts = {} },

			-- Allows extra capabilities provided by blink.cmp
			-- blink.cmpによって提供される追加機能を許可します
			"saghen/blink.cmp",
		},
		config = function()
			-- Brief aside: **What is LSP?**
			--
			-- LSP is an initialism you've probably heard, but might not understand what it is.
			--
			-- LSP stands for Language Server Protocol. It's a protocol that helps editors
			-- and language tooling communicate in a standardized fashion.
			--
			-- In general, you have a "server" which is some tool built to understand a particular
			-- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc.). These Language Servers
			-- (sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
			-- processes that communicate with some "client" - in this case, Neovim!
			--
			-- LSP provides Neovim with features like:
			--  - Go to definition
			--  - Find references
			--  - Autocompletion
			--  - Symbol Search
			--  - and more!
			--
			-- Thus, Language Servers are external tools that must be installed separately from
			-- Neovim. This is where `mason` and related plugins come into play.
			--
			-- If you're wondering about lsp vs treesitter, you can check out the wonderfully
			-- and elegantly composed help section, `:help lsp-vs-treesitter`
			-- ちょっと余談：**LSPとは？**
			--
			-- LSPは、おそらく聞いたことがある頭字語ですが、それが何であるかを理解していないかもしれません。
			--
			-- LSPはLanguage Server Protocolの略です。これは、エディタ
			-- と言語ツールが標準化された方法で通信するのに役立つプロトコルです。
			--
			-- 一般的に、特定の言語（`gopls`、`lua_ls`、`rust_analyzer`など）を理解するために構築された
			-- ツールである「サーバー」があります。これらの言語サーバー
			-- （LSPサーバーと呼ばれることもありますが、それはATMマシンのようなものです）は、
			-- いくつかの「クライアント」（この場合はNeovim！）と通信するスタンドアロンのプロセスです。
			--
			-- LSPは、次のような機能をNeovimに提供します。
			--  - 定義に移動
			--  - 参照を検索
			--  - 自動補完
			--  - シンボル検索
			--  - その他多数！
			--
			-- したがって、言語サーバーはNeovimとは別にインストールする必要がある外部ツールです。
			-- ここで`mason`と関連プラグインが登場します。
			--
			-- lspとtreesitterの違いについて疑問に思っている場合は、
			-- 見事にエレガントに構成されたヘルプセクション `:help lsp-vs-treesitter` を確認できます

			--  This function gets run when an LSP attaches to a particular buffer.
			--    That is to say, every time a new file is opened that is associated with
			--    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
			--    function will be executed to configure the current buffer
			-- この関数は、LSPが特定のバッファにアタッチされるときに実行されます。
			--    つまり、lspに関連付けられている新しいファイルが開かれるたびに
			--    （たとえば、`main.rs`を開くと`rust_analyzer`に関連付けられます）、
			--    この関数が実行されて現在のバッファが構成されます
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					-- NOTE: Remember that Lua is a real programming language, and as such it is possible
					-- to define small helper and utility functions so you don't have to repeat yourself.
					--
					-- In this case, we create a function that lets us more easily define mappings specific
					-- for LSP related items. It sets the mode, buffer and description for us each time.
					-- 注：Luaは実際のプログラミング言語であり、したがって、
					-- 同じことを繰り返さないように、小さなヘルパー関数やユーティリティ関数を定義することが可能です。
					--
					-- この場合、LSP関連の項目に固有のマッピングをより簡単に定義できる関数を作成します。
					-- モード、バッファ、および説明を毎回設定します。
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					-- Rename the variable under your cursor.
					--  Most Language Servers support renaming across files, etc.
					-- カーソルの下にある変数の名前を変更します。
					--  ほとんどの言語サーバーは、ファイル間での名前変更などをサポートしています。
					map("grn", vim.lsp.buf.rename, "[R]e[n]ame")

					-- Execute a code action, usually your cursor needs to be on top of an error
					-- or a suggestion from your LSP for this to activate.
					-- コードアクションを実行します。通常、これをアクティブにするには、カーソルがエラー
					-- またはLSPからの提案の上にある必要があります。
					map("gra", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })

					-- Find references for the word under your cursor.
					-- カーソルの下の単語の参照を検索します。
					map("grr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

					-- Jump to the implementation of the word under your cursor.
					--  Useful when your language has ways of declaring types without an actual implementation.
					-- カーソルの下の単語の実装にジャンプします。
					--  言語に実際の装飾なしで型を宣言する方法がある場合に便利です。
					map("gri", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

					-- Jump to the definition of the word under your cursor.
					--  This is where a variable was first declared, or where a function is defined, etc.
					--  To jump back, press <C-t>.
					-- カーソルの下の単語の定義にジャンプします。
					--  これは、変数が最初に宣言された場所、または関数が定義されている場所などです。
					--  元に戻るには、<C-t>を押します。
					map("grd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

					-- WARN: This is not Goto Definition, this is Goto Declaration.
					--  For example, in C this would take you to the header.
					-- 警告：これは定義へのジャンプではなく、宣言へのジャンプです。
					--  たとえば、C言語ではヘッダーに移動します。
					map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

					-- Fuzzy find all the symbols in your current document.
					--  Symbols are things like variables, functions, types, etc.
					-- 現在のドキュメント内のすべてのシンボルをあいまい検索します。
					--  シンボルとは、変数、関数、型などのことです。
					map("gO", require("telescope.builtin").lsp_document_symbols, "Open Document Symbols")

					-- Fuzzy find all the symbols in your current workspace.
					--  Similar to document symbols, except searches over your entire project.
					-- 現在のワークスペース内のすべてのシンボルをあいまい検索します。
					--  ドキュメントシンボルに似ていますが、プロジェクト全体を検索します。
					map("gW", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Open Workspace Symbols")

					-- Jump to the type of the word under your cursor.
					--  Useful when you're not sure what type a variable is and you want to see
					--  the definition of its *type*, not where it was *defined*.
					-- カーソルの下の単語の型にジャンプします。
					--  変数の型がわからず、その*型*の定義を見たい場合に便利です。
					-- *定義された*場所ではありません。
					map("grt", require("telescope.builtin").lsp_type_definitions, "[G]oto [T]ype Definition")

					-- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
					-- この関数は、neovim nightly（バージョン0.11）とstable（バージョン0.10）の違いを解決します
					---@param client vim.lsp.Client
					---@param method vim.lsp.protocol.Method
					---@param bufnr? integer some lsp support methods only in specific files
					---@return boolean
					local function client_supports_method(client, method, bufnr)
						if vim.fn.has("nvim-0.11") == 1 then
							return client:supports_method(method, bufnr)
						else
							return client.supports_method(method, { bufnr = bufnr })
						end
					end

					-- The following two autocommands are used to highlight references of the
					-- word under your cursor when your cursor rests there for a little while.
					--    See `:help CursorHold` for information about when this is executed
					--
					-- When you move your cursor, the highlights will be cleared (the second autocommand).
					-- 次の2つの自動コマンドは、カーソルがしばらくそこにとどまったときに、
					-- カーソルの下の単語の参照をハイライトするために使用されます。
					--    これがいつ実行されるかについての情報は、`:help CursorHold`を参照してください
					--
					-- カーソルを移動すると、ハイライトがクリアされます（2番目の自動コマンド）。
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if
						client
						and client_supports_method(
							client,
							vim.lsp.protocol.Methods.textDocument_documentHighlight,
							event.buf
						)
					then
						local highlight_augroup =
							vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
							end,
						})
					end

					-- The following code creates a keymap to toggle inlay hints in your
					-- code, if the language server you are using supports them
					--
					-- This may be unwanted, since they displace some of your code
					-- 次のコードは、使用している言語サーバーがサポートしている場合、
					-- コード内のインレイヒントを切り替えるためのキーマップを作成します
					--
					-- これは、コードの一部を置き換えるため、望ましくない場合があります
					if
						client
						and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf)
					then
						map("<leader>th", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
						end, "[T]oggle Inlay [H]ints")
					end
				end,
			})

			-- Diagnostic Config
			-- See :help vim.diagnostic.Opts
			-- 診断設定
			-- :help vim.diagnostic.Opts を参照
			vim.diagnostic.config({
				severity_sort = true,
				float = { border = "rounded", source = "if_many" },
				underline = { severity = vim.diagnostic.severity.ERROR },
				signs = vim.g.have_nerd_font and {
					text = {
						[vim.diagnostic.severity.ERROR] = "󰅚 ",
						[vim.diagnostic.severity.WARN] = "󰀪 ",
						[vim.diagnostic.severity.INFO] = "󰋽 ",
						[vim.diagnostic.severity.HINT] = "󰌶 ",
					},
				} or {},
				virtual_text = {
					source = "if_many",
					spacing = 2,
					format = function(diagnostic)
						local diagnostic_message = {
							[vim.diagnostic.severity.ERROR] = diagnostic.message,
							[vim.diagnostic.severity.WARN] = diagnostic.message,
							[vim.diagnostic.severity.INFO] = diagnostic.message,
							[vim.diagnostic.severity.HINT] = diagnostic.message,
						}
						return diagnostic_message[diagnostic.severity]
					end,
				},
			})

			-- LSP servers and clients are able to communicate to each other what features they support.
			--  By default, Neovim doesn't support everything that is in the LSP specification.
			--  When you add blink.cmp, luasnip, etc. Neovim now has *more* capabilities.
			--  So, we create new capabilities with blink.cmp, and then broadcast that to the servers.
			-- LSPサーバーとクライアントは、サポートする機能を互いに通信できます。
			--  デフォルトでは、NeovimはLSP仕様のすべてをサポートしているわけではありません。
			--  blink.cmp、luasnipなどを追加すると、Neovimの機能が*さらに*向上します。
			--  そこで、blink.cmpで新しい機能を作成し、それをサーバーにブロードキャストします。
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			-- Enable the following language servers
			--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
			--
			--  Add any additional override configuration in the following tables. Available keys are:
			--  - cmd (table): Override the default command used to start the server
			--  - filetypes (table): Override the default list of associated filetypes for the server
			--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
			--  - settings (table): Override the default settings passed when initializing the server.
			--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
			-- 次の言語サーバーを有効にします
			--  ここに必要なLSPを自由に追加/削除してください。自動的にインストールされます。
			--
			--  次の表に、追加の上書き設定を追加します。使用可能なキーは次のとおりです。
			--  - cmd (table): サーバーを起動するために使用されるデフォルトのコマンドを上書きします
			--  - filetypes (table): サーバーに関連付けられているファイルタイプのデフォルトのリストを上書きします
			--  - capabilities (table): capabilitiesのフィールドを上書きします。特定のLSP機能を無効にするために使用できます。
			--  - settings (table): サーバーの初期化時に渡されるデフォルトの設定を上書きします。
			--        たとえば、`lua_ls`のオプションを表示するには、https://luals.github.io/wiki/settings/にアクセスします。
			local servers = {
				-- clangd = {},
				-- gopls = {},
				-- pyright = {},
				-- rust_analyzer = {},
				-- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
				--
				-- Some languages (like typescript) have entire language plugins that can be useful:
				--    https://github.com/pmizio/typescript-tools.nvim
				--
				-- But for many setups, the LSP (`ts_ls`) will work just fine
				-- ts_ls = {},
				--
				-- ... など。事前設定されたすべてのLSPのリストについては、`:help lspconfig-all`を参照してください
				--
				-- 一部の言語（typescriptなど）には、役立つ言語プラグイン全体があります。
				--    https://github.com/pmizio/typescript-tools.nvim
				--
				-- しかし、多くのセットアップでは、LSP（`ts_ls`）で十分です

				lua_ls = {
					-- cmd = { ... },
					-- filetypes = { ... },
					-- capabilities = {},
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
							-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
							-- diagnostics = { disable = { 'missing-fields' } },
							-- 以下を切り替えて、Lua_LSのうるさい`missing-fields`警告を無視できます
						},
					},
				},
			}

			-- Ensure the servers and tools above are installed
			--
			-- To check the current status of installed tools and/or manually install
			-- other tools, you can run
			--    :Mason
			--
			-- You can press `g?` for help in this menu.
			--
			-- `mason` had to be setup earlier: to configure its options see the
			-- `dependencies` table for `nvim-lspconfig` above.
			--
			-- You can add other tools here that you want Mason to install
			-- for you, so that they are available from within Neovim.
			-- 上記のサーバーとツールがインストールされていることを確認します
			--
			-- インストールされているツールの現在のステータスを確認したり、
			-- 他のツールを手動でインストールしたりするには、次を実行します
			--    :Mason
			--
			-- このメニューで`g?`を押すとヘルプが表示されます。
			--
			-- `mason`は以前に設定する必要がありました。そのオプションを設定するには、
			-- 上記の`nvim-lspconfig`の`dependencies`テーブルを参照してください。
			--
			-- Masonにインストールしてもらいたい他のツールをここに追加して、
			-- Neovim内から利用できるようにすることができます。
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua", -- Used to format Lua code
				-- "stylua", -- Luaコードのフォーマットに使用
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
				-- ensure_installed = {}, -- 明示的に空のテーブルに設定します（Kickstartはmason-tool-installerを介してインストールをポピュレートします）
				automatic_installation = false,
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						-- This handles overriding only values explicitly passed
						-- by the server configuration above. Useful when disabling
						-- certain features of an LSP (for example, turning off formatting for ts_ls)
						-- これは、上記のサーバー構成によって明示的に渡された値のみを
						-- オーバーライドすることを処理します。LSPの特定の機能を無効にする場合に便利です
						-- （たとえば、ts_lsのフォーマットをオフにするなど）
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},

	{ -- Autoformat
		-- 自動フォーマット
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				-- Disable "format_on_save lsp_fallback" for languages that don't
				-- have a well standardized coding style. You can add additional
				-- languages here or re-enable it for the disabled ones.
				-- 標準化されたコーディングスタイルがない言語については、
				-- "format_on_save lsp_fallback"を無効にします。ここに追加の言語を
				-- 追加するか、無効になっている言語に対して再度有効にすることができます。
				local disable_filetypes = { c = true, cpp = true }
				if disable_filetypes[vim.bo[bufnr].filetype] then
					return nil
				else
					return {
						timeout_ms = 500,
						lsp_format = "fallback",
					}
				end
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform can also run multiple formatters sequentially
				-- python = { "isort", "black" },
				--
				-- You can use 'stop_after_first' to run the first available formatter from the list
				-- javascript = { "prettierd", "prettier", stop_after_first = true },
				-- Conformは複数のフォーマッタを順番に実行することもできます
				-- python = { "isort", "black" },
				--
				-- 'stop_after_first'を使用して、リストから最初に使用可能なフォーマッタを実行できます
				-- javascript = { "prettierd", "prettier", stop_after_first = true },
			},
		},
	},

	{ -- Autocompletion
		-- 自動補完
		"saghen/blink.cmp",
		event = "VimEnter",
		version = "1.*",
		dependencies = {
			-- Snippet Engine
			-- スニペットエンジン
			{
				"L3MON4D3/LuaSnip",
				version = "2.*",
				build = (function()
					-- Build Step is needed for regex support in snippets.
					-- This step is not supported in many windows environments.
					-- Remove the below condition to re-enable on windows.
					-- ビルドステップは、スニペットでの正規表現サポートに必要です。
					-- このステップは、多くのWindows環境ではサポートされていません。
					-- Windowsで再度有効にするには、以下の条件を削除してください。
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {
					-- `friendly-snippets` contains a variety of premade snippets.
					--    See the README about individual language/framework/plugin snippets:
					--    https://github.com/rafamadriz/friendly-snippets
					-- {
					--   'rafamadriz/friendly-snippets',
					--   config = function()
					--     require('luasnip.loaders.from_vscode').lazy_load()
					--   end,
					-- },
					-- `friendly-snippets`には、さまざまな既成のスニペットが含まれています。
					--    個々の言語/フレームワーク/プラグインのスニペットについては、READMEを参照してください。
					--    https://github.com/rafamadriz/friendly-snippets
				},
			},
			"folke/lazydev.nvim",
		},
		---
		-- @module 'blink.cmp'
		-- @type blink.cmp.Config
		opts = {
			keymap = {
				-- 'default' (recommended) for mappings similar to built-in completions
				--   <c-y> to accept ([y]es) the completion.
				--    This will auto-import if your LSP supports it.
				--    This will expand snippets if the LSP sent a snippet.
				-- 'super-tab' for tab to accept
				-- 'enter' for enter to accept
				-- 'none' for no mappings
				--
				-- For an understanding of why the 'default' preset is recommended,
				-- you will need to read `:help ins-completion`
				--
				-- No, but seriously. Please read `:help ins-completion`, it is really good!
				--
				-- All presets have the following mappings:
				-- <tab>/<s-tab>: move to right/left of your snippet expansion
				-- <c-space>: Open menu or open docs if already open
				-- <c-n>/<c-p> or <up>/<down>: Select next/previous item
				-- <c-e>: Hide menu
				-- <c-k>: Toggle signature help
				--
				-- See :h blink-cmp-config-keymap for defining your own keymap
				-- 'default'（推奨）は、組み込み補完に似たマッピング用です
				--   <c-y>で補完を承認（[y]es）します。
				--    LSPがサポートしている場合、これは自動インポートされます。
				--    LSPがスニペットを送信した場合、これはスニペットを展開します。
				-- 'super-tab'はタブで承認
				-- 'enter'はエンターで承認
				-- 'none'はマッピングなし
				--
				-- 'default'プリセットが推奨される理由を理解するには、
				-- `:help ins-completion`を読む必要があります
				--
				-- いや、でも真面目に。`:help ins-completion`を読んでください、本当に良いです！
				--
				-- すべてのプリセットには次のマッピングがあります。
				-- <tab>/<s-tab>：スニペット展開の右/左に移動
				-- <c-space>：メニューを開くか、すでに開いている場合はドキュメントを開く
				-- <c-n>/<c-p>または<up>/<down>：次/前の項目を選択
				-- <c-e>：メニューを非表示
				-- <c-k>：署名ヘルプを切り替え
				--
				-- 独自のキーマップを定義するには、:h blink-cmp-config-keymapを参照してください
				preset = "default",

				-- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
				--    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
				-- より高度なLuasnipキーマップ（選択ノードの選択、展開など）については、次を参照してください。
			},

			appearance = {
				-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				-- 'mono'（デフォルト）は'Nerd Font Mono'用、'normal'は'Nerd Font'用
				-- アイコンが整列するように間隔を調整します
				nerd_font_variant = "mono",
			},

			completion = {
				-- By default, you may press `<c-space>` to show the documentation.
				-- Optionally, set `auto_show = true` to show the documentation after a delay.
				-- デフォルトでは、`<c-space>`を押してドキュメントを表示できます。
				-- オプションで、`auto_show = true`に設定して、遅延後にドキュメントを表示します。
				documentation = { auto_show = false, auto_show_delay_ms = 500 },
			},

			sources = {
				default = { "lsp", "path", "snippets", "lazydev" },
				providers = {
					lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
				},
			},

			snippets = { preset = "luasnip" },

			-- Blink.cmp includes an optional, recommended rust fuzzy matcher,
			-- which automatically downloads a prebuilt binary when enabled.
			--
			-- By default, we use the Lua implementation instead, but you may enable
			-- the rust implementation via `'prefer_rust_with_warning'`
			--
			-- See :h blink-cmp-config-fuzzy for more information
			-- Blink.cmpには、オプションで推奨されるRustファジーマッチャーが含まれており、
			-- 有効にすると、ビルド済みのバイナリが自動的にダウンロードされます。
			--
			-- デフォルトでは、代わりにLua実装を使用しますが、
			-- `'prefer_rust_with_warning'`を介してRust実装を有効にすることができます
			--
			-- 詳細については、:h blink-cmp-config-fuzzyを参照してください
			fuzzy = { implementation = "lua" },

			-- Shows a signature help window while you type arguments for a function
			-- 関数への引数を入力している間、署名ヘルプウィンドウを表示します
			signature = { enabled = true },
		},
	},

	{
		-- You can easily change to a different colorscheme.
		-- Change the name of the colorscheme plugin below, and then
		-- change the command in the config to whatever the name of that colorscheme is.
		--
		-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
		-- 別のカラースキームに簡単に変更できます。
		-- 以下のカラースキームプラグインの名前を変更し、
		-- 設定のコマンドをそのカラースキームの名前に変更します。
		--
		-- すでにインストールされているカラースキームを確認したい場合は、`:Telescope colorscheme`を使用できます。
		"folke/tokyonight.nvim",
		priority = 1000, -- Make sure to load this before all the other start plugins.
		-- priority = 1000, -- 他のすべての開始プラグインの前にこれをロードするようにしてください。
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("tokyonight").setup({
				styles = {
					comments = { italic = false }, -- Disable italics in comments
					-- comments = { italic = false }, -- コメントのイタリックを無効にする
				},
			})

			-- Load the colorscheme here.
			-- Like many other themes, this one has different styles, and you could load
			-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
			-- ここでカラースキームをロードします。
			-- 他の多くのテーマと同様に、これにはさまざまなスタイルがあり、
			-- 'tokyonight-storm'、'tokyonight-moon'、'tokyonight-day'など、他のスタイルをロードできます。
			vim.cmd.colorscheme("tokyonight-night")
		end,
	},

	-- Highlight todo, notes, etc in comments
	-- コメント内のtodo、メモなどをハイライトします
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	{
		-- Collection of various small independent plugins/modules
		-- さまざまな小さな独立したプラグイン/モジュールのコレクション
		"echasnovski/mini.nvim",
		config = function()
			-- Better Around/Inside textobjects
			--
			-- Examples:
			--  - va)  - [V]isually select [A]round [)]paren
			--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
			--  - ci'  - [C]hange [I]nside [']quote
			-- より良いAround/Insideテキストオブジェクト
			--
			-- 例：
			--  - va)  - [V]isually select [A]round [)]paren（括弧の周りを選択）
			--  - yinq - [Y]ank [I]nside [N]ext [Q]uote（次の引用符の内側をヤンク）
			--  - ci'  - [C]hange [I]nside [']quote（引用符の内側を変更）
			require("mini.ai").setup({ n_lines = 500 })

			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			--
			-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- - sd'   - [S]urround [D]elete [']quotes
			-- - sr)'  - [S]urround [R]eplace [)] [']
			-- 周囲（括弧、引用符など）の追加/削除/置換
			--
			-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren（内側の単語を括弧で囲む）
			-- - sd'   - [S]urround [D]elete [']quotes（引用符を削除）
			-- - sr)'  - [S]urround [R]eplace [)] [']（括弧を引用符に置換）
			require("mini.surround").setup()

			-- Simple and easy statusline.
			--  You could remove this setup call if you don't like it,
			--  and try some other statusline plugin
			-- シンプルで簡単なステータスライン。
			--  気に入らない場合は、このセットアップコールを削除して、
			--  他のステータスラインプラグインを試すことができます
			local statusline = require("mini.statusline")
			-- set use_icons to true if you have a Nerd Font
			-- Nerd Fontを使用している場合は、use_iconsをtrueに設定します
			statusline.setup({ use_icons = vim.g.have_nerd_font })

			-- You can configure sections in the statusline by overriding their
			-- default behavior. For example, here we set the section for
			-- cursor location to LINE:COLUMN
			-- デフォルトの動作をオーバーライドすることで、ステータスラインのセクションを設定できます。
			-- たとえば、ここではカーソルの場所のセクションをLINE：COLUMNに設定します
			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return "%2l:%-2v"
			end

			-- ... and there is more!
			--  Check out: https://github.com/echasnovski/mini.nvim
			-- ... そしてもっとあります！
			--  チェックアウト：https://github.com/echasnovski/mini.nvim
		end,
	},
	{
		-- Highlight, edit, and navigate code
		-- コードのハイライト、編集、ナビゲート
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		main = "nvim-treesitter.configs", -- Sets main module to use for opts
		-- main = "nvim-treesitter.configs", -- オプションに使用するメインモジュールを設定します
		-- [[ Configure Treesitter ]] See `:help nvim-treesitter`
		-- [[ Treesitterの設定 ]] `:help nvim-treesitter`を参照
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"diff",
				"html",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"query",
				"vim",
				"vimdoc",
			},
			-- Autoinstall languages that are not installed
			-- インストールされていない言語を自動インストールします
			auto_install = true,
			highlight = {
				enable = true,
				-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
				--  If you are experiencing weird indenting issues, add the language to
				--  the list of additional_vim_regex_highlighting and disabled languages for indent.
				-- 一部の言語は、インデントルールにvimの正規表現ハイライトシステム（Rubyなど）に依存しています。
				--  奇妙なインデントの問題が発生している場合は、
				--  additional_vim_regex_highlightingのリストとインデントが無効になっている言語に言語を追加してください。
				additional_vim_regex_highlighting = { "ruby" },
			},
			indent = { enable = true, disable = { "ruby" } },
		},
		--There are additional nvim-treesitter modules that you can use to interact
		--with nvim-treesitter. You should go explore a few and see what interests you:
		--
		--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
		--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
		--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
		-- nvim-treesitterと対話するために使用できる追加のnvim-treesitterモジュールがあります。
		-- いくつか調べて、興味のあるものを見てください。
		--
		--    - インクリメンタルセレクション：含まれています。`:help nvim-treesitter-incremental-selection-mod`を参照してください
		--    - 現在のコンテキストを表示：https://github.com/nvim-treesitter/nvim-treesitter-context
		--    - Treesitter + textobjects：https://github.com/nvim-treesitter/nvim-treesitter-textobjects
	},

	-- The following comments only work if you have downloaded the kickstart repo, not just copy pasted the
	-- init.lua. If you want these files, they are in the repository, so you can just download them and
	-- place them in the correct locations.
	-- 以下のコメントは、kickstartリポジトリをダウンロードした場合にのみ機能し、
	-- init.luaをコピーして貼り付けただけでは機能しません。これらのファイルが必要な場合は、
	-- リポジトリにあるので、ダウンロードして正しい場所に配置するだけです。

	-- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
	--
	--  Here are some example plugins that I've included in the Kickstart repository.
	--  Uncomment any of the lines below to enable them (you will need to restart nvim).
	--
	-- require 'kickstart.plugins.debug',
	-- require 'kickstart.plugins.indent_line',
	-- require 'kickstart.plugins.lint',
	-- require 'kickstart.plugins.autopairs',
	-- require 'kickstart.plugins.neo-tree',
	-- require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps
	-- 注：Neovimの旅の次のステップ：Kickstartの追加プラグインを追加/設定する
	--
	--  Kickstartリポジトリに含まれているプラグインの例をいくつか示します。
	--  以下の行のいずれかのコメントを解除して有効にします（nvimを再起動する必要があります）。
	--
	-- require 'kickstart.plugins.gitsigns', -- gitsignsが推奨するキーマップを追加します

	-- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
	--    This is the easiest way to modularize your config.
	--
	--  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
	-- { import = 'custom.plugins' },
	--
	-- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
	-- Or use telescope!
	-- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
	-- you can continue same window with `<space>sr` which resumes last telescope search
	-- 注：以下のインポートにより、`lua/custom/plugins/*.lua`から独自のプラグイン、設定などを自動的に追加できます
	--    これは、設定をモジュール化する最も簡単な方法です。
	--
	--  次の行のコメントを解除し、プラグインを`lua/custom/plugins/*.lua`に追加して開始します。
	-- { import = 'custom.plugins' },
	--
	-- ロード、ソーシング、および例に関する追加情報については、`:help lazy.nvim-🔌-plugin-spec`を参照してください
	-- またはテレスコープを使用してください！
	-- ノーマルモードで`<space>sh`と入力し、`lazy.nvim-plugin`と記述します
	-- 同じウィンドウで`<space>sr`を続行でき、最後のテレスコープ検索を再開します
}, { -- UI configuration for lazy.nvim
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		-- Nerd Fontを使用している場合：アイコンを空のテーブルに設定すると、
		-- デフォルトのlazy.nvimで定義されたNerd Fontアイコンが使用されます。それ以外の場合は、ユニコードアイコンテーブルを定義します
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

-- User Settings
-- ユーザー設定
require("user-config")

-- The line beneath this is called `modeline`. See `:help modeline`
-- この下の行は`modeline`と呼ばれます。`:help modeline`を参照してください
-- vim: ts=2 sts=2 sw=2 et
