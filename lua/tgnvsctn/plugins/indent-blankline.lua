local ib_status, ib = pcall(require, "indent_blankline")
if not ib_status then
	return
end

ib.setup({
	show_current_context = true,
})
