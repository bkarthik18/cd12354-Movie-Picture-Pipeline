$env:Path += ";$env:LOCALAPPDATA\Microsoft\WinGet\Packages\Kubernetes.kubectl_Microsoft.Winget.Source_8wekyb3d8bbwe;C:\Program Files\Amazon\AWSCLIV2"

$userEntry = "- userarn: arn:aws:iam::681993069705:user/github-action-user\n  username: github-action-role\n  groups:\n    - system:masters\n"
$patchJson = '{"data":{"mapUsers":"' + $userEntry.Replace("`n", "\n") + '"}}'

kubectl patch configmap aws-auth -n kube-system --type merge -p $patchJson
Write-Host "Successfully patched aws-auth!" -ForegroundColor Green

