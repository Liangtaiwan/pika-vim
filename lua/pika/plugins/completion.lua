local function nvim_cmp_config()
  local cmp = require("cmp")
  local lspkind = require("lspkind")

  local lspkind_format = lspkind.cmp_format({
    with_text = true,
    menu = {
      buffer = "[Buffer]",
      nvim_lsp = "[LSP]",
      path = "[Path]",
    },
  })
  vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = "#b0b0b0" })

  local format = function(entry, vim_item)
    local function trim(s, max_len)
      if string.len(s) <= max_len then
        return s
      else
        return string.sub(s, 1, max_len - 1) .. "…"
      end
    end

    vim_item.abbr = trim(vim_item.abbr, 119)
    return lspkind_format(entry, vim_item)
  end

  cmp.setup({
    snippet = {
      expand = function(args)
        require("snippy").expand_snippet(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = {
      { name = "copilot" },
      { name = "nvim_lsp" },
      { name = "buffer" },
      { name = "path" },
      { name = "snippy" },
    },
    formatting = { format = format },
  })
  cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = { { name = "buffer" } },
  })
  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
  })
  local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
  end
  cmp.setup({
    mapping = {
      ["<Tab>"] = vim.schedule_wrap(function(fallback)
        if cmp.visible() and has_words_before() then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        else
          fallback()
        end
      end),
    },
  })
end

return {
  {
    "hrsh7th/nvim-cmp",
      dependencies = {
      "onsails/lspkind-nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      {
        "dcampos/cmp-snippy",
        dependencies = { "dcampos/nvim-snippy" },
      },
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end
      }
    },
    config = nvim_cmp_config,
    event = { "InsertEnter", "CmdlineEnter" },
  },
}
