SUMMARY = "meta-go001: Custom linux firmwares "

python do_display_banner() {
    bb.plain("*****************************************************************");
    bb.plain("* meta-go001: --- Custom linux firmware files configuration --- *");
    bb.plain("*****************************************************************");
}

addtask display_banner before do_build

FILES:${PN}-rtl8821 = " \
  ${nonarch_base_libdir}/firmware/rtlwifi/rtl8821*.bin \
  ${nonarch_base_libdir}/firmware/rtw88/rtw8821*.bin \
  ${nonarch_base_libdir}/firmware/rtl_bt/rtl8821*.bin \
"

