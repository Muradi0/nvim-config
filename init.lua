local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- [[ Set diagnostic icons ]]
-- Note: You need to have a "Nerd Font" installed and configured in your terminal
-- for these icons to render correctly.
local signs = {
    Error = " ", -- "" (U+F06A) or " " (U+F659)
    Warn = " ", -- "" (U+F071)
    Info = " ", -- "" (U+F05A)
    Hint = " ", -- "" (U+F0EB) or "💡" (U+1F4A1)
}
vim.diagnostic.config()

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = signs.Error,
            [vim.diagnostic.severity.WARN] = signs.Warn,
            [vim.diagnostic.severity.INFO] = signs.Info,
            [vim.diagnostic.severity.HINT] = signs.Hint,
        },
    },
})

vim.diagnostic.config({
    -- ... other configs like signs ...

    virtual_text = {
        prefix = "●", -- Or use an icon like '▎' or '‣'
        spacing = 4, -- Add some space after the prefix
    },
})

require("vim-options")
require("lazy").setup("plugins")
