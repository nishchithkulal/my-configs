 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#131316',
    base01 = '#1f1f23',
    base02 = '#2a2a2d',
    base03 = '#90909a',
    base04 = '#c7c5d0',
    base05 = '#e4e1e6',
    base06 = '#e4e1e6',
    base07 = '#e4e1e6',
    base08 = '#ffb4ab',
    base09 = '#edb5e0',
    base0A = '#c4c5dd',
    base0B = '#bdc3f9',
    base0C = '#edb5e0',
    base0D = '#bdc3f9',
    base0E = '#c4c5dd',
    base0F = '#e0e1f9',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#e4e1e6',          bg = '#131316' })
  hi('TelescopeBorder',         { fg = '#90909a',             bg = '#131316' })
  hi('TelescopePromptNormal',   { fg = '#e4e1e6',          bg = '#131316' })
  hi('TelescopePromptBorder',   { fg = '#90909a',             bg = '#131316' })
  hi('TelescopePromptPrefix',   { fg = '#bdc3f9',             bg = '#131316' })
  hi('TelescopePromptCounter',  { fg = '#c7c5d0',  bg = '#131316' })
  hi('TelescopePromptTitle',    { fg = '#131316',             bg = '#bdc3f9' })
  hi('TelescopePreviewTitle',   { fg = '#131316',             bg = '#c4c5dd' })
  hi('TelescopeResultsTitle',   { fg = '#131316',             bg = '#edb5e0' })
  hi('TelescopeSelection',      { fg = '#e4e1e6',          bg = '#2a2a2d' })
  hi('TelescopeSelectionCaret', { fg = '#bdc3f9',             bg = '#2a2a2d' })
  hi('TelescopeMatching',       { fg = '#bdc3f9',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#e4e1e6',          bg = '#131316' })
  hi('MiniPickBorder',         { fg = '#90909a',             bg = '#131316' })
  hi('MiniPickPrompt',   { fg = '#e4e1e6',          bg = '#131316' })
  hi('MiniPickPromptPrefix',   { fg = '#bdc3f9',             bg = '#131316' })
  hi('MiniPickBorderText',    { fg = '#131316',             bg = '#bdc3f9' })
  hi('MiniPickMatchCurrent',      { fg = '#e4e1e6',          bg = '#2a2a2d' })
  hi('MiniPickPromptCaret', { fg = '#bdc3f9',             bg = '#2a2a2d' })
  hi('MiniPickMatchRanges',       { fg = '#bdc3f9',             bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates).
-- The handler re-requires this module, which re-runs the code below, so the
-- previous handle is stopped first; otherwise handlers double on every signal.
if _G.__matugen_signal then
  _G.__matugen_signal:stop()
  _G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M
