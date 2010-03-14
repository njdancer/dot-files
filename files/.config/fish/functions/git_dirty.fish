function git_dirty
	not test (git status|grep \n -c) = '2'
end
