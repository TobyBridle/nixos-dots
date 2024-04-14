{ pkgs, ... }: {
  programs.nixvim = {
    enable = true;
    enableMan = true;
    options = {
      number = true;
      relativenumber = true;
    };
    globals.mapleader = " ";
    clipboard.register = "unnamedplus";
    colorschemes.catppuccin = {
      enable = true;
      background.dark = "mocha";
    };
    extraConfigLua = ''
      vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
      vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
      vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
      vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

      vim.keymap.set("n", "<C-p>", "<Plug>(YankyPreviousEntry)")
      vim.keymap.set("n", "<C-p>", "<Plug>(YankyPreviousEntry)")
      vim.keymap.set("n", "<C-n>", "<Plug>(YankyNextEntry)")

      require('guess-indent').setup {}
    '';
    plugins = {
      lsp = {
        enable = true;
        servers = {
          rnix-lsp.enable = true;
          rust-analyzer = { enable = true; installCargo = true; installRustc = true; };
        };
      };
      lsp-format = {
        enable = true;
        lspServersToEnable = [ "rnix-lsp" "rust-analyzer" ];
      };
      treesitter = {
        enable = true;
        nixvimInjections = true;
        incrementalSelection = {
          enable = true;
          keymaps = {
            initSelection = "<C-CR>";
            nodeIncremental = "<C-CR>";
            nodeDecremental = "<C-S-CR>";
          };
        };
      };
      gitmessenger = {
        enable = true;
        includeDiff = "all";
      };
      todo-comments.enable = true;
      leap.enable = true;
      telescope = {
        enable = true;
        keymaps = {
          "<Leader>fg" = {
            action = "git_files";
            desc = "Telescope Find (Git) Files";
          };
          "<Leader>ff" = {
            action = "find_files";
            desc = "Telescope Find Files";
          };
        };
        extensions = {
          undo.enable = true;
          fzf-native.enable = true;
        };
      };
      hardtime = {
        enable = true;
        restrictionMode = "hint";
      };
      nvim-autopairs.enable = true;
      clangd-extensions = {
        enable = true;
        enableOffsetEncodingWorkaround = true;
      };
      wilder.enable = true;
      yanky = {
        enable = true;
        extraOptions.highlight.timer = 100;
      };
      nvim-cmp = {
        enable = true;
        mapping = {
          "<C-j>" = "function(callback) cmp.select_next_item() end";
          "<C-k>" = "function(callback) cmp.select_prev_item() end";
          "<CR>" = "cmp.mapping.confirm({ select = false })";
        };
        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "path"; }
          { name = "fuzzy_path"; }
          { name = "buffer"; }
          { name = "fuzzy_buffer"; }
          { name = "rg"; }
          { name = "git"; }
          { name = "latex_symbols"; }
          { name = "npm"; }
          { name = "conventionalcommits"; }
        ];
      };
    };
    extraPlugins = with pkgs.vimPlugins; [
      guess-indent-nvim
    ];
  };
  home.packages = with pkgs; [
    fd
    ripgrep
  ];
}
