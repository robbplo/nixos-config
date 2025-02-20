function pull -d "Gitnow: Pull changes from remote server but stashing uncommitted changes" -w 'git pull'
    if not __gitnow_is_git_repository
        __gitnow_msg_not_valid_repository "pull"
        return
    end

    set -l len (count $argv)
    set -l xorigin (__gitnow_current_remote)
    set -l xbranch (__gitnow_current_branch_name)
    set -l xcmd ""

    echo "⚡️ Pulling changes..."

    set -l xdefaults --rebase --autostash --tags

    if test $len -gt 2
        set xcmd $argv

        echo "Mode: Manual"
        echo "Default flags: $xdefaults"
        echo
    else
        echo "Mode: Auto"
        echo "Default flags: $xdefaults"

        if test $len -eq 1
            set xbranch $argv[1]
        end

        if test $len -eq 2
            set xorigin $argv[1]
            set xbranch $argv[2]
        end

        set xcmd $xorigin $xbranch
        set -l xremote_url (command git config --get "remote.$xorigin.url")

        echo "Remote URL: $xorigin ($xremote_url)"
        echo "Remote branch: $xbranch"
        echo
    end

    command git pull $xcmd $xdefaults
end
