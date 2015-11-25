###
### Steps of deployment using PowerShell
###


### 1. Add solution to Farm Solutions

Add-SPSolution “C:\WSP Deployment\NewSolutionPack.wsp”


### 2. Deploy your solution

# a. To a specific web application
Install-SPSolution -Identity “NewSolutionPack.wsp” -WebApplication “http://sps:1&#8221; -GACDeployment -CASPolicies -Confirm:$false

# b. To all web applications
Install-SPSolution -Identity “NewSolutionPack.wsp” -AllWebApplications -GACDeployment -CASPolicies -Confirm:$false

### 3. Upgrade the solution by Retract and delete the old solution, then add and deploy the new one


# a. 
Uninstall-SPSolution -Identity “NewSolutionPack.wsp” -WebApplication “http://sps:1&#8221; -Confirm:$false
# if you want to retract the solution from all web applications, you need to use this
Uninstall-SPSolution -Identity “NewSolutionPack.wsp” -AllWebApplications -Confirm:$false

# b. 
Remove-SPSolution -Identity “NewSolutionPack.wsp” -Confirm:$false

# c.
Add-SPSolution “C:\WSP Deployment\NewSolutionPack.wsp”

# d. 
Install-SPSolution -Identity “NewSolutionPack.wsp” -WebApplication “http://sps:1&#8221; -GACDeployment -CASPolicies -Confirm:$false
