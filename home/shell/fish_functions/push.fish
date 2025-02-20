function push -d "Gitnow: Push commit changes to remote repository" -w 'git push'
    if not __gitnow_is_git_repository
        __gitnow_msg_not_valid_repository "push"
        return
    end

    set -l opts $argv
    set -l xorigin (__gitnow_current_remote)
    set -l xbranch (__gitnow_current_branch_name)


    if test (count $opts) -eq 0
        set opts $xorigin $xbranch
        set -l xremote_url (command git config --get "remote.$xorigin.url")

        echo "🚀 Pushing changes..."
        echo "Mode: Auto"
        echo "Remote URL: $xorigin ($xremote_url)"
        echo "Remote branch: $xbranch"
    else
        set -l v_mode "auto"

        for v in $argv
            switch $v
                case -t --tags
                    set opts $xorigin $xbranch --follow-tags
                    set -l xremote_url (command git config --get "remote.$xorigin.url")

                    echo "🚀 Pushing changes..."
                    echo "Mode: Auto (incl. tags)"
                    echo "Remote URL: $xorigin ($xremote_url)"
                    echo "Remote branch: $xbranch"
                case -h --help
                    echo "NAME"
                    echo "      Gitnow: push - Push current branch to default origin"
                    echo "OPTIONS:"
                    echo "      -t --tags               (auto mode) include annotated tags that relate to the commits"
                    echo "      -h --help               Show information about the options for this command"
                    return
                case -\*
                case '*'
                    set -l v_mode "manual"
                    echo "Mode: Manual"
            end
        end
    end

    echo

    command git push --set-upstream $opts
end
