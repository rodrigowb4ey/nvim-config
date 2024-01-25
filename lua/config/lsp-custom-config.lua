local lspconfig = require("lspconfig")
local neoconf = require("neoconf")

local custom_config = {
  volar = { filetypes = { "vue", "typescript", "javascript" } },
  -- Add configurations for other servers if needed
}

local function custom_setup(server_name)
  local server_config = {}
  if neoconf.get(server_name .. ".disable") then
    return
  end

  if custom_config[server_name] then
    server_config = custom_config[server_name]
  end

  lspconfig[server_name].setup(server_config)
end

return {
  custom_setup = custom_setup,
}
