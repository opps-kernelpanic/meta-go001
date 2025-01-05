
SUMMARY = "meta-go001: Custom base files and input for profile.d"

FILESEXTRAPATHS:append := "${THISDIR}/files:"

python do_display_banner() {
    bb.plain("*******************************************************");
    bb.plain("* meta-go001: --- Custom base-files configuration --- *");
    bb.plain("*******************************************************");
}

SRC_URI += " \
      file://terminal.sh \
      file://network.sh \
"

do_install:append:stm32mpcommon () {
    install -d ${D}${sysconfdir}/profile.d/
    install -m 644 ${WORKDIR}/terminal.sh ${D}${sysconfdir}/profile.d/terminal.sh
    install -m 644 ${WORKDIR}/network.sh ${D}${sysconfdir}/profile.d/network.sh
}

addtask display_banner before do_build
