void call(){
    stage(config.stagename){
         node(config.agent) {             
    //    println("Stage Name:" + config.stagename)
     
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

String scanfolderpath = config.scanfolderpath
String projectname = config.projectname   
String scanoutpath = config.scanoutpath
String buildPropfile = config.buildPropfile
String extracommand = config.extracommand ?: ''

def jobnameparts = jobname.tokenize('/') as String[]
def jobconsolename = jobnameparts[0]             
String jenkinsbuildurl =  jenkinsurl + "/blue/organizations/jenkins/" + jobconsolename + "/detail/" + branchname + "/" + buildnumber + "/pipeline"             

String agentname = agent.toLowerCase()  

          try
          {              
            //Update the OWASP status as Success in the properties file.
            writeFile file: buildPropfile, text: "Success"
            
       withCredentials([string(credentialsId: githubtokencredentialid, variable: 'GITHUB_TOKEN')]) {
         
         if(agentname.contains("windows"))
         {
     //        println("Entering Windows if statement")
          CURRENT_HASH = bat(returnStdout: true, script: 'git rev-parse HEAD').trim()
          githubcommit = CURRENT_HASH.readLines().drop(1).join(" ") 
          url = githubapiurl + githubcommit        
          
          //bat "npm install dependency-check -g"
          bat "if not exist " + scanoutpath + " mkdir " + scanoutpath + ""
          bat "C:\\jenkins\\owasp\\dependency-check\\bin\\dependency-check.bat --scan " + scanfolderpath + "  --project " + projectname  + " --out " + scanoutpath +  " -f XML -f HTML " + extracommand

          //bat "C:\\jenkins\\owasp\\dependency-check\\bin\\dependency-check.bat --scan " + scanfolderpath + "  --project " + projectname  + " --out " + scanoutpath +  " -f XML" + extracommand
          
         //response = bat(returnStdout: true, script: "curl -XPOST -H \"Authorization: token $GITHUB_TOKEN\" $url -d \"{\"state\": \"success\",\"context\":\"ci/jenkins: owasp-dependency-check-frontend\", \"target_url\": \"https://jenkins.fs.usda.gov\",\"description\": \"Your tests passed on Jenkins!\"}\"")
    //     println(response)                          
         }
         if(agentname.contains("linux"))
         {
  //           println("Entering Linux if statement")
          CURRENT_HASH = sh(returnStdout: true, script: 'git rev-parse HEAD').trim()
//             println("Current Hash:" + CURRENT_HASH)
          url = githubapiurl + CURRENT_HASH        
          
         sh "mkdir -p " + scanoutpath + ""
           sh "/opt/dependency-check/bin/dependency-check.sh --scan " + scanfolderpath + " --project " + projectname + " --out " + scanoutpath + " -f XML -f HTML " + extracommand

           //sh "/home/Jenkins/owasp/dependency-check/bin/dependency-check.sh --scan " + scanfolderpath + " --project " + projectname + " --out " + scanoutpath + " -f XML" + extracommand

             //Remove this when this code is moved to Prod
           //sh "/home/jenkins/owasp/dependency-check/bin/dependency-check.sh --scan " + scanfolderpath + " --project " + projectname + " --out " + scanoutpath + " -f XML"
          archiveArtifacts artifacts: 'owaspreportfrontend/dependency-check-report.xml,owaspreportfrontend/dependency-check-report.html', followSymlinks: false
          response = sh(script: "curl -XPOST -H \"Authorization: token $GITHUB_TOKEN\" $url -d '{\"state\": \"success\",\"context\":\"ci/jenkins: ${stagename}\", \"target_url\": \"${jenkinsbuildurl}\",\"description\": \"Your tests passed on Jenkins!\"}'", returnStdout: true).trim()      
      //    println(response)             
         }        

   }                 
            
           }catch (Exception e) {            
            println(e.message)           
            //Update the SonarQube Frontend  status as Failed in the properties file.
            writeFile file: buildPropfile, text: "Failed"
            error("Build failed because of " + e.message)
            
             withCredentials([string(credentialsId: githubtokencredentialid, variable: 'GITHUB_TOKEN')]) {
         
         if(agentname.contains("windows"))
         {
       //      println("Entering Windows if statement")
          CURRENT_HASH = bat(returnStdout: true, script: 'git rev-parse HEAD').trim()
          githubcommit = CURRENT_HASH.readLines().drop(1).join(" ") 
          url = githubapiurl + githubcommit        

         }
         if(agentname.contains("linux"))
         {
      //       println("Entering Linux if statement")
          CURRENT_HASH = sh(returnStdout: true, script: 'git rev-parse HEAD').trim()
       //      println("Current Hash:" + CURRENT_HASH)
          url = githubapiurl + CURRENT_HASH        
          
          response = sh(script: "curl -XPOST -H \"Authorization: token $GITHUB_TOKEN\" $url -d '{\"state\": \"failure\",\"context\":\"ci/jenkins: ${stagename}\", \"target_url\": \"${jenkinsbuildurl}\",\"description\": \"Your tests failed on Jenkins!\"}'", returnStdout: true).trim()      
      //    println(response)             
         }        

   }          
        }           
          
      }
    }
}
