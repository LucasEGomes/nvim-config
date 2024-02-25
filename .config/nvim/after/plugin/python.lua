local lspconfig = require("lspconfig")

lspconfig.pylsp.setup({
    settings = {
        isort = {
            enabled = true,
        },
        pylsp = {
            plugins = {
                jedi_completion = {
                    include_function_objects = true,
                    include_class_objects    = true,
                    include_params           = true,
                },
                pycode_style = {
                    enabled = false,
                },
                pylint = {
                    enabled = true,
                },
                yapf = {
                    enabled = true,
                },
                autopep8 = {
                    enabled = false,
                },
            },
        },
    },
})
