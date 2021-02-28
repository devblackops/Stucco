properties {
    $PSBPreference.Publish.PSRepositoryApiKey = $galleryApiKey.GetNetworkCredential().password
}

task default -depends test

task Test -FromModule PowerShellBuild -Version 0.5.0

