local setup, comment = pcall(require, "Comment")
if not setup then
	return
end

comment.setup()

-- gc and a motion to comment and uncomment
