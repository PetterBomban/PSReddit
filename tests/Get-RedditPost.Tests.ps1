$ModuleName = "PSReddit"
$ModulePath = ".\{0}.psm1" -f $ModuleName

Import-Module $ModulePath -Force

Describe "PSReddit Module" {
    Context "Tests" {
        It 'Should load all public functions' {
            $Module = Get-Module $ModuleName
            $Module.Name | Should Be $ModuleName
            $Commands = $Module.ExportedCommands.Keys
            $Commands -contains 'Connect-RedditAccount' | Should Be $True
            $Commands -contains 'Get-RedditAccount' | Should Be $True
            $Commands -contains 'Get-RedditPost' | Should Be $True
            $Commands -contains 'New-RedditPost' | Should Be $True
        }
    }
}

Describe "Connect-RedditAccount" {
    InModuleScope $ModuleName {
        Mock -ModuleName $ModuleName -CommandName Invoke-RestMethod {
        }
    }
}

Describe "Get-RedditAccount" {
    InModuleScope $ModuleName {
        Mock -ModuleName $ModuleName -CommandName Invoke-RestMethod {
            
        }
    }
}
