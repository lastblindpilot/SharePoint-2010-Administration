if ((Get-PSSnapin "Microsoft.SharePoint.PowerShell" -ErrorAction SilentlyContinue) -eq $null) {
    Add-PSSnapin "Microsoft.SharePoint.PowerShell"
}
  
try {
	# Site URL
	$spWeb = Get-SPWeb -identity "http://smsk01we32u/"
	  
	# List name
	$listName = "SSEF template"
	  
	# List description
	$listDescription = "SSEF listName"  
	  
	# Templates:  
	# https://joelblogs.co.uk/2011/06/16/sharepoint-2010-base-types-list-template-and-definition-ids-and-content-types-ids/
	$listTemplate = [Microsoft.SharePoint.SPlistTemplateType]::GenericList 
	
	Write-host "Adding list : " $listName

	$spListCollection = $spWeb.Lists 
	
	# Add list
	$spListCollection.Add($listName,$listDescription,$listTemplate) 
	
	
	# Get new list
	$listNameWithURL = "/Lists/" + $listName
	$spList = $spWeb.GetList($listNameWithURL) 
	
	# Add list to the Quick Launch
	# $spList.OnQuickLaunch = "True" 

	$spFieldType = [Microsoft.SharePoint.SPFieldType]::Text 
	$firstFieldName = "FirstName"
	$secondFieldName = "LastName"
	$spList.Fields.Add("FirstName",$spFieldType,$false) 
	$spList.Fields.Add("LastName",$spFieldType,$false) 
	
	<# $choices = New-Object System.Collections.Specialized.StringCollection 
	$choices.Add("First Choice") 
	$choices.Add("Second Choice") 
	$choices.Add("Third Choice")  

 	$spFieldType = [Microsoft.SharePoint.SPFieldType]::Choice 
	$spList.Fields.Add("ChoiceField",$spFieldType,$false,$false,$choices)  #>
	
	
	# Modify view
	$listViewNameWithURL = "/Lists/" + $listName + "/AllItems.aspx"
	$spView = $spWeb.GetViewFromUrl($listViewNameWithURL) 
	
	$spField = $spList.Fields[$firstFieldName] 
	$spView.ViewFields.Add($spField) 
	
	$spField = $spList.Fields[$secondFieldName] 
	$spView.ViewFields.Add($spField) 
	
	$spView.Update()
	
}
  
catch {
  Write-host "Error" $_.exception
  $errorlabel = $true
}
  
finally {
  if ($spWeb -ne $null) {$spWeb.Dispose()}
  #if($errorlabel -eq $true) {exit 1} else {exit 0}
} 
