<?xml version="1.0" encoding="UTF-8"?>
<project name="MHP adder" board="Mojo V3" language="Lucid">
  <files>
    <src>multi_LED_digit.luc</src>
    <src>led_digit.luc</src>
    <src>logic.luc</src>
    <src top="true">mojo_top.luc</src>
    <src>fsm_tester.luc</src>
    <ucf>adder_in_out.ucf</ucf>
    <ucf lib="true">io_shield.ucf</ucf>
    <ucf lib="true">mojo.ucf</ucf>
    <component>decoder.luc</component>
    <component>reset_conditioner.luc</component>
    <component>counter.luc</component>
  </files>
</project>
