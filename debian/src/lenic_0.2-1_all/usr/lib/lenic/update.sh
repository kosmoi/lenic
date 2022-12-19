#!/bin/dash

# --- Lenic 0.2-1 update function ---


echo "Get security updates and may some other updates for your system."
echo ""
read -p "Do you want to continue? [Y/n] " RUSURE
  if [ "$RUSURE" = "y" ] || [ "$RUSURE" = "Y" ] || [ "$RUSURE" = "" ]; then
    apt update -y && apt upgrade -y
  else
    echo "...operation canceled"
  fi
