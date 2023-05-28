local wezterm = require('wezterm')

return {
  -- Smart tab bar [distraction-free mode]
  hide_tab_bar_if_only_one_tab = true,
  -- Color scheme
  -- https://wezfurlong.org/wezterm/config/appearance.html

  scrollback_lines = 3500,
  window_background_opacity = 0.90,
  window_close_confirmation = 'NeverPrompt',
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  -- Font configuration
  -- https://wezfurlong.org/wezterm/config/fonts.html
  font = wezterm.font('JetBrainsMono Nerd Font'),
  font_size = 9.7,
  underline_position = -2,
  underline_thickness = '250%',
  colors = {
    -- The default text color
    foreground = '#eff0eb',
    -- The default background color
    background = '#1e222a',
    -- Overrides the cell background color when the current cell is occupied by the
    -- cursor and the cursor style is set to Block
    cursor_bg = '#e16c96',
    -- Overrides the text color when the current cell is occupied by the cursor
    cursor_fg = '#282A36',
    -- Specifies the border color of the cursor when the cursor style is set to Block,
    -- or the color of the vertical or horizontal bar when the cursor style is set to
    -- Bar or Underline.
    cursor_border = '#52ad70',
    -- the foreground color of selected text
    selection_fg = 'black',
    -- the background color of selected text
    selection_bg = '#fffacd',
    -- The color of the scrollbar "thumb"; the portion that represents the current viewport
    scrollbar_thumb = '#222222',
    -- The color of the split lines between panes
    split = '#444444',
    ansi = {
      '#282a36',
      '#FF5C57',
      '#5AF78E',
      '#F3F99D',
      '#57C7FF',
      '#FF6AC1',
      '#9AEDFE',
      '#F1F1F0',
    },
    brights = {
      '#686868',
      '#FF5C57',
      '#5AF78E',
      '#F3F99D',
      '#57C7FF',
      '#FF6AC1',
      '#9AEDFE',
      '#EFF0EB',
    },
    -- Arbitrary colors of the palette in the range from 16 to 255
    indexed = { [136] = '#af8700' },
    -- Since: 20220319-142410-0fcdea07
    -- When the IME, a dead key or a leader key are being processed and are effectively
    -- holding input pending the result of input composition, change the cursor
    -- to this color to give a visual cue about the compose state.
    compose_cursor = 'orange',
    -- Colors for copy_mode and quick_select
    -- available since: 20220807-113146-c2fee766
    -- In copy_mode, the color of the active text is:
    -- 1. copy_mode_active_highlight_* if additional text was selected using the mouse
    -- 2. selection_* otherwise
    copy_mode_active_highlight_bg = { Color = '#000000' },
    -- use `AnsiColor` to specify one of the ansi color palette values
    -- (index 0-15) using one of the names "Black", "Maroon", "Green",
    --  "Olive", "Navy", "Purple", "Teal", "Silver", "Grey", "Red", "Lime",
    -- "Yellow", "Blue", "Fuchsia", "Aqua" or "White".
    copy_mode_active_highlight_fg = { AnsiColor = 'Black' },
    copy_mode_inactive_highlight_bg = { Color = '#52ad70' },
    copy_mode_inactive_highlight_fg = { AnsiColor = 'White' },
    quick_select_label_bg = { Color = 'peru' },
    quick_select_label_fg = { Color = '#ffffff' },
    quick_select_match_bg = { AnsiColor = 'Navy' },
    quick_select_match_fg = { Color = '#ffffff' },
  },
  leader = { key = 'a', mods = 'CMD', timeout_milliseconds = 1000 },
  keys = {
    {
      key = '|',
      mods = 'LEADER|SHIFT',
      action = wezterm.action.SplitHorizontal({ domain = 'CurrentPaneDomain' }),
    },
    {
      key = '-',
      mods = 'LEADER',
      action = wezterm.action.SplitVertical({ domain = 'CurrentPaneDomain' }),
    },
  },
}
