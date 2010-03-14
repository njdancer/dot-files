function git_pushed
	test (git rev-list --remotes=origin|grep (parse_git_rev) -c) = '1'
end