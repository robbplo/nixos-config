function browser-menu
  set pairs '{
"Actions API": "https://gitlab.betty.services/code/actions-api",
"Actions compiler": "https://gitlab.betty.services/code/actions-compiler",
"Actions JS": "https://gitlab.betty.services/code/actions-js",
"Actions providers": "https://gitlab.betty.services/code/actions-providers",
"Actions scheduler": "https://gitlab.betty.services/code/actions-scheduler",
"Artifact API": "https://gitlab.betty.services/code/artifact-api",
"Assets API": "https://gitlab.betty.services/code/assets-api",
"Betty5": "https://gitlab.betty.services/code/betty5",
"Betty6": "https://gitlab.betty.services/code/betty6",
"Block store": "https://gitlab.betty.services/code/block_store",
"Builder API": "https://gitlab.betty.services/code/builder-api",
"Data API": "https://gitlab.betty.services/code/data-api",
"Data compiler": "https://gitlab.betty.services/code/data-compiler",
"Embedding service": "https://gitlab.betty.services/code/machine-learning/embedding-service",
"File caching service": "https://gitlab.betty.services/code/file_caching_service",
"IDE action canvas": "https://gitlab.betty.services/actions/ide-action-canvas",
"IDE action step detail view": "https://gitlab.betty.services/actions/ide-action-step-detail-view",
"IDE logs": "https://gitlab.betty.services/code/falcon/ide-logs",
"IDE roles": "https://gitlab.betty.services/code/falcon/ide-roles",
"Logs reader": "https://gitlab.betty.services/code/logs_reader",
"Logs writer": "https://gitlab.betty.services/code/logs_writer",
"Meta API": "https://gitlab.betty.services/code/meta_api",
"Peggy": "https://gitlab.betty.services/code/peggy",
"Pretty Betty (IDE)": "https://gitlab.betty.services/code/pretty-betty",
"Rate limiter": "https://gitlab.betty.services/code/rate_limiter",
"Replicator": "https://gitlab.betty.services/code/replicator",
"Runtime dispatcher": "https://gitlab.betty.services/code/runtime_dispatcher"
	}'
  set result (echo $pairs | jq -r 'keys.[]' | wofi -id -M fuzzy)
  xdg-open (echo $pairs | jq -r ".\"$result\"")
end

