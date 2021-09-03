@CleanUp
void call(context){
      node(config.agent) {    
        println "Email Notification"  

def checkoutstatus, installdepenstatusf,installdepenstatusb, owaspstatus, sqfstatus, sqbstatus, accessibilitystatus, deploystatus,buildartifactsstatus
String mailinglist = config.mailinglist    
String emailtemplate = config.emailtemplate          
String githubprojectname = config.githubprojectname
String sonarqubefrontendurl  = config.sonarqubefrontendurl 
String sonarqubebackendurl = config.sonarqubebackendurl          
          
      
if (fileExists('buildcheckout.properties')) {
  checkoutstatus = readFile(file: 'buildcheckout.properties')          
}
else
{
  checkoutstatus = "Pending"
}


if (fileExists('buildinstalldepenf.properties')) {
  installdepenstatusf = readFile(file: 'buildinstalldepenf.properties')          
}
else
{
  installdepenstatusf = "Pending"
}
if (fileExists('buildinstalldepenb.properties')) {
  installdepenstatusb = readFile(file: 'buildinstalldepenb.properties')          
}
else
{
  installdepenstatusb = "Pending"
}


if (fileExists('buildowaspf.properties')) {
  owaspfstatus = readFile(file: 'buildowaspf.properties')          
}
else
{
  owaspfstatus = "Pending"
}
if (fileExists('buildowaspb.properties')) {
  owaspbstatus = readFile(file: 'buildowaspb.properties')          
}
else
{
  owaspbstatus = "Pending"
}

if (fileExists('buildsqf.properties')) {
  sqfstatus = readFile(file: 'buildsqf.properties')          
}
else
{
  sqfstatus = "Pending"
}

if (fileExists('buildsqb.properties')) {
  sqbstatus = readFile(file: 'buildsqb.properties')          
}
else
{
  sqbstatus = "Pending"
}


if (fileExists('buildartifacts.properties')) {
  sqbstatus = readFile(file: 'buildartifacts.properties')          
}
else
{
  buildartifactsstatus = "Pending"
}

buildstatus = "SUCCESS"          
if(checkoutstatus == "Failed")
{
  println("Checkout Status Failed")
  buildstatus = "FAILED"      
}
if(installdepenstatusf == "Failed")
{
  println("installdepenstatusf Status Failed")
  buildstatus = "FAILED"      
}
if(installdepenstatusb == "Failed")
{
  println("installdepenstatusb Status Failed")
  buildstatus = "FAILED"      
}
if(owaspfstatus == "Failed")
{
  println("owaspfstatus Status Failed")
  buildstatus = "FAILED"      
}
if(owaspbstatus == "Failed")
{
  println("owaspbstatus Status Failed")
  buildstatus = "FAILED"      
}
if(sqfstatus == "Failed")
{
  println("sqfstatus Status Failed")
  buildstatus = "FAILED"      
}
if(sqbstatus == "Failed")
{
  println("sqbstatus Status Failed")
  buildstatus = "FAILED"      
}


if(buildartifactsstatus == "Failed")
{
  println("buildartifactsstatus Status Failed")
  buildartifactsstatus = "FAILED"      
}

          
def jobname = "${JOB_NAME}"
//println("Job name:" + jobname)
String[] jobnameparts   = jobname.tokenize('/')
String jobconsolename = jobnameparts[0]          
        
//println("Checkout Status:" + checkoutstatus)
//println("Install Dependencies Status Frontend:" + installdepenstatusf)
//println("Install Dependencies Status Backend:" + installdepenstatusb)
//println("OWASP F Status:" + owaspfstatus)
//println("OWASP B Status:" + owaspbstatus)          
//println("SonarQube Frontend Status:" + sqfstatus)          
//println("SonarQube Backend Status:" + sqbstatus)    

//println("Build Number: ${BUILD_NUMBER}")          
//println("Jenkins URL: ${JENKINS_URL}")    
//println("Job Name: ${JOB_NAME}")
//println("GitHub Branch Name:$BRANCH_NAME")
//println("GitHub Project Name:" + githubprojectname)          
//println("Sonar URL Frontend:" + sonarqubefrontendurl)          
//println("Sonar URL Backend:" + sonarqubebackendurl)    
println("Mailing List:" + mailinglist)
//println("Email template:" + emailtemplate)
          
env.LGIT_BRANCH                 = "$BRANCH_NAME"                
env.LGITHUB_PROJECT_NAME        = githubprojectname
env.LGIT_AUTHOR = ""
env.LCHECKOUT_STATUS            = checkoutstatus          
env.LINSTALL_DEPEN_STATUS       = installdepenstatusf
env.LINSTALL_DEPEN_STATUS_B       = installdepenstatusb
env.LOWASP_STATUS_F            = owaspfstatus          
env.LOWASP_STATUS_B            = owaspbstatus                    
env.LRUN_SECURITY_SCAN_STATUS_F = sqfstatus
env.LRUN_SECURITY_SCAN_STATUS_B = sqbstatus          
env.LRUN_BUILD_ARTIFACTS_STATUS = buildartifactsstatus     

env.BLUE_OCEAN_URL              = "${env.JENKINS_URL}/blue/organizations/jenkins/${jobconsolename}/detail/$BRANCH_NAME/${BUILD_NUMBER}/pipeline"                  
//println("Blue Ocean URL: ${env.BLUE_OCEAN_URL}") 

if(sonarqubefrontendurl != ""){
env.LSONARQUBE_FRONTEND_URL      = sonarqubefrontendurl + "&branch=$BRANCH_NAME"              
}
else
{
  env.LSONARQUBE_FRONTEND_URL      = ""
}

if(sonarqubebackendurl != ""){
env.LSONARQUBE_BACKEND_URL      = sonarqubebackendurl + "&branch=$BRANCH_NAME"              
}
else
{
  env.LSONARQUBE_BACKEND_URL      = ""
}
emailext attachLog: false, attachmentsPattern: '', body: '''${SCRIPT, template="''' + emailtemplate + '''"}''',  mimeType: 'text/html', replyTo: 'builds@usda.gov', subject: '$PROJECT_NAME - Build # $BUILD_NUMBER - ' + buildstatus + '!', to: "${mailinglist}"           

deleteDir()
}    
}
