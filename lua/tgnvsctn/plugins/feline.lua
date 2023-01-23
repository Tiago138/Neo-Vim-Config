local feline_setup, feline = pcall(require, "feline")
if not feline_setup then
	return
end

local ctp_feline_setup, ctp_feline = pcall(require, "catppuccin.groups.integrations.feline")
if not ctp_feline_setup then
	return
end

feline.setup({
	components = ctp_feline.get(),
})
