module model (
    input a,
    input b,
    input cin,
    output logic sum,
    output logic cout
);
    assign {cout,sum}=a+b+cin;
endmodule