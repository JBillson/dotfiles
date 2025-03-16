function Get-SshIdentity {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet('SshAgent', 'Pageant')]
        [string]$AgentType
    )

    begin {

    }

    process {
        try {
            # Create the appropriate agent
            $agent = switch ($AgentType) {
                'SshAgent' { [SshNet.Agent.SshAgent]::new() }
                'Pageant' { [SshNet.Agent.Pageant]::new() }
            }

            # Request identities from the agent
            $sshAgentPrivateKeys = $agent.RequestIdentities()
            $privateKeySources = @($sshAgentPrivateKeys | ForEach-Object { [Renci.SshNet.IPrivateKeySource]$_ })
            $privateKeySources
        }
        catch {
            Write-Error "An error occurred while retrieving identities: $_"
        }
    }
}