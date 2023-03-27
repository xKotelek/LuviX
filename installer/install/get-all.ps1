$LUVI_VERSION = "2.14.0"
$LIT_VERSION = "3.8.5"
# Environment variables take precedence
if (test-path env:LUVI_VERSION) { $LUVI_VERSION = $env:LUVI_VERSION }
if (test-path env:LIT_VERSION) { $LIT_VERSION = $env:LIT_VERSION }

if (test-path env:LUVI_ARCH) {
  $LUVI_ARCH = $env:LUVI_ARCH
} else {
  if ([System.Environment]::Is64BitProcess) {
    $LUVI_ARCH = "Windows-amd64"
  } else {
    $LUVI_ARCH = "Windows-ia32"
  }
}
$LUVI_URL = "https://github.com/luvit/luvi/releases/download/v$LUVI_VERSION/luvi-regular-$LUVI_ARCH.exe"
$LIT_URL = "https://lit.luvit.io/packages/luvit/lit/v$LIT_VERSION.zip"
$LUVIT_URL = "https://github.com/xKotelek/LuviX/releases/download/0.0000000.1/luvitx.zip"

function Download-File {
  param (
    [string]$url,
    [string]$file
  )
  [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls11 -bor [System.Net.SecurityProtocolType]::Tls12;
  Write-Host "Downloading $url to $file"
  $downloader = new-object System.Net.WebClient
  $downloader.Proxy.Credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials;
  $downloader.DownloadFile($url, $file)
}

# Download Files
Download-File $LUVI_URL "luvix.exe"
Download-File $LIT_URL "litx.zip"
Download-File $LUVIT_URL "luvitx.zip"

# Create lit.exe using lit
Start-Process ".\luvix.exe" -ArgumentList "litx.zip -- make litx.zip litx.exe luvix.exe" -Wait -NoNewWindow
# Cleanup
Remove-Item "litx.zip"
# Create luvit using lit
Start-Process ".\litx.exe" -ArgumentList "make luvitx.zip luvitx.exe luvix.exe" -Wait -NoNewWindow
Remove-Item "luvitx.zip"
