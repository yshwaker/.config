local status_ok, better_comments = pcall(require, "better-comment")
if not status_ok then
	return
end

better_comments.Setup()
