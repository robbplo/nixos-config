function __gitnow_current_remote
    set -l branch_name (__gitnow_current_branch_name)
    command git config "branch.$branch_name.remote" 2>/dev/null; or echo origin
end
