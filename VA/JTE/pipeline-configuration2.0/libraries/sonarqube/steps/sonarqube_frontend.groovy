void call() {
     stage(config.stagename){
          node(config.agent) {
println('static code analysis')
String response, url
String stagename = config.stagename
String agent = config.agent
//String appname = config.appname
String jobname = config.jobname
String branchname = config.branchname
String buildnumber = config.buildnumber
String githubapiurl = config.githubapiurl 
String githubtokencredentialid = config.githubtokencredentialid
String jenkinsurl = config.jenkinsurl
String sonarqubeprojectname = config.sonarqubeprojectname
String sonarqubedotnetbuildcommand = config.sonarqubedotnetbuildcommand ?: ''
String enablequalitygate = config.enablequalitygate ?: 'No'
String generateSonarQubeReports = config.generateSonarQubeReports ?: 'No'
String mvnadditionalparam = config.mvnadditionalparam ?: ''

String projectkey = config.project_key
String sonarurl = config.sonar_url
String sonartoken = config.sonar_token
String gitbranch = config.git_branch

String buildPropfile = config.buildPropfile
String sonarqubeextraparams = config.sonarqubeextraparams
//java, dotnet, other
String sonarqubescantype = config.sonarqubescantype
String[] jobnameparts = jobname.tokenize('/')
String jobconsolename = jobnameparts[0]

String oswindows = 'windows'
String oslinux = 'linux'
String sonarscantypejava = 'java'
String sonarscantypedotnet = 'dotnet'
String sonarscantypeother = 'other'
String sonarscantypecplus = 'cplus'
String sonarscantypemsbuild = 'msbuild'
String sonarscantypecplusother = 'cplusother'

String sonarqubetoolname = 'SonarQube'

String buildstatussuccess = 'Success'
String buildstatusfailed = 'Failed'

println('Quality Gate Enabled:' + enablequalitygate)
println('Generate SonarQube Reports:' + generateSonarQubeReports)

String jenkinsbuildurl =  jenkinsurl + '/blue/organizations/jenkins/' + jobconsolename
jenkinsbuildurl = jenkinsbuildurl + '/detail/' + branchname + '/' + buildnumber + '/pipeline'

println('Jenkins Build url:' + jenkinsbuildurl)

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
           if (sonarqubescantype.contains(sonarscantypejava)) {
               println('SonarQube type:' + sonarqubescantype)
          }

         if (sonarqubescantype.contains(sonarscantypedotnet)) {
              withSonarQubeEnv(sonarqubetoolname) {       
        //  bat 'dotnet tool install --global dotnet-sonarscanner --version 4.8.0'       
          bat 'dotnet restore '  + sonarqubedotnetbuildcommand
          bat 'dotnet sonarscanner begin /k:' + sonarqubeprojectname +  '  /d:sonar.host.url=' + sonarurl  + ' ' + sonarqubeextraparams
          bat 'dotnet build ' + sonarqubedotnetbuildcommand
          bat 'dotnet sonarscanner end'

          if (generateSonarQubeReports == "Yes") {
         	bat 'if exist sonarqubereports ( rmdir /s/q sonarqubereports )'
	         bat 'mkdir sonarqubereports'

          sleep(150)

          bat "java -jar c:\\jenkins\\sonar-cnes-report-3.2.2.jar -t " + sonartoken + " -s " + sonarurl + " -p " + sonarqubeprojectname + " -b " + gitbranch + " -o sonarqubereports"
                
	     bat 'copy sonarqubereports\\*-analysis-report.docx sonarqubereports\\sonarqubeanalysisreport.docx'
	     bat 'copy sonarqubereports\\*-issues-report.xlsx sonarqubereports\\sonarqubeissuesreport.xlsx'
          archiveArtifacts artifacts: 'sonarqubereports\\sonarqubeanalysisreport.docx', fingerprint: true
   	     archiveArtifacts artifacts: 'sonarqubereports\\sonarqubeissuesreport.xlsx', fingerprint: true
          }

              }
         }

         if (sonarqubescantype.contains(sonarscantypeother)) {
        withSonarQubeEnv(sonarqubetoolname) {
          bat 'npm install -g typescript --force'
          bat 'C:\\jenkins\\sonar-scanner-cli-4.4.0.2170-windows\\bin\\sonar-scanner -Dsonar.projectKey=' + projectkey + ' -Dsonar.projectName=' + sonarqubeprojectname + ' -Dsonar.host.url=' + sonarurl + ' -Dsonar.branch.name=' + gitbranch + ' ' + sonarqubeextraparams
      }
         }

      if (sonarqubescantype.contains(sonarscantypecplus)) {
         println('SonarQube type:' + sonarqubescantype)
         println('ProjectKey:' + projectkey)
        withSonarQubeEnv(sonarqubetoolname) {
           
           //bat 'echo %VCTargetsPath%'
           //bat 'C:\\jenkins\\sonar-scanner-cli-4.4.0.2170-windows\\bin\\sonar-scanner /k:' + projectkey + ' -Dsonar.projectName=' + sonarqubeprojectname + ' -Dsonar.host.url=' + sonarurl + ' -Dsonar.branch.name=' + gitbranch + ' ' + sonarqubeextraparams
          //bat 'c:\\jenkins\\sonar-scanner-msbuild-5.0.4.24009-net46\\SonarScanner.MSBuild begin -Dsonar.projectKey=' + projectkey + ' -Dsonar.projectName=' + sonarqubeprojectname + ' -Dsonar.host.url=' + sonarurl + ' -Dsonar.branch.name=' + gitbranch + ' ' + sonarqubeextraparams
          //bat 'build-wrapper-win-x86-64.exe --out-dir build_wrapper_output_directory MSBuild.exe /t:Rebuild'
          //bat 'c:\\jenkins\\sonar-scanner-msbuild-5.0.4.24009-net46\\SonarScanner.MSBuild.exe end'

          bat 'echo %VCTargetsPath%'
         bat 'C:\\jenkins\\sonar-scanner-msbuild-5.0.4.24009-net46\\SonarScanner.MSBuild.exe begin /k:' + projectkey + ' /n:' + sonarqubeprojectname + ' /d:sonar.host.url=' + sonarurl + ' /d:sonar.branch.name=' + gitbranch + ' ' + sonarqubeextraparams 
         bat 'c:\\jenkins\\build-wrapper-win-x86-64.exe --out-dir build_wrapper_output_directory C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\MSBuild\\Current\\Bin\\MSBuild.exe /t:Rebuild' 
         bat 'C:\\jenkins\\sonar-scanner-msbuild-5.0.4.24009-net46\\SonarScanner.MSBuild.exe end'
           
        
      }
         }


if (sonarqubescantype.contains(sonarscantypemsbuild)) {
         println('SonarQube type:' + sonarqubescantype)
         println('ProjectKey:' + projectkey)
        withSonarQubeEnv(sonarqubetoolname) {
           
           //bat 'echo %VCTargetsPath%'
           //bat 'C:\\jenkins\\sonar-scanner-cli-4.4.0.2170-windows\\bin\\sonar-scanner /k:' + projectkey + ' -Dsonar.projectName=' + sonarqubeprojectname + ' -Dsonar.host.url=' + sonarurl + ' -Dsonar.branch.name=' + gitbranch + ' ' + sonarqubeextraparams
          //bat 'c:\\jenkins\\sonar-scanner-msbuild-5.0.4.24009-net46\\SonarScanner.MSBuild begin -Dsonar.projectKey=' + projectkey + ' -Dsonar.projectName=' + sonarqubeprojectname + ' -Dsonar.host.url=' + sonarurl + ' -Dsonar.branch.name=' + gitbranch + ' ' + sonarqubeextraparams
          //bat 'build-wrapper-win-x86-64.exe --out-dir build_wrapper_output_directory MSBuild.exe /t:Rebuild'
          //bat 'c:\\jenkins\\sonar-scanner-msbuild-5.0.4.24009-net46\\SonarScanner.MSBuild.exe end'

          bat 'echo %VCTargetsPath%'
         bat 'C:\\jenkins\\sonar-scanner-msbuild-5.0.4.24009-net46\\SonarScanner.MSBuild.exe begin /k:' + projectkey + ' /n:' + sonarqubeprojectname + ' /d:sonar.host.url=' + sonarurl + ' /d:sonar.branch.name=' + gitbranch + ' ' + sonarqubeextraparams 
         bat 'MSBuild ' + sonarqubedotnetbuildcommand 
         bat 'C:\\jenkins\\sonar-scanner-msbuild-5.0.4.24009-net46\\SonarScanner.MSBuild.exe end'
                  
      }
         }


if (sonarqubescantype.contains(sonarscantypecplusother)) {
         println('SonarQube type:' + sonarqubescantype)
         println('ProjectKey:' + projectkey)
        withSonarQubeEnv(sonarqubetoolname) {
           
         bat 'echo %VCTargetsPath%'
         bat 'C:\\jenkins\\sonar-scanner-msbuild-5.0.4.24009-net46\\SonarScanner.MSBuild.exe begin /k:' + projectkey + ' /n:' + sonarqubeprojectname + ' /d:sonar.host.url=' + sonarurl + ' /d:sonar.branch.name=' + gitbranch + ' ' + sonarqubeextraparams 
           
        
      }
         }

}
         if (agentname.contains(oslinux)){
           if (sonarqubescantype.contains(sonarscantypejava)) {
              withSonarQubeEnv(sonarqubetoolname) {
         sh 'node -v'
           sh 'npm -v'
          sh 'mvn clean compile verify ' + mvnadditionalparam + ''
          sh 'mvn sonar:sonar -Dsonar.projectKey=' + projectkey + ' -Dsonar.projectName=' + sonarqubeprojectname + ' -Dsonar.branch.name=' + gitbranch + ' ' + sonarqubeextraparams + ' '  + mvnadditionalparam + ''
          }
         }

         if (sonarqubescantype.contains(sonarscantypedotnet)) {
         println('SonarQube type:' + sonarqubescantype)
         }

         if (sonarqubescantype.contains(sonarscantypeother)) {
        withSonarQubeEnv(sonarqubetoolname) {
           sh 'node -v'
           sh 'npm -v'
           sh '/home/Jenkins/tools/hudson.plugins.sonar.SonarRunnerInstallation/SonarQubeScanner/bin/sonar-scanner -Dsonar.projectKey=' + projectkey + ' -Dsonar.projectName=' + sonarqubeprojectname + ' -Dsonar.branch.name=' + gitbranch + ' ' + sonarqubeextraparams
              }
        }
      }

   withCredentials([string(credentialsId: githubtokencredentialid, variable: 'GITHUB_TOKEN')]) {
     if (agentname.contains(oswindows)) {
                       //response = bat(returnStdout: true, script: "curl -XPOST -H \"Authorization: token $GITHUB_TOKEN\" $url -d \"{\"state\": \"success\",\"context\":\"ci/jenkins: owasp-dependency-check-frontend\", \"target_url\": \"https://jenkins.fs.usda.gov\",\"description\": \"Your tests passed on Jenkins!\"}\"")
    //     println(response)
         }
         if (agentname.contains(oslinux)) {
            response = sh(script: "curl -XPOST -H \"Authorization: token $GITHUB_TOKEN\" $url -d '{\"state\": \"success\",\"context\":\"ci/jenkins: ${stagename}\", \"target_url\": \"${jenkinsbuildurl}\",\"description\": \"Your tests passed on Jenkins!\"}'", returnStdout: true).trim()      
            println(response)
         }
   }

//enforce the quality gate only when the branch name is development or master
//if (branchname == 'development' || branchname == 'dev' || branchname =='Development' || branchname == 'develop' || branchname == 'master') {
if (branchname == 'master' || branchname == 'staging' || branchname == 'main') {   
   if (enablequalitygate == 'Yes') {
//sleep for 75 seconds before the SonarQube background analysis is complete
     sleep(75)

  def qualitygate = waitForQualityGate()
      if (qualitygate.status != 'OK') {
                 //Update the properties file for SonarQube Frontend as Success
         /* groovylint-disable-next-line SpaceAroundMapEntryColon */
         writeFile file: buildPropfile, text: buildstatusfailed

          withCredentials([string(credentialsId: githubtokencredentialid, variable: 'GITHUB_TOKEN')]) {
         if (agentname.contains(oswindows)) {
     //response = bat(returnStdout: true, script: "curl -XPOST -H \"Authorization: token $GITHUB_TOKEN\" $url -d \"{\"state\": \"success\",\"context\":\"ci/jenkins: owasp-dependency-check-frontend\", \"target_url\": \"https://jenkins.fs.usda.gov\",\"description\": \"Your tests passed on Jenkins!\"}\"")
    //     println(response)
         }
         if(agentname.contains(oslinux)) {
          response = sh(script: "curl -XPOST -H \"Authorization: token $GITHUB_TOKEN\" $url -d '{\"state\": \"failure\",\"context\":\"ci/jenkins: ${stagename}\", \"target_url\": \"${jenkinsbuildurl}\",\"description\": \"Your tests failed on Jenkins!\"}'", returnStdout: true).trim()      
          println(response)
         }
          }
         error "Pipeline aborted due to quality gate coverage failure: ${qualitygate.status}"
      }
      else {
       /* groovylint-disable-next-line SpaceAroundMapEntryColon */
       writeFile file: buildPropfile, text: buildstatussuccess
      }
   }
}
else {
       /* groovylint-disable-next-line SpaceAroundMapEntryColon */
       writeFile file: buildPropfile, text: buildstatussuccess
}
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
