<h1>Code review TFS</h1>

<h2>Installation</h2>
Please go to the releases tab in order to download the latest stable release.

The installer should install the command on your machine with no need for you to interviene.

<h2>Configuration</h2>
On your first execution of the command you will be asked for three informations, your TFS root URL, username and password.

After that your command will be ready for using

<h2>Commands available</h2>

<code>$ cr feature </code>

        This will list all features on your current repository.

<code>$ cr feature [-f|--finish] {feature_name} </code>

        This will create a new feature (branch) for you to work on.
        
        This command will always create a branch from master, so if you use ir from another feature, 
        it will not move or delete modifications you might have done
        
        If -f or --finish parameter is informed, it will try to finish feature {feature_name} instead of
        creating it. If you inform the -f parameter but does not inform {feature_name}, it will try
        to finish your current feature

<code>$ cr move {feature_name}</code>

        This command will switch your active feature to {feature_name}

<code>$ cr review [[-t|--title] {pull_request_title}] [--hotfix]</code>

        This command will create (or update) a pull request with your modifications and try to merge them on
        the master branch.
        
        The parameters -t or --title are used to inform the title of the pull request, if you do not inform
        any, it will use the last commit message as the title.
        
        If you try to create a pull request on master, it will first create a feature using your pull request
        title and then create a pull request accordingly.
        
        The parameter --hotfix is used if the changes are emergencial or do not need to be reviewed, i.e., the 
        pull request will be automatically merged into master.

<code>$ cr share</code>

        Pushes current feature to server without creating pull request, making it available for all users.

<code>$ cr update</code>

        Merge master branch into current feature and pulls any changes. (useful to resolve conflicts)
