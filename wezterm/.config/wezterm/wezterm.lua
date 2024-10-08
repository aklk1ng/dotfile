local wezterm = require('wezterm')

return {
  font = wezterm.font_with_fallback({
    'FiraCode Nerd Font',
    'Noto Sans CJK SC',
  }),
  term = 'wezterm',
  font_size = 23,
  use_cap_height_to_scale_fallback_fonts = true,
  hide_tab_bar_if_only_one_tab = true,
  window_decorations = 'NONE',
  window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
  command_palette_font_size = 20,
  underline_position = -7,
  underline_thickness = 2.5,
  line_height = 1.0,
  window_frame = {
    font = wezterm.font({ family = 'FiraCode Nerd Font' }),
    font_size = 20.0,
    inactive_titlebar_bg = '#202325',
    active_titlebar_bg = '#202325',
  },
  colors = {
    foreground = '#8b8b8b',
    background = '#202325',
    cursor_bg = '#808080',
    cursor_fg = '#1a1b21',
    cursor_border = '#707070',
    selection_fg = '#1c1c2f',
    selection_bg = '#a0a0a0',
    scrollbar_thumb = '#808080',
    split = '#808080',

    ansi = {
      '#282a36',
      '#a35858',
      '#6c8846',
      '#93894e',
      '#537e96',
      '#756ba4',
      '#6096a1',
      '#aaaaaa',
    },
    brights = {
      '#686868',
      '#a35858',
      '#6c8846',
      '#93894e',
      '#537e96',
      '#756ba4',
      '#6096a1',
      '#aaaaaa',
    },

    tab_bar = {
      -- The color of the inactive tab bar edge/divider
      background = '#202325',
      active_tab = {
        bg_color = '#202325',
        fg_color = '#aaaaaa',
      },
      inactive_tab = {
        bg_color = '#202325',
        fg_color = '#808080',
      },
    },
  },
}
