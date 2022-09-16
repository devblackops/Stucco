describe 'Get-StuccoTemplate' {
    it 'Returns the Stucco template' {
        $t = Get-StuccoTemplate
        $t.psobject.TypeNames.Contains('System.Management.Automation.PSCustomObject') | Should -Be $true
    }
}
