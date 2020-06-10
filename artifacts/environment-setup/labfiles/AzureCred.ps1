
$tenantID = (Get-AzContext).Tenant.TenantId
$subsciptionID = (Get-AzContext).Subscription.Id

#Certificates
$certFolder = "C:\Azure\Certs"
$certFilePath = "$certFolder\MB-SPIMARCH20.pfx"
$certStartDate = (Get-Date).Date
$certStartDateStr = $certStartDate.ToString("MM/dd/yyyy")
$certEndDate = $certStartDate.AddYears(1)
$certEndDateStr = $certEndDate.ToString("MM/dd/yyyy")
$certName = "MB-SPIMARCH20"
$certPassword = "Cop123456789!"
$certPasswordSecureString = ConvertTo-SecureString $certPassword -AsPlainText -Force

$application = Get-AzADApplication -DisplayName $certName

$servicePrincipal = Get-AzADServicePrincipal -ApplicationId $application.ApplicationId

$servicePrincipalobjectId = $servicePrincipal.Id
write-host "service principal object Id: " $servicePrincipalobjectId


$AzureUserName="mboswell@microsoft.com"                # READ FROM FILE
$AzurePassword = "<replace>"               # READ FROM FILE
$TokenGeneratorClientId =  $servicePrincipalobjectId = $servicePrincipal.Id  # READ FROM FILE
$AzureSQLPassword = "L1ghtbulb!"