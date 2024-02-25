local gitignore = require("gitignore")

function generate()
    gitignore.generate({
        args = ""
    })
end

return {
    generate = generate
}
