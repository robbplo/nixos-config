function logs -d "Gitnow: Shows logs in a fancy way"
    if not __gitnow_is_git_repository
        __gitnow_msg_not_valid_repository "logs"
        return
    end

    set -l v_max_commits "80"
    set -l v_args

    for v in $argv
        switch $v
            case -h --help
                echo "NAME"
                echo "      Gitnow: logs - Show logs in a fancy way (first $v_max_commits commits by default)"
                echo "EXAMPLES"
                echo "      logs [git log options]"
                echo "EXTRA OPTIONS:"
                echo "      -h, --help      Show information about the options for this command"
                return
            case -\*
            case '*'
                set v_args $argv
                break
        end
    end

    if test -n "$v_args"
        set v_max_commits
    else
        set v_max_commits "-$v_max_commits"
    end

    LC_ALL=C command git log $v_max_commits $v_args --color --graph \
        --pretty=format:"%C(red)%h%C(reset)%C(yellow)%d%Creset %s %C(green italic)(%cr)%C(reset) %C(blue)%an%C(reset) %C(white dim)%GK %C(reset)" --abbrev-commit \
        | command less -R
end
