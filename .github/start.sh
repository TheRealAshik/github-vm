#Downloads
curl -s -o login.sh -L "https://raw.githubusercontent.com/JohnnyNetsec/github-vm/main/mac/login.sh"
#disable spotlight indexing
sudo mdutil -i off -a

#Create new account
sudo dscl . -create /Users/runneradmin
sudo dscl . -create /Users/runneradmin UserShell /bin/bash
sudo dscl . -create /Users/runneradmin RealName Runner_Admin
sudo dscl . -create /Users/runneradmin UniqueID 1001
sudo dscl . -create /Users/runneradmin PrimaryGroupID 80
sudo dscl . -create /Users/runneradmin NFSHomeDirectory /Users/runneradmin
sudo dscl . -passwd /Users/runneradmin P@ssw0rd!
sudo createhomedir -c -u runneradmin > /dev/null
sudo dscl . -append /Groups/admin GroupMembership runneradmin

#Install TigerVNC (free alternative that works headless)
echo "Installing TigerVNC..."
brew install tigervnc

#Create VNC password file
mkdir -p ~/.vnc
echo "P@ssw0rd!" | vncpasswd -f > ~/.vnc/passwd
chmod 600 ~/.vnc/passwd

#Start TigerVNC server with virtual display
vncserver :1 -geometry 1920x1080 -depth 24 -localhost no

#Alternative: Use x11vnc with virtual framebuffer
# brew install x11vnc
# x11vnc -create -env FD_PROG=/usr/bin/fluxbox -env X11VNC_FINDDISPLAY_ALWAYS_FAILS=1 -env X11VNC_CREATE_GEOM=${1:-1920x1080x24} -nopw -forever -shared

#install ngrok
brew install --cask ngrok
#configure ngrok and start it
ngrok authtoken $1
ngrok tcp 5901 --region=in &
