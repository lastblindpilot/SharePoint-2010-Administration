if ((Get-PSSnapin "Microsoft.SharePoint.PowerShell" -ErrorAction SilentlyContinue) -eq $null) {
    Add-PSSnapin "Microsoft.SharePoint.PowerShell"
}
Add-Type -AssemblyName System.Web
$spWeb = Get-SPWeb -identity "http://infra/sites/inventory"  
$list = $spWeb.Lists["ARS"]

$list.SaveAsTemplate("ARSListTemplate","ARSListTemplate","ARSListTemplate",0)