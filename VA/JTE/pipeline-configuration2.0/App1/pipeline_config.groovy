String applicationname = 'App1'
String agentname = 'linux-worker1'
String mailinglistemails = 'email@email.com'
String emailtemplatename = 'email.template'
String githubtokencredential = 'GITHUB_TOKEN'
String sonarqubefrontendproject_key = 'App1'
String githubreponame = 'VA/App1'


String jenkins_url = "${env.JENKINS_URL}"
String github_api_url = "${env.GITHUB_API_URL}"
String job_name = "${env.JOB_NAME}"
String branch_name = "${env.BRANCH_NAME}"
String build_number = "${env.BUILD_NUMBER}"
String sonar_host = "${env.SONAR_HOST}"


libraries{
    checkout{
        appname = applicationname
        agent = agentname
        githubapiurl = "${github_api_url}/${githubreponame}/statuses/"
        githubtokencredentialid = githubtokencredential
        jobname = "${job_name}"
        branchname = "${branch_name}"
        buildnumber = "${build_number}"
        jenkinsurl = "${jenkins_url}"
    }

      buildfsapps{          
        agent = agentname
        appname = applicationname
        stagename = "build"
        githubapiurl = "${github_api_url}/${githubreponame}/statuses/"
        githubtokencredentialid = "GITHUB_TOKEN"
        jobname = "${job_name}"
        branchname = "${branch_name}"
        buildnumber = "${build_number}"
        jenkinsurl = "${jenkins_url}"
        buildPropfile = "buildfsapps.properties"        
    }
    owasp_dependency_check{
        appname = applicationname
        stagename = "owasp-dependency-check"
        agent = agentname
        githubapiurl = "${github_api_url}/${githubreponame}/statuses/"
        githubtokencredentialid = githubtokencredential
        jobname = "${job_name}"
        branchname = "${branch_name}"
        buildnumber = "${build_number}"
        jenkinsurl = "${jenkins_url}"
        scanfolderpath = "src"
        projectname = "App1"
        scanoutpath =  "owaspreport"
        buildPropfile = "buildowaspf.properties"
    }

    sonarqube{
        appname = applicationname
        stagename = "sonarqube"
        agent = agentname
        githubapiurl = "${github_api_url}/${githubreponame}/statuses/"
        githubtokencredentialid = githubtokencredential
       jobname = "${job_name}"
        branchname = "${branch_name}"
        buildnumber = "${build_number}"
        jenkinsurl = "${jenkins_url}"
        project_key = sonarqubefrontendproject_key
        sonarqubeprojectname = sonarqubefrontendproject_key
        sonarqubeextraparams =" -Dsonar.dependencyCheck.reportPath=owaspreport/dependency-check-report.xml"
        sonarqubescantype = "java"
        sonar_url =  "${sonar_host}"
        enablequalitygate = "No"
        git_branch = "${branch_name}"
        buildPropfile = "buildsqf.properties"
    }
    upload_artifacts{
        appname = applicationname
        stagename = "sonarqube"
        agent = agentname
        githubapiurl = "${github_api_url}/${githubreponame}/statuses/"
        githubtokencredentialid = githubtokencredential
       jobname = "${job_name}"
        branchname = "${branch_name}"
        buildnumber = "${build_number}"
        jenkinsurl = "${jenkins_url}"
        project_key = sonarqubefrontendproject_key
        sonarqubeprojectname = sonarqubefrontendproject_key
        sonarqubeextraparams =" -Dsonar.dependencyCheck.reportPath=owaspreport/dependency-check-report.xml"
        sonarqubescantype = "java"
        sonar_url =  "${sonar_host}"
        enablequalitygate = "No"
        git_branch = "${branch_name}"
        buildPropfile = "buildsqf.properties"
    }
    deploy_dev{
        appname = applicationname
        stagename = "sonarqube"
        agent = agentname
        githubapiurl = "${github_api_url}/${githubreponame}/statuses/"
        githubtokencredentialid = githubtokencredential
       jobname = "${job_name}"
        branchname = "${branch_name}"
        buildnumber = "${build_number}"
        jenkinsurl = "${jenkins_url}"
        project_key = sonarqubefrontendproject_key
        sonarqubeprojectname = sonarqubefrontendproject_key
        sonarqubeextraparams =" -Dsonar.dependencyCheck.reportPath=owaspreport/dependency-check-report.xml"
        sonarqubescantype = "java"
        sonar_url =  "${sonar_host}"
        enablequalitygate = "No"
        git_branch = "${branch_name}"
        buildPropfile = "buildsqf.properties"
    }
     
}

