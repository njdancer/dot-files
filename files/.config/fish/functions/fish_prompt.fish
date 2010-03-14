function fish_prompt -d "Write out the prompt"
	printf '%s%s@%s%s' (set_color brown) (whoami) (hostname|cut -d . -f 1) (set_color normal) 
 
	# Color writeable dirs green, read-only dirs red
	if test -w "."
		printf ' %s%s' (set_color green) (prompt_pwd)
	else
		printf ' %s%s' (set_color red) (prompt_pwd)
	end
 
	# # Print subversion revision
	# if test -d ".svn"
	# 	printf ' %s%s@%s' (set_color normal) (set_color blue) (parse_svn_revision)
	# end
 
	# Print git branch
	if git status > /dev/null 2>&1
		printf ' %s%s/%s' (set_color normal) (set_color blue) (parse_git_branch) 
	end
	printf '%s> ' (set_color normal)
end