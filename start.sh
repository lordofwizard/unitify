# Ensure DISPLAY is set correctly
export DISPLAY=:1
export XAUTHORITY=$HOME/.Xauthority
export XDG_RUNTIME_DIR=/run/user/$UID

# Add the X authority cookie
xauth add $DISPLAY . d7c11dba2b51ce5b975722e599eeda00
xhost +SI:localuser:$(whoami)

# Start the GNOME Terminal
if ! pgrep -x "build.x86_64" > /dev/null; then
    echo "Unity process not found. Restarting unity..."
    "/home/rbl/Downloads/ship/linux build/build.x86_64"
#   ~/unitify
else
    echo "Unity process is running."
fi
