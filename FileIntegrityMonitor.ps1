Function Calc-Hash($fpath){
    $hash = Get-FileHash -Path $fpath -Algorithm SHA512
    return $hash
}


Write-Host "Options:"
Write-Host "   A) Update baseline to be monitored"
Write-Host "   B) Start monitoring using baseline"

$userOpt = Read-Host -Prompt "Please enter 'A' or 'B'"

if ($userOpt.ToUpper() -eq "A") {
    $oldBase = Test-Path -Path .\base.txt

    if ($oldBase){
        Remove-Item .\base.txt
        }

    $files = Get-ChildItem -Path .\Files

    foreach ($f in $files) {
        $hash = Calc-Hash $f.FullName
        "$($hash.Path)|$($hash.Hash)" | Out-File -FilePath .\base.txt -Append
        }
    }

elseif ($userOpt.ToUpper() -eq "B") {
    
    $fileHashDict = @{}

    $fileContents = Get-Content -Path .\base.txt

    foreach ($file in $fileContents) {
        $fileHashDict.add($file.Split("|")[0], $file.Split("|")[1])
        }

    while ($true){

        Start-Sleep -Seconds 1
        $files = Get-ChildItem -Path .\Files

        foreach ($file in $files) {
            $hashLive = Calc-Hash $file.FullName

            if ($fileHashDict[$hashLive.Path] -eq $null) {
                Write-Host "$($hashLive.Path) has been created" -ForegroundColor Red
            }

            else {
         
             if ($fileHashDict[$hashLive.Path] -eq $hashLive.hash) {
            
             }
             else {
                Write-Host "$($hashLive.Path) has changed!" -ForegroundColor Yellow
                }
         
             }

        }
        foreach ($key in $fileHashDict.Keys) {
            $baseExists = Test-Path -Path $key
            if (-Not $baseExists) {
                Write-Host "$($key) has been deleted!"
                }
        }
    }
}
 