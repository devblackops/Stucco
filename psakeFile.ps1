
task default

task Publish {
    Publish-Module -Path ./Stucco -Repository PSGallery -NuGetApiKey $env:PSGALLERY_API_KEY
} -description 'Publish module to PSGallery'

task ? -description 'Lists the available tasks' {
    'Available tasks:'
    $psake.context.Peek().Tasks.Keys | Sort-Object
}
