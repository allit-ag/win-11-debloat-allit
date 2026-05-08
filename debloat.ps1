$tempConfig = "C:\Temp\Win11Debloat-Config-20260501.json"

# Ensure temp directory exists
New-Item -ItemType Directory -Path "C:\Temp" -Force | Out-Null

try {
    # Download config locally
    Invoke-WebRequest `
        -Uri "https://raw.githubusercontent.com/allit-ag/win-11-debloat-allit/refs/heads/main/config/Win11Debloat-Config-20260501.json" `
        -OutFile $tempConfig

    # Run debloat script with local config
    & ([scriptblock]::Create((irm "https://debloat.raphi.re/"))) -Config $tempConfig
}
finally {
    # Cleanup config file afterwards
    Remove-Item $tempConfig -Force -ErrorAction SilentlyContinue
}