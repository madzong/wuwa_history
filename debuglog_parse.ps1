$gamePathFile = $ENV:APPDATA + "\KRLauncher\G153\C50004\kr_starter_game.json";
$gamePath = (Get-Content $gamePathFile | Out-String | ConvertFrom-Json).path;
$debugLogPath = $gamePath + "\Client\Binaries\Win64\ThirdParty\KrPcSdk_Global\KRSDKRes\KRSDKWebView\debug.log";
$pattern = [regex] '#url": ("[^"]*)';
$m = $pattern.Matches((Get-Content $debugLogPath | Out-String));
if ($m.Length -eq 0) {
    Write-Host "Cannot find url! Open convene history first!" -ForegroundColor Red;
    return;
}

$url = ($m | Select-Object -Last 1).Groups[1].ToString();
$url = $url.substring(1);

Write-Host "Found URL!";
Write-Host $url;
Write-Host "URL copied to clipboard!";
Set-Clipboard -Value $url;