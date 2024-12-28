SUMMARY = "meta-go001: Custom kernel and configuration files"

FILESEXTRAPATHS:append := "${THISDIR}:"

python do_display_banner() {
    bb.plain("***************************************************************************");
    bb.plain("* meta-go001: --- Custom kernel and configuration files configuration --- *");
    bb.plain("***************************************************************************");
}

addtask display_banner before do_build

KERNEL_CONFIG_FRAGMENTS:append:stm32mp1common = " ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', "${WORKDIR}/fragments/${LINUX_VERSION}/fragment-05-go001.config", '', d)} "

SRC_URI += "file://${LINUX_VERSION}/fragment-05-go001.config;subdir=fragments"
# SRC_URI:class-devupstream += "file://${LINUX_VERSION}/fragment-05-go001.config;subdir=fragments"
