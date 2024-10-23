function portal
  set -x target_name (pwd | path basename)
  set -x source_root (path resolve ~/.config/portal)
  set -x source_dir $source_root/$target_name
  __portal_main $argv
end

function __portal_error
  echo -e $argv >&2
  exit 1
end

function __portal_msg
  echo -e $argv
end

function __portal_create_exclude_file
  echo "\
.envrc
.direnv/
.portal-source\
" > $argv[1]
end

function __portal_create_envrc_file
  echo "\
echo
echo "🔮 The portal has been opened 🔮"
echo
use flake $(cat .portal-source)\
" > $argv[1]
end

function __portal_main
  set -l cmd __portal_$argv[1]

  if functions -q $cmd
    $cmd
    return
  end
  __portal_usage
end

function __portal_open
  if [ -e .portal-source ]
    __portal_error "A portal is already open here"
  end

  if not [ -d .git ]
    __portal_error "Not in a git repository"
  end

  if not [ -d $source_dir ]
    __portal_error "No source found for this repository, create one first using `portal link`"
  end

  if [ -d .envrc ]
    __portal_error ".envrc already exists, remove it first"
  end

  echo $source_dir > .portal-source
  mv .git/info/exclude .git/info/exclude.portal-backup
  __portal_create_exclude_file .git/info/exclude
  __portal_create_envrc_file .envrc
  direnv allow
end

function __portal_close
  if not [ -e .portal-source ]
    __portal_error "There is no open portal here"
  end

  direnv revoke
  rm -f .portal-source
  rm -f .envrc
  mv -f .git/info/exclude.portal-backup .git/info/exclude
  set -ge DIRENV_FILE
  set -ge DIRENV_DIR
  __portal_msg "🔮 The portal has been closed 🔮"
end

function __portal_link
  if [ -d $source_dir ]
    __portal_error "Link with name \"$target_name\" already exists"
  end

  mkdir -p $source_dir
  pushd $source_dir
  pwd > .portal-target
  nix flake init
  popd

  __portal_msg "\n🔮 Link has been established for \"$target_name\" 🔮"
end

#function __portal_source
#  echo $source_root
#  if [ -z $argv[1] ]
#    builtin cd $source_root/$argv[1]
#  else
#    builtin cd $source_root
#  end
#end

function __portal_usage
  echo "Usage: portal [command]"
  echo ""
  echo "Commands:"
  echo "  open     Open the portal in the current repository"
  echo "  close    Close the portal in the current repository"
  echo "  link     Establish a link to the source portal"
  echo ""
  echo "If no command is provided, the script will display whether the portal is open or closed."
end

