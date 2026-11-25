return {
  {
    "stevearc/gkeep.nvim",
    enabled = false,
  },
  {
    "itchyny/calendar.vim",
    enabled = false,
    config = function()
      vim.g.calendar_google_calendar = 1
      vim.g.calendar_google_task = 1
      vim.cmd("source ~/.cache/calendar.vim/credentials.vim")
    end,
  },
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    ft = "markdown",
    cmd = "Obsidian",
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
      legacy_commands = false,

      workspaces = {
        -- Arch: ~/Documents/notes, Mac: ~/Documents/notes_work
        {
          name = "work",
          path = vim.fn.has("mac") == 1 and "~/Documents/notes_work/" or "~/Documents/notes/",
        },
      },

      log_level = vim.log.levels.WARN,

      daily_notes = {
        folder = "Daily Notes",
        date_format = "YYYY/MMMM/DD-MM-YYYY dddd",
      },

      templates = {
        folder = "龠-Templates",
        date_format = "YYYY-MM-DD",
        time_format = "HH:mm",
      },

      attachments = {
        folder = "assets/imgs",
        img_name_func = function()
          return string.format("%s-", os.time())
        end,
      },

      picker = {
        name = "telescope.nvim",
      },

      link = {
        style = "wiki",
      },

      note_id_func = function(title)
        local suffix = ""
        if title then
          suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.time()) .. "-" .. suffix
      end,

      frontmatter = {
        func = function(note)
          local out = {}

          -- Preserve all existing frontmatter fields (title, prefix, note_type,
          -- created, tags, theme, structure, target, etc.) — never inject
          -- `id` or `aliases: []`.
          if note.metadata ~= nil then
            for k, v in pairs(note.metadata) do
              out[k] = v
            end
          end

          -- Keep tags in sync if the note object carries them and metadata doesn't.
          if out.tags == nil and note.tags ~= nil and #note.tags > 0 then
            out.tags = note.tags
          end

          -- Fill `title` if the note has one and metadata doesn't.
          if out.title == nil and note.title ~= nil then
            out.title = note.title
          end

          -- Stamp `created` on first save.
          if out.created == nil then
            out.created = os.date("%Y-%m-%dT%H:%M")
          end

          -- Always refresh `updated` on save.
          out.updated = os.date("%Y-%m-%dT%H:%M")

          return out
        end,
      },

      -- Checkbox icons and colors are obsidian.nvim's defaults; this sets
      -- the order toggling cycles through
      checkbox = {
        order = { " ", "x", ">", "~", "!" },
      },
    },
  },
}
