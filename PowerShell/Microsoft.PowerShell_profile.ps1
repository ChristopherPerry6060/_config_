
function prompt {
    $p = $executionContext.SessionState.Path.CurrentLocation
    $osc7 = ""
    if ($p.Provider.Name -eq "FileSystem") {
        $ansi_escape = [char]27
        $provider_path = $p.ProviderPath -Replace "\\", "/"
        $osc7 = "$ansi_escape]7;file://${env:COMPUTERNAME}/${provider_path}${ansi_escape}\"
    }
    "${osc7}PS $p$('>' * ($nestedPromptLevel + 1)) ";
}
function cgen {
    & cargo generate --git https://github.com/ChristopherPerry6060/project-templates
}
function cdo {
    & cargo doc --color always --no-deps --open
}

function unzip {
    Expand-Archive "*.zip" .
    
}
function keep-merged {
    get-childitem | where name -notlike "Merged*" | rm
}
function rma {
    rm *
}
Set-Alias -Name lg -Value lazygit
