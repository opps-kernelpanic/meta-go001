SUMMARY = "meta-go001: go001 graphical user interface"
DESCRIPTION = "meta-go001 This Bitbake file is used for the go001 user interface application"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

# FILESEXTRAPATHS:append := "${THISDIR}/files:"
SRC_URI = "file://terminal-ui.c \
            file://CMakeLists.txt \
            "

python do_display_banner() {
    bb.plain("********************************************");
    bb.plain("* meta-go001: --- Go001 UI application --- *");
    bb.plain("********************************************");
}

addtask display_banner before do_build

DEPENDS = "lvgl libdrm"

# Set the build system
inherit cmake pkgconfig

do_configure() {
    cmake ${S}/../ \
      -DCMAKE_SYSROOT=${STAGING_DIR_HOST} \
      -DLVGL_INCLUDE_DIR=${STAGING_DIR_HOST}/usr/include/lvgl \
      -DCMAKE_LIBRARY_PATH=${STAGING_DIR_HOST}/usr/lib
}

do_compile() {
    cmake --build . --target terminal-ui
}

do_install() {
    install -d ${D}${bindir}
    install -m 755 terminal-ui ${D}${bindir}
}
