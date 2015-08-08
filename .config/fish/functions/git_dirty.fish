function git_dirty
	not test (git status|grep 'nothing to commit (working directory clean)' -c) = '1'
end
