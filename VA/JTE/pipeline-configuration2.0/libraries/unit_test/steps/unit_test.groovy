void call() {
     stage(config.stagename){
          node(config.agent) {
println('unit test')
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

String gitbranch = config.git_branch

String buildPropfile = config.buildPropfile

String[] jobnameparts = jobname.tokenize('/')
String jobconsolename = jobnameparts[0]

String oswindows = 'windows'
String oslinux = 'linux'

String buildstatussuccess = 'Success'
String buildstatusfailed = 'Failed'


String jenkinsbuildurl =  jenkinsurl + '/blue/organizations/jenkins/' + jobconsolename
jenkinsbuildurl = jenkinsbuildurl + '/detail/' + branchname + '/' + buildnumber + '/pipeline'


String agentname = agent.toLowerCase()

if (agentname.contains(oswindows)) {
CURRENT_HASH = bat(returnStdout: true, script: 'git rev-parse HEAD').trim()
githubcommit = CURRENT_HASH.readLines().drop(1).join(" ")
url = githubapiurl + githubcommit
}
if (agentname.contains(oslinux)) {
    CURRENT_HASH = sh(returnStdout: true, script: 'git rev-parse HEAD').trim()
    url = githubapiurl + CURRENT_HASH
}

        try {
          if (agentname.contains(oswindows)) {    

  

//The below code is for AFF
if (appname == 'FAM.IM.AFF'){
  if (branchname == 'staging' || branchname == 'dev') {                 
   
    bat '''        
        dir

         '''                 
       
      }
      
      }


               
        }

//         if (agentname.contains(oslinux)){      


  //       }

writeFile file: buildPropfile, text: buildstatussuccess

}catch (Exception e) {
            println(e.message)
            //Update the SonarQube Frontend  status as Failed in the properties file.
            /* groovylint-disable-next-line SpaceAroundMapEntryColon */
            writeFile file: buildPropfile, text: buildstatusfailed
            error('Build failed because of ' + e.message)
              withCredentials([string(credentialsId: githubtokencredentialid, variable: 'GITHUB_TOKEN')]){
         if (agentname.contains(oswindows)) {
     //response = bat(returnStdout: true, script: "curl -XPOST -H \"Authorization: token $GITHUB_TOKEN\" $url -d \"{\"state\": \"failure\",\"context\":\"ci/jenkins: owasp-dependency-check-frontend\", \"target_url\": \"https://jenkins.fs.usda.gov\",\"description\": \"Your tests failed on Jenkins!\"}\"")
    //     println(response)
         }
         if (agentname.contains(oslinux)) {
          response = sh(script: "curl -XPOST -H \"Authorization: token $GITHUB_TOKEN\" $url -d '{\"state\": \"failure\",\"context\":\"ci/jenkins: ${stagename}\", \"target_url\": \"${jenkinsbuildurl}\",\"description\": \"Your tests failed on Jenkins!\"}'", returnStdout: true).trim()
          println(response)
         }
}
}
}
}
}
