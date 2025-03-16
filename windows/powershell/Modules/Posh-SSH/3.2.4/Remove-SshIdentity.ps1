function Remove-SshIdentity {
    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='High')]
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet('SshAgent', 'Pageant')]
        [string]$AgentType,

        [Parameter(Mandatory=$false)]
        [string]$Comment,

        [Parameter(Mandatory=$false)]
        [switch]$All
    )

    begin {}

    process {
        try {
            # Create the appropriate agent
            $agent = switch ($AgentType) {
                'SshAgent' { [SshNet.Agent.SshAgent]::new() }
                'Pageant' { [SshNet.Agent.Pageant]::new() }
            }

            if ($All) {
                if ($PSCmdlet.ShouldProcess("All identities", "Remove")) {
                    $agent.RemoveAllIdentities()
                    Write-Output "All identities have been removed from $AgentType"
                }
            }
            elseif ($Comment) {
                $identities = $agent.RequestIdentities()
                $identityToRemove = $identities | Where-Object { $_.Comment -eq $Comment }

                if ($identityToRemove) {
                    if ($PSCmdlet.ShouldProcess("Identity with comment: $Comment", "Remove")) {
                        $agent.RemoveIdentity($identityToRemove)
                        Write-Output "Identity with comment '$Comment' has been removed from $AgentType"
                    }
                }
                else {
                    Write-Warning "No identity found with the comment: $Comment"
                }
            }
            else {
                Write-Error "You must specify either -All or -Comment"
            }
        }
        catch {
            Write-Error "An error occurred while removing identities: $_"
        }
    }
}