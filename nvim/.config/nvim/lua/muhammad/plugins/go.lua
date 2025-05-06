return {
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {},
    config = function()
      require("go").setup({
        lsp_cfg = false, -- we use separate lsp config
        lsp_on_attach = function(client, bufnr)
          -- Your on_attach function
        end,
        dap_debug = true,
      })

      -- Key mappings (in normal mode)
      local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
      end

      map("n", "<leader>gfs", "<cmd>GoFillStruct<CR>", "Fill struct")
      map("n", "<leader>gft", "<cmd>GoTestFunc<CR>", "Test function")
      map("n", "<leader>gat", "<cmd>GoAddTest<CR>", "Add test")
      map("n", "<leader>gie", "<cmd>GoIfErr<CR>", "Add if err")
      map("n", "<leader>gr", "<cmd>GoRun<CR>", "Run Go program")
      map("n", "<leader>gtf", "<cmd>GoTestFile<CR>", "Test file")
      map("n", "<leader>gtc", "<cmd>GoCoverage<CR>", "Test coverage")
      map("n", "<leader>gta", "<cmd>GoAlt<CR>", "Go to alternate file")
    end,
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()',
  },
  {
    "leoluz/nvim-dap-go",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      require("dap-go").setup()

      -- Debug keymaps
      vim.keymap.set("n", "<leader>dt", function()
        require("dap-go").debug_test()
      end, { desc = "Debug test" })
      vim.keymap.set("n", "<leader>dl", function()
        require("dap-go").debug_last()
      end, { desc = "Debug last test" })
    end,
    ft = "go",
  },
}
