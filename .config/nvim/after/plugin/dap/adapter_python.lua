local dap = require("dap")

local function adapter(callback, config)
    if config.request == 'attach' then
        local port = (config.connect or config).port
        local host = (config.connect or config).host or '127.0.0.1'
        callback({
            type = 'server',
            port = assert(port, '`connect.port` is required for a python `attach` configuration'),
            host = host,
            options = {
                source_filetype = 'python',
            },
        })
    else
        callback({
            type = 'executable',
            command = os.getenv("HOME") .. '/.virtualenvs/debugpy/bin/python',
            args = { '-m', 'debugpy.adapter' },
            options = {
                source_filetype = 'python',
            },
        })
    end
end

dap.adapters.python = adapter
dap.adapters.debugpy = adapter
