module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Make sound
    output motor         // Vibrate
);
    assign motor=(vibrate_mode==1)?ring:1'b0;
    assign ringer=(vibrate_mode==0)?ring:1'b0;
endmodule
