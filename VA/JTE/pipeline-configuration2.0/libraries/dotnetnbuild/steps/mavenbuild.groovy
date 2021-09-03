void call() {
        stage(config.stagename) {
        node(config.agent) {
            println(config.stagename)

            String response, url
            String stagename = config.stagename
            String agent = config.agent
            String appname = config.appname
            String jobname = config.jobname
            String branchname = config.branchname
            String buildnumber = config.buildnumber
            String githubapiurl = config.githubapiurl
            String githubtokencredentialid = config.githubtokencredentialid
            String jenkinsurl = config.jenkinsurl
            String buildPropfile = config.buildPropfile

            def jobnameparts = jobname.tokenize('/') as String[]
            def jobconsolename = jobnameparts[0]
            String jenkinsbuildurl =  jenkinsurl + '/blue/organizations/jenkins/' + jobconsolename + '/detail/' + branchname + '/' + buildnumber + '/pipeline'

            String agentname = agent.toLowerCase()

            writeFile file: buildPropfile, text: 'Pending'

            try {
                withCredentials([string(credentialsId: githubtokencredentialid, variable: 'GITHUB_TOKEN')]) {
                    if (agentname.contains('windows')) {
                        println('Entering Windows if statement')
                        CURRENT_HASH = bat(returnStdout: true, script: 'git rev-parse HEAD').trim()
                        githubcommit = CURRENT_HASH.readLines().drop(1).join(' ')
                        url = githubapiurl + githubcommit

                     }

                    if (agentname.contains('linux')) {
                        println('Entering Linux if statement')
                        CURRENT_HASH = sh(returnStdout: true, script: 'git rev-parse HEAD').trim()
                        url = githubapiurl + CURRENT_HASH 

                        sh '''
                           dotnet build 
                        '''
                  

                        response = sh(script: "curl -XPOST -H \"Authorization: token $GITHUB_TOKEN\" $url -d '{\"state\": \"success\",\"context\":\"ci/jenkins: ${stagename}\", \"target_url\": \"${jenkinsbuildurl}\",\"description\": \"Your tests passed on Jenkins!\"}'", returnStdout: true).trim()
                        println(response)
                    }
                }

                //Update the Install Depen status as Success in the properties file
                writeFile file: buildPropfile, text: 'Success'
         }catch (Exception e) {
                println(e.message)
                //Update the Install Depen status as Failed in the properties file.
                writeFile file: buildPropfile, text: 'Failed'
                error('Build failed because of ' + e.message)

                withCredentials([string(credentialsId: githubtokencredentialid, variable: 'GITHUB_TOKEN')]) {
                    if (agentname.contains('windows')) {
                        println('Entering Windows if statement')
                        CURRENT_HASH = bat(returnStdout: true, script: 'git rev-parse HEAD').trim()
                        githubcommit = CURRENT_HASH.readLines().drop(1).join(' ')
                        url = githubapiurl + githubcommit
//response = bat(returnStdout: true, script: "curl -XPOST -H \"Authorization: token $GITHUB_TOKEN\" $url -d \"{\"state\": \"failure\",\"context\":\"ci/jenkins: ${stagename}\", \"target_url\": \"https://jenkins.fs.usda.gov\",\"description\": \"Your tests passed on Jenkins!\"}\"")
                    //     println(response)
                    }

                    if (agentname.contains('linux')) {
                        println('Entering Linux if statement')
                        CURRENT_HASH = sh(returnStdout: true, script: 'git rev-parse HEAD').trim()
                        url = githubapiurl + CURRENT_HASH 

                        response = sh(script: "curl -XPOST -H \"Authorization: token $GITHUB_TOKEN\" $url -d '{\"state\": \"failure\",\"context\":\"ci/jenkins: ${stagename}\", \"target_url\": \"${jenkinsbuildurl}\",\"description\": \"Your tests failed on Jenkins!\"}'", returnStdout: true).trim()
                        println(response)
                    }
                }


            }
        }
        }
}
