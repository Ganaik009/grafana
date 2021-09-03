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
            String projectname = config.projectname


            def jobnameparts = jobname.tokenize('/') as String[]
            def jobconsolename = jobnameparts[0]
            String jenkinsbuildurl =  jenkinsurl + '/blue/organizations/jenkins/' + jobconsolename + '/detail/' + branchname + '/' + buildnumber + '/pipeline'

            String agentname = agent.toLowerCase()
            String servicenowcredentials = config.servicenowcredentials

            writeFile file: buildPropfile, text: 'Pending'

            def latestversion = new StringBuilder()
            def error     = new StringBuilder()

            def cmd = "git describe --tags".execute()
            cmd.consumeProcessOutput(latestversion, error)
            cmd.waitForOrKill(1000)

            if (!error.toString().equals("")) 
                println "Error executing the cmd"


            try {
                println("Entering code")
                withCredentials([usernamePassword(credentialsId: 'servicenowcredentials', passwordVariable: 'snpassword', usernameVariable: 'snuser')]) {
                println("Entered creds")

                    if (agentname.contains('windows')) {
                                    println('Entering Windows if statement')
                                    CURRENT_HASH = bat(returnStdout: true, script: 'git rev-parse HEAD').trim()
                                    githubcommit = CURRENT_HASH.readLines().drop(1).join(' ')
                                    url = githubapiurl + githubcommit

          

                     if (agentname.contains('linux')) {
                         println('Entering Linux if statement')

                                 response = sh (script: "curl \"https://fsciodev.servicenowservices.com/api/g_us14/application_ci_utils\" --request POST --header \"Accept:application/json\" --header \"Content-Type:application/json\" --data \'{\"id\":\"${snuser}\",\"version\":\"${latestversion}\"}\' --header \"Authorization: basic $snpassword=\",returnStdout: true").trim()
                         }


                }

                //Update the Install Depen status as Success in the properties file
                writeFile file: buildPropfile, text: 'Success'
         }catch (Exception e) {

            }
        }
        }
}
