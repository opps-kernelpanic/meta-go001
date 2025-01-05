SUMMARY = "meta-go001: procps mod"
DESCRIPTION = "meta-go001 This Bitbake file is used for a custom procps configuration"

FILESEXTRAPATHS:append := "${THISDIR}/files:"

python do_display_banner() {
    bb.plain("*********************************************");
    bb.plain("* meta-go001: ---  procps configuration --- *");
    bb.plain("*********************************************");
}

SRC_URI += " \
     file://99-custom-sysctl.conf \
     "

do_install:append:stm32mpcommon () {
    install -d ${D}${sysconfdir}/sysctl.d
    install -m 644 ${WORKDIR}/99-custom-sysctl.conf ${D}${sysconfdir}/sysctl.d/99-custom-sysctl.conf
}

addtask display_banner before do_build
