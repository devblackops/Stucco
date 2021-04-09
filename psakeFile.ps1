properties {
    if ($galleryApiKey) {
        $PSBPreference.Publish.PSRepositoryApiKey = $galleryApiKey.GetNetworkCredential().password
    }
}

task default -depends test

task Test -FromModule PowerShellBuild -Version 0.6.1

