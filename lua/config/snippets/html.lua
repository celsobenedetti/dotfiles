local M = {}

M.config = function(ls, s, fmt, rep, i, t, c)
	ls.add_snippets("html", {
		s("clas", fmt('class="{iNode1}"', { iNode1 = i(1) })),
	})
end

return M
