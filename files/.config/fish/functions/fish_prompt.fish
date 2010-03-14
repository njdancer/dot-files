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
	if is_git_repo
		if git_dirty
			set_color red
		else
			if git_pushed
				set_color green
			else
				set_color blue
			end
		end
	
		printf ' %s:%s' (parse_git_branch) (parse_git_rev)
	end
	
	printf '%s> ' (set_color normal)
end