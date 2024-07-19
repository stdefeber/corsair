.. _amm:

=========
Wishbone
=========

Signals
=======

These signals will be used in the interface of the register map.

============= ===== ========= =========================================================
Signal        Width Direction Description
============= ===== ========= =========================================================
wb_adr_i      >1    input     Wishbone address
wb_dat_i      >1    input     Wishbone write data
wb_we_i       1     input     Wishbone write
wb_cyc_i      1     input     Wishbone cycle
wb_stb_i      1     input     Wishbone strobe
wb_sel_i      >1    input     Wishbone sel
wb_dat_o      >1    output    Wishbone read data
wb_ack_o      1     output    Wishbone acknowledge 
============= ===== ========= =========================================================

.. note::

    Specific bit widths for buses are defined in ``globcfg`` section of a ``csrconfig`` file.

Protocol
========

Refer to official documentation: `Wishbone Specification <https://cdn.opencores.org/downloads/wbspec_b3.pdf`_.
