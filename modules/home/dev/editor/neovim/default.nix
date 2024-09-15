{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.neovim-flake.homeManagerModules.default
    ./plugins
    ./mappings.nix
  ];

  programs.neovim-flake = {
    enable = true;

    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;
        tabWidth = 2;
        useSystemClipboard = true;
        preventJunkFiles = true;
        debugMode = {
          enable = false;
          level = 20;
          logFile = "/tmp/nvim.log";
        };
      };

      vim.lsp = {
        formatOnSave = false;
        lspkind.enable = false;
        lightbulb.enable = true;
        lspsaga.enable = false;
        nvimCodeActionMenu.enable = true;
        trouble.enable = true;
        lspSignature.enable = true;
        lsplines.enable = true;
        nvim-docs-view.enable = true;
      };

      vim.debugger = {
        nvim-dap = {
          enable = true;
          ui.enable = true;
        };
      };

      vim.languages = {
        enableLSP = true;
        enableFormat = true;
        enableTreesitter = true;
        # enableExtraDiagnostics = true;

        nix.enable = true;
        html.enable = true;
        css.enable = true;
        sql.enable = true;
        java.enable = true;
        ts.enable = true;
        svelte.enable = true;
        go.enable = true;
        zig.enable = true;
        python.enable = true;
        dart.enable = true;
        elixir.enable = true;
        bash.enable = true;
        terraform.enable = true;
        nim.enable = false;
        tailwind.enable = true;
        clang = {
          enable = true;
          lsp.server = "clangd";
        };

        rust = {
          enable = true;
          crates.enable = true;
        };
      };

      vim.visuals = {
        enable = true;
        nvimWebDevicons.enable = true;
        scrollBar.enable = true;
        smoothScroll.enable = true;
        cellularAutomaton.enable = false;
        fidget-nvim.enable = true;
        highlight-undo.enable = true;

        indentBlankline = {
          enable = true;
          setupOpts = {
            scope = {
              enabled = true;
            };
          };
        };

        cursorline = {
          enable = true;
          lineTimeout = 0;
        };
      };

      vim.statusline = {
        lualine = {
          enable = true;
        };
      };

      vim.autopairs.enable = true;

      vim.autocomplete = {
        enable = true;
        type = "nvim-cmp";
      };

      vim.filetree = {
        nvimTree = {
          enable = true;
        };
      };

      vim.tabline = {
        nvimBufferline.enable = true;
      };

      vim.treesitter.context.enable = true;
      vim.treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        qmljs
        qmldir
      ];

      vim.binds = {
        whichKey.enable = true;
        cheatsheet.enable = true;
      };

      vim.telescope.enable = true;

      vim.git = {
        enable = true;
        gitsigns.enable = true;
        gitsigns.codeActions.enable = false; # throws an annoying debug message
      };

      vim.minimap = {
        minimap-vim.enable = false;
        codewindow.enable = true; # lighter, faster, and uses lua for configuration
      };

      vim.dashboard = {
        dashboard-nvim.enable = false;
        alpha.enable = true;
      };

      vim.notify = {
        nvim-notify.enable = false;
      };

      vim.projects = {
        project-nvim.enable = true;
      };

      vim.utility = {
        ccc.enable = true;
        vim-wakatime.enable = true;
        icon-picker.enable = true;
        surround.enable = true;
        diffview-nvim.enable = true;
        motion = {
          hop.enable = true;
          leap.enable = true;
        };
      };

      vim.notes = {
        obsidian.enable = false; # FIXME neovim fails to build if obsidian is enabled
        orgmode.enable = false;
        mind-nvim.enable = true;
        todo-comments.enable = true;
      };

      vim.terminal = {
        toggleterm = {
          enable = true;
          lazygit.enable = true;
        };
      };

      vim.ui = {
        borders.enable = true;
        noice.enable = true;
        colorizer.enable = true;
        modes-nvim.enable = false; # the theme looks terrible with catppuccin
        illuminate.enable = true;
        breadcrumbs = {
          enable = true;
          navbuddy.enable = true;
        };
        smartcolumn = {
          enable = true;
          setupOpts.custom_colorcolumn = {
            # this is a freeform module, it's `buftype = int;` for configuring column position
            nix = "110";
            ruby = "120";
            java = "130";
            go = ["90" "130"];
          };
        };
      };

      vim.assistant = {
        copilot = {
          enable = false;
          cmp.enable = false;
        };
      };

      vim.session = {
        nvim-session-manager.enable = false;
      };

      vim.gestures = {
        gesture-nvim.enable = false;
      };

      vim.comments = {
        comment-nvim.enable = true;
      };

      vim.presence = {
        neocord.enable = true;
      };
    };
  };
}
