SUMMARY = "meta-go001: Custom kernel and configuration files"

FILESEXTRAPATHS:append := "${THISDIR}:"

python do_display_banner() {
    bb.plain("***************************************************************************");
    bb.plain("* meta-go001: --- Custom kernel and configuration files configuration --- *");
    bb.plain("***************************************************************************");
}

addtask display_banner before do_build

KERNEL_CONFIG_FRAGMENTS:append:stm32mp1common = " \
    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', "${WORKDIR}/fragments/${LINUX_VERSION}/fragment-05-go001.config", '', d)} \
"

SRC_URI += "file://${LINUX_VERSION}/fragment-05-go001.config;subdir=fragments"

# Custom kernel and configuration files
addtask do_copy after do_configure before do_compile

SRC_URI += "file://${LINUX_VERSION}/patches_manifest.txt"
KERNEL_LOCAL_PATH = "${THISDIR}/../../../sources/linux"

do_copy() {
    cat ${WORKDIR}/${LINUX_VERSION}/patches_manifest.txt | xargs -I {} cp ${KERNEL_LOCAL_PATH}/{} ${S}/{}
}

