void call() {
        stage('checkout-code') {
        node(config.agent) {
            println 'Checkout code'

            properties([disableConcurrentBuilds()])

            String response, url
            String agent = config.agent
            String appname = config.appname
            String jobname = config.jobname
            String branchname = config.branchname
            String buildnumber = config.buildnumber
            String githubapiurl = config.githubapiurl
            String githubtokencredentialid = config.githubtokencredentialid
            String jenkinsurl = config.jenkinsurl

            def jobnameparts = jobname.tokenize('/') as String[]
            def jobconsolename = jobnameparts[0]
            String jenkinsbuildurl =  jenkinsurl + 'blue/organizations/jenkins/' + jobconsolename + '/detail/' + branchname + '/' + buildnumber + '/pipeline'

            String agentname = agent.toLowerCase()
         

            //Create the properties file with the initial status as Pending
            writeFile file: 'buildcheckout.properties', text: 'Pending'
            writeFile file: 'buildinstalldepenf.properties', text: 'Pending'
            writeFile file: 'buildinstalldepenb.properties', text: 'Pending'
            writeFile file: 'buildowasp.properties', text: 'Pending'
            writeFile file: 'buildowaspf.properties', text: 'Pending'
            writeFile file: 'buildowaspb.properties', text: 'Pending'
            writeFile file: 'buildsq.properties', text: 'Pending'
            writeFile file: 'buildsqf.properties', text: 'Pending'
            writeFile file: 'buildsqb.properties', text: 'Pending'
            writeFile file: 'build508.properties', text: 'Pending'
            writeFile file: 'builddeploy.properties', text: 'Pending'
            writeFile file: 'buildartifacts.properties', text: 'Pending'

            try {
                def scmUrl = scm.getUserRemoteConfigs()[0].getUrl()
                def author, checkoutstatus

                git branch: '$BRANCH_NAME', credentialsId: 'services_personalaccesstoken', url:scmUrl

                currentBuild.displayName = appname + " Build #$BUILD_NUMBER"
                currentBuild.description = appname + " Build #$BUILD_NUMBER"

                //Update the Checkout status as Success in the properties file.
                writeFile file: 'buildcheckout.properties', text: 'Success'

                checkoutstatus = readFile(file: 'buildcheckout.properties')

                withCredentials([string(credentialsId: githubtokencredentialid, variable: 'GITHUB_TOKEN')]) {
                    if (agentname.contains('windows')) {
                        CURRENT_HASH = bat(returnStdout: true, script: 'git rev-parse HEAD').trim()
                        githubcommit = CURRENT_HASH.readLines().drop(1).join(' ')
                        url = githubapiurl + githubcommit
                    }
                    if (agentname.contains('linux')) {
                     //   println('Entering Linux if statement')
                        CURRENT_HASH = sh(returnStdout: true, script: 'git rev-parse HEAD').trim()
                        url = githubapiurl + CURRENT_HASH
                        response = sh(script: "curl -XPOST -H \"Authorization: token $GITHUB_TOKEN\" $url -d '{\"state\": \"success\",\"context\":\"ci/jenkins: checkout-code\", \"target_url\": \"${jenkinsbuildurl}\",\"description\": \"Your tests passed on Jenkins!!!!\"}'", returnStdout: true).trim()
                        println(response)
                    }
                }

  } catch (Exception e) {
                println('Handle the exception!')
                println(e.message)
                //Update the Checkout status as Failed in the properties file.
                writeFile file: 'buildcheckout.properties', text: 'Failed'
                error('Build failed because of ' + e.message)

                withCredentials([string(credentialsId: githubtokencredentialid, variable: 'GITHUB_TOKEN')]) {
                    if (agentname.contains('windows')) {
                        CURRENT_HASH = bat(returnStdout: true, script: 'git rev-parse HEAD').trim()
                        githubcommit = CURRENT_HASH.readLines().drop(1).join(' ')
                        url = githubapiurl + githubcommit
                        println('url' + url)
                    }
                    if (agentname.contains('linux')) {
                        CURRENT_HASH = sh(returnStdout: true, script: 'git rev-parse HEAD').trim()
                        url = githubapiurl + CURRENT_HASH
                        println('url:' + url)
                        response = sh(script: "curl -XPOST -H \"Authorization: token $GITHUB_TOKEN\" $url -d '{\"state\": \"failure\",\"context\":\"ci/jenkins: checkout-code\", \"target_url\": \"${jenkinsbuildurl}\",\"description\": \"Your tests failed on Jenkins!\"}'", returnStdout: true).trim()
                        println(response)
                    }
                }

            }
        }
        }
}
