require recipes-core/images/core-image-minimal.bb

SUMMARY = "A small image just capable of allowing a device to boot."

#------------------------------- Init system -----------------------------------
INIT_MANAGER = "systemd"
IMAGE_INSTALL += " systemd"

#------------------------------ Device manager ---------------------------------
USE_DEVFS = "1"
VIRTUAL-RUNTIME_dev_manager = "udev"

#------------------------------ Network ----------------------------------------
IMAGE_INSTALL += " \
    openssh \
    modemmanager \
    networkmanager \
    curl \
    iw \
    wpa-supplicant \
    ethtool \
    net-tools \
    traceroute \
    iproute2 \
"

#-------------------------- Location - Time ------------------------------------
IMAGE_INSTALL += " \
    ntp \
    ntpq \
    gpsd \
"

#------------------------------ Audio -------------------------------------------
IMAGE_INSTALL += " \
    alsa-lib \
    alsa-tools \
    alsa-utils \
"

#------------------------------ Storage -----------------------------------------
IMAGE_INSTALL += " mmc-utils"

#------------------------------ Editor ------------------------------------------
IMAGE_INSTALL += " vim"

#------------------------------ Tools -------------------------------------------
# Replace busybox with coreutils (which includes full 'ls', 'cp', etc.)
IMAGE_INSTALL += " coreutils"
# Replace busybox ps with procps
IMAGE_INSTALL += " procps"
IMAGE_INSTALL += " rfkill"

