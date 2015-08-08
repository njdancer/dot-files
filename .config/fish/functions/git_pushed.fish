function git_pushed
  
	test (git rev-list --remotes=origin 2> /dev/null|grep (parse_git_rev) -c) = '1'
end