function git_pushed
	test (git rev-list --remotes|grep \n -c) = (git rev-list --all|grep \n -c)
end