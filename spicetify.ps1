# Function to install Spotify via winget
function install_spotify {
  winget install spotify
}

# Function to install Spicetify
function install_spicetify {
  Invoke-WebRequest -UseBasicParsing -Uri "https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.ps1" | Invoke-Expression
}

# Function to install Spicetify Marketplace
function install_marketplace {
  Invoke-WebRequest -UseBasicParsing -Uri "https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/resources/install.ps1" | Invoke-Expression
}

Write-Output "Checking if Spotify is installed through winget."

# Check if Spotify is installed
if (winget list --name spotify | Select-String -Pattern "Spotify") {
  Write-Output "Spotify is installed."
}
else {
  Write-Output "Spotify is not installed through winget."

  # Prompt user to install Spotify
  $spotifyChoice = $Host.UI.PromptForChoice('', "Do you want to install Spotify?", ("&Yes", "&No"), 0)

  # If user wants to install Spotify
  if ($spotifyChoice -eq 0) {
    Write-Output "Installing Spotify.."
    install_spotify
  }

  # If user doesn't want to install Spotify
  elseif ($spotifyChoice -eq 1) {
    Write-Output "No problem. The program will now stop"
    exit
  }
}

# Prompt user to install Spicetify
$spicetifyChoice = $Host.UI.PromptForChoice('', "Do you want to install 🔥 Spicetify? 🌶️", ("&Yes", "&No"), 0)

# If user wants to install Spicetify
if ($spicetifyChoice -eq 0) {
  Write-Output "Installing 🔥 Spicetify.."
  install_spicetify

  <# This is now done by default #>
  # # Prompt user to install Spicetify Marketplace
  # $marketplaceChoice = $Host.UI.PromptForChoice('', "Do you want to install Spicetify Marketplace?", ("&Yes", "&No"), 0)

  # # If user wants to install Spicetify Marketplace
  # if ($marketplaceChoice -eq 0) {
  #   Write-Output "Installing Spicetify Markeplace.."
  #   install_marketplace
  # }
}

# If user doesn't want to install Spicetify
elseif ($spicetifyChoice -eq 1) {
  Write-Output "No problem. The program will now stop"
}
