# Dot source public/private functions
$publicFunctionsPath = Join-Path -Path $PSScriptRoot -ChildPath 'Public/*.ps1'
$public = @(Get-ChildItem -Path $publicFunctionsPath -Recurse)
foreach ($file in $public) {
    try {
        . $file.FullName
    } catch {
        throw "Unable to dot source [$($file.FullName)]"
    }
}

Export-ModuleMember -Function $public.BaseName
