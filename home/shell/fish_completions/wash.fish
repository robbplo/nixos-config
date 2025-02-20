# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_wash_global_optspecs
	string join \n o/output= experimental help-markdown V/version h/help
end

function __fish_wash_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_wash_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_wash_using_subcommand
	set -l cmd (__fish_wash_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c wash -n "__fish_wash_needs_command" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_needs_command" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_needs_command" -l help-markdown
complete -c wash -n "__fish_wash_needs_command" -s V -l version -d 'Print version'
complete -c wash -n "__fish_wash_needs_command" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_needs_command" -f -a "app" -d 'Manage declarative applications and deployments (wadm)'
complete -c wash -n "__fish_wash_needs_command" -f -a "build" -d 'Build (and sign) a wasmCloud component or capability provider'
complete -c wash -n "__fish_wash_needs_command" -f -a "call" -d 'Invoke a simple function on a component running in a wasmCloud host'
complete -c wash -n "__fish_wash_needs_command" -f -a "capture" -d 'Capture and debug cluster invocations and state'
complete -c wash -n "__fish_wash_needs_command" -f -a "completions" -d 'Generate shell completions for wash'
complete -c wash -n "__fish_wash_needs_command" -f -a "claims" -d 'Generate and manage JWTs for wasmCloud components and capability providers'
complete -c wash -n "__fish_wash_needs_command" -f -a "config" -d 'Create configuration for components, capability providers and links'
complete -c wash -n "__fish_wash_needs_command" -f -a "ctx" -d 'Manage wasmCloud host configuration contexts'
complete -c wash -n "__fish_wash_needs_command" -f -a "dev" -d 'Start a developer loop to hot-reload a local wasmCloud component'
complete -c wash -n "__fish_wash_needs_command" -f -a "down" -d 'Tear down a local wasmCloud environment (launched with wash up)'
complete -c wash -n "__fish_wash_needs_command" -f -a "drain" -d 'Manage contents of local wasmCloud caches'
complete -c wash -n "__fish_wash_needs_command" -f -a "get" -d 'Get information about different running wasmCloud resources'
complete -c wash -n "__fish_wash_needs_command" -f -a "inspect" -d 'Inspect a Wasm component or capability provider for signing information and interfaces'
complete -c wash -n "__fish_wash_needs_command" -f -a "keys" -d 'Generate and manage signing keys'
complete -c wash -n "__fish_wash_needs_command" -f -a "link" -d 'Link one component to another on a set of interfaces'
complete -c wash -n "__fish_wash_needs_command" -f -a "new" -d 'Create a new project from a template or git repository'
complete -c wash -n "__fish_wash_needs_command" -f -a "par" -d 'Create, inspect, and modify capability provider archive files'
complete -c wash -n "__fish_wash_needs_command" -f -a "plugin" -d 'Manage wash plugins'
complete -c wash -n "__fish_wash_needs_command" -f -a "push" -d 'Push an artifact to an OCI compliant registry'
complete -c wash -n "__fish_wash_needs_command" -f -a "pull" -d 'Pull an artifact from an OCI compliant registry'
complete -c wash -n "__fish_wash_needs_command" -f -a "secrets" -d 'Create secret references for components, capability providers and links'
complete -c wash -n "__fish_wash_needs_command" -f -a "spy" -d 'Spy on all invocations a component sends and receives'
complete -c wash -n "__fish_wash_needs_command" -f -a "scale" -d 'Scale a component running in a host to a certain level of concurrency'
complete -c wash -n "__fish_wash_needs_command" -f -a "start" -d 'Start a component or capability provider'
complete -c wash -n "__fish_wash_needs_command" -f -a "stop" -d 'Stop a component, capability provider, or host'
complete -c wash -n "__fish_wash_needs_command" -f -a "label" -d 'Label (or un-label) a host with a key=value label pair'
complete -c wash -n "__fish_wash_needs_command" -f -a "update" -d 'Update a component running in a host to newer image reference'
complete -c wash -n "__fish_wash_needs_command" -f -a "up" -d 'Bootstrap a local wasmCloud environment'
complete -c wash -n "__fish_wash_needs_command" -f -a "ui" -d 'Serve a web UI for wasmCloud'
complete -c wash -n "__fish_wash_needs_command" -f -a "wit" -d 'Create wit packages and fetch wit dependencies for a component'
complete -c wash -n "__fish_wash_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wash -n "__fish_wash_using_subcommand app; and not __fish_seen_subcommand_from list get status history delete put deploy undeploy validate help" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand app; and not __fish_seen_subcommand_from list get status history delete put deploy undeploy validate help" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand app; and not __fish_seen_subcommand_from list get status history delete put deploy undeploy validate help" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand app; and not __fish_seen_subcommand_from list get status history delete put deploy undeploy validate help" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand app; and not __fish_seen_subcommand_from list get status history delete put deploy undeploy validate help" -f -a "list" -d 'List all applications available within the lattice'
complete -c wash -n "__fish_wash_using_subcommand app; and not __fish_seen_subcommand_from list get status history delete put deploy undeploy validate help" -f -a "get" -d 'Get the application manifest for a specific version of an application'
complete -c wash -n "__fish_wash_using_subcommand app; and not __fish_seen_subcommand_from list get status history delete put deploy undeploy validate help" -f -a "status" -d 'Get the current status of a given application'
complete -c wash -n "__fish_wash_using_subcommand app; and not __fish_seen_subcommand_from list get status history delete put deploy undeploy validate help" -f -a "history" -d 'Get the version history of a given application'
complete -c wash -n "__fish_wash_using_subcommand app; and not __fish_seen_subcommand_from list get status history delete put deploy undeploy validate help" -f -a "delete" -d 'Delete an application version'
complete -c wash -n "__fish_wash_using_subcommand app; and not __fish_seen_subcommand_from list get status history delete put deploy undeploy validate help" -f -a "put" -d 'Create an application version by putting the manifest into the wadm store'
complete -c wash -n "__fish_wash_using_subcommand app; and not __fish_seen_subcommand_from list get status history delete put deploy undeploy validate help" -f -a "deploy" -d 'Deploy an application to the lattice'
complete -c wash -n "__fish_wash_using_subcommand app; and not __fish_seen_subcommand_from list get status history delete put deploy undeploy validate help" -f -a "undeploy" -d 'Undeploy an application, removing it from the lattice'
complete -c wash -n "__fish_wash_using_subcommand app; and not __fish_seen_subcommand_from list get status history delete put deploy undeploy validate help" -f -a "validate" -d 'Validate an application manifest'
complete -c wash -n "__fish_wash_using_subcommand app; and not __fish_seen_subcommand_from list get status history delete put deploy undeploy validate help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from list" -s r -l ctl-host -d 'CTL Host for connection, defaults to 127.0.0.1 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from list" -s p -l ctl-port -d 'CTL Port for connections, defaults to 4222 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from list" -l ctl-jwt -d 'JWT file for CTL authentication. Must be supplied with ctl_seed' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from list" -l ctl-seed -d 'Seed file or literal for CTL authentication. Must be supplied with ctl_jwt' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from list" -l ctl-credsfile -d 'Credsfile for CTL authentication. Combines ctl_seed and ctl_jwt. See https://docs.nats.io/using-nats/developer/connecting/creds for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from list" -l ctl-tls-ca-file -d 'TLS CA file for CTL authentication. See https://docs.nats.io/using-nats/developer/connecting/tls for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from list" -l ctl-tls-first -d 'Perform TLS handshake before expecting the server greeting' -r -f -a "{true\t'',false\t''}"
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from list" -l js-domain -d 'JS domain for wasmcloud control interface. Defaults to None' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from list" -s x -l lattice -d 'Lattice name for wasmcloud control interface, defaults to "default"' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from list" -s t -l timeout-ms -d 'Timeout length to await a control interface response, defaults to 2000 milliseconds' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from list" -l context -d 'Name of a context to use for CTL connection and authentication' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from list" -s w -l watch -d 'Enables Real-time updates, duration can be specified in ms or in humantime (eg: 5s, 2m, 15ms). Defaults to 1000 milliseconds' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from list" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from list" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from list" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from get" -s w -l watch -d 'Enables real-time updates' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from get" -s r -l ctl-host -d 'CTL Host for connection, defaults to 127.0.0.1 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from get" -s p -l ctl-port -d 'CTL Port for connections, defaults to 4222 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from get" -l ctl-jwt -d 'JWT file for CTL authentication. Must be supplied with ctl_seed' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from get" -l ctl-seed -d 'Seed file or literal for CTL authentication. Must be supplied with ctl_jwt' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from get" -l ctl-credsfile -d 'Credsfile for CTL authentication. Combines ctl_seed and ctl_jwt. See https://docs.nats.io/using-nats/developer/connecting/creds for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from get" -l ctl-tls-ca-file -d 'TLS CA file for CTL authentication. See https://docs.nats.io/using-nats/developer/connecting/tls for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from get" -l ctl-tls-first -d 'Perform TLS handshake before expecting the server greeting' -r -f -a "{true\t'',false\t''}"
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from get" -l js-domain -d 'JS domain for wasmcloud control interface. Defaults to None' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from get" -s x -l lattice -d 'Lattice name for wasmcloud control interface, defaults to "default"' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from get" -s t -l timeout-ms -d 'Timeout length to await a control interface response, defaults to 2000 milliseconds' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from get" -l context -d 'Name of a context to use for CTL connection and authentication' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from get" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from get" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from get" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from status" -s r -l ctl-host -d 'CTL Host for connection, defaults to 127.0.0.1 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from status" -s p -l ctl-port -d 'CTL Port for connections, defaults to 4222 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from status" -l ctl-jwt -d 'JWT file for CTL authentication. Must be supplied with ctl_seed' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from status" -l ctl-seed -d 'Seed file or literal for CTL authentication. Must be supplied with ctl_jwt' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from status" -l ctl-credsfile -d 'Credsfile for CTL authentication. Combines ctl_seed and ctl_jwt. See https://docs.nats.io/using-nats/developer/connecting/creds for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from status" -l ctl-tls-ca-file -d 'TLS CA file for CTL authentication. See https://docs.nats.io/using-nats/developer/connecting/tls for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from status" -l ctl-tls-first -d 'Perform TLS handshake before expecting the server greeting' -r -f -a "{true\t'',false\t''}"
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from status" -l js-domain -d 'JS domain for wasmcloud control interface. Defaults to None' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from status" -s x -l lattice -d 'Lattice name for wasmcloud control interface, defaults to "default"' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from status" -s t -l timeout-ms -d 'Timeout length to await a control interface response, defaults to 2000 milliseconds' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from status" -l context -d 'Name of a context to use for CTL connection and authentication' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from status" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from status" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from status" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from status" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from history" -s r -l ctl-host -d 'CTL Host for connection, defaults to 127.0.0.1 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from history" -s p -l ctl-port -d 'CTL Port for connections, defaults to 4222 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from history" -l ctl-jwt -d 'JWT file for CTL authentication. Must be supplied with ctl_seed' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from history" -l ctl-seed -d 'Seed file or literal for CTL authentication. Must be supplied with ctl_jwt' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from history" -l ctl-credsfile -d 'Credsfile for CTL authentication. Combines ctl_seed and ctl_jwt. See https://docs.nats.io/using-nats/developer/connecting/creds for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from history" -l ctl-tls-ca-file -d 'TLS CA file for CTL authentication. See https://docs.nats.io/using-nats/developer/connecting/tls for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from history" -l ctl-tls-first -d 'Perform TLS handshake before expecting the server greeting' -r -f -a "{true\t'',false\t''}"
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from history" -l js-domain -d 'JS domain for wasmcloud control interface. Defaults to None' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from history" -s x -l lattice -d 'Lattice name for wasmcloud control interface, defaults to "default"' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from history" -s t -l timeout-ms -d 'Timeout length to await a control interface response, defaults to 2000 milliseconds' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from history" -l context -d 'Name of a context to use for CTL connection and authentication' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from history" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from history" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from history" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from history" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from delete" -s r -l ctl-host -d 'CTL Host for connection, defaults to 127.0.0.1 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from delete" -s p -l ctl-port -d 'CTL Port for connections, defaults to 4222 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from delete" -l ctl-jwt -d 'JWT file for CTL authentication. Must be supplied with ctl_seed' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from delete" -l ctl-seed -d 'Seed file or literal for CTL authentication. Must be supplied with ctl_jwt' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from delete" -l ctl-credsfile -d 'Credsfile for CTL authentication. Combines ctl_seed and ctl_jwt. See https://docs.nats.io/using-nats/developer/connecting/creds for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from delete" -l ctl-tls-ca-file -d 'TLS CA file for CTL authentication. See https://docs.nats.io/using-nats/developer/connecting/tls for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from delete" -l ctl-tls-first -d 'Perform TLS handshake before expecting the server greeting' -r -f -a "{true\t'',false\t''}"
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from delete" -l js-domain -d 'JS domain for wasmcloud control interface. Defaults to None' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from delete" -s x -l lattice -d 'Lattice name for wasmcloud control interface, defaults to "default"' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from delete" -s t -l timeout-ms -d 'Timeout length to await a control interface response, defaults to 2000 milliseconds' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from delete" -l context -d 'Name of a context to use for CTL connection and authentication' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from delete" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from delete" -l all-undeployed -d 'Whether to delete all undeployed apps'
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from delete" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from delete" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from put" -s r -l ctl-host -d 'CTL Host for connection, defaults to 127.0.0.1 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from put" -s p -l ctl-port -d 'CTL Port for connections, defaults to 4222 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from put" -l ctl-jwt -d 'JWT file for CTL authentication. Must be supplied with ctl_seed' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from put" -l ctl-seed -d 'Seed file or literal for CTL authentication. Must be supplied with ctl_jwt' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from put" -l ctl-credsfile -d 'Credsfile for CTL authentication. Combines ctl_seed and ctl_jwt. See https://docs.nats.io/using-nats/developer/connecting/creds for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from put" -l ctl-tls-ca-file -d 'TLS CA file for CTL authentication. See https://docs.nats.io/using-nats/developer/connecting/tls for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from put" -l ctl-tls-first -d 'Perform TLS handshake before expecting the server greeting' -r -f -a "{true\t'',false\t''}"
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from put" -l js-domain -d 'JS domain for wasmcloud control interface. Defaults to None' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from put" -s x -l lattice -d 'Lattice name for wasmcloud control interface, defaults to "default"' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from put" -s t -l timeout-ms -d 'Timeout length to await a control interface response, defaults to 2000 milliseconds' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from put" -l context -d 'Name of a context to use for CTL connection and authentication' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from put" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from put" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from put" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from put" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from deploy" -s r -l ctl-host -d 'CTL Host for connection, defaults to 127.0.0.1 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from deploy" -s p -l ctl-port -d 'CTL Port for connections, defaults to 4222 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from deploy" -l ctl-jwt -d 'JWT file for CTL authentication. Must be supplied with ctl_seed' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from deploy" -l ctl-seed -d 'Seed file or literal for CTL authentication. Must be supplied with ctl_jwt' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from deploy" -l ctl-credsfile -d 'Credsfile for CTL authentication. Combines ctl_seed and ctl_jwt. See https://docs.nats.io/using-nats/developer/connecting/creds for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from deploy" -l ctl-tls-ca-file -d 'TLS CA file for CTL authentication. See https://docs.nats.io/using-nats/developer/connecting/tls for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from deploy" -l ctl-tls-first -d 'Perform TLS handshake before expecting the server greeting' -r -f -a "{true\t'',false\t''}"
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from deploy" -l js-domain -d 'JS domain for wasmcloud control interface. Defaults to None' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from deploy" -s x -l lattice -d 'Lattice name for wasmcloud control interface, defaults to "default"' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from deploy" -s t -l timeout-ms -d 'Timeout length to await a control interface response, defaults to 2000 milliseconds' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from deploy" -l context -d 'Name of a context to use for CTL connection and authentication' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from deploy" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from deploy" -l replace -d 'Whether or not wash should attempt to replace the resources by performing an optimistic delete shortly before applying resources'
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from deploy" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from deploy" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from deploy" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from undeploy" -s r -l ctl-host -d 'CTL Host for connection, defaults to 127.0.0.1 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from undeploy" -s p -l ctl-port -d 'CTL Port for connections, defaults to 4222 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from undeploy" -l ctl-jwt -d 'JWT file for CTL authentication. Must be supplied with ctl_seed' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from undeploy" -l ctl-seed -d 'Seed file or literal for CTL authentication. Must be supplied with ctl_jwt' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from undeploy" -l ctl-credsfile -d 'Credsfile for CTL authentication. Combines ctl_seed and ctl_jwt. See https://docs.nats.io/using-nats/developer/connecting/creds for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from undeploy" -l ctl-tls-ca-file -d 'TLS CA file for CTL authentication. See https://docs.nats.io/using-nats/developer/connecting/tls for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from undeploy" -l ctl-tls-first -d 'Perform TLS handshake before expecting the server greeting' -r -f -a "{true\t'',false\t''}"
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from undeploy" -l js-domain -d 'JS domain for wasmcloud control interface. Defaults to None' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from undeploy" -s x -l lattice -d 'Lattice name for wasmcloud control interface, defaults to "default"' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from undeploy" -s t -l timeout-ms -d 'Timeout length to await a control interface response, defaults to 2000 milliseconds' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from undeploy" -l context -d 'Name of a context to use for CTL connection and authentication' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from undeploy" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from undeploy" -l all -d 'Whether to undeploy all the available apps'
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from undeploy" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from undeploy" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from undeploy" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from validate" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from validate" -l check-image-refs -d 'Whether to check image references in the manifest'
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from validate" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from validate" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from validate" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from help" -f -a "list" -d 'List all applications available within the lattice'
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from help" -f -a "get" -d 'Get the application manifest for a specific version of an application'
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from help" -f -a "status" -d 'Get the current status of a given application'
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from help" -f -a "history" -d 'Get the version history of a given application'
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete an application version'
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from help" -f -a "put" -d 'Create an application version by putting the manifest into the wadm store'
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from help" -f -a "deploy" -d 'Deploy an application to the lattice'
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from help" -f -a "undeploy" -d 'Undeploy an application, removing it from the lattice'
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from help" -f -a "validate" -d 'Validate an application manifest'
complete -c wash -n "__fish_wash_using_subcommand app; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wash -n "__fish_wash_using_subcommand build" -s p -l config-path -d 'Path to the wasmcloud.toml file or parent folder to use for building' -r -F
complete -c wash -n "__fish_wash_using_subcommand build" -l pkg-config -d 'The path to the configuration file' -r -F
complete -c wash -n "__fish_wash_using_subcommand build" -l pkg-cache -d 'The path to the cache directory. Defaults to the system cache directory' -r -F
complete -c wash -n "__fish_wash_using_subcommand build" -l keys-directory -d 'Location of key files for signing. Defaults to $WASH_KEYS ($HOME/.wash/keys)' -r -F
complete -c wash -n "__fish_wash_using_subcommand build" -s i -l issuer -d 'Path to issuer seed key (account). If this flag is not provided, the seed will be sourced from $WASH_KEYS ($HOME/.wash/keys) or generated for you if it cannot be found' -r
complete -c wash -n "__fish_wash_using_subcommand build" -s s -l subject -d 'Path to subject seed key (module or service). If this flag is not provided, the seed will be sourced from $WASH_KEYS ($HOME/.wash/keys) or generated for you if it cannot be found' -r
complete -c wash -n "__fish_wash_using_subcommand build" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand build" -l disable-keygen -d 'Disables autogeneration of keys if seed(s) are not provided'
complete -c wash -n "__fish_wash_using_subcommand build" -l build-only -d 'Skip signing the artifact and only use the native toolchain to build'
complete -c wash -n "__fish_wash_using_subcommand build" -l sign-only -d 'Skip building the artifact and only use configuration to sign'
complete -c wash -n "__fish_wash_using_subcommand build" -l skip-fetch -d 'Skip wit dependency fetching and use only what is currently present in the wit directory (useful for airgapped or disconnected environments)'
complete -c wash -n "__fish_wash_using_subcommand build" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand build" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand build" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand call" -s r -l rpc-host -d 'RPC Host for connection, defaults to 127.0.0.1 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand call" -s p -l rpc-port -d 'RPC Port for connections, defaults to 4222 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand call" -l rpc-jwt -d 'JWT file for RPC authentication. Must be supplied with rpc_seed' -r
complete -c wash -n "__fish_wash_using_subcommand call" -l rpc-seed -d 'Seed file or literal for RPC authentication. Must be supplied with rpc_jwt' -r
complete -c wash -n "__fish_wash_using_subcommand call" -l rpc-credsfile -d 'Credsfile for RPC authentication. Combines rpc_seed and rpc_jwt. See https://docs.nats.io/using-nats/developer/connecting/creds for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand call" -l rpc-ca-file -d 'CA file for RPC authentication. See https://docs.nats.io/using-nats/developer/security/securing_nats for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand call" -s x -l lattice -d 'Lattice for wasmcloud command interface, defaults to "default"' -r
complete -c wash -n "__fish_wash_using_subcommand call" -s t -l rpc-timeout-ms -d 'Timeout length for RPC, defaults to 2000 milliseconds' -r
complete -c wash -n "__fish_wash_using_subcommand call" -l context -d 'Name of the context to use for RPC connection, authentication, and cluster seed invocation signing' -r
complete -c wash -n "__fish_wash_using_subcommand call" -l http-scheme -d 'Scheme to use when making the HTTP request' -r
complete -c wash -n "__fish_wash_using_subcommand call" -l http-host -d 'Host to use when making the HTTP request' -r
complete -c wash -n "__fish_wash_using_subcommand call" -l http-port -d 'Port on which to make the HTTP request' -r
complete -c wash -n "__fish_wash_using_subcommand call" -l http-method -d 'Method to use when making the HTTP request' -r
complete -c wash -n "__fish_wash_using_subcommand call" -l http-body -d 'Stringified body contents to use when making the HTTP request' -r
complete -c wash -n "__fish_wash_using_subcommand call" -l http-body-path -d 'Path to a file to use as the body when making a HTTP request' -r -F
complete -c wash -n "__fish_wash_using_subcommand call" -l http-content-type -d 'Content type header to pass with the request' -r
complete -c wash -n "__fish_wash_using_subcommand call" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand call" -l http-response-extract-json -d 'Whether the content of the HTTP response body should be parsed as JSON and returned directly'
complete -c wash -n "__fish_wash_using_subcommand call" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand call" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand call" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand capture; and not __fish_seen_subcommand_from replay help" -l window-size -d 'The length of time in minutes to keep messages in the stream' -r
complete -c wash -n "__fish_wash_using_subcommand capture; and not __fish_seen_subcommand_from replay help" -s r -l ctl-host -d 'CTL Host for connection, defaults to 127.0.0.1 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand capture; and not __fish_seen_subcommand_from replay help" -s p -l ctl-port -d 'CTL Port for connections, defaults to 4222 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand capture; and not __fish_seen_subcommand_from replay help" -l ctl-jwt -d 'JWT file for CTL authentication. Must be supplied with ctl_seed' -r
complete -c wash -n "__fish_wash_using_subcommand capture; and not __fish_seen_subcommand_from replay help" -l ctl-seed -d 'Seed file or literal for CTL authentication. Must be supplied with ctl_jwt' -r
complete -c wash -n "__fish_wash_using_subcommand capture; and not __fish_seen_subcommand_from replay help" -l ctl-credsfile -d 'Credsfile for CTL authentication. Combines ctl_seed and ctl_jwt. See https://docs.nats.io/using-nats/developer/connecting/creds for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand capture; and not __fish_seen_subcommand_from replay help" -l ctl-tls-ca-file -d 'TLS CA file for CTL authentication. See https://docs.nats.io/using-nats/developer/connecting/tls for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand capture; and not __fish_seen_subcommand_from replay help" -l ctl-tls-first -d 'Perform TLS handshake before expecting the server greeting' -r -f -a "{true\t'',false\t''}"
complete -c wash -n "__fish_wash_using_subcommand capture; and not __fish_seen_subcommand_from replay help" -l js-domain -d 'JS domain for wasmcloud control interface. Defaults to None' -r
complete -c wash -n "__fish_wash_using_subcommand capture; and not __fish_seen_subcommand_from replay help" -s x -l lattice -d 'Lattice name for wasmcloud control interface, defaults to "default"' -r
complete -c wash -n "__fish_wash_using_subcommand capture; and not __fish_seen_subcommand_from replay help" -s t -l timeout-ms -d 'Timeout length to await a control interface response, defaults to 2000 milliseconds' -r
complete -c wash -n "__fish_wash_using_subcommand capture; and not __fish_seen_subcommand_from replay help" -l context -d 'Name of a context to use for CTL connection and authentication' -r
complete -c wash -n "__fish_wash_using_subcommand capture; and not __fish_seen_subcommand_from replay help" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand capture; and not __fish_seen_subcommand_from replay help" -l enable -d 'Enable wash capture. This will setup a NATS JetStream stream to capture all invocations'
complete -c wash -n "__fish_wash_using_subcommand capture; and not __fish_seen_subcommand_from replay help" -l disable -d 'Disable wash capture. This will removed the NATS JetStream stream that was setup to capture all invocations'
complete -c wash -n "__fish_wash_using_subcommand capture; and not __fish_seen_subcommand_from replay help" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand capture; and not __fish_seen_subcommand_from replay help" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand capture; and not __fish_seen_subcommand_from replay help" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand capture; and not __fish_seen_subcommand_from replay help" -f -a "replay"
complete -c wash -n "__fish_wash_using_subcommand capture; and not __fish_seen_subcommand_from replay help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wash -n "__fish_wash_using_subcommand capture; and __fish_seen_subcommand_from replay" -l source-id -d 'A component ID to filter captured invocations by. This will filter anywhere the component is the source of the invocation' -r
complete -c wash -n "__fish_wash_using_subcommand capture; and __fish_seen_subcommand_from replay" -l target-id -d 'A component ID to filter captured invocations by. This will filter anywhere the component is the target of the invocation' -r
complete -c wash -n "__fish_wash_using_subcommand capture; and __fish_seen_subcommand_from replay" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand capture; and __fish_seen_subcommand_from replay" -l interactive -d 'Whether or not to step through the replay one message at a time'
complete -c wash -n "__fish_wash_using_subcommand capture; and __fish_seen_subcommand_from replay" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand capture; and __fish_seen_subcommand_from replay" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand capture; and __fish_seen_subcommand_from replay" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand capture; and __fish_seen_subcommand_from help" -f -a "replay"
complete -c wash -n "__fish_wash_using_subcommand capture; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wash -n "__fish_wash_using_subcommand completions; and not __fish_seen_subcommand_from zsh bash fish power-shell help" -s d -l dir -d 'Output directory (default \'.\')' -r -F
complete -c wash -n "__fish_wash_using_subcommand completions; and not __fish_seen_subcommand_from zsh bash fish power-shell help" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand completions; and not __fish_seen_subcommand_from zsh bash fish power-shell help" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand completions; and not __fish_seen_subcommand_from zsh bash fish power-shell help" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand completions; and not __fish_seen_subcommand_from zsh bash fish power-shell help" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand completions; and not __fish_seen_subcommand_from zsh bash fish power-shell help" -f -a "zsh" -d 'generate completions for Zsh'
complete -c wash -n "__fish_wash_using_subcommand completions; and not __fish_seen_subcommand_from zsh bash fish power-shell help" -f -a "bash" -d 'generate completions for Bash'
complete -c wash -n "__fish_wash_using_subcommand completions; and not __fish_seen_subcommand_from zsh bash fish power-shell help" -f -a "fish" -d 'generate completions for Fish'
complete -c wash -n "__fish_wash_using_subcommand completions; and not __fish_seen_subcommand_from zsh bash fish power-shell help" -f -a "power-shell" -d 'generate completions for PowerShell'
complete -c wash -n "__fish_wash_using_subcommand completions; and not __fish_seen_subcommand_from zsh bash fish power-shell help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wash -n "__fish_wash_using_subcommand completions; and __fish_seen_subcommand_from zsh" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand completions; and __fish_seen_subcommand_from zsh" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand completions; and __fish_seen_subcommand_from zsh" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand completions; and __fish_seen_subcommand_from zsh" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand completions; and __fish_seen_subcommand_from bash" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand completions; and __fish_seen_subcommand_from bash" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand completions; and __fish_seen_subcommand_from bash" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand completions; and __fish_seen_subcommand_from bash" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand completions; and __fish_seen_subcommand_from fish" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand completions; and __fish_seen_subcommand_from fish" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand completions; and __fish_seen_subcommand_from fish" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand completions; and __fish_seen_subcommand_from fish" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand completions; and __fish_seen_subcommand_from power-shell" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand completions; and __fish_seen_subcommand_from power-shell" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand completions; and __fish_seen_subcommand_from power-shell" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand completions; and __fish_seen_subcommand_from power-shell" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand completions; and __fish_seen_subcommand_from help" -f -a "zsh" -d 'generate completions for Zsh'
complete -c wash -n "__fish_wash_using_subcommand completions; and __fish_seen_subcommand_from help" -f -a "bash" -d 'generate completions for Bash'
complete -c wash -n "__fish_wash_using_subcommand completions; and __fish_seen_subcommand_from help" -f -a "fish" -d 'generate completions for Fish'
complete -c wash -n "__fish_wash_using_subcommand completions; and __fish_seen_subcommand_from help" -f -a "power-shell" -d 'generate completions for PowerShell'
complete -c wash -n "__fish_wash_using_subcommand completions; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wash -n "__fish_wash_using_subcommand claims; and not __fish_seen_subcommand_from inspect sign token help" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand claims; and not __fish_seen_subcommand_from inspect sign token help" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand claims; and not __fish_seen_subcommand_from inspect sign token help" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand claims; and not __fish_seen_subcommand_from inspect sign token help" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand claims; and not __fish_seen_subcommand_from inspect sign token help" -f -a "inspect" -d 'Examine the signing claims information or WIT world from a signed component component'
complete -c wash -n "__fish_wash_using_subcommand claims; and not __fish_seen_subcommand_from inspect sign token help" -f -a "sign" -d 'Sign a WebAssembly component, specifying capabilities and other claims including expiration, tags, and additional metadata'
complete -c wash -n "__fish_wash_using_subcommand claims; and not __fish_seen_subcommand_from inspect sign token help" -f -a "token" -d 'Generate a signed JWT by supplying basic token information, a signing seed key, and metadata'
complete -c wash -n "__fish_wash_using_subcommand claims; and not __fish_seen_subcommand_from inspect sign token help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from inspect" -s d -l digest -d 'Digest to verify artifact against (if OCI URL is provided for `<component>`)' -r
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from inspect" -s u -l user -d 'OCI username, if omitted anonymous authentication will be used' -r
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from inspect" -s p -l password -d 'OCI password, if omitted anonymous authentication will be used' -r
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from inspect" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from inspect" -l jwt-only -d 'Extract the raw JWT from the file and print to stdout'
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from inspect" -l wit -d 'Extract the WIT world from a component and print to stdout instead of the claims'
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from inspect" -l allow-latest -d 'Allow latest artifact tags (if OCI URL is provided for `<component>`)'
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from inspect" -l insecure -d 'Allow insecure (HTTP) registry connections'
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from inspect" -l insecure-skip-tls-verify -d 'Skip checking OCI registry\'s certificate for validity'
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from inspect" -l no-cache -d 'skip the local OCI cache'
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from inspect" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from inspect" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from inspect" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from sign" -s d -l destination -d 'Destination for signed module. If this flag is not provided, the signed module will be placed in the same directory as the source with a "_s" suffix' -r
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from sign" -s n -l name -d 'A human-readable, descriptive name for the token' -r
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from sign" -s t -l tag -d 'A list of arbitrary tags to be embedded in the token' -r
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from sign" -s r -l rev -d 'Revision number' -r
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from sign" -s v -l ver -d 'Human-readable version string' -r
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from sign" -s a -l call-alias -d 'Developer or human friendly unique alias used for invoking an component, consisting of lowercase alphanumeric characters, underscores \'_\' and slashes \'/\'' -r
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from sign" -s i -l issuer -d 'Path to issuer seed key (account). If this flag is not provided, the will be sourced from $WASH_KEYS ($HOME/.wash/keys) or generated for you if it cannot be found' -r
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from sign" -s s -l subject -d 'Path to subject seed key (module). If this flag is not provided, the will be sourced from $WASH_KEYS ($HOME/.wash/keys) or generated for you if it cannot be found' -r
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from sign" -l directory -d 'Location of key files for signing. Defaults to $WASH_KEYS ($HOME/.wash/keys)' -r -F
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from sign" -s x -l expires -d 'Indicates the token expires in the given amount of days. If this option is left off, the token will never expire' -r
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from sign" -s b -l nbf -d 'Period in days that must elapse before this token is valid. If this option is left off, the token will be valid immediately' -r
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from sign" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from sign" -l disable-keygen -d 'Disables autogeneration of keys if seed(s) are not provided'
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from sign" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from sign" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from sign" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from token" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from token" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from token" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from token" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from token" -f -a "component" -d 'Generate a signed JWT for an component module'
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from token" -f -a "operator" -d 'Generate a signed JWT for an operator'
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from token" -f -a "account" -d 'Generate a signed JWT for an account'
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from token" -f -a "provider" -d 'Generate a signed JWT for a service (capability provider)'
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from token" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from help" -f -a "inspect" -d 'Examine the signing claims information or WIT world from a signed component component'
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from help" -f -a "sign" -d 'Sign a WebAssembly component, specifying capabilities and other claims including expiration, tags, and additional metadata'
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from help" -f -a "token" -d 'Generate a signed JWT by supplying basic token information, a signing seed key, and metadata'
complete -c wash -n "__fish_wash_using_subcommand claims; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wash -n "__fish_wash_using_subcommand config; and not __fish_seen_subcommand_from put get del help" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand config; and not __fish_seen_subcommand_from put get del help" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand config; and not __fish_seen_subcommand_from put get del help" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand config; and not __fish_seen_subcommand_from put get del help" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand config; and not __fish_seen_subcommand_from put get del help" -f -a "put" -d 'Put named configuration'
complete -c wash -n "__fish_wash_using_subcommand config; and not __fish_seen_subcommand_from put get del help" -f -a "get" -d 'Get a named configuration'
complete -c wash -n "__fish_wash_using_subcommand config; and not __fish_seen_subcommand_from put get del help" -f -a "del" -d 'Delete a named configuration'
complete -c wash -n "__fish_wash_using_subcommand config; and not __fish_seen_subcommand_from put get del help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from put" -s r -l ctl-host -d 'CTL Host for connection, defaults to 127.0.0.1 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from put" -s p -l ctl-port -d 'CTL Port for connections, defaults to 4222 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from put" -l ctl-jwt -d 'JWT file for CTL authentication. Must be supplied with ctl_seed' -r
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from put" -l ctl-seed -d 'Seed file or literal for CTL authentication. Must be supplied with ctl_jwt' -r
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from put" -l ctl-credsfile -d 'Credsfile for CTL authentication. Combines ctl_seed and ctl_jwt. See https://docs.nats.io/using-nats/developer/connecting/creds for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from put" -l ctl-tls-ca-file -d 'TLS CA file for CTL authentication. See https://docs.nats.io/using-nats/developer/connecting/tls for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from put" -l ctl-tls-first -d 'Perform TLS handshake before expecting the server greeting' -r -f -a "{true\t'',false\t''}"
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from put" -l js-domain -d 'JS domain for wasmcloud control interface. Defaults to None' -r
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from put" -s x -l lattice -d 'Lattice name for wasmcloud control interface, defaults to "default"' -r
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from put" -s t -l timeout-ms -d 'Timeout length to await a control interface response, defaults to 2000 milliseconds' -r
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from put" -l context -d 'Name of a context to use for CTL connection and authentication' -r
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from put" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from put" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from put" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from put" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from get" -s r -l ctl-host -d 'CTL Host for connection, defaults to 127.0.0.1 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from get" -s p -l ctl-port -d 'CTL Port for connections, defaults to 4222 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from get" -l ctl-jwt -d 'JWT file for CTL authentication. Must be supplied with ctl_seed' -r
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from get" -l ctl-seed -d 'Seed file or literal for CTL authentication. Must be supplied with ctl_jwt' -r
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from get" -l ctl-credsfile -d 'Credsfile for CTL authentication. Combines ctl_seed and ctl_jwt. See https://docs.nats.io/using-nats/developer/connecting/creds for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from get" -l ctl-tls-ca-file -d 'TLS CA file for CTL authentication. See https://docs.nats.io/using-nats/developer/connecting/tls for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from get" -l ctl-tls-first -d 'Perform TLS handshake before expecting the server greeting' -r -f -a "{true\t'',false\t''}"
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from get" -l js-domain -d 'JS domain for wasmcloud control interface. Defaults to None' -r
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from get" -s x -l lattice -d 'Lattice name for wasmcloud control interface, defaults to "default"' -r
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from get" -s t -l timeout-ms -d 'Timeout length to await a control interface response, defaults to 2000 milliseconds' -r
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from get" -l context -d 'Name of a context to use for CTL connection and authentication' -r
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from get" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from get" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from get" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from del" -s r -l ctl-host -d 'CTL Host for connection, defaults to 127.0.0.1 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from del" -s p -l ctl-port -d 'CTL Port for connections, defaults to 4222 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from del" -l ctl-jwt -d 'JWT file for CTL authentication. Must be supplied with ctl_seed' -r
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from del" -l ctl-seed -d 'Seed file or literal for CTL authentication. Must be supplied with ctl_jwt' -r
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from del" -l ctl-credsfile -d 'Credsfile for CTL authentication. Combines ctl_seed and ctl_jwt. See https://docs.nats.io/using-nats/developer/connecting/creds for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from del" -l ctl-tls-ca-file -d 'TLS CA file for CTL authentication. See https://docs.nats.io/using-nats/developer/connecting/tls for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from del" -l ctl-tls-first -d 'Perform TLS handshake before expecting the server greeting' -r -f -a "{true\t'',false\t''}"
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from del" -l js-domain -d 'JS domain for wasmcloud control interface. Defaults to None' -r
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from del" -s x -l lattice -d 'Lattice name for wasmcloud control interface, defaults to "default"' -r
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from del" -s t -l timeout-ms -d 'Timeout length to await a control interface response, defaults to 2000 milliseconds' -r
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from del" -l context -d 'Name of a context to use for CTL connection and authentication' -r
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from del" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from del" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from del" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from del" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "put" -d 'Put named configuration'
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "get" -d 'Get a named configuration'
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "del" -d 'Delete a named configuration'
complete -c wash -n "__fish_wash_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wash -n "__fish_wash_using_subcommand ctx; and not __fish_seen_subcommand_from list del new default edit help" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand ctx; and not __fish_seen_subcommand_from list del new default edit help" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand ctx; and not __fish_seen_subcommand_from list del new default edit help" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand ctx; and not __fish_seen_subcommand_from list del new default edit help" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand ctx; and not __fish_seen_subcommand_from list del new default edit help" -f -a "list" -d 'Lists all stored contexts (JSON files) found in the context directory, with the exception of index.json'
complete -c wash -n "__fish_wash_using_subcommand ctx; and not __fish_seen_subcommand_from list del new default edit help" -f -a "del" -d 'Delete a stored context'
complete -c wash -n "__fish_wash_using_subcommand ctx; and not __fish_seen_subcommand_from list del new default edit help" -f -a "new" -d 'Create a new context'
complete -c wash -n "__fish_wash_using_subcommand ctx; and not __fish_seen_subcommand_from list del new default edit help" -f -a "default" -d 'Set the default context'
complete -c wash -n "__fish_wash_using_subcommand ctx; and not __fish_seen_subcommand_from list del new default edit help" -f -a "edit" -d 'Edit a context directly using a text editor'
complete -c wash -n "__fish_wash_using_subcommand ctx; and not __fish_seen_subcommand_from list del new default edit help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wash -n "__fish_wash_using_subcommand ctx; and __fish_seen_subcommand_from list" -l directory -d 'Location of context files for managing. Defaults to $WASH_CONTEXTS ($HOME/.wash/contexts)' -r -F
complete -c wash -n "__fish_wash_using_subcommand ctx; and __fish_seen_subcommand_from list" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand ctx; and __fish_seen_subcommand_from list" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand ctx; and __fish_seen_subcommand_from list" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand ctx; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand ctx; and __fish_seen_subcommand_from del" -l directory -d 'Location of context files for managing. Defaults to $WASH_CONTEXTS ($HOME/.wash/contexts)' -r -F
complete -c wash -n "__fish_wash_using_subcommand ctx; and __fish_seen_subcommand_from del" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand ctx; and __fish_seen_subcommand_from del" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand ctx; and __fish_seen_subcommand_from del" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand ctx; and __fish_seen_subcommand_from del" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand ctx; and __fish_seen_subcommand_from new" -l directory -d 'Location of context files for managing. Defaults to $WASH_CONTEXTS ($HOME/.wash/contexts)' -r -F
complete -c wash -n "__fish_wash_using_subcommand ctx; and __fish_seen_subcommand_from new" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand ctx; and __fish_seen_subcommand_from new" -s i -l interactive -d 'Create the context in an interactive terminal prompt, instead of an autogenerated default context'
complete -c wash -n "__fish_wash_using_subcommand ctx; and __fish_seen_subcommand_from new" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand ctx; and __fish_seen_subcommand_from new" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand ctx; and __fish_seen_subcommand_from new" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand ctx; and __fish_seen_subcommand_from default" -l directory -d 'Location of context files for managing. Defaults to $WASH_CONTEXTS ($HOME/.wash/contexts)' -r -F
complete -c wash -n "__fish_wash_using_subcommand ctx; and __fish_seen_subcommand_from default" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand ctx; and __fish_seen_subcommand_from default" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand ctx; and __fish_seen_subcommand_from default" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand ctx; and __fish_seen_subcommand_from default" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand ctx; and __fish_seen_subcommand_from edit" -l directory -d 'Location of context files for managing. Defaults to $WASH_CONTEXTS ($HOME/.wash/contexts)' -r -F
complete -c wash -n "__fish_wash_using_subcommand ctx; and __fish_seen_subcommand_from edit" -s e -l editor -d 'Your terminal text editor of choice. This editor must be present in your $PATH, or an absolute filepath' -r
complete -c wash -n "__fish_wash_using_subcommand ctx; and __fish_seen_subcommand_from edit" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand ctx; and __fish_seen_subcommand_from edit" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand ctx; and __fish_seen_subcommand_from edit" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand ctx; and __fish_seen_subcommand_from edit" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand ctx; and __fish_seen_subcommand_from help" -f -a "list" -d 'Lists all stored contexts (JSON files) found in the context directory, with the exception of index.json'
complete -c wash -n "__fish_wash_using_subcommand ctx; and __fish_seen_subcommand_from help" -f -a "del" -d 'Delete a stored context'
complete -c wash -n "__fish_wash_using_subcommand ctx; and __fish_seen_subcommand_from help" -f -a "new" -d 'Create a new context'
complete -c wash -n "__fish_wash_using_subcommand ctx; and __fish_seen_subcommand_from help" -f -a "default" -d 'Set the default context'
complete -c wash -n "__fish_wash_using_subcommand ctx; and __fish_seen_subcommand_from help" -f -a "edit" -d 'Edit a context directly using a text editor'
complete -c wash -n "__fish_wash_using_subcommand ctx; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wash -n "__fish_wash_using_subcommand dev" -l nats-credsfile -d 'Optional path to a NATS credentials file to authenticate and extend existing NATS infrastructure' -r -F
complete -c wash -n "__fish_wash_using_subcommand dev" -l nats-config-file -d 'Optional path to a NATS config file NOTE: If your configuration changes the address or port to listen on from 0.0.0.0:4222, ensure you set --nats-host and --nats-port' -r -F
complete -c wash -n "__fish_wash_using_subcommand dev" -l nats-remote-url -d 'Optional remote URL of existing NATS infrastructure to extend' -r
complete -c wash -n "__fish_wash_using_subcommand dev" -l nats-version -d 'NATS server version to download, e.g. `v2.10.7`. See https://github.com/nats-io/nats-server/releases/ for releases' -r
complete -c wash -n "__fish_wash_using_subcommand dev" -l nats-host -d 'NATS server host to connect to' -r
complete -c wash -n "__fish_wash_using_subcommand dev" -l nats-port -d 'NATS server port to connect to. This will be used as the NATS listen port if `--nats-connect-only` isn\'t set' -r
complete -c wash -n "__fish_wash_using_subcommand dev" -l nats-websocket-port -d 'NATS websocket port to use. TLS is not supported. This is required for the wash ui to connect from localhost' -r
complete -c wash -n "__fish_wash_using_subcommand dev" -l nats-js-domain -d 'NATS Server Jetstream domain for extending superclusters' -r
complete -c wash -n "__fish_wash_using_subcommand dev" -l wasmcloud-version -d 'wasmcloud host version to download, e.g. `v1.4.2`' -r
complete -c wash -n "__fish_wash_using_subcommand dev" -s x -l lattice -d 'A unique identifier for a lattice, frequently used within NATS topics to isolate messages among different lattices' -r
complete -c wash -n "__fish_wash_using_subcommand dev" -l host-seed -d 'The seed key (a printable 256-bit Ed25519 private key) used by this host to generate it\'s public key' -r
complete -c wash -n "__fish_wash_using_subcommand dev" -l rpc-host -d 'An IP address or DNS name to use to connect to NATS for RPC messages, defaults to the value supplied to --nats-host if not supplied' -r
complete -c wash -n "__fish_wash_using_subcommand dev" -l rpc-port -d 'A port to use to connect to NATS for RPC messages, defaults to the value supplied to --nats-port if not supplied' -r
complete -c wash -n "__fish_wash_using_subcommand dev" -l rpc-seed -d 'A seed nkey to use to authenticate to NATS for RPC messages' -r
complete -c wash -n "__fish_wash_using_subcommand dev" -l rpc-timeout-ms -d 'Timeout in milliseconds for all RPC calls' -r
complete -c wash -n "__fish_wash_using_subcommand dev" -l rpc-jwt -d 'A user JWT to use to authenticate to NATS for RPC messages' -r
complete -c wash -n "__fish_wash_using_subcommand dev" -l rpc-tls-ca-file -d 'A TLS CA file to use to authenticate to NATS for RPC messages' -r -F
complete -c wash -n "__fish_wash_using_subcommand dev" -l rpc-credsfile -d 'Convenience flag for RPC authentication, internally this parses the JWT and seed from the credsfile' -r -F
complete -c wash -n "__fish_wash_using_subcommand dev" -l ctl-host -d 'An IP address or DNS name to use to connect to NATS for Control Interface (CTL) messages, defaults to the value supplied to --nats-host if not supplied' -r
complete -c wash -n "__fish_wash_using_subcommand dev" -l ctl-port -d 'A port to use to connect to NATS for CTL messages, defaults to the value supplied to --nats-port if not supplied' -r
complete -c wash -n "__fish_wash_using_subcommand dev" -l ctl-seed -d 'A seed nkey to use to authenticate to NATS for CTL messages' -r
complete -c wash -n "__fish_wash_using_subcommand dev" -l ctl-jwt -d 'A user JWT to use to authenticate to NATS for CTL messages' -r
complete -c wash -n "__fish_wash_using_subcommand dev" -l ctl-credsfile -d 'Convenience flag for CTL authentication, internally this parses the JWT and seed from the credsfile' -r -F
complete -c wash -n "__fish_wash_using_subcommand dev" -l ctl-tls-ca-file -d 'A TLS CA file to use to authenticate to NATS for CTL messages' -r -F
complete -c wash -n "__fish_wash_using_subcommand dev" -l cluster-seed -d 'The seed key (a printable 256-bit Ed25519 private key) used by this host to sign all invocations' -r
complete -c wash -n "__fish_wash_using_subcommand dev" -l cluster-issuers -d 'A comma-delimited list of public keys that can be used as issuers on signed invocations' -r
complete -c wash -n "__fish_wash_using_subcommand dev" -l provider-delay -d 'Delay, in milliseconds, between requesting a provider shut down and forcibly terminating its process' -r
complete -c wash -n "__fish_wash_using_subcommand dev" -l allowed-insecure -d 'A comma-separated list of OCI hosts to which insecure (non-TLS) connections are allowed' -r
complete -c wash -n "__fish_wash_using_subcommand dev" -l wasmcloud-js-domain -d 'Jetstream domain name, configures a host to properly connect to a NATS supercluster' -r
complete -c wash -n "__fish_wash_using_subcommand dev" -l allow-file-load -d 'Denotes if a wasmCloud host should allow starting components from the file system' -r -f -a "{true\t'',false\t''}"
complete -c wash -n "__fish_wash_using_subcommand dev" -s l -l label -d 'A label to apply to the host, in the form of `key=value`. This flag can be repeated to supply multiple labels' -r
complete -c wash -n "__fish_wash_using_subcommand dev" -l log-level -d 'Controls the verbosity of JSON structured logs from the wasmCloud host' -r
complete -c wash -n "__fish_wash_using_subcommand dev" -l max-execution-time-ms -d 'Defines the Max Execution time (in ms) that the host runtime will execute for' -r
complete -c wash -n "__fish_wash_using_subcommand dev" -l secrets-topic -d 'If provided, enables interfacing with a secrets backend for secret retrieval over the given topic prefix' -r
complete -c wash -n "__fish_wash_using_subcommand dev" -l policy-topic -d 'If provided, enables policy checks on start actions and component invocations' -r
complete -c wash -n "__fish_wash_using_subcommand dev" -l host-log-path -d 'Path to which to log information from the wasmCloud host' -r -F
complete -c wash -n "__fish_wash_using_subcommand dev" -l host-path -d 'Path to a binary that should be used to start the wasmCloud host' -r -F
complete -c wash -n "__fish_wash_using_subcommand dev" -l wadm-version -d 'wadm version to download, e.g. `v0.18.0`' -r
complete -c wash -n "__fish_wash_using_subcommand dev" -l wadm-js-domain -d 'The JetStream domain to use for wadm' -r
complete -c wash -n "__fish_wash_using_subcommand dev" -l wadm-manifest -d 'The path to a wadm application manifest to run while the host is up' -r -F
complete -c wash -n "__fish_wash_using_subcommand dev" -l pkg-config -d 'The path to the configuration file' -r -F
complete -c wash -n "__fish_wash_using_subcommand dev" -l pkg-cache -d 'The path to the cache directory. Defaults to the system cache directory' -r -F
complete -c wash -n "__fish_wash_using_subcommand dev" -l host-id -d 'ID of the host to use for `wash dev` if one is not selected, `wash dev` will attempt to use the single host in the lattice' -r
complete -c wash -n "__fish_wash_using_subcommand dev" -s d -l work-dir -d 'Path to code directory' -r -F
complete -c wash -n "__fish_wash_using_subcommand dev" -s i -l ignore-dir -d 'Directories to ignore when watching for changes. This should be set to directories where generated files are placed, such as `target/` or `dist/`. Can be specified multiple times' -r -F
complete -c wash -n "__fish_wash_using_subcommand dev" -l manifest-output-dir -d 'Write generated WADM manifest(s) to a given folder (every time they are generated)' -r -F
complete -c wash -n "__fish_wash_using_subcommand dev" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand dev" -l nats-connect-only -d 'If a connection can\'t be established, exit and don\'t start a NATS server. Will be ignored if a remote_url and credsfile are specified'
complete -c wash -n "__fish_wash_using_subcommand dev" -l rpc-tls -d 'Optional flag to enable host communication with a NATS server over TLS for RPC messages'
complete -c wash -n "__fish_wash_using_subcommand dev" -l rpc-tls-first -d 'Optional flag to enable performing TLS handshake before expecting the server greeting for RPC messages'
complete -c wash -n "__fish_wash_using_subcommand dev" -l ctl-tls -d 'Optional flag to enable host communication with a NATS server over TLS for CTL messages'
complete -c wash -n "__fish_wash_using_subcommand dev" -l ctl-tls-first -d 'Optional flag to enable performing TLS handshake before expecting the server greeting for CTL messages'
complete -c wash -n "__fish_wash_using_subcommand dev" -l allow-latest -d 'Determines whether OCI images tagged latest are allowed to be pulled from OCI registries and started'
complete -c wash -n "__fish_wash_using_subcommand dev" -l config-service-enabled -d 'Denotes if a wasmCloud host should issue requests to a config service on startup'
complete -c wash -n "__fish_wash_using_subcommand dev" -l enable-structured-logging -d 'Enable JSON structured logging from the wasmCloud host'
complete -c wash -n "__fish_wash_using_subcommand dev" -l enable-ipv6 -d 'Enables IPV6 addressing for wasmCloud hosts'
complete -c wash -n "__fish_wash_using_subcommand dev" -l wasmcloud-start-only -d 'If enabled, wasmCloud will not be downloaded if it\'s not installed'
complete -c wash -n "__fish_wash_using_subcommand dev" -l multi-local -d 'If enabled, allows starting additional wasmCloud hosts on this machine'
complete -c wash -n "__fish_wash_using_subcommand dev" -l disable-wadm -d 'If enabled, wadm will not be downloaded or run as a part of the up command'
complete -c wash -n "__fish_wash_using_subcommand dev" -l leave-host-running -d 'Leave the wasmCloud host running after stopping the devloop'
complete -c wash -n "__fish_wash_using_subcommand dev" -l skip-fetch -d 'Skip wit dependency fetching and use only what is currently present in the wit directory (useful for airgapped or disconnected environments)'
complete -c wash -n "__fish_wash_using_subcommand dev" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand dev" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand dev" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c wash -n "__fish_wash_using_subcommand down" -s x -l lattice -d 'A lattice prefix is a unique identifier for a lattice, and is frequently used within NATS topics to isolate messages from different lattices' -r
complete -c wash -n "__fish_wash_using_subcommand down" -l ctl-host -d 'An IP address or DNS name to use to connect to NATS for Control Interface (CTL) messages, defaults to the value supplied to --nats-host if not supplied' -r
complete -c wash -n "__fish_wash_using_subcommand down" -l ctl-port -d 'A port to use to connect to NATS for CTL messages, defaults to the value supplied to --nats-port if not supplied' -r
complete -c wash -n "__fish_wash_using_subcommand down" -l ctl-credsfile -d 'Convenience flag for CTL authentication, internally this parses the JWT and seed from the credsfile' -r -F
complete -c wash -n "__fish_wash_using_subcommand down" -l ctl-seed -d 'A seed nkey to use to authenticate to NATS for CTL messages' -r
complete -c wash -n "__fish_wash_using_subcommand down" -l ctl-jwt -d 'A user JWT to use to authenticate to NATS for CTL messages' -r
complete -c wash -n "__fish_wash_using_subcommand down" -l ctl-tls-ca-file -d 'A TLS CA file to use to authenticate to NATS for CTL messages' -r -F
complete -c wash -n "__fish_wash_using_subcommand down" -l ctl-tls-first -d 'Perform TLS handshake before expecting the server greeting' -r -f -a "{true\t'',false\t''}"
complete -c wash -n "__fish_wash_using_subcommand down" -l host-id -r
complete -c wash -n "__fish_wash_using_subcommand down" -l purge-jetstream -d 'Purge NATS Jetstream storage and streams that persist when wasmCloud is stopped' -r -f -a "{none\t'Don\'t purge any Jetstream data, the default',all\t'Purge all streams and KV buckets for wasmCloud and wadm',wadm\t'Purge all streams and KV buckets for wadm, removing all application manifests',wasmcloud\t'Purge all KV buckets for wasmCloud, removing all links and configuration data'}"
complete -c wash -n "__fish_wash_using_subcommand down" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand down" -l all -d 'Shutdown all hosts running locally if launched with --multi-local'
complete -c wash -n "__fish_wash_using_subcommand down" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand down" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand down" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c wash -n "__fish_wash_using_subcommand drain; and not __fish_seen_subcommand_from all oci lib dev downloads help" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand drain; and not __fish_seen_subcommand_from all oci lib dev downloads help" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand drain; and not __fish_seen_subcommand_from all oci lib dev downloads help" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand drain; and not __fish_seen_subcommand_from all oci lib dev downloads help" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand drain; and not __fish_seen_subcommand_from all oci lib dev downloads help" -f -a "all" -d 'Remove all cached files created by wasmcloud'
complete -c wash -n "__fish_wash_using_subcommand drain; and not __fish_seen_subcommand_from all oci lib dev downloads help" -f -a "oci" -d 'Remove cached files downloaded from OCI registries by wasmCloud'
complete -c wash -n "__fish_wash_using_subcommand drain; and not __fish_seen_subcommand_from all oci lib dev downloads help" -f -a "lib" -d 'Remove cached binaries extracted from provider archives'
complete -c wash -n "__fish_wash_using_subcommand drain; and not __fish_seen_subcommand_from all oci lib dev downloads help" -f -a "dev" -d 'Remove files and logs from wash dev sessions'
complete -c wash -n "__fish_wash_using_subcommand drain; and not __fish_seen_subcommand_from all oci lib dev downloads help" -f -a "downloads" -d 'Remove downloaded and generated files from launching wasmCloud hosts'
complete -c wash -n "__fish_wash_using_subcommand drain; and not __fish_seen_subcommand_from all oci lib dev downloads help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wash -n "__fish_wash_using_subcommand drain; and __fish_seen_subcommand_from all" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand drain; and __fish_seen_subcommand_from all" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand drain; and __fish_seen_subcommand_from all" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand drain; and __fish_seen_subcommand_from all" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand drain; and __fish_seen_subcommand_from oci" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand drain; and __fish_seen_subcommand_from oci" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand drain; and __fish_seen_subcommand_from oci" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand drain; and __fish_seen_subcommand_from oci" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand drain; and __fish_seen_subcommand_from lib" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand drain; and __fish_seen_subcommand_from lib" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand drain; and __fish_seen_subcommand_from lib" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand drain; and __fish_seen_subcommand_from lib" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand drain; and __fish_seen_subcommand_from dev" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand drain; and __fish_seen_subcommand_from dev" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand drain; and __fish_seen_subcommand_from dev" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand drain; and __fish_seen_subcommand_from dev" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand drain; and __fish_seen_subcommand_from downloads" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand drain; and __fish_seen_subcommand_from downloads" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand drain; and __fish_seen_subcommand_from downloads" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand drain; and __fish_seen_subcommand_from downloads" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand drain; and __fish_seen_subcommand_from help" -f -a "all" -d 'Remove all cached files created by wasmcloud'
complete -c wash -n "__fish_wash_using_subcommand drain; and __fish_seen_subcommand_from help" -f -a "oci" -d 'Remove cached files downloaded from OCI registries by wasmCloud'
complete -c wash -n "__fish_wash_using_subcommand drain; and __fish_seen_subcommand_from help" -f -a "lib" -d 'Remove cached binaries extracted from provider archives'
complete -c wash -n "__fish_wash_using_subcommand drain; and __fish_seen_subcommand_from help" -f -a "dev" -d 'Remove files and logs from wash dev sessions'
complete -c wash -n "__fish_wash_using_subcommand drain; and __fish_seen_subcommand_from help" -f -a "downloads" -d 'Remove downloaded and generated files from launching wasmCloud hosts'
complete -c wash -n "__fish_wash_using_subcommand drain; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wash -n "__fish_wash_using_subcommand get; and not __fish_seen_subcommand_from links claims hosts inventory help" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand get; and not __fish_seen_subcommand_from links claims hosts inventory help" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand get; and not __fish_seen_subcommand_from links claims hosts inventory help" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand get; and not __fish_seen_subcommand_from links claims hosts inventory help" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand get; and not __fish_seen_subcommand_from links claims hosts inventory help" -f -a "links" -d 'Retrieve all known links in the lattice'
complete -c wash -n "__fish_wash_using_subcommand get; and not __fish_seen_subcommand_from links claims hosts inventory help" -f -a "claims" -d 'Retrieve all known claims inside the lattice'
complete -c wash -n "__fish_wash_using_subcommand get; and not __fish_seen_subcommand_from links claims hosts inventory help" -f -a "hosts" -d 'Retrieve all responsive hosts in the lattice'
complete -c wash -n "__fish_wash_using_subcommand get; and not __fish_seen_subcommand_from links claims hosts inventory help" -f -a "inventory" -d 'Retrieve inventory a given host on in the lattice'
complete -c wash -n "__fish_wash_using_subcommand get; and not __fish_seen_subcommand_from links claims hosts inventory help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from links" -s r -l ctl-host -d 'CTL Host for connection, defaults to 127.0.0.1 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from links" -s p -l ctl-port -d 'CTL Port for connections, defaults to 4222 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from links" -l ctl-jwt -d 'JWT file for CTL authentication. Must be supplied with ctl_seed' -r
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from links" -l ctl-seed -d 'Seed file or literal for CTL authentication. Must be supplied with ctl_jwt' -r
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from links" -l ctl-credsfile -d 'Credsfile for CTL authentication. Combines ctl_seed and ctl_jwt. See https://docs.nats.io/using-nats/developer/connecting/creds for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from links" -l ctl-tls-ca-file -d 'TLS CA file for CTL authentication. See https://docs.nats.io/using-nats/developer/connecting/tls for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from links" -l ctl-tls-first -d 'Perform TLS handshake before expecting the server greeting' -r -f -a "{true\t'',false\t''}"
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from links" -l js-domain -d 'JS domain for wasmcloud control interface. Defaults to None' -r
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from links" -s x -l lattice -d 'Lattice name for wasmcloud control interface, defaults to "default"' -r
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from links" -s t -l timeout-ms -d 'Timeout length to await a control interface response, defaults to 2000 milliseconds' -r
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from links" -l context -d 'Name of a context to use for CTL connection and authentication' -r
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from links" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from links" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from links" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from links" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from claims" -s r -l ctl-host -d 'CTL Host for connection, defaults to 127.0.0.1 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from claims" -s p -l ctl-port -d 'CTL Port for connections, defaults to 4222 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from claims" -l ctl-jwt -d 'JWT file for CTL authentication. Must be supplied with ctl_seed' -r
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from claims" -l ctl-seed -d 'Seed file or literal for CTL authentication. Must be supplied with ctl_jwt' -r
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from claims" -l ctl-credsfile -d 'Credsfile for CTL authentication. Combines ctl_seed and ctl_jwt. See https://docs.nats.io/using-nats/developer/connecting/creds for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from claims" -l ctl-tls-ca-file -d 'TLS CA file for CTL authentication. See https://docs.nats.io/using-nats/developer/connecting/tls for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from claims" -l ctl-tls-first -d 'Perform TLS handshake before expecting the server greeting' -r -f -a "{true\t'',false\t''}"
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from claims" -l js-domain -d 'JS domain for wasmcloud control interface. Defaults to None' -r
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from claims" -s x -l lattice -d 'Lattice name for wasmcloud control interface, defaults to "default"' -r
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from claims" -s t -l timeout-ms -d 'Timeout length to await a control interface response, defaults to 2000 milliseconds' -r
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from claims" -l context -d 'Name of a context to use for CTL connection and authentication' -r
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from claims" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from claims" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from claims" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from claims" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from hosts" -s r -l ctl-host -d 'CTL Host for connection, defaults to 127.0.0.1 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from hosts" -s p -l ctl-port -d 'CTL Port for connections, defaults to 4222 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from hosts" -l ctl-jwt -d 'JWT file for CTL authentication. Must be supplied with ctl_seed' -r
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from hosts" -l ctl-seed -d 'Seed file or literal for CTL authentication. Must be supplied with ctl_jwt' -r
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from hosts" -l ctl-credsfile -d 'Credsfile for CTL authentication. Combines ctl_seed and ctl_jwt. See https://docs.nats.io/using-nats/developer/connecting/creds for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from hosts" -l ctl-tls-ca-file -d 'TLS CA file for CTL authentication. See https://docs.nats.io/using-nats/developer/connecting/tls for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from hosts" -l ctl-tls-first -d 'Perform TLS handshake before expecting the server greeting' -r -f -a "{true\t'',false\t''}"
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from hosts" -l js-domain -d 'JS domain for wasmcloud control interface. Defaults to None' -r
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from hosts" -s x -l lattice -d 'Lattice name for wasmcloud control interface, defaults to "default"' -r
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from hosts" -s t -l timeout-ms -d 'Timeout length to await a control interface response, defaults to 2000 milliseconds' -r
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from hosts" -l context -d 'Name of a context to use for CTL connection and authentication' -r
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from hosts" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from hosts" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from hosts" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from hosts" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from inventory" -s r -l ctl-host -d 'CTL Host for connection, defaults to 127.0.0.1 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from inventory" -s p -l ctl-port -d 'CTL Port for connections, defaults to 4222 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from inventory" -l ctl-jwt -d 'JWT file for CTL authentication. Must be supplied with ctl_seed' -r
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from inventory" -l ctl-seed -d 'Seed file or literal for CTL authentication. Must be supplied with ctl_jwt' -r
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from inventory" -l ctl-credsfile -d 'Credsfile for CTL authentication. Combines ctl_seed and ctl_jwt. See https://docs.nats.io/using-nats/developer/connecting/creds for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from inventory" -l ctl-tls-ca-file -d 'TLS CA file for CTL authentication. See https://docs.nats.io/using-nats/developer/connecting/tls for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from inventory" -l ctl-tls-first -d 'Perform TLS handshake before expecting the server greeting' -r -f -a "{true\t'',false\t''}"
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from inventory" -l js-domain -d 'JS domain for wasmcloud control interface. Defaults to None' -r
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from inventory" -s x -l lattice -d 'Lattice name for wasmcloud control interface, defaults to "default"' -r
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from inventory" -s t -l timeout-ms -d 'Timeout length to await a control interface response, defaults to 2000 milliseconds' -r
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from inventory" -l context -d 'Name of a context to use for CTL connection and authentication' -r
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from inventory" -s w -l watch -d 'Enables Real-time updates, duration can be specified in ms or in humantime (eg: 2s, 5m, 54ms). Defaults to 5000 milliseconds' -r
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from inventory" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from inventory" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from inventory" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from inventory" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from help" -f -a "links" -d 'Retrieve all known links in the lattice'
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from help" -f -a "claims" -d 'Retrieve all known claims inside the lattice'
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from help" -f -a "hosts" -d 'Retrieve all responsive hosts in the lattice'
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from help" -f -a "inventory" -d 'Retrieve inventory a given host on in the lattice'
complete -c wash -n "__fish_wash_using_subcommand get; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wash -n "__fish_wash_using_subcommand inspect" -s d -l digest -d 'Digest to verify artifact against (if OCI URL is provided for `<target>`)' -r
complete -c wash -n "__fish_wash_using_subcommand inspect" -s u -l user -d 'OCI username, if omitted anonymous authentication will be used' -r
complete -c wash -n "__fish_wash_using_subcommand inspect" -s p -l password -d 'OCI password, if omitted anonymous authentication will be used' -r
complete -c wash -n "__fish_wash_using_subcommand inspect" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand inspect" -l jwt-only -d 'Extract the raw JWT from the file and print to stdout'
complete -c wash -n "__fish_wash_using_subcommand inspect" -l wit -d 'Extract the WIT world from a component and print to stdout instead of the claims. When inspecting a provider archive, this flag will be ignored'
complete -c wash -n "__fish_wash_using_subcommand inspect" -l allow-latest -d 'Allow latest artifact tags (if OCI URL is provided for `<target>`)'
complete -c wash -n "__fish_wash_using_subcommand inspect" -l insecure -d 'Allow insecure (HTTP) registry connections'
complete -c wash -n "__fish_wash_using_subcommand inspect" -l insecure-skip-tls-verify -d 'Skip checking OCI registry\'s certificate for validity'
complete -c wash -n "__fish_wash_using_subcommand inspect" -l no-cache -d 'skip the local OCI cache and pull the artifact from the registry to inspect'
complete -c wash -n "__fish_wash_using_subcommand inspect" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand inspect" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand inspect" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand keys; and not __fish_seen_subcommand_from gen get list help" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand keys; and not __fish_seen_subcommand_from gen get list help" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand keys; and not __fish_seen_subcommand_from gen get list help" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand keys; and not __fish_seen_subcommand_from gen get list help" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand keys; and not __fish_seen_subcommand_from gen get list help" -f -a "gen" -d 'Generates a keypair'
complete -c wash -n "__fish_wash_using_subcommand keys; and not __fish_seen_subcommand_from gen get list help" -f -a "get" -d 'Retrieves a keypair and prints the contents'
complete -c wash -n "__fish_wash_using_subcommand keys; and not __fish_seen_subcommand_from gen get list help" -f -a "list" -d 'Lists all keypairs in a directory'
complete -c wash -n "__fish_wash_using_subcommand keys; and not __fish_seen_subcommand_from gen get list help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wash -n "__fish_wash_using_subcommand keys; and __fish_seen_subcommand_from gen" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand keys; and __fish_seen_subcommand_from gen" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand keys; and __fish_seen_subcommand_from gen" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand keys; and __fish_seen_subcommand_from gen" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand keys; and __fish_seen_subcommand_from get" -s d -l directory -d 'Absolute path to where keypairs are stored. Defaults to `$HOME/.wash/keys`' -r -F
complete -c wash -n "__fish_wash_using_subcommand keys; and __fish_seen_subcommand_from get" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand keys; and __fish_seen_subcommand_from get" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand keys; and __fish_seen_subcommand_from get" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand keys; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand keys; and __fish_seen_subcommand_from list" -s d -l directory -d 'Absolute path to where keypairs are stored. Defaults to `$HOME/.wash/keys`' -r -F
complete -c wash -n "__fish_wash_using_subcommand keys; and __fish_seen_subcommand_from list" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand keys; and __fish_seen_subcommand_from list" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand keys; and __fish_seen_subcommand_from list" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand keys; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand keys; and __fish_seen_subcommand_from help" -f -a "gen" -d 'Generates a keypair'
complete -c wash -n "__fish_wash_using_subcommand keys; and __fish_seen_subcommand_from help" -f -a "get" -d 'Retrieves a keypair and prints the contents'
complete -c wash -n "__fish_wash_using_subcommand keys; and __fish_seen_subcommand_from help" -f -a "list" -d 'Lists all keypairs in a directory'
complete -c wash -n "__fish_wash_using_subcommand keys; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wash -n "__fish_wash_using_subcommand link; and not __fish_seen_subcommand_from query put del help" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand link; and not __fish_seen_subcommand_from query put del help" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand link; and not __fish_seen_subcommand_from query put del help" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand link; and not __fish_seen_subcommand_from query put del help" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand link; and not __fish_seen_subcommand_from query put del help" -f -a "query" -d 'Query all links, same as `wash get links`'
complete -c wash -n "__fish_wash_using_subcommand link; and not __fish_seen_subcommand_from query put del help" -f -a "put" -d 'Put a link from a source to a target on a given WIT interface'
complete -c wash -n "__fish_wash_using_subcommand link; and not __fish_seen_subcommand_from query put del help" -f -a "del" -d 'Delete a link'
complete -c wash -n "__fish_wash_using_subcommand link; and not __fish_seen_subcommand_from query put del help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from query" -s r -l ctl-host -d 'CTL Host for connection, defaults to 127.0.0.1 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from query" -s p -l ctl-port -d 'CTL Port for connections, defaults to 4222 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from query" -l ctl-jwt -d 'JWT file for CTL authentication. Must be supplied with ctl_seed' -r
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from query" -l ctl-seed -d 'Seed file or literal for CTL authentication. Must be supplied with ctl_jwt' -r
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from query" -l ctl-credsfile -d 'Credsfile for CTL authentication. Combines ctl_seed and ctl_jwt. See https://docs.nats.io/using-nats/developer/connecting/creds for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from query" -l ctl-tls-ca-file -d 'TLS CA file for CTL authentication. See https://docs.nats.io/using-nats/developer/connecting/tls for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from query" -l ctl-tls-first -d 'Perform TLS handshake before expecting the server greeting' -r -f -a "{true\t'',false\t''}"
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from query" -l js-domain -d 'JS domain for wasmcloud control interface. Defaults to None' -r
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from query" -s x -l lattice -d 'Lattice name for wasmcloud control interface, defaults to "default"' -r
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from query" -s t -l timeout-ms -d 'Timeout length to await a control interface response, defaults to 2000 milliseconds' -r
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from query" -l context -d 'Name of a context to use for CTL connection and authentication' -r
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from query" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from query" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from query" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from query" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from put" -s r -l ctl-host -d 'CTL Host for connection, defaults to 127.0.0.1 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from put" -s p -l ctl-port -d 'CTL Port for connections, defaults to 4222 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from put" -l ctl-jwt -d 'JWT file for CTL authentication. Must be supplied with ctl_seed' -r
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from put" -l ctl-seed -d 'Seed file or literal for CTL authentication. Must be supplied with ctl_jwt' -r
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from put" -l ctl-credsfile -d 'Credsfile for CTL authentication. Combines ctl_seed and ctl_jwt. See https://docs.nats.io/using-nats/developer/connecting/creds for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from put" -l ctl-tls-ca-file -d 'TLS CA file for CTL authentication. See https://docs.nats.io/using-nats/developer/connecting/tls for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from put" -l ctl-tls-first -d 'Perform TLS handshake before expecting the server greeting' -r -f -a "{true\t'',false\t''}"
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from put" -l js-domain -d 'JS domain for wasmcloud control interface. Defaults to None' -r
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from put" -s x -l lattice -d 'Lattice name for wasmcloud control interface, defaults to "default"' -r
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from put" -s t -l timeout-ms -d 'Timeout length to await a control interface response, defaults to 2000 milliseconds' -r
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from put" -l context -d 'Name of a context to use for CTL connection and authentication' -r
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from put" -l interface -d 'The interface of the link, e.g. "incoming-handler" in "wasi:http/incoming-handler"' -r
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from put" -l source-config -d 'List of named configuration to make available to the source' -r
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from put" -l target-config -d 'List of named configuration to make available to the target' -r
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from put" -s l -l link-name -d 'Link name, defaults to "default". Used for scenarios where a single source may have multiple links to the same target, or different targets with the same WIT namespace, package, and interface' -r
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from put" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from put" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from put" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from put" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from del" -s r -l ctl-host -d 'CTL Host for connection, defaults to 127.0.0.1 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from del" -s p -l ctl-port -d 'CTL Port for connections, defaults to 4222 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from del" -l ctl-jwt -d 'JWT file for CTL authentication. Must be supplied with ctl_seed' -r
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from del" -l ctl-seed -d 'Seed file or literal for CTL authentication. Must be supplied with ctl_jwt' -r
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from del" -l ctl-credsfile -d 'Credsfile for CTL authentication. Combines ctl_seed and ctl_jwt. See https://docs.nats.io/using-nats/developer/connecting/creds for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from del" -l ctl-tls-ca-file -d 'TLS CA file for CTL authentication. See https://docs.nats.io/using-nats/developer/connecting/tls for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from del" -l ctl-tls-first -d 'Perform TLS handshake before expecting the server greeting' -r -f -a "{true\t'',false\t''}"
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from del" -l js-domain -d 'JS domain for wasmcloud control interface. Defaults to None' -r
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from del" -s x -l lattice -d 'Lattice name for wasmcloud control interface, defaults to "default"' -r
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from del" -s t -l timeout-ms -d 'Timeout length to await a control interface response, defaults to 2000 milliseconds' -r
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from del" -l context -d 'Name of a context to use for CTL connection and authentication' -r
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from del" -s l -l link-name -d 'Link name, defaults to "default"' -r
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from del" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from del" -l all -d 'Delete all links present in the cluster (with prompt)'
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from del" -l force -d 'Force an operation that is otherwise seen as risky'
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from del" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from del" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from del" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from help" -f -a "query" -d 'Query all links, same as `wash get links`'
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from help" -f -a "put" -d 'Put a link from a source to a target on a given WIT interface'
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from help" -f -a "del" -d 'Delete a link'
complete -c wash -n "__fish_wash_using_subcommand link; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wash -n "__fish_wash_using_subcommand new; and not __fish_seen_subcommand_from component provider help" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand new; and not __fish_seen_subcommand_from component provider help" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand new; and not __fish_seen_subcommand_from component provider help" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand new; and not __fish_seen_subcommand_from component provider help" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand new; and not __fish_seen_subcommand_from component provider help" -f -a "component" -d 'Generate a wasmCloud component project'
complete -c wash -n "__fish_wash_using_subcommand new; and not __fish_seen_subcommand_from component provider help" -f -a "provider" -d 'Generate a new capability provider project'
complete -c wash -n "__fish_wash_using_subcommand new; and not __fish_seen_subcommand_from component provider help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wash -n "__fish_wash_using_subcommand new; and __fish_seen_subcommand_from component" -l git -d 'GitHub repository url. Requires \'git\' to be installed in PATH' -r
complete -c wash -n "__fish_wash_using_subcommand new; and __fish_seen_subcommand_from component" -l subfolder -d 'Optional subfolder of the git repository' -r
complete -c wash -n "__fish_wash_using_subcommand new; and __fish_seen_subcommand_from component" -l branch -d 'Optional github branch. Defaults to "main"' -r
complete -c wash -n "__fish_wash_using_subcommand new; and __fish_seen_subcommand_from component" -s p -l path -d 'Optional path for template project (alternative to --git)' -r -F
complete -c wash -n "__fish_wash_using_subcommand new; and __fish_seen_subcommand_from component" -s v -l values -d 'Optional path to file containing placeholder values' -r -F
complete -c wash -n "__fish_wash_using_subcommand new; and __fish_seen_subcommand_from component" -l favorites -d 'Favorites file - to use for project selection' -r -F
complete -c wash -n "__fish_wash_using_subcommand new; and __fish_seen_subcommand_from component" -s t -l template-name -d 'Template name - name of template to use' -r
complete -c wash -n "__fish_wash_using_subcommand new; and __fish_seen_subcommand_from component" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand new; and __fish_seen_subcommand_from component" -l silent -d 'Silent - do not prompt user. Placeholder values in the templates will be resolved from a \'--values\' file and placeholder defaults'
complete -c wash -n "__fish_wash_using_subcommand new; and __fish_seen_subcommand_from component" -l no-git-init -d 'Don\'t run \'git init\' on the new folder'
complete -c wash -n "__fish_wash_using_subcommand new; and __fish_seen_subcommand_from component" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand new; and __fish_seen_subcommand_from component" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand new; and __fish_seen_subcommand_from component" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand new; and __fish_seen_subcommand_from provider" -l git -d 'GitHub repository url. Requires \'git\' to be installed in PATH' -r
complete -c wash -n "__fish_wash_using_subcommand new; and __fish_seen_subcommand_from provider" -l subfolder -d 'Optional subfolder of the git repository' -r
complete -c wash -n "__fish_wash_using_subcommand new; and __fish_seen_subcommand_from provider" -l branch -d 'Optional github branch. Defaults to "main"' -r
complete -c wash -n "__fish_wash_using_subcommand new; and __fish_seen_subcommand_from provider" -s p -l path -d 'Optional path for template project (alternative to --git)' -r -F
complete -c wash -n "__fish_wash_using_subcommand new; and __fish_seen_subcommand_from provider" -s v -l values -d 'Optional path to file containing placeholder values' -r -F
complete -c wash -n "__fish_wash_using_subcommand new; and __fish_seen_subcommand_from provider" -l favorites -d 'Favorites file - to use for project selection' -r -F
complete -c wash -n "__fish_wash_using_subcommand new; and __fish_seen_subcommand_from provider" -s t -l template-name -d 'Template name - name of template to use' -r
complete -c wash -n "__fish_wash_using_subcommand new; and __fish_seen_subcommand_from provider" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand new; and __fish_seen_subcommand_from provider" -l silent -d 'Silent - do not prompt user. Placeholder values in the templates will be resolved from a \'--values\' file and placeholder defaults'
complete -c wash -n "__fish_wash_using_subcommand new; and __fish_seen_subcommand_from provider" -l no-git-init -d 'Don\'t run \'git init\' on the new folder'
complete -c wash -n "__fish_wash_using_subcommand new; and __fish_seen_subcommand_from provider" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand new; and __fish_seen_subcommand_from provider" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand new; and __fish_seen_subcommand_from provider" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand new; and __fish_seen_subcommand_from help" -f -a "component" -d 'Generate a wasmCloud component project'
complete -c wash -n "__fish_wash_using_subcommand new; and __fish_seen_subcommand_from help" -f -a "provider" -d 'Generate a new capability provider project'
complete -c wash -n "__fish_wash_using_subcommand new; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wash -n "__fish_wash_using_subcommand par; and not __fish_seen_subcommand_from create inspect insert help" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand par; and not __fish_seen_subcommand_from create inspect insert help" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand par; and not __fish_seen_subcommand_from create inspect insert help" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand par; and not __fish_seen_subcommand_from create inspect insert help" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand par; and not __fish_seen_subcommand_from create inspect insert help" -f -a "create" -d 'Build a provider archive file'
complete -c wash -n "__fish_wash_using_subcommand par; and not __fish_seen_subcommand_from create inspect insert help" -f -a "inspect" -d 'Inspect a provider archive file'
complete -c wash -n "__fish_wash_using_subcommand par; and not __fish_seen_subcommand_from create inspect insert help" -f -a "insert" -d 'Insert a provider into a provider archive file'
complete -c wash -n "__fish_wash_using_subcommand par; and not __fish_seen_subcommand_from create inspect insert help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from create" -s v -l vendor -d 'Vendor string to help identify the publisher of the provider (e.g. Redis, Cassandra, wasmcloud, etc). Not unique' -r
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from create" -s r -l revision -d 'Monotonically increasing revision number' -r
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from create" -l version -d 'Human friendly version string' -r
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from create" -s j -l schema -d 'Optional path to a JSON schema describing the link definition specification for this provider' -r -F
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from create" -s d -l directory -d 'Location of key files for signing. Defaults to $WASH_KEYS ($HOME/.wash/keys)' -r -F
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from create" -s i -l issuer -d 'Path to issuer seed key (account). If this flag is not provided, the will be sourced from $WASH_KEYS ($HOME/.wash/keys) or generated for you if it cannot be found' -r
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from create" -s s -l subject -d 'Path to subject seed key (service). If this flag is not provided, the will be sourced from $WASH_KEYS ($HOME/.wash/keys) or generated for you if it cannot be found' -r
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from create" -s n -l name -d 'Name of the capability provider' -r
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from create" -s a -l arch -d 'Architecture of provider binary in format ARCH-OS (e.g. x86_64-linux)' -r
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from create" -s b -l binary -d 'Path to provider binary for populating the archive' -r
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from create" -l destination -d 'File output destination path' -r
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from create" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from create" -l compress -d 'Include a compressed provider archive'
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from create" -l disable-keygen -d 'Disables autogeneration of signing keys'
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from create" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from create" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from inspect" -s d -l digest -d 'Digest to verify artifact against (if OCI URL is provided for `<archive>`)' -r
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from inspect" -s u -l user -d 'OCI username, if omitted anonymous authentication will be used' -r
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from inspect" -s p -l password -d 'OCI password, if omitted anonymous authentication will be used' -r
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from inspect" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from inspect" -l allow-latest -d 'Allow latest artifact tags (if OCI URL is provided for `<archive>`)'
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from inspect" -l insecure -d 'Allow insecure (HTTP) registry connections'
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from inspect" -l insecure-skip-tls-verify -d 'Skip checking OCI registry\'s certificate for validity'
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from inspect" -l no-cache -d 'skip the local OCI cache'
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from inspect" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from inspect" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from inspect" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from insert" -s a -l arch -d 'Architecture of binary in format ARCH-OS (e.g. x86_64-linux)' -r
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from insert" -s b -l binary -d 'Path to provider binary to insert into archive' -r
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from insert" -s d -l directory -d 'Location of key files for signing. Defaults to $WASH_KEYS ($HOME/.wash/keys)' -r -F
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from insert" -s i -l issuer -d 'Path to issuer seed key (account). If this flag is not provided, the will be sourced from $WASH_KEYS ($HOME/.wash/keys) or generated for you if it cannot be found' -r
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from insert" -s s -l subject -d 'Path to subject seed key (service). If this flag is not provided, the will be sourced from $WASH_KEYS ($HOME/.wash/keys) or generated for you if it cannot be found' -r
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from insert" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from insert" -l disable-keygen -d 'Disables autogeneration of signing keys'
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from insert" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from insert" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from insert" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from help" -f -a "create" -d 'Build a provider archive file'
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from help" -f -a "inspect" -d 'Inspect a provider archive file'
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from help" -f -a "insert" -d 'Insert a provider into a provider archive file'
complete -c wash -n "__fish_wash_using_subcommand par; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wash -n "__fish_wash_using_subcommand plugin; and not __fish_seen_subcommand_from install uninstall list help" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand plugin; and not __fish_seen_subcommand_from install uninstall list help" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand plugin; and not __fish_seen_subcommand_from install uninstall list help" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand plugin; and not __fish_seen_subcommand_from install uninstall list help" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand plugin; and not __fish_seen_subcommand_from install uninstall list help" -f -a "install" -d 'Install a wash plugin'
complete -c wash -n "__fish_wash_using_subcommand plugin; and not __fish_seen_subcommand_from install uninstall list help" -f -a "uninstall" -d 'Uninstall a plugin'
complete -c wash -n "__fish_wash_using_subcommand plugin; and not __fish_seen_subcommand_from install uninstall list help" -f -a "list" -d 'List installed plugins'
complete -c wash -n "__fish_wash_using_subcommand plugin; and not __fish_seen_subcommand_from install uninstall list help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wash -n "__fish_wash_using_subcommand plugin; and __fish_seen_subcommand_from install" -s u -l user -d 'OCI username, if omitted anonymous authentication will be used' -r
complete -c wash -n "__fish_wash_using_subcommand plugin; and __fish_seen_subcommand_from install" -s p -l password -d 'OCI password, if omitted anonymous authentication will be used' -r
complete -c wash -n "__fish_wash_using_subcommand plugin; and __fish_seen_subcommand_from install" -s d -l digest -d 'Digest to verify plugin against. For OCI manifests, this is the digest format used in the manifest. For other types of plugins, this is the SHA256 digest of the plugin binary' -r
complete -c wash -n "__fish_wash_using_subcommand plugin; and __fish_seen_subcommand_from install" -l plugin-dir -d 'Path to plugin directory. Defaults to $HOME/.wash/plugins' -r -F
complete -c wash -n "__fish_wash_using_subcommand plugin; and __fish_seen_subcommand_from install" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand plugin; and __fish_seen_subcommand_from install" -l insecure -d 'Allow insecure (HTTP) registry connections'
complete -c wash -n "__fish_wash_using_subcommand plugin; and __fish_seen_subcommand_from install" -l insecure-skip-tls-verify -d 'Skip checking server\'s certificate for validity'
complete -c wash -n "__fish_wash_using_subcommand plugin; and __fish_seen_subcommand_from install" -l allow-latest -d 'Allow latest artifact tags (if pulling from OCI registry)'
complete -c wash -n "__fish_wash_using_subcommand plugin; and __fish_seen_subcommand_from install" -l update -d 'Whether or not to update the plugin if it is already installed. Defaults to false'
complete -c wash -n "__fish_wash_using_subcommand plugin; and __fish_seen_subcommand_from install" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand plugin; and __fish_seen_subcommand_from install" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand plugin; and __fish_seen_subcommand_from install" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand plugin; and __fish_seen_subcommand_from uninstall" -l plugin-dir -d 'Path to plugin directory. Defaults to $HOME/.wash/plugins' -r -F
complete -c wash -n "__fish_wash_using_subcommand plugin; and __fish_seen_subcommand_from uninstall" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand plugin; and __fish_seen_subcommand_from uninstall" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand plugin; and __fish_seen_subcommand_from uninstall" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand plugin; and __fish_seen_subcommand_from uninstall" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand plugin; and __fish_seen_subcommand_from list" -l plugin-dir -d 'Path to plugin directory. Defaults to $HOME/.wash/plugins' -r -F
complete -c wash -n "__fish_wash_using_subcommand plugin; and __fish_seen_subcommand_from list" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand plugin; and __fish_seen_subcommand_from list" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand plugin; and __fish_seen_subcommand_from list" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand plugin; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand plugin; and __fish_seen_subcommand_from help" -f -a "install" -d 'Install a wash plugin'
complete -c wash -n "__fish_wash_using_subcommand plugin; and __fish_seen_subcommand_from help" -f -a "uninstall" -d 'Uninstall a plugin'
complete -c wash -n "__fish_wash_using_subcommand plugin; and __fish_seen_subcommand_from help" -f -a "list" -d 'List installed plugins'
complete -c wash -n "__fish_wash_using_subcommand plugin; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wash -n "__fish_wash_using_subcommand push" -s r -l registry -d 'Registry of artifact. This is only needed if the URL is not a full (OCI) artifact URL (ie, missing the registry fragment)' -r
complete -c wash -n "__fish_wash_using_subcommand push" -s c -l config -d 'Path to OCI config file, if omitted will default to a blank configuration' -r -F
complete -c wash -n "__fish_wash_using_subcommand push" -s a -l annotation -d 'Optional set of annotations to apply to the OCI artifact manifest' -r
complete -c wash -n "__fish_wash_using_subcommand push" -s u -l user -d 'OCI username, if omitted anonymous authentication will be used' -r
complete -c wash -n "__fish_wash_using_subcommand push" -s p -l password -d 'OCI password, if omitted anonymous authentication will be used' -r
complete -c wash -n "__fish_wash_using_subcommand push" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand push" -l allow-latest -d 'Allow latest artifact tags'
complete -c wash -n "__fish_wash_using_subcommand push" -l insecure -d 'Allow insecure (HTTP) registry connections'
complete -c wash -n "__fish_wash_using_subcommand push" -l insecure-skip-tls-verify -d 'Skip checking server\'s certificate for validity'
complete -c wash -n "__fish_wash_using_subcommand push" -l monolithic-push -d 'Push the artifact monolithically instead of chunked'
complete -c wash -n "__fish_wash_using_subcommand push" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand push" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand push" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand pull" -l destination -d 'File destination of artifact' -r
complete -c wash -n "__fish_wash_using_subcommand pull" -s r -l registry -d 'Registry of artifact. This is only needed if the URL is not a full (OCI) artifact URL (ie, missing the registry fragment)' -r
complete -c wash -n "__fish_wash_using_subcommand pull" -s d -l digest -d 'Digest to verify artifact against' -r
complete -c wash -n "__fish_wash_using_subcommand pull" -s u -l user -d 'OCI username, if omitted anonymous authentication will be used' -r
complete -c wash -n "__fish_wash_using_subcommand pull" -s p -l password -d 'OCI password, if omitted anonymous authentication will be used' -r
complete -c wash -n "__fish_wash_using_subcommand pull" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand pull" -l allow-latest -d 'Allow latest artifact tags'
complete -c wash -n "__fish_wash_using_subcommand pull" -l insecure -d 'Allow insecure (HTTP) registry connections'
complete -c wash -n "__fish_wash_using_subcommand pull" -l insecure-skip-tls-verify -d 'Skip checking server\'s certificate for validity'
complete -c wash -n "__fish_wash_using_subcommand pull" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand pull" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand pull" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand secrets; and not __fish_seen_subcommand_from put get del help" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand secrets; and not __fish_seen_subcommand_from put get del help" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand secrets; and not __fish_seen_subcommand_from put get del help" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand secrets; and not __fish_seen_subcommand_from put get del help" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand secrets; and not __fish_seen_subcommand_from put get del help" -f -a "put" -d 'Put secret reference'
complete -c wash -n "__fish_wash_using_subcommand secrets; and not __fish_seen_subcommand_from put get del help" -f -a "get" -d 'Get a secret reference by name'
complete -c wash -n "__fish_wash_using_subcommand secrets; and not __fish_seen_subcommand_from put get del help" -f -a "del" -d 'Delete a secret reference by name'
complete -c wash -n "__fish_wash_using_subcommand secrets; and not __fish_seen_subcommand_from put get del help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from put" -s r -l ctl-host -d 'CTL Host for connection, defaults to 127.0.0.1 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from put" -s p -l ctl-port -d 'CTL Port for connections, defaults to 4222 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from put" -l ctl-jwt -d 'JWT file for CTL authentication. Must be supplied with ctl_seed' -r
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from put" -l ctl-seed -d 'Seed file or literal for CTL authentication. Must be supplied with ctl_jwt' -r
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from put" -l ctl-credsfile -d 'Credsfile for CTL authentication. Combines ctl_seed and ctl_jwt. See https://docs.nats.io/using-nats/developer/connecting/creds for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from put" -l ctl-tls-ca-file -d 'TLS CA file for CTL authentication. See https://docs.nats.io/using-nats/developer/connecting/tls for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from put" -l ctl-tls-first -d 'Perform TLS handshake before expecting the server greeting' -r -f -a "{true\t'',false\t''}"
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from put" -l js-domain -d 'JS domain for wasmcloud control interface. Defaults to None' -r
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from put" -s x -l lattice -d 'Lattice name for wasmcloud control interface, defaults to "default"' -r
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from put" -s t -l timeout-ms -d 'Timeout length to await a control interface response, defaults to 2000 milliseconds' -r
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from put" -l context -d 'Name of a context to use for CTL connection and authentication' -r
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from put" -l field -d 'The field to use for retrieving the secret from the backend' -r
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from put" -s v -l version -d 'The version of the secret to retrieve. If not supplied, the latest version will be used' -r
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from put" -l property -d 'Freeform policy properties to pass to the secrets backend, in the form of `key=value`. Can be specified multiple times' -r
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from put" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from put" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from put" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from put" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from get" -s r -l ctl-host -d 'CTL Host for connection, defaults to 127.0.0.1 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from get" -s p -l ctl-port -d 'CTL Port for connections, defaults to 4222 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from get" -l ctl-jwt -d 'JWT file for CTL authentication. Must be supplied with ctl_seed' -r
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from get" -l ctl-seed -d 'Seed file or literal for CTL authentication. Must be supplied with ctl_jwt' -r
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from get" -l ctl-credsfile -d 'Credsfile for CTL authentication. Combines ctl_seed and ctl_jwt. See https://docs.nats.io/using-nats/developer/connecting/creds for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from get" -l ctl-tls-ca-file -d 'TLS CA file for CTL authentication. See https://docs.nats.io/using-nats/developer/connecting/tls for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from get" -l ctl-tls-first -d 'Perform TLS handshake before expecting the server greeting' -r -f -a "{true\t'',false\t''}"
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from get" -l js-domain -d 'JS domain for wasmcloud control interface. Defaults to None' -r
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from get" -s x -l lattice -d 'Lattice name for wasmcloud control interface, defaults to "default"' -r
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from get" -s t -l timeout-ms -d 'Timeout length to await a control interface response, defaults to 2000 milliseconds' -r
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from get" -l context -d 'Name of a context to use for CTL connection and authentication' -r
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from get" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from get" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from get" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from del" -s r -l ctl-host -d 'CTL Host for connection, defaults to 127.0.0.1 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from del" -s p -l ctl-port -d 'CTL Port for connections, defaults to 4222 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from del" -l ctl-jwt -d 'JWT file for CTL authentication. Must be supplied with ctl_seed' -r
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from del" -l ctl-seed -d 'Seed file or literal for CTL authentication. Must be supplied with ctl_jwt' -r
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from del" -l ctl-credsfile -d 'Credsfile for CTL authentication. Combines ctl_seed and ctl_jwt. See https://docs.nats.io/using-nats/developer/connecting/creds for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from del" -l ctl-tls-ca-file -d 'TLS CA file for CTL authentication. See https://docs.nats.io/using-nats/developer/connecting/tls for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from del" -l ctl-tls-first -d 'Perform TLS handshake before expecting the server greeting' -r -f -a "{true\t'',false\t''}"
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from del" -l js-domain -d 'JS domain for wasmcloud control interface. Defaults to None' -r
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from del" -s x -l lattice -d 'Lattice name for wasmcloud control interface, defaults to "default"' -r
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from del" -s t -l timeout-ms -d 'Timeout length to await a control interface response, defaults to 2000 milliseconds' -r
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from del" -l context -d 'Name of a context to use for CTL connection and authentication' -r
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from del" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from del" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from del" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from del" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from help" -f -a "put" -d 'Put secret reference'
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from help" -f -a "get" -d 'Get a secret reference by name'
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from help" -f -a "del" -d 'Delete a secret reference by name'
complete -c wash -n "__fish_wash_using_subcommand secrets; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wash -n "__fish_wash_using_subcommand spy" -s r -l ctl-host -d 'CTL Host for connection, defaults to 127.0.0.1 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand spy" -s p -l ctl-port -d 'CTL Port for connections, defaults to 4222 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand spy" -l ctl-jwt -d 'JWT file for CTL authentication. Must be supplied with ctl_seed' -r
complete -c wash -n "__fish_wash_using_subcommand spy" -l ctl-seed -d 'Seed file or literal for CTL authentication. Must be supplied with ctl_jwt' -r
complete -c wash -n "__fish_wash_using_subcommand spy" -l ctl-credsfile -d 'Credsfile for CTL authentication. Combines ctl_seed and ctl_jwt. See https://docs.nats.io/using-nats/developer/connecting/creds for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand spy" -l ctl-tls-ca-file -d 'TLS CA file for CTL authentication. See https://docs.nats.io/using-nats/developer/connecting/tls for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand spy" -l ctl-tls-first -d 'Perform TLS handshake before expecting the server greeting' -r -f -a "{true\t'',false\t''}"
complete -c wash -n "__fish_wash_using_subcommand spy" -l js-domain -d 'JS domain for wasmcloud control interface. Defaults to None' -r
complete -c wash -n "__fish_wash_using_subcommand spy" -s x -l lattice -d 'Lattice name for wasmcloud control interface, defaults to "default"' -r
complete -c wash -n "__fish_wash_using_subcommand spy" -s t -l timeout-ms -d 'Timeout length to await a control interface response, defaults to 2000 milliseconds' -r
complete -c wash -n "__fish_wash_using_subcommand spy" -l context -d 'Name of a context to use for CTL connection and authentication' -r
complete -c wash -n "__fish_wash_using_subcommand spy" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand spy" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand spy" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand spy" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand scale; and not __fish_seen_subcommand_from component help" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand scale; and not __fish_seen_subcommand_from component help" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand scale; and not __fish_seen_subcommand_from component help" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand scale; and not __fish_seen_subcommand_from component help" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand scale; and not __fish_seen_subcommand_from component help" -f -a "component" -d 'Scale a component running in a host to a certain level of concurrency'
complete -c wash -n "__fish_wash_using_subcommand scale; and not __fish_seen_subcommand_from component help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wash -n "__fish_wash_using_subcommand scale; and __fish_seen_subcommand_from component" -s r -l ctl-host -d 'CTL Host for connection, defaults to 127.0.0.1 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand scale; and __fish_seen_subcommand_from component" -s p -l ctl-port -d 'CTL Port for connections, defaults to 4222 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand scale; and __fish_seen_subcommand_from component" -l ctl-jwt -d 'JWT file for CTL authentication. Must be supplied with ctl_seed' -r
complete -c wash -n "__fish_wash_using_subcommand scale; and __fish_seen_subcommand_from component" -l ctl-seed -d 'Seed file or literal for CTL authentication. Must be supplied with ctl_jwt' -r
complete -c wash -n "__fish_wash_using_subcommand scale; and __fish_seen_subcommand_from component" -l ctl-credsfile -d 'Credsfile for CTL authentication. Combines ctl_seed and ctl_jwt. See https://docs.nats.io/using-nats/developer/connecting/creds for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand scale; and __fish_seen_subcommand_from component" -l ctl-tls-ca-file -d 'TLS CA file for CTL authentication. See https://docs.nats.io/using-nats/developer/connecting/tls for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand scale; and __fish_seen_subcommand_from component" -l ctl-tls-first -d 'Perform TLS handshake before expecting the server greeting' -r -f -a "{true\t'',false\t''}"
complete -c wash -n "__fish_wash_using_subcommand scale; and __fish_seen_subcommand_from component" -l js-domain -d 'JS domain for wasmcloud control interface. Defaults to None' -r
complete -c wash -n "__fish_wash_using_subcommand scale; and __fish_seen_subcommand_from component" -s x -l lattice -d 'Lattice name for wasmcloud control interface, defaults to "default"' -r
complete -c wash -n "__fish_wash_using_subcommand scale; and __fish_seen_subcommand_from component" -s t -l timeout-ms -d 'Timeout length to await a control interface response, defaults to 2000 milliseconds' -r
complete -c wash -n "__fish_wash_using_subcommand scale; and __fish_seen_subcommand_from component" -l context -d 'Name of a context to use for CTL connection and authentication' -r
complete -c wash -n "__fish_wash_using_subcommand scale; and __fish_seen_subcommand_from component" -s c -l max-instances -d 'Maximum number of component instances allowed to run concurrently. Setting this value to `0` will stop the component' -r
complete -c wash -n "__fish_wash_using_subcommand scale; and __fish_seen_subcommand_from component" -s a -l annotations -d 'Optional set of annotations used to describe the nature of this component scale command. For example, autonomous agents may wish to “tag” scale requests as part of a given deployment' -r
complete -c wash -n "__fish_wash_using_subcommand scale; and __fish_seen_subcommand_from component" -l config -d 'List of named configuration to apply to the component, may be empty' -r
complete -c wash -n "__fish_wash_using_subcommand scale; and __fish_seen_subcommand_from component" -l wait-timeout-ms -d 'Timeout for waiting for scale to occur (normally on an auction response), defaults to 2000 milliseconds' -r
complete -c wash -n "__fish_wash_using_subcommand scale; and __fish_seen_subcommand_from component" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand scale; and __fish_seen_subcommand_from component" -l skip-wait -d 'By default, the command will wait until the component has been scaled. If this flag is passed, the command will return immediately after acknowledgement from the host, without waiting for the component to be scaled. If this flag is omitted, the command will wait until the scaled event has been acknowledged'
complete -c wash -n "__fish_wash_using_subcommand scale; and __fish_seen_subcommand_from component" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand scale; and __fish_seen_subcommand_from component" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand scale; and __fish_seen_subcommand_from component" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand scale; and __fish_seen_subcommand_from help" -f -a "component" -d 'Scale a component running in a host to a certain level of concurrency'
complete -c wash -n "__fish_wash_using_subcommand scale; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wash -n "__fish_wash_using_subcommand start; and not __fish_seen_subcommand_from component provider help" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand start; and not __fish_seen_subcommand_from component provider help" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand start; and not __fish_seen_subcommand_from component provider help" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand start; and not __fish_seen_subcommand_from component provider help" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand start; and not __fish_seen_subcommand_from component provider help" -f -a "component" -d 'Launch a component in a host'
complete -c wash -n "__fish_wash_using_subcommand start; and not __fish_seen_subcommand_from component provider help" -f -a "provider" -d 'Launch a provider in a host'
complete -c wash -n "__fish_wash_using_subcommand start; and not __fish_seen_subcommand_from component provider help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from component" -s r -l ctl-host -d 'CTL Host for connection, defaults to 127.0.0.1 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from component" -s p -l ctl-port -d 'CTL Port for connections, defaults to 4222 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from component" -l ctl-jwt -d 'JWT file for CTL authentication. Must be supplied with ctl_seed' -r
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from component" -l ctl-seed -d 'Seed file or literal for CTL authentication. Must be supplied with ctl_jwt' -r
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from component" -l ctl-credsfile -d 'Credsfile for CTL authentication. Combines ctl_seed and ctl_jwt. See https://docs.nats.io/using-nats/developer/connecting/creds for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from component" -l ctl-tls-ca-file -d 'TLS CA file for CTL authentication. See https://docs.nats.io/using-nats/developer/connecting/tls for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from component" -l ctl-tls-first -d 'Perform TLS handshake before expecting the server greeting' -r -f -a "{true\t'',false\t''}"
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from component" -l js-domain -d 'JS domain for wasmcloud control interface. Defaults to None' -r
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from component" -s x -l lattice -d 'Lattice name for wasmcloud control interface, defaults to "default"' -r
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from component" -s t -l timeout-ms -d 'Timeout length to await a control interface response, defaults to 2000 milliseconds' -r
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from component" -l context -d 'Name of a context to use for CTL connection and authentication' -r
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from component" -l host-id -d 'Id of host or a string to match on the friendly name of a host. if omitted the component will be auctioned in the lattice to find a suitable host. If a string is supplied to match against, then the matching host ID will be used. If more than one host matches, then an error will be returned' -r
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from component" -l max-instances -d 'Maximum number of instances this component can run concurrently' -r
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from component" -s c -l constraint -d 'Constraints for component auction in the form of "label=value". If host-id is supplied, this list is ignored' -r
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from component" -l auction-timeout-ms -d 'Timeout to await an auction response, defaults to 2000 milliseconds' -r
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from component" -l config -d 'List of named configuration to apply to the component, may be empty' -r
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from component" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from component" -l skip-wait -d 'By default, the command will wait until the component has been started. If this flag is passed, the command will return immediately after acknowledgement from the host, without waiting for the component to start. If this flag is omitted, the timeout will be adjusted to 5 seconds to account for component download times'
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from component" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from component" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from component" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from provider" -s r -l ctl-host -d 'CTL Host for connection, defaults to 127.0.0.1 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from provider" -s p -l ctl-port -d 'CTL Port for connections, defaults to 4222 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from provider" -l ctl-jwt -d 'JWT file for CTL authentication. Must be supplied with ctl_seed' -r
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from provider" -l ctl-seed -d 'Seed file or literal for CTL authentication. Must be supplied with ctl_jwt' -r
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from provider" -l ctl-credsfile -d 'Credsfile for CTL authentication. Combines ctl_seed and ctl_jwt. See https://docs.nats.io/using-nats/developer/connecting/creds for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from provider" -l ctl-tls-ca-file -d 'TLS CA file for CTL authentication. See https://docs.nats.io/using-nats/developer/connecting/tls for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from provider" -l ctl-tls-first -d 'Perform TLS handshake before expecting the server greeting' -r -f -a "{true\t'',false\t''}"
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from provider" -l js-domain -d 'JS domain for wasmcloud control interface. Defaults to None' -r
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from provider" -s x -l lattice -d 'Lattice name for wasmcloud control interface, defaults to "default"' -r
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from provider" -s t -l timeout-ms -d 'Timeout length to await a control interface response, defaults to 2000 milliseconds' -r
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from provider" -l context -d 'Name of a context to use for CTL connection and authentication' -r
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from provider" -l host-id -d 'Id of host or a string to match on the friendly name of a host. if omitted the provider will be auctioned in the lattice to find a suitable host. If a string is supplied to match against, then the matching host ID will be used. If more than one host matches, then an error will be returned' -r
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from provider" -s l -l link-name -d 'Link name of provider' -r
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from provider" -s c -l constraint -d 'Constraints for provider auction in the form of "label=value". If host-id is supplied, this list is ignored' -r
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from provider" -l auction-timeout-ms -d 'Timeout to await an auction response, defaults to 2000 milliseconds' -r
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from provider" -l config -d 'List of named configuration to apply to the provider, may be empty' -r
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from provider" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from provider" -l skip-wait -d 'By default, the command will wait until the provider has been started. If this flag is passed, the command will return immediately after acknowledgement from the host, without waiting for the provider to start. If this flag is omitted, the timeout will be adjusted to 30 seconds to account for provider download times'
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from provider" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from provider" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from provider" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from help" -f -a "component" -d 'Launch a component in a host'
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from help" -f -a "provider" -d 'Launch a provider in a host'
complete -c wash -n "__fish_wash_using_subcommand start; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wash -n "__fish_wash_using_subcommand stop; and not __fish_seen_subcommand_from component provider host help" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand stop; and not __fish_seen_subcommand_from component provider host help" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand stop; and not __fish_seen_subcommand_from component provider host help" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand stop; and not __fish_seen_subcommand_from component provider host help" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand stop; and not __fish_seen_subcommand_from component provider host help" -f -a "component" -d 'Stop a component running in a host'
complete -c wash -n "__fish_wash_using_subcommand stop; and not __fish_seen_subcommand_from component provider host help" -f -a "provider" -d 'Stop a provider running in a host'
complete -c wash -n "__fish_wash_using_subcommand stop; and not __fish_seen_subcommand_from component provider host help" -f -a "host" -d 'Purge and stop a running host'
complete -c wash -n "__fish_wash_using_subcommand stop; and not __fish_seen_subcommand_from component provider host help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from component" -s r -l ctl-host -d 'CTL Host for connection, defaults to 127.0.0.1 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from component" -s p -l ctl-port -d 'CTL Port for connections, defaults to 4222 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from component" -l ctl-jwt -d 'JWT file for CTL authentication. Must be supplied with ctl_seed' -r
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from component" -l ctl-seed -d 'Seed file or literal for CTL authentication. Must be supplied with ctl_jwt' -r
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from component" -l ctl-credsfile -d 'Credsfile for CTL authentication. Combines ctl_seed and ctl_jwt. See https://docs.nats.io/using-nats/developer/connecting/creds for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from component" -l ctl-tls-ca-file -d 'TLS CA file for CTL authentication. See https://docs.nats.io/using-nats/developer/connecting/tls for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from component" -l ctl-tls-first -d 'Perform TLS handshake before expecting the server greeting' -r -f -a "{true\t'',false\t''}"
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from component" -l js-domain -d 'JS domain for wasmcloud control interface. Defaults to None' -r
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from component" -s x -l lattice -d 'Lattice name for wasmcloud control interface, defaults to "default"' -r
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from component" -s t -l timeout-ms -d 'Timeout length to await a control interface response, defaults to 2000 milliseconds' -r
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from component" -l context -d 'Name of a context to use for CTL connection and authentication' -r
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from component" -l host-id -d 'Id of host to stop component on. If a non-ID is provided, the host will be selected based on matching the prefix of the ID or the friendly name and will return an error if more than one host matches. If no host ID is passed, a host will be selected based on whether or not the component is running on it. If more than 1 host is running this component, an error will be returned with a list of hosts running the component' -r
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from component" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from component" -l skip-wait -d 'By default, the command will wait until the component has been stopped. If this flag is passed, the command will return immediately after acknowledgement from the host, without waiting for the component to stp[]'
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from component" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from component" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from component" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from provider" -s r -l ctl-host -d 'CTL Host for connection, defaults to 127.0.0.1 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from provider" -s p -l ctl-port -d 'CTL Port for connections, defaults to 4222 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from provider" -l ctl-jwt -d 'JWT file for CTL authentication. Must be supplied with ctl_seed' -r
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from provider" -l ctl-seed -d 'Seed file or literal for CTL authentication. Must be supplied with ctl_jwt' -r
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from provider" -l ctl-credsfile -d 'Credsfile for CTL authentication. Combines ctl_seed and ctl_jwt. See https://docs.nats.io/using-nats/developer/connecting/creds for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from provider" -l ctl-tls-ca-file -d 'TLS CA file for CTL authentication. See https://docs.nats.io/using-nats/developer/connecting/tls for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from provider" -l ctl-tls-first -d 'Perform TLS handshake before expecting the server greeting' -r -f -a "{true\t'',false\t''}"
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from provider" -l js-domain -d 'JS domain for wasmcloud control interface. Defaults to None' -r
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from provider" -s x -l lattice -d 'Lattice name for wasmcloud control interface, defaults to "default"' -r
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from provider" -s t -l timeout-ms -d 'Timeout length to await a control interface response, defaults to 2000 milliseconds' -r
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from provider" -l context -d 'Name of a context to use for CTL connection and authentication' -r
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from provider" -l host-id -d 'Id of host to stop provider on. If a non-ID is provided, the host will be selected based on matching the prefix of the ID or the friendly name and will return an error if more than one host matches. If no host ID is passed, a host will be selected based on whether or not the provider is running on it. If more than 1 host is running this provider, an error will be returned with a list of hosts running the provider' -r
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from provider" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from provider" -l skip-wait -d 'By default, the command will wait until the provider has been stopped. If this flag is passed, the command will return immediately after acknowledgement from the host, without waiting for the provider to stop'
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from provider" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from provider" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from provider" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from host" -s r -l ctl-host -d 'CTL Host for connection, defaults to 127.0.0.1 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from host" -s p -l ctl-port -d 'CTL Port for connections, defaults to 4222 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from host" -l ctl-jwt -d 'JWT file for CTL authentication. Must be supplied with ctl_seed' -r
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from host" -l ctl-seed -d 'Seed file or literal for CTL authentication. Must be supplied with ctl_jwt' -r
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from host" -l ctl-credsfile -d 'Credsfile for CTL authentication. Combines ctl_seed and ctl_jwt. See https://docs.nats.io/using-nats/developer/connecting/creds for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from host" -l ctl-tls-ca-file -d 'TLS CA file for CTL authentication. See https://docs.nats.io/using-nats/developer/connecting/tls for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from host" -l ctl-tls-first -d 'Perform TLS handshake before expecting the server greeting' -r -f -a "{true\t'',false\t''}"
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from host" -l js-domain -d 'JS domain for wasmcloud control interface. Defaults to None' -r
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from host" -s x -l lattice -d 'Lattice name for wasmcloud control interface, defaults to "default"' -r
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from host" -s t -l timeout-ms -d 'Timeout length to await a control interface response, defaults to 2000 milliseconds' -r
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from host" -l context -d 'Name of a context to use for CTL connection and authentication' -r
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from host" -l host-timeout -d 'The timeout in ms for how much time to give the host for graceful shutdown' -r
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from host" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from host" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from host" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from host" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from help" -f -a "component" -d 'Stop a component running in a host'
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from help" -f -a "provider" -d 'Stop a provider running in a host'
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from help" -f -a "host" -d 'Purge and stop a running host'
complete -c wash -n "__fish_wash_using_subcommand stop; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wash -n "__fish_wash_using_subcommand label" -s r -l ctl-host -d 'CTL Host for connection, defaults to 127.0.0.1 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand label" -s p -l ctl-port -d 'CTL Port for connections, defaults to 4222 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand label" -l ctl-jwt -d 'JWT file for CTL authentication. Must be supplied with ctl_seed' -r
complete -c wash -n "__fish_wash_using_subcommand label" -l ctl-seed -d 'Seed file or literal for CTL authentication. Must be supplied with ctl_jwt' -r
complete -c wash -n "__fish_wash_using_subcommand label" -l ctl-credsfile -d 'Credsfile for CTL authentication. Combines ctl_seed and ctl_jwt. See https://docs.nats.io/using-nats/developer/connecting/creds for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand label" -l ctl-tls-ca-file -d 'TLS CA file for CTL authentication. See https://docs.nats.io/using-nats/developer/connecting/tls for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand label" -l ctl-tls-first -d 'Perform TLS handshake before expecting the server greeting' -r -f -a "{true\t'',false\t''}"
complete -c wash -n "__fish_wash_using_subcommand label" -l js-domain -d 'JS domain for wasmcloud control interface. Defaults to None' -r
complete -c wash -n "__fish_wash_using_subcommand label" -s x -l lattice -d 'Lattice name for wasmcloud control interface, defaults to "default"' -r
complete -c wash -n "__fish_wash_using_subcommand label" -s t -l timeout-ms -d 'Timeout length to await a control interface response, defaults to 2000 milliseconds' -r
complete -c wash -n "__fish_wash_using_subcommand label" -l context -d 'Name of a context to use for CTL connection and authentication' -r
complete -c wash -n "__fish_wash_using_subcommand label" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand label" -l delete -d 'Delete the label, instead of adding it'
complete -c wash -n "__fish_wash_using_subcommand label" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand label" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand label" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand update; and not __fish_seen_subcommand_from component help" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand update; and not __fish_seen_subcommand_from component help" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand update; and not __fish_seen_subcommand_from component help" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand update; and not __fish_seen_subcommand_from component help" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand update; and not __fish_seen_subcommand_from component help" -f -a "component" -d 'Update a component running in a host to a newer version'
complete -c wash -n "__fish_wash_using_subcommand update; and not __fish_seen_subcommand_from component help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wash -n "__fish_wash_using_subcommand update; and __fish_seen_subcommand_from component" -s r -l ctl-host -d 'CTL Host for connection, defaults to 127.0.0.1 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand update; and __fish_seen_subcommand_from component" -s p -l ctl-port -d 'CTL Port for connections, defaults to 4222 for local nats' -r
complete -c wash -n "__fish_wash_using_subcommand update; and __fish_seen_subcommand_from component" -l ctl-jwt -d 'JWT file for CTL authentication. Must be supplied with ctl_seed' -r
complete -c wash -n "__fish_wash_using_subcommand update; and __fish_seen_subcommand_from component" -l ctl-seed -d 'Seed file or literal for CTL authentication. Must be supplied with ctl_jwt' -r
complete -c wash -n "__fish_wash_using_subcommand update; and __fish_seen_subcommand_from component" -l ctl-credsfile -d 'Credsfile for CTL authentication. Combines ctl_seed and ctl_jwt. See https://docs.nats.io/using-nats/developer/connecting/creds for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand update; and __fish_seen_subcommand_from component" -l ctl-tls-ca-file -d 'TLS CA file for CTL authentication. See https://docs.nats.io/using-nats/developer/connecting/tls for details' -r -F
complete -c wash -n "__fish_wash_using_subcommand update; and __fish_seen_subcommand_from component" -l ctl-tls-first -d 'Perform TLS handshake before expecting the server greeting' -r -f -a "{true\t'',false\t''}"
complete -c wash -n "__fish_wash_using_subcommand update; and __fish_seen_subcommand_from component" -l js-domain -d 'JS domain for wasmcloud control interface. Defaults to None' -r
complete -c wash -n "__fish_wash_using_subcommand update; and __fish_seen_subcommand_from component" -s x -l lattice -d 'Lattice name for wasmcloud control interface, defaults to "default"' -r
complete -c wash -n "__fish_wash_using_subcommand update; and __fish_seen_subcommand_from component" -s t -l timeout-ms -d 'Timeout length to await a control interface response, defaults to 2000 milliseconds' -r
complete -c wash -n "__fish_wash_using_subcommand update; and __fish_seen_subcommand_from component" -l context -d 'Name of a context to use for CTL connection and authentication' -r
complete -c wash -n "__fish_wash_using_subcommand update; and __fish_seen_subcommand_from component" -l host-id -d 'ID of host to update the component on. If a non-ID is provided, the host will be selected based on matching the prefix of the ID or the friendly name and will return an error if more than one host matches. If no host ID is passed, a host will be selected based on whether or not the component is running on it. If more than 1 host is running this component, an error will be returned with a list of hosts running the component' -r
complete -c wash -n "__fish_wash_using_subcommand update; and __fish_seen_subcommand_from component" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand update; and __fish_seen_subcommand_from component" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand update; and __fish_seen_subcommand_from component" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand update; and __fish_seen_subcommand_from component" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand update; and __fish_seen_subcommand_from help" -f -a "component" -d 'Update a component running in a host to a newer version'
complete -c wash -n "__fish_wash_using_subcommand update; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wash -n "__fish_wash_using_subcommand up" -l nats-credsfile -d 'Optional path to a NATS credentials file to authenticate and extend existing NATS infrastructure' -r -F
complete -c wash -n "__fish_wash_using_subcommand up" -l nats-config-file -d 'Optional path to a NATS config file NOTE: If your configuration changes the address or port to listen on from 0.0.0.0:4222, ensure you set --nats-host and --nats-port' -r -F
complete -c wash -n "__fish_wash_using_subcommand up" -l nats-remote-url -d 'Optional remote URL of existing NATS infrastructure to extend' -r
complete -c wash -n "__fish_wash_using_subcommand up" -l nats-version -d 'NATS server version to download, e.g. `v2.10.7`. See https://github.com/nats-io/nats-server/releases/ for releases' -r
complete -c wash -n "__fish_wash_using_subcommand up" -l nats-host -d 'NATS server host to connect to' -r
complete -c wash -n "__fish_wash_using_subcommand up" -l nats-port -d 'NATS server port to connect to. This will be used as the NATS listen port if `--nats-connect-only` isn\'t set' -r
complete -c wash -n "__fish_wash_using_subcommand up" -l nats-websocket-port -d 'NATS websocket port to use. TLS is not supported. This is required for the wash ui to connect from localhost' -r
complete -c wash -n "__fish_wash_using_subcommand up" -l nats-js-domain -d 'NATS Server Jetstream domain for extending superclusters' -r
complete -c wash -n "__fish_wash_using_subcommand up" -l wasmcloud-version -d 'wasmcloud host version to download, e.g. `v1.4.2`' -r
complete -c wash -n "__fish_wash_using_subcommand up" -s x -l lattice -d 'A unique identifier for a lattice, frequently used within NATS topics to isolate messages among different lattices' -r
complete -c wash -n "__fish_wash_using_subcommand up" -l host-seed -d 'The seed key (a printable 256-bit Ed25519 private key) used by this host to generate it\'s public key' -r
complete -c wash -n "__fish_wash_using_subcommand up" -l rpc-host -d 'An IP address or DNS name to use to connect to NATS for RPC messages, defaults to the value supplied to --nats-host if not supplied' -r
complete -c wash -n "__fish_wash_using_subcommand up" -l rpc-port -d 'A port to use to connect to NATS for RPC messages, defaults to the value supplied to --nats-port if not supplied' -r
complete -c wash -n "__fish_wash_using_subcommand up" -l rpc-seed -d 'A seed nkey to use to authenticate to NATS for RPC messages' -r
complete -c wash -n "__fish_wash_using_subcommand up" -l rpc-timeout-ms -d 'Timeout in milliseconds for all RPC calls' -r
complete -c wash -n "__fish_wash_using_subcommand up" -l rpc-jwt -d 'A user JWT to use to authenticate to NATS for RPC messages' -r
complete -c wash -n "__fish_wash_using_subcommand up" -l rpc-tls-ca-file -d 'A TLS CA file to use to authenticate to NATS for RPC messages' -r -F
complete -c wash -n "__fish_wash_using_subcommand up" -l rpc-credsfile -d 'Convenience flag for RPC authentication, internally this parses the JWT and seed from the credsfile' -r -F
complete -c wash -n "__fish_wash_using_subcommand up" -l ctl-host -d 'An IP address or DNS name to use to connect to NATS for Control Interface (CTL) messages, defaults to the value supplied to --nats-host if not supplied' -r
complete -c wash -n "__fish_wash_using_subcommand up" -l ctl-port -d 'A port to use to connect to NATS for CTL messages, defaults to the value supplied to --nats-port if not supplied' -r
complete -c wash -n "__fish_wash_using_subcommand up" -l ctl-seed -d 'A seed nkey to use to authenticate to NATS for CTL messages' -r
complete -c wash -n "__fish_wash_using_subcommand up" -l ctl-jwt -d 'A user JWT to use to authenticate to NATS for CTL messages' -r
complete -c wash -n "__fish_wash_using_subcommand up" -l ctl-credsfile -d 'Convenience flag for CTL authentication, internally this parses the JWT and seed from the credsfile' -r -F
complete -c wash -n "__fish_wash_using_subcommand up" -l ctl-tls-ca-file -d 'A TLS CA file to use to authenticate to NATS for CTL messages' -r -F
complete -c wash -n "__fish_wash_using_subcommand up" -l cluster-seed -d 'The seed key (a printable 256-bit Ed25519 private key) used by this host to sign all invocations' -r
complete -c wash -n "__fish_wash_using_subcommand up" -l cluster-issuers -d 'A comma-delimited list of public keys that can be used as issuers on signed invocations' -r
complete -c wash -n "__fish_wash_using_subcommand up" -l provider-delay -d 'Delay, in milliseconds, between requesting a provider shut down and forcibly terminating its process' -r
complete -c wash -n "__fish_wash_using_subcommand up" -l allowed-insecure -d 'A comma-separated list of OCI hosts to which insecure (non-TLS) connections are allowed' -r
complete -c wash -n "__fish_wash_using_subcommand up" -l wasmcloud-js-domain -d 'Jetstream domain name, configures a host to properly connect to a NATS supercluster' -r
complete -c wash -n "__fish_wash_using_subcommand up" -l allow-file-load -d 'Denotes if a wasmCloud host should allow starting components from the file system' -r -f -a "{true\t'',false\t''}"
complete -c wash -n "__fish_wash_using_subcommand up" -s l -l label -d 'A label to apply to the host, in the form of `key=value`. This flag can be repeated to supply multiple labels' -r
complete -c wash -n "__fish_wash_using_subcommand up" -l log-level -d 'Controls the verbosity of JSON structured logs from the wasmCloud host' -r
complete -c wash -n "__fish_wash_using_subcommand up" -l max-execution-time-ms -d 'Defines the Max Execution time (in ms) that the host runtime will execute for' -r
complete -c wash -n "__fish_wash_using_subcommand up" -l secrets-topic -d 'If provided, enables interfacing with a secrets backend for secret retrieval over the given topic prefix' -r
complete -c wash -n "__fish_wash_using_subcommand up" -l policy-topic -d 'If provided, enables policy checks on start actions and component invocations' -r
complete -c wash -n "__fish_wash_using_subcommand up" -l host-log-path -d 'Path to which to log information from the wasmCloud host' -r -F
complete -c wash -n "__fish_wash_using_subcommand up" -l host-path -d 'Path to a binary that should be used to start the wasmCloud host' -r -F
complete -c wash -n "__fish_wash_using_subcommand up" -l wadm-version -d 'wadm version to download, e.g. `v0.18.0`' -r
complete -c wash -n "__fish_wash_using_subcommand up" -l wadm-js-domain -d 'The JetStream domain to use for wadm' -r
complete -c wash -n "__fish_wash_using_subcommand up" -l wadm-manifest -d 'The path to a wadm application manifest to run while the host is up' -r -F
complete -c wash -n "__fish_wash_using_subcommand up" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand up" -s d -l detached -d 'Launch NATS and wasmCloud detached from the current terminal as background processes'
complete -c wash -n "__fish_wash_using_subcommand up" -l nats-connect-only -d 'If a connection can\'t be established, exit and don\'t start a NATS server. Will be ignored if a remote_url and credsfile are specified'
complete -c wash -n "__fish_wash_using_subcommand up" -l rpc-tls -d 'Optional flag to enable host communication with a NATS server over TLS for RPC messages'
complete -c wash -n "__fish_wash_using_subcommand up" -l rpc-tls-first -d 'Optional flag to enable performing TLS handshake before expecting the server greeting for RPC messages'
complete -c wash -n "__fish_wash_using_subcommand up" -l ctl-tls -d 'Optional flag to enable host communication with a NATS server over TLS for CTL messages'
complete -c wash -n "__fish_wash_using_subcommand up" -l ctl-tls-first -d 'Optional flag to enable performing TLS handshake before expecting the server greeting for CTL messages'
complete -c wash -n "__fish_wash_using_subcommand up" -l allow-latest -d 'Determines whether OCI images tagged latest are allowed to be pulled from OCI registries and started'
complete -c wash -n "__fish_wash_using_subcommand up" -l config-service-enabled -d 'Denotes if a wasmCloud host should issue requests to a config service on startup'
complete -c wash -n "__fish_wash_using_subcommand up" -l enable-structured-logging -d 'Enable JSON structured logging from the wasmCloud host'
complete -c wash -n "__fish_wash_using_subcommand up" -l enable-ipv6 -d 'Enables IPV6 addressing for wasmCloud hosts'
complete -c wash -n "__fish_wash_using_subcommand up" -l wasmcloud-start-only -d 'If enabled, wasmCloud will not be downloaded if it\'s not installed'
complete -c wash -n "__fish_wash_using_subcommand up" -l multi-local -d 'If enabled, allows starting additional wasmCloud hosts on this machine'
complete -c wash -n "__fish_wash_using_subcommand up" -l disable-wadm -d 'If enabled, wadm will not be downloaded or run as a part of the up command'
complete -c wash -n "__fish_wash_using_subcommand up" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand up" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand up" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c wash -n "__fish_wash_using_subcommand ui" -s p -l port -d 'Which port to run the UI on, defaults to 3030' -r
complete -c wash -n "__fish_wash_using_subcommand ui" -s v -l version -d 'Which version of the UI to run' -r
complete -c wash -n "__fish_wash_using_subcommand ui" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand ui" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand ui" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand ui" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand wit; and not __fish_seen_subcommand_from build deps publish help" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand wit; and not __fish_seen_subcommand_from build deps publish help" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand wit; and not __fish_seen_subcommand_from build deps publish help" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand wit; and not __fish_seen_subcommand_from build deps publish help" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand wit; and not __fish_seen_subcommand_from build deps publish help" -f -a "build" -d 'Build a WIT package from a directory. By default, this will fetch all dependencies needed and encode them in the WIT package. This will generate a lock file that can be used to fetch the dependencies in the future'
complete -c wash -n "__fish_wash_using_subcommand wit; and not __fish_seen_subcommand_from build deps publish help" -f -a "deps" -d 'Fetch dependencies for a component'
complete -c wash -n "__fish_wash_using_subcommand wit; and not __fish_seen_subcommand_from build deps publish help" -f -a "publish" -d 'Publish a WIT package to a registry. This will automatically infer the package name from the WIT package'
complete -c wash -n "__fish_wash_using_subcommand wit; and not __fish_seen_subcommand_from build deps publish help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wash -n "__fish_wash_using_subcommand wit; and __fish_seen_subcommand_from build" -s d -l wit-dir -d 'The directory containing the WIT files to build' -r -F
complete -c wash -n "__fish_wash_using_subcommand wit; and __fish_seen_subcommand_from build" -s f -l file -d 'The name of the file that should be written. This can also be a full path. Defaults to the current directory with the name of the package' -r -F
complete -c wash -n "__fish_wash_using_subcommand wit; and __fish_seen_subcommand_from build" -l pkg-config -d 'The path to the configuration file' -r -F
complete -c wash -n "__fish_wash_using_subcommand wit; and __fish_seen_subcommand_from build" -l pkg-cache -d 'The path to the cache directory. Defaults to the system cache directory' -r -F
complete -c wash -n "__fish_wash_using_subcommand wit; and __fish_seen_subcommand_from build" -s p -l config-path -d 'Path to the wasmcloud.toml file or parent folder to use for building' -r -F
complete -c wash -n "__fish_wash_using_subcommand wit; and __fish_seen_subcommand_from build" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand wit; and __fish_seen_subcommand_from build" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand wit; and __fish_seen_subcommand_from build" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand wit; and __fish_seen_subcommand_from build" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand wit; and __fish_seen_subcommand_from deps" -s d -l wit-dir -d 'The directory containing the WIT files to fetch dependencies for' -r -F
complete -c wash -n "__fish_wash_using_subcommand wit; and __fish_seen_subcommand_from deps" -s t -l type -d 'The desired output type of the dependencies. Valid options are "wit" or "wasm" (wasm is the WIT package binary format)' -r
complete -c wash -n "__fish_wash_using_subcommand wit; and __fish_seen_subcommand_from deps" -l pkg-config -d 'The path to the configuration file' -r -F
complete -c wash -n "__fish_wash_using_subcommand wit; and __fish_seen_subcommand_from deps" -l pkg-cache -d 'The path to the cache directory. Defaults to the system cache directory' -r -F
complete -c wash -n "__fish_wash_using_subcommand wit; and __fish_seen_subcommand_from deps" -s p -l config-path -d 'Path to the wasmcloud.toml file or parent folder to use for building' -r -F
complete -c wash -n "__fish_wash_using_subcommand wit; and __fish_seen_subcommand_from deps" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand wit; and __fish_seen_subcommand_from deps" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand wit; and __fish_seen_subcommand_from deps" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand wit; and __fish_seen_subcommand_from deps" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c wash -n "__fish_wash_using_subcommand wit; and __fish_seen_subcommand_from publish" -l wit-registry -d 'The registry domain to use. Overrides configuration file(s)' -r
complete -c wash -n "__fish_wash_using_subcommand wit; and __fish_seen_subcommand_from publish" -l pkg-config -d 'The path to the configuration file' -r -F
complete -c wash -n "__fish_wash_using_subcommand wit; and __fish_seen_subcommand_from publish" -l pkg-cache -d 'The path to the cache directory. Defaults to the system cache directory' -r -F
complete -c wash -n "__fish_wash_using_subcommand wit; and __fish_seen_subcommand_from publish" -s o -l output -d 'Specify output format (text or json)' -r
complete -c wash -n "__fish_wash_using_subcommand wit; and __fish_seen_subcommand_from publish" -l experimental -d 'Whether or not to enable experimental features'
complete -c wash -n "__fish_wash_using_subcommand wit; and __fish_seen_subcommand_from publish" -l help-markdown
complete -c wash -n "__fish_wash_using_subcommand wit; and __fish_seen_subcommand_from publish" -s h -l help -d 'Print help'
complete -c wash -n "__fish_wash_using_subcommand wit; and __fish_seen_subcommand_from help" -f -a "build" -d 'Build a WIT package from a directory. By default, this will fetch all dependencies needed and encode them in the WIT package. This will generate a lock file that can be used to fetch the dependencies in the future'
complete -c wash -n "__fish_wash_using_subcommand wit; and __fish_seen_subcommand_from help" -f -a "deps" -d 'Fetch dependencies for a component'
complete -c wash -n "__fish_wash_using_subcommand wit; and __fish_seen_subcommand_from help" -f -a "publish" -d 'Publish a WIT package to a registry. This will automatically infer the package name from the WIT package'
complete -c wash -n "__fish_wash_using_subcommand wit; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wash -n "__fish_wash_using_subcommand help; and not __fish_seen_subcommand_from app build call capture completions claims config ctx dev down drain get inspect keys link new par plugin push pull secrets spy scale start stop label update up ui wit help" -f -a "app" -d 'Manage declarative applications and deployments (wadm)'
complete -c wash -n "__fish_wash_using_subcommand help; and not __fish_seen_subcommand_from app build call capture completions claims config ctx dev down drain get inspect keys link new par plugin push pull secrets spy scale start stop label update up ui wit help" -f -a "build" -d 'Build (and sign) a wasmCloud component or capability provider'
complete -c wash -n "__fish_wash_using_subcommand help; and not __fish_seen_subcommand_from app build call capture completions claims config ctx dev down drain get inspect keys link new par plugin push pull secrets spy scale start stop label update up ui wit help" -f -a "call" -d 'Invoke a simple function on a component running in a wasmCloud host'
complete -c wash -n "__fish_wash_using_subcommand help; and not __fish_seen_subcommand_from app build call capture completions claims config ctx dev down drain get inspect keys link new par plugin push pull secrets spy scale start stop label update up ui wit help" -f -a "capture" -d 'Capture and debug cluster invocations and state'
complete -c wash -n "__fish_wash_using_subcommand help; and not __fish_seen_subcommand_from app build call capture completions claims config ctx dev down drain get inspect keys link new par plugin push pull secrets spy scale start stop label update up ui wit help" -f -a "completions" -d 'Generate shell completions for wash'
complete -c wash -n "__fish_wash_using_subcommand help; and not __fish_seen_subcommand_from app build call capture completions claims config ctx dev down drain get inspect keys link new par plugin push pull secrets spy scale start stop label update up ui wit help" -f -a "claims" -d 'Generate and manage JWTs for wasmCloud components and capability providers'
complete -c wash -n "__fish_wash_using_subcommand help; and not __fish_seen_subcommand_from app build call capture completions claims config ctx dev down drain get inspect keys link new par plugin push pull secrets spy scale start stop label update up ui wit help" -f -a "config" -d 'Create configuration for components, capability providers and links'
complete -c wash -n "__fish_wash_using_subcommand help; and not __fish_seen_subcommand_from app build call capture completions claims config ctx dev down drain get inspect keys link new par plugin push pull secrets spy scale start stop label update up ui wit help" -f -a "ctx" -d 'Manage wasmCloud host configuration contexts'
complete -c wash -n "__fish_wash_using_subcommand help; and not __fish_seen_subcommand_from app build call capture completions claims config ctx dev down drain get inspect keys link new par plugin push pull secrets spy scale start stop label update up ui wit help" -f -a "dev" -d 'Start a developer loop to hot-reload a local wasmCloud component'
complete -c wash -n "__fish_wash_using_subcommand help; and not __fish_seen_subcommand_from app build call capture completions claims config ctx dev down drain get inspect keys link new par plugin push pull secrets spy scale start stop label update up ui wit help" -f -a "down" -d 'Tear down a local wasmCloud environment (launched with wash up)'
complete -c wash -n "__fish_wash_using_subcommand help; and not __fish_seen_subcommand_from app build call capture completions claims config ctx dev down drain get inspect keys link new par plugin push pull secrets spy scale start stop label update up ui wit help" -f -a "drain" -d 'Manage contents of local wasmCloud caches'
complete -c wash -n "__fish_wash_using_subcommand help; and not __fish_seen_subcommand_from app build call capture completions claims config ctx dev down drain get inspect keys link new par plugin push pull secrets spy scale start stop label update up ui wit help" -f -a "get" -d 'Get information about different running wasmCloud resources'
complete -c wash -n "__fish_wash_using_subcommand help; and not __fish_seen_subcommand_from app build call capture completions claims config ctx dev down drain get inspect keys link new par plugin push pull secrets spy scale start stop label update up ui wit help" -f -a "inspect" -d 'Inspect a Wasm component or capability provider for signing information and interfaces'
complete -c wash -n "__fish_wash_using_subcommand help; and not __fish_seen_subcommand_from app build call capture completions claims config ctx dev down drain get inspect keys link new par plugin push pull secrets spy scale start stop label update up ui wit help" -f -a "keys" -d 'Generate and manage signing keys'
complete -c wash -n "__fish_wash_using_subcommand help; and not __fish_seen_subcommand_from app build call capture completions claims config ctx dev down drain get inspect keys link new par plugin push pull secrets spy scale start stop label update up ui wit help" -f -a "link" -d 'Link one component to another on a set of interfaces'
complete -c wash -n "__fish_wash_using_subcommand help; and not __fish_seen_subcommand_from app build call capture completions claims config ctx dev down drain get inspect keys link new par plugin push pull secrets spy scale start stop label update up ui wit help" -f -a "new" -d 'Create a new project from a template or git repository'
complete -c wash -n "__fish_wash_using_subcommand help; and not __fish_seen_subcommand_from app build call capture completions claims config ctx dev down drain get inspect keys link new par plugin push pull secrets spy scale start stop label update up ui wit help" -f -a "par" -d 'Create, inspect, and modify capability provider archive files'
complete -c wash -n "__fish_wash_using_subcommand help; and not __fish_seen_subcommand_from app build call capture completions claims config ctx dev down drain get inspect keys link new par plugin push pull secrets spy scale start stop label update up ui wit help" -f -a "plugin" -d 'Manage wash plugins'
complete -c wash -n "__fish_wash_using_subcommand help; and not __fish_seen_subcommand_from app build call capture completions claims config ctx dev down drain get inspect keys link new par plugin push pull secrets spy scale start stop label update up ui wit help" -f -a "push" -d 'Push an artifact to an OCI compliant registry'
complete -c wash -n "__fish_wash_using_subcommand help; and not __fish_seen_subcommand_from app build call capture completions claims config ctx dev down drain get inspect keys link new par plugin push pull secrets spy scale start stop label update up ui wit help" -f -a "pull" -d 'Pull an artifact from an OCI compliant registry'
complete -c wash -n "__fish_wash_using_subcommand help; and not __fish_seen_subcommand_from app build call capture completions claims config ctx dev down drain get inspect keys link new par plugin push pull secrets spy scale start stop label update up ui wit help" -f -a "secrets" -d 'Create secret references for components, capability providers and links'
complete -c wash -n "__fish_wash_using_subcommand help; and not __fish_seen_subcommand_from app build call capture completions claims config ctx dev down drain get inspect keys link new par plugin push pull secrets spy scale start stop label update up ui wit help" -f -a "spy" -d 'Spy on all invocations a component sends and receives'
complete -c wash -n "__fish_wash_using_subcommand help; and not __fish_seen_subcommand_from app build call capture completions claims config ctx dev down drain get inspect keys link new par plugin push pull secrets spy scale start stop label update up ui wit help" -f -a "scale" -d 'Scale a component running in a host to a certain level of concurrency'
complete -c wash -n "__fish_wash_using_subcommand help; and not __fish_seen_subcommand_from app build call capture completions claims config ctx dev down drain get inspect keys link new par plugin push pull secrets spy scale start stop label update up ui wit help" -f -a "start" -d 'Start a component or capability provider'
complete -c wash -n "__fish_wash_using_subcommand help; and not __fish_seen_subcommand_from app build call capture completions claims config ctx dev down drain get inspect keys link new par plugin push pull secrets spy scale start stop label update up ui wit help" -f -a "stop" -d 'Stop a component, capability provider, or host'
complete -c wash -n "__fish_wash_using_subcommand help; and not __fish_seen_subcommand_from app build call capture completions claims config ctx dev down drain get inspect keys link new par plugin push pull secrets spy scale start stop label update up ui wit help" -f -a "label" -d 'Label (or un-label) a host with a key=value label pair'
complete -c wash -n "__fish_wash_using_subcommand help; and not __fish_seen_subcommand_from app build call capture completions claims config ctx dev down drain get inspect keys link new par plugin push pull secrets spy scale start stop label update up ui wit help" -f -a "update" -d 'Update a component running in a host to newer image reference'
complete -c wash -n "__fish_wash_using_subcommand help; and not __fish_seen_subcommand_from app build call capture completions claims config ctx dev down drain get inspect keys link new par plugin push pull secrets spy scale start stop label update up ui wit help" -f -a "up" -d 'Bootstrap a local wasmCloud environment'
complete -c wash -n "__fish_wash_using_subcommand help; and not __fish_seen_subcommand_from app build call capture completions claims config ctx dev down drain get inspect keys link new par plugin push pull secrets spy scale start stop label update up ui wit help" -f -a "ui" -d 'Serve a web UI for wasmCloud'
complete -c wash -n "__fish_wash_using_subcommand help; and not __fish_seen_subcommand_from app build call capture completions claims config ctx dev down drain get inspect keys link new par plugin push pull secrets spy scale start stop label update up ui wit help" -f -a "wit" -d 'Create wit packages and fetch wit dependencies for a component'
complete -c wash -n "__fish_wash_using_subcommand help; and not __fish_seen_subcommand_from app build call capture completions claims config ctx dev down drain get inspect keys link new par plugin push pull secrets spy scale start stop label update up ui wit help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from app" -f -a "list" -d 'List all applications available within the lattice'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from app" -f -a "get" -d 'Get the application manifest for a specific version of an application'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from app" -f -a "status" -d 'Get the current status of a given application'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from app" -f -a "history" -d 'Get the version history of a given application'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from app" -f -a "delete" -d 'Delete an application version'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from app" -f -a "put" -d 'Create an application version by putting the manifest into the wadm store'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from app" -f -a "deploy" -d 'Deploy an application to the lattice'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from app" -f -a "undeploy" -d 'Undeploy an application, removing it from the lattice'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from app" -f -a "validate" -d 'Validate an application manifest'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from capture" -f -a "replay"
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from completions" -f -a "zsh" -d 'generate completions for Zsh'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from completions" -f -a "bash" -d 'generate completions for Bash'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from completions" -f -a "fish" -d 'generate completions for Fish'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from completions" -f -a "power-shell" -d 'generate completions for PowerShell'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from claims" -f -a "inspect" -d 'Examine the signing claims information or WIT world from a signed component component'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from claims" -f -a "sign" -d 'Sign a WebAssembly component, specifying capabilities and other claims including expiration, tags, and additional metadata'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from claims" -f -a "token" -d 'Generate a signed JWT by supplying basic token information, a signing seed key, and metadata'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "put" -d 'Put named configuration'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "get" -d 'Get a named configuration'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "del" -d 'Delete a named configuration'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from ctx" -f -a "list" -d 'Lists all stored contexts (JSON files) found in the context directory, with the exception of index.json'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from ctx" -f -a "del" -d 'Delete a stored context'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from ctx" -f -a "new" -d 'Create a new context'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from ctx" -f -a "default" -d 'Set the default context'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from ctx" -f -a "edit" -d 'Edit a context directly using a text editor'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from drain" -f -a "all" -d 'Remove all cached files created by wasmcloud'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from drain" -f -a "oci" -d 'Remove cached files downloaded from OCI registries by wasmCloud'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from drain" -f -a "lib" -d 'Remove cached binaries extracted from provider archives'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from drain" -f -a "dev" -d 'Remove files and logs from wash dev sessions'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from drain" -f -a "downloads" -d 'Remove downloaded and generated files from launching wasmCloud hosts'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from get" -f -a "links" -d 'Retrieve all known links in the lattice'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from get" -f -a "claims" -d 'Retrieve all known claims inside the lattice'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from get" -f -a "hosts" -d 'Retrieve all responsive hosts in the lattice'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from get" -f -a "inventory" -d 'Retrieve inventory a given host on in the lattice'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from keys" -f -a "gen" -d 'Generates a keypair'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from keys" -f -a "get" -d 'Retrieves a keypair and prints the contents'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from keys" -f -a "list" -d 'Lists all keypairs in a directory'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from link" -f -a "query" -d 'Query all links, same as `wash get links`'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from link" -f -a "put" -d 'Put a link from a source to a target on a given WIT interface'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from link" -f -a "del" -d 'Delete a link'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from new" -f -a "component" -d 'Generate a wasmCloud component project'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from new" -f -a "provider" -d 'Generate a new capability provider project'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from par" -f -a "create" -d 'Build a provider archive file'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from par" -f -a "inspect" -d 'Inspect a provider archive file'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from par" -f -a "insert" -d 'Insert a provider into a provider archive file'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from plugin" -f -a "install" -d 'Install a wash plugin'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from plugin" -f -a "uninstall" -d 'Uninstall a plugin'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from plugin" -f -a "list" -d 'List installed plugins'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from secrets" -f -a "put" -d 'Put secret reference'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from secrets" -f -a "get" -d 'Get a secret reference by name'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from secrets" -f -a "del" -d 'Delete a secret reference by name'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from scale" -f -a "component" -d 'Scale a component running in a host to a certain level of concurrency'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from start" -f -a "component" -d 'Launch a component in a host'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from start" -f -a "provider" -d 'Launch a provider in a host'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from stop" -f -a "component" -d 'Stop a component running in a host'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from stop" -f -a "provider" -d 'Stop a provider running in a host'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from stop" -f -a "host" -d 'Purge and stop a running host'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from update" -f -a "component" -d 'Update a component running in a host to a newer version'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from wit" -f -a "build" -d 'Build a WIT package from a directory. By default, this will fetch all dependencies needed and encode them in the WIT package. This will generate a lock file that can be used to fetch the dependencies in the future'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from wit" -f -a "deps" -d 'Fetch dependencies for a component'
complete -c wash -n "__fish_wash_using_subcommand help; and __fish_seen_subcommand_from wit" -f -a "publish" -d 'Publish a WIT package to a registry. This will automatically infer the package name from the WIT package'
