SUMMARY = "meta-go001: dnsmasq mod"
DESCRIPTION = "meta-go001 This Bitbake file is used for a custom dnsmasq configuration"

FILESEXTRAPATHS:append := "${THISDIR}/files:"

python do_display_banner() {
    bb.plain("*********************************************");
    bb.plain("* meta-go001: --- dnsmasq configuration --- *");
    bb.plain("*********************************************");
}

SRC_URI += " \
     file://01-custom-dnsmasq.conf \
     "

do_install:append:stm32mpcommon () {
    install -d ${D}${sysconfdir}/dnsmasq.d
    install -m 644 ${WORKDIR}/01-custom-dnsmasq.conf ${D}${sysconfdir}/dnsmasq.d/01-custom-dnsmasq.conf
}

addtask display_banner before do_build
