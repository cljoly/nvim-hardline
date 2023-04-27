local colors = {
  black = '#282C34',
  blue = '#61AFEF',
  cyan = '#56B6C2',
  green = '#98C379',
  grey_comment = "#5C6370",
  grey_cursor = "#2C323C",
  grey_menu = "#3E4452",
  purple = '#C678DD',
  red = '#E06C75',
  white = '#ABB2BF',
  yellow = '#E5C07B',
}

local inactive = {
  guifg = colors.grey_comment,
  guibg = colors.grey_cursor,
}

return {
  mode = {
    inactive = inactive,
    normal = {
      guifg = colors.black,
      guibg = colors.green,
    },
    insert = {
      guifg = colors.black,
      guibg = colors.blue,
    },
    replace = {
      guifg = colors.black,
      guibg = colors.cyan,
    },
    visual = {
      guifg = colors.black,
      guibg = colors.purple,
    },
    command = {
      guifg = colors.black,
      guibg = colors.red,
    },
  },
  low = {
    active = {
      guifg = colors.white,
      guibg = colors.grey_cursor,
    },
    inactive = inactive,
  },
  med = {
    active = {
      guifg = colors.yellow,
      guibg = colors.grey_cursor,
    },
    inactive = inactive,
  },
  high = {
    active = {
      guifg = colors.white,
      guibg = colors.grey_menu,
    },
    inactive = inactive,
  },
  error = {
    active = {
      guifg = colors.black,
      guibg = colors.red,
    },
    inactive = inactive,
  },
  warning = {
    active = {
      guifg = colors.black,
      guibg = colors.yellow,
    },
    inactive = inactive,
  },
  bufferline = {
    separator = inactive,
    current = {
      guifg = colors.black,
      guibg = colors.green,
    },
    current_modified = {
      guifg = colors.black,
      guibg = colors.blue,
    },
    background = {
      guifg = colors.green,
      guibg = colors.black,
    },
    background_modified = {
      guifg = colors.blue,
      guibg = colors.black,
    },
  },
}
