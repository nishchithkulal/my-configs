 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#1e100c',
    base01 = '#2b1c18',
    base02 = '#362622',
    base03 = '#aa8981',
    base04 = '#e3beb5',
    base05 = '#f9dcd5',
    base06 = '#f9dcd5',
    base07 = '#f9dcd5',
    base08 = '#ffb4ab',
    base09 = '#e6c356',
    base0A = '#ffb5a1',
    base0B = '#ffb5a1',
    base0C = '#e6c356',
    base0D = '#ffb5a1',
    base0E = '#ffb5a1',
    base0F = '#ffdbd1',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#f9dcd5',          bg = '#1e100c' })
  hi('TelescopeBorder',         { fg = '#aa8981',             bg = '#1e100c' })
  hi('TelescopePromptNormal',   { fg = '#f9dcd5',          bg = '#1e100c' })
  hi('TelescopePromptBorder',   { fg = '#aa8981',             bg = '#1e100c' })
  hi('TelescopePromptPrefix',   { fg = '#ffb5a1',             bg = '#1e100c' })
  hi('TelescopePromptCounter',  { fg = '#e3beb5',  bg = '#1e100c' })
  hi('TelescopePromptTitle',    { fg = '#1e100c',             bg = '#ffb5a1' })
  hi('TelescopePreviewTitle',   { fg = '#1e100c',             bg = '#ffb5a1' })
  hi('TelescopeResultsTitle',   { fg = '#1e100c',             bg = '#e6c356' })
  hi('TelescopeSelection',      { fg = '#f9dcd5',          bg = '#362622' })
  hi('TelescopeSelectionCaret', { fg = '#ffb5a1',             bg = '#362622' })
  hi('TelescopeMatching',       { fg = '#ffb5a1',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#f9dcd5',          bg = '#1e100c' })
  hi('MiniPickBorder',         { fg = '#aa8981',             bg = '#1e100c' })
  hi('MiniPickPrompt',   { fg = '#f9dcd5',          bg = '#1e100c' })
  hi('MiniPickPromptPrefix',   { fg = '#ffb5a1',             bg = '#1e100c' })
  hi('MiniPickBorderText',    { fg = '#1e100c',             bg = '#ffb5a1' })
  hi('MiniPickMatchCurrent',      { fg = '#f9dcd5',          bg = '#362622' })
  hi('MiniPickPromptCaret', { fg = '#ffb5a1',             bg = '#362622' })
  hi('MiniPickMatchRanges',       { fg = '#ffb5a1',             bold = true })
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
