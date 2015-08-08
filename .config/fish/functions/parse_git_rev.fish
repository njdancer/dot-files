function parse_git_rev
	git rev-list --max-count=1 HEAD|sed 's/\(.\{6\}\).*/\1/'
end