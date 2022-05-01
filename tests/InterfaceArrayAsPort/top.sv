interface sim_sram_if;   
   int start_addr;
endinterface // sim_sram_if

module dut(sim_sram_if ss_if [1:0], output logic [1:0][32-1:0] a);
   assign a[0] = ss_if[0].start_addr;
   assign a[1] = ss_if[1].start_addr;
endmodule // dut

module top(output logic [1:0][32-1:0] o);
   sim_sram_if u_sim_sram_if [1:0] ();
   assign u_sim_sram_if[0].start_addr = 32'h01234567;
   assign u_sim_sram_if[1].start_addr = 32'h89abcdef;
   dut u_dut(.ss_if(u_sim_sram_if), .a(o));
endmodule // top
