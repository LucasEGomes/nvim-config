local neotest = require("neotest")

return {
    debug_current = function() neotest.run.run({ strategy = "dap" }) end,
    summary_toggle = neotest.summary.toggle,
}
