#!/bin/bash
hash (){
        HASH_REGEX="(Deploy )([a-zA-Z0-9]*)"
        if [[ $1 =~ $HASH_REGEX ]]; then
           echo ${BASH_REMATCH[2]}
        fi
}
env_hash (){
        command_base='heroku releases -a '
        result="$($command_base$1)"
        echo "$(hash "$result")"
}
diff (){
        app_name=$1
        staging_env=$2
        pipeline_name=$3
        production_version="$(env_hash $app_name)"
        staging_version="$(env_hash $staging_env)"
        echo "############# "$app_name" ##################"
        if [[ "$production_version" = "$staging_version" ]]; then
                echo "No changes to deploy"
        else
                echo "https://github.com/worklyfe/web/compare/"$production_version"..."$staging_version
                echo "/h promote "$pipeline_name" "$staging_env" to production"
        fi
        echo "####################################"
}
diff "worklyfeweb" "worklyfe-web-staging" "web"
