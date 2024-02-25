local dap = require("dap")
local vscode = require("dap.ext.vscode")

local function load_launchjs()
    print("Loading")
    vscode.load_launchjs(nil, { debugpy = { "python" } })
end

return {
    load_launchjs          = load_launchjs,
    continue               = dap.continue,
    pause                  = dap.pause,
    restart                = dap.restart,
    terminate              = dap.terminate,
    step_over              = dap.step_over,
    step_into              = dap.step_into,
    step_out               = dap.step_out,
    breakpoint             = dap.toggle_breakpoint,
    conditional_breakpoint = function() dap.toggle_breakpoint(vim.fn.input("Condition: ")) end,
    log_breakpoint         = function() dap.toggle_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end
}
