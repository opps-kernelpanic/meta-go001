SUMMARY = "meta-go001: NetworkManager mod"
DESCRIPTION = "meta-go001 This Bitbake file is used for a custom NetworkManager configuration"

FILESEXTRAPATHS:append := "${THISDIR}/files:"

python do_display_banner() {
    bb.plain("****************************************************");
    bb.plain("* meta-go001: --- NetworkManager configuration --- *");
    bb.plain("****************************************************");
}

SRC_URI += " \
     file://eth0.nmconnection \
     "

PACKAGECONFIG:append:pn-networkmanager = " modemmanager"
PACKAGECONFIG:append:pn-networkmanager = " wwan"
PACKAGECONFIG:append:pn-networkmanager = " wifi"

do_install:append:stm32mpcommon () {
    install -d ${D}${sysconfdir}/NetworkManager/system-connections
    install -m 600 ${WORKDIR}/eth0.nmconnection ${D}${sysconfdir}/NetworkManager/system-connections/eth0.nmconnection
}

addtask display_banner before do_build
