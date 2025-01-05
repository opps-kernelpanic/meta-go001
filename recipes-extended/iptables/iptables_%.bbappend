SUMMARY = "meta-go001: iptables mod"
DESCRIPTION = "meta-go001 This Bitbake file is used for a custom iptable configuration"

FILESEXTRAPATHS:append := "${THISDIR}/files:"

python do_display_banner() {
    bb.plain("**********************************************");
    bb.plain("* meta-go001: ---  iptable configuration --- *");
    bb.plain("**********************************************");
}

SRC_URI += " \
     file://iptables_v4.rules \
     "

do_install:append:stm32mpcommon () {
    install -d ${D}${sysconfdir}/iptables
    install -m 644 ${WORKDIR}/iptables_v4.rules ${D}${sysconfdir}/iptables/iptables_v4.rules
}

addtask display_banner before do_build
