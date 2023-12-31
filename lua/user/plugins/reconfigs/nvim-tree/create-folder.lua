local utils = require "nvim-tree.utils"
local events = require "nvim-tree.events"
local lib = require "nvim-tree.lib"
local core = require "nvim-tree.core"
local notify = require "nvim-tree.notify"

local find_file = require("nvim-tree.actions.finders.find-file").fn

local M = {}

local function get_containing_folder(node)
    if node.nodes ~= nil then
        return utils.path_add_trailing(node.absolute_path)
    end
    local node_name_size = #(node.name or "")
    return node.absolute_path:sub(0, -node_name_size - 1)
end

function M.fn(node)
    node = node and lib.get_last_group_node(node)
    if not node or node.name == ".." then
        node = {
            absolute_path = core.get_cwd(),
            nodes = core.get_explorer().nodes,
            open = true,
            name = node.name,
        }
    end

    local containing_folder = get_containing_folder(node)

    local input_opts = {
      prompt = "Create folder ",
      default = containing_folder,
      completion = "file",
    }

    vim.ui.input(input_opts, function(new_folder_path)
      utils.clear_prompt()
      if not new_folder_path or new_folder_path == containing_folder then
        return
      end

      if utils.file_exists(new_folder_path) then
        notify.warn "Cannot create: folder already exists"
        return
      end

      -- create a folder for each path element if the folder does not exist
      local path_to_create = ""
      local idx = 0

      local is_error = false
      for path in utils.path_split(new_folder_path) do
        idx = idx + 1
        local p = utils.path_remove_trailing(path)
        if #path_to_create == 0 and vim.fn.has "win32" == 1 then
          path_to_create = utils.path_join { p, path_to_create }
        else
          path_to_create = utils.path_join { path_to_create, p }
        end

        if not utils.file_exists(path_to_create) then
          local success = vim.loop.fs_mkdir(path_to_create, 493)
          if not success then
            notify.error("Could not create folder " .. path_to_create)
            is_error = true
            break
          end
          events._dispatch_folder_created(new_folder_path)
        end
      end
      if not is_error then
        notify.info("." .. string.sub(new_folder_path, #containing_folder, -1) .. " was properly created")
      end

      -- synchronously refreshes as we can't wait for the watchers
      find_file(utils.path_remove_trailing(new_folder_path))
    end)
end

return M
