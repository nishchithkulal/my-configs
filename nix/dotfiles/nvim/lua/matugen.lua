 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#1d1010',
    base01 = '#2a1c1c',
    base02 = '#352626',
    base03 = '#a88988',
    base04 = '#e1bebd',
    base05 = '#f7dddb',
    base06 = '#f7dddb',
    base07 = '#f7dddb',
    base08 = '#ffb4ab',
    base09 = '#ffb873',
    base0A = '#ffb3b2',
    base0B = '#ffb3b2',
    base0C = '#ffb873',
    base0D = '#ffb3b2',
    base0E = '#ffb3b2',
    base0F = '#ffdad8',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#f7dddb',          bg = '#1d1010' })
  hi('TelescopeBorder',         { fg = '#a88988',             bg = '#1d1010' })
  hi('TelescopePromptNormal',   { fg = '#f7dddb',          bg = '#1d1010' })
  hi('TelescopePromptBorder',   { fg = '#a88988',             bg = '#1d1010' })
  hi('TelescopePromptPrefix',   { fg = '#ffb3b2',             bg = '#1d1010' })
  hi('TelescopePromptCounter',  { fg = '#e1bebd',  bg = '#1d1010' })
  hi('TelescopePromptTitle',    { fg = '#1d1010',             bg = '#ffb3b2' })
  hi('TelescopePreviewTitle',   { fg = '#1d1010',             bg = '#ffb3b2' })
  hi('TelescopeResultsTitle',   { fg = '#1d1010',             bg = '#ffb873' })
  hi('TelescopeSelection',      { fg = '#f7dddb',          bg = '#352626' })
  hi('TelescopeSelectionCaret', { fg = '#ffb3b2',             bg = '#352626' })
  hi('TelescopeMatching',       { fg = '#ffb3b2',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#f7dddb',          bg = '#1d1010' })
  hi('MiniPickBorder',         { fg = '#a88988',             bg = '#1d1010' })
  hi('MiniPickPrompt',   { fg = '#f7dddb',          bg = '#1d1010' })
  hi('MiniPickPromptPrefix',   { fg = '#ffb3b2',             bg = '#1d1010' })
  hi('MiniPickBorderText',    { fg = '#1d1010',             bg = '#ffb3b2' })
  hi('MiniPickMatchCurrent',      { fg = '#f7dddb',          bg = '#352626' })
  hi('MiniPickPromptCaret', { fg = '#ffb3b2',             bg = '#352626' })
  hi('MiniPickMatchRanges',       { fg = '#ffb3b2',             bold = true })
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
