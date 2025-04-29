SUMMARY = "meta-go001: lvgl mod"
DESCRIPTION = "meta-go001 This Bitbake file is used for a custom lvgl configuration"

FILESEXTRAPATHS:append := "${THISDIR}/files:"

python do_display_banner() {
    bb.plain("******************************************");
    bb.plain("* meta-go001: --- lvgl configuration --- *");
    bb.plain("******************************************");
}

PACKAGECONFIG:append:pn-lvgl= " drm"
LVGL_CONFIG_LV_USE_LOG = "1"
LVGL_CONFIG_LV_LOG_LEVEL = "LV_LOG_LEVEL_WARN"
LVGL_CONFIG_LV_LOG_PRINTF = "1"

addtask display_banner before do_build
