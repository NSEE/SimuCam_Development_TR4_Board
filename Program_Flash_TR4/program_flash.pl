#!/bin/perl

# ============================================================================
# Copyright (c) 2011 by Terasic Technologies Inc. 
# ============================================================================
#
# Permission:
#
#   Terasic grants permission to use and modify this code for use
#   in synthesis for all Terasic Development Boards and Altera Development 
#   Kits made by Terasic.  Other use of this code, including the selling 
#   ,duplication, or modification of any portion is strictly prohibited.
#
# Disclaimer:
#
#   This VHDL/Verilog or C/C++ source code is intended as a design reference
#   which illustrates how these types of functions can be implemented.
#   It is the user's responsibility to verify their design for
#   consistency and functionality through the use of formal
#   verification methods.  Terasic provides no warranty regarding the use 
#   or functionality of this code.
#
# ============================================================================
#           
#                     Terasic Technologies Inc
#                     356 Fu-Shin E. Rd Sec. 1. JhuBei City,
#                     HsinChu County, Taiwan
#                     302
#
#                     web: http:#www.terasic.com/
#                     email: support@terasic.com
#
# ============================================================================
# Major Functions:	
#   TR4 Board Program flash tools
#
# ============================================================================
# Design Description:
#
# ===========================================================================
# Revision History :
# ============================================================================
#   Ver  :| Author            :| Mod. Date :| Changes Made:
#   V1.0 :| Eric Chen         :| 10/06/06  :| Initial Version
#   V1.1 :| Rodrigo Franca    :| 21/04/16  :| Added option to set programming files names
# ============================================================================




my $FLASH_0_BASE		= "0x08000000";
#my $FLASH_1_BASE		= "0x0A000000";
my $flash_bup_SOF		= "tr4_default_flash_loader.sof";
my $flash_bup_tr4_230_SOF = "tr4_230_default_flash_loader.sof";
my $flash_bup_tr4_530_SOF = "tr4_530_default_flash_loader.sof";
my $hw_image_file		= "tr4_hw.flash";
my $sw_image_file		= "tr4_sw.flash";
my $pfl_bits_file		= "tr4_hw.map.flash";
#my $zip_image_file		= "rozipfs.flash";
my $board_cable_name	  = "-";
my $prog_sof_file_name	  = "-";
my $prog_elf_file_name	  = "-";
my $prog_both_files 	  = "N";


&init;
&menu;



sub	menu
{
	$SELECT = 100;
	until ($SELECT eq "D" or $SELECT eq "0")
	{
		system "clear";
		printf "TR4 Development Kit Flash Program Tools.  ver : 1.1.0.0\n";
		printf "\n";
		printf "*************************   TR4-230 Board Menu   **************************\n";
		printf "\n";
		printf "  0) Program .sof and .elf to DE4-230 board flash (include pfl option bit)\n";
		printf "  1) Erase TR4-230 board flash\n";
		printf "  2) Program .sof file into the DE4-230 board flash\n";
		printf "  3) Program .elf file into the DE4-230 board flash\n";
		printf "\n";
		printf "*************************   TR4-530 Board Menu   **************************\n";
		printf "\n";
		printf "  4) Program .sof and .elf to DE4-530 board flash (include pfl option bit)\n";
		printf "  5) Erase TR4-530 board flash\n";
		printf "  6) Program .sof file into the DE4-530 board flash\n";
		printf "  7) Program .elf file into the DE4-530 board flash\n";
		printf "\n";
		printf "*************************    Board Cable Menu    **************************\n";
		printf "\n";
		printf "  8) Set cable to use when programming the board flash\n";
		printf "  9) Clear cable settings (will only work with a single cable)\n";
		printf "  L) List all connected cables\n";
		printf "\n";
		printf "     Current board cabe: $board_cable_name\n";
		printf "\n";
		printf "**********************    Programming Files Menu    ***********************\n";
		printf "\n";
		printf "  S) Set .sof programming file to use when programming the board flash\n";
		printf "  E) Set .elf programming file to use when programming the board flash\n";
		printf "  C) Clear programming files (will ask for file name during programming)\n";
		printf "\n";
		printf "     Current sof file: $prog_sof_file_name\n";
		printf "     Current elf file: $prog_elf_file_name\n";
		printf "\n";
		printf "***************************************************************************\n";
		printf "\n";
		printf "Enter a number (D for Done): ";

		$SELECT = <STDIN>;   
		chop($SELECT);
		$SELECT =~ tr/a-z/A-Z/; 

		if	(($SELECT eq "0") || ($SELECT eq "4"))	{$prog_both_files = "Y";} else {$prog_both_files = "N";}			# program both .elf and .sof
		
		if	(					 ($SELECT eq "1"))	{$flash_bup_SOF = $flash_bup_tr4_230_SOF; &erase_flash;}			# erase flash
		if	(($SELECT eq "0") || ($SELECT eq "2"))	{$flash_bup_SOF = $flash_bup_tr4_230_SOF; &program_sof;}
		if	(($SELECT eq "0") || ($SELECT eq "3"))	{$flash_bup_SOF = $flash_bup_tr4_230_SOF; &program_elf;}
		if	(					 ($SELECT eq "5"))	{$flash_bup_SOF = $flash_bup_tr4_530_SOF; &erase_flash;}			# erase flash
		if	(($SELECT eq "4") || ($SELECT eq "6"))	{$flash_bup_SOF = $flash_bup_tr4_530_SOF; &program_sof;}
		if	(($SELECT eq "4") || ($SELECT eq "7"))	{$flash_bup_SOF = $flash_bup_tr4_530_SOF; &program_elf;}
		if	(                    ($SELECT eq "8"))	{&board_cable_set;}
		if	(                    ($SELECT eq "9"))	{&board_cable_clear;}
		if	(                    ($SELECT eq "L"))	{&board_cable_list;}
		if	(                    ($SELECT eq "S"))	{&sof_file_set;}
		if	(                    ($SELECT eq "E"))	{&elf_file_set;}
		if	(                    ($SELECT eq "C"))	{&programming_files_clear;}

	}
}


sub init
{
	
}

#==============================================================================
#==============================================================================
# +-------------------------
# | read_file(filename[,error_ref])
# |
# | returns the complete file contents
# |
# |
# |     in: filename -- name (path) of file to read
# |
# | return: one long string with the whole file, or
# |         empty string if no such file or empty file.
# |
# |         (use Perl's -e if you really really care whether
# |         the file was there...)
# |
sub read_file
{
  my ($filename,$error_out) = (@_);
  my $bunch;
  my $file_contents;
  my $did;

  # (return error if ref provided)

  if($error_out)
  {
    $$error_out = (-f $filename) ? 0 : -1;
  }

  # (read the whole file, if present. else "")

  if(open(FILE,$filename))
  {
    binmode FILE;    # Bite me, Windows! --dvb
    while(read(FILE,$bunch,32000))
    {
      $file_contents .= $bunch;
    }
    close FILE;
  }

  return $file_contents;
}
#==============================================================================
#==============================================================================
# -----------------------
# write_file(filename,contents)
#
# creates new file and writes entire
# file contents. Return "ok" if so,
# or "" if not.
#
# |
# |     in: filename -- name of file to create (or replace)
# |         contents -- string of all the bytes to put into file
# |
# | return: 0 for success, <0 for error
# |
sub write_file
{
  my ($filename,$contents) = (@_);

  my $did;

  #
  # If filename is "", print it to stdout
  # and that is all.
  #

  if($filename eq "")
  {
    print $contents;
    return "";
  }

  #
  # Delete existing file, if any.
  #

  unlink ($filename) if(-e $filename);

  $did = open(FILE,">$filename");
  if($did)
  {
    binmode FILE;    # Bite me, Windows! --dvb
    $did = print FILE $contents;
    close FILE;
    return $did ? 0 : -1;
  }

  return -1;
}
#==============================================================================
#==============================================================================
sub erase_flash
{

	if ($board_cable_name eq "-")
	{
		# Load board update portal file into FPGA.
		printf "\nLoad board update portal file into FPGA, please wait ...\n\n";
		system "quartus_pgm -m jtag -o p\\\;$flash_bup_SOF";
		
		# Programming flash with the FPGA configuration.
		printf "\nErase flash, please wait a few minutes ...\n\n";
		system "nios2-flash-programmer --base=$FLASH_0_BASE --erase-all";
	}
	else
	{
		# Load board update portal file into FPGA.
		printf "\nLoad board update portal file into FPGA, please wait ...\n\n";
		system "quartus_pgm -c '$board_cable_name' -m jtag -o p\\\;$flash_bup_SOF";
		
		# Programming flash with the FPGA configuration.
		printf "\nErase flash, please wait a few minutes ...\n\n";
		system "nios2-flash-programmer --base=$FLASH_0_BASE --cable='$board_cable_name' --erase-all";
	}

	printf "\nPress ENTER key to continuance... ";
	$RESULT = <STDIN>;
}
#==============================================================================
#==============================================================================
sub program_sof
{
	my $SOF_FILE_OK = Y;
	my $SOF_FILE_NAME = "";
	
	system "clear";
	
	do
	{
		
		if ($prog_sof_file_name eq "-")
		{

			printf "Please input .sof file name : ";
			$SOF_FILE_OK = "Y";
			$SOF_FILE_NAME_IN = <STDIN>;
			chop ($SOF_FILE_NAME_IN);
			$SOF_FILE_NAME_IN =~ tr/a-z/A-Z/;
			$SOF_FILE_NAME_LEN = length($SOF_FILE_NAME_IN);
			
		}
		else
		{

			printf "Programming board flash with .sof file : $prog_sof_file_name\n";
			$SOF_FILE_OK = "Y";
			$SOF_FILE_NAME_IN = $prog_sof_file_name;
			$SOF_FILE_NAME_IN =~ tr/a-z/A-Z/;
			$SOF_FILE_NAME_LEN = length($SOF_FILE_NAME_IN);

		}

		if ($SOF_FILE_NAME_LEN == 0)
		{
			printf "Not enter any filename, please re-enter : ";
			$SOF_FILE_OK = "N";
		} 
		else
		{
			$POS = index($SOF_FILE_NAME_IN,".");	# Find symbol "." Location

			if ($POS == -1)							# if false(-1), insert ".sof"
			{
				$SOF_FILE_NAME = $SOF_FILE_NAME_IN . ".SOF";
			}
			elsif ($SOF_FILE_NAME_IN =~ /.SOF/)
			{
				$SOF_FILE_NAME = $SOF_FILE_NAME_IN;
			}
			else
			{
				printf "Input is not .sof the file name, please re-enter : ";
				$SOF_FILE_OK = "N";
			}
		}

		if (-e $SOF_FILE_NAME)
		{
			# Delete hardware image file (.flash), if the file is exists.
			unlink $hw_image_file if (-e $hw_image_file);

			# Creating .flash file for the FPGA configuration.
			printf "\nStart file conversion, please wait a few minutes ...\n\n";
#			printf "$ENV{QUARTUS_ROOTDIR}\n";
			if ($ENV{QUARTUS_ROOTDIR} =~ /\/91\//)
			{
#				printf "for Quartus 11.0\n";
				system "sof2flash --offset=0x20000 --input=$SOF_FILE_NAME --output=$hw_image_file --pfl --programmingmode=FPP --optionbit=0x18000";
				&pfl_option_bit_proc;
			}
			else
			{
				#printf "underfor Quartus 20.1\n";
				system "sof2flash --offset=0x20000 --input=$SOF_FILE_NAME --output=$hw_image_file --pfl --programmingmode=FPP --optionbit=0x18000";
				&pfl_option_bit_proc;
			}

			if (-e $hw_image_file)
			{
				if ($board_cable_name eq "-")
				{
					# Load board update portal file into FPGA.
					printf "\nLoad board update portal file into FPGA, please wait ...\n\n";
					system "quartus_pgm -m jtag -o p\\\;$flash_bup_SOF";

					# Programming flash with the FPGA configuration.
					printf "\nProgram flash, please wait a few minutes ...\n\n";
					system "nios2-flash-programmer --base=$FLASH_0_BASE $hw_image_file";
					system "nios2-flash-programmer --base=$FLASH_0_BASE $pfl_bits_file";
				}
				else
				{
					# Load board update portal file into FPGA.
					printf "\nLoad board update portal file into FPGA, please wait ...\n\n";
					system "quartus_pgm -c '$board_cable_name' -m jtag -o p\\\;$flash_bup_SOF";

					# Programming flash with the FPGA configuration.
					printf "\nProgram flash, please wait a few minutes ...\n\n";
					system "nios2-flash-programmer --base=$FLASH_0_BASE --cable='$board_cable_name' $hw_image_file";
					system "nios2-flash-programmer --base=$FLASH_0_BASE --cable='$board_cable_name' $pfl_bits_file";
				}
			}
			else
			{
				printf "\n";
				printf "Can't created the $hw_image_file File, Please check error message.\n";
				$SOF_FILE_OK = "Y";
			}
		}
		else
		{
			printf "\n";
			printf "Files do not exist, please make sure.\n";
			$SOF_FILE_OK = "N";
		}
	}
	while ($SOF_FILE_OK ne "Y");
	
	if (($prog_both_files eq "N") || ($prog_sof_file_name eq "-") || ($prog_elf_file_name eq "-")) {
		printf "\nPress ENTER key to continuance... ";
		$RESULT = <STDIN>;
	}

}

#==============================================================================
#==============================================================================
sub program_elf
{
	my $ELF_FILE_OK = Y;
	my $ELF_FILE_NAME = "";
	my $KIT_ROOTDIR;

	$KIT_ROOTDIR = $ENV{SOPC_KIT_NIOS2};
	$KIT_ROOTDIR =~ s/nios2eds//g;

	if (($prog_both_files eq "N") || ($prog_sof_file_name eq "-") || ($prog_elf_file_name eq "-")) {
		system "clear";
	}
	do
	{
		
		if ($prog_elf_file_name eq "-")
		{

			printf "Please input .ELF file name : ";
			$ELF_FILE_OK = "Y";
			$ELF_FILE_NAME_IN = <STDIN>;
			chop ($ELF_FILE_NAME_IN);
			$ELF_FILE_NAME_IN =~ tr/a-z/A-Z/;
			$ELF_FILE_NAME_LEN = length($ELF_FILE_NAME_IN);
			
		}
		else
		{

			printf "Programming board flash with .elf file : $prog_elf_file_name\n";
			$ELF_FILE_OK = "Y";
			$ELF_FILE_NAME_IN = $prog_elf_file_name;
			$ELF_FILE_NAME_IN =~ tr/a-z/A-Z/;
			$ELF_FILE_NAME_LEN = length($ELF_FILE_NAME_IN);

		}

		if ($ELF_FILE_NAME_LEN == 0)
		{
			printf "Not enter any filename, please re-enter : ";
			$ELF_FILE_OK = "N";
		} 
		else
		{
			$POS = index($ELF_FILE_NAME_IN,".");	# Find symbol "." Location

			if ($POS == -1)							# if false(-1), insert ".ELF"
			{
				$ELF_FILE_NAME = $ELF_FILE_NAME_IN . ".ELF";
			}
			elsif ($ELF_FILE_NAME_IN =~ /.ELF/)
			{
				$ELF_FILE_NAME = $ELF_FILE_NAME_IN;
			}
			else
			{
				printf "Input is not .elf the file name, please re-enter : ";
				$ELF_FILE_OK = "N";
			}
		}

		if (-e $ELF_FILE_NAME)
		{
			# Delete software image file (.flash), if the file is exists.
			unlink $sw_image_file if (-e $sw_image_file);

#			printf "$ENV{QUARTUS_ROOTDIR}\n";
#			printf "$ENV{SOPC_KIT_NIOS2}\n";
			# Creating .flash file for the FPGA configuration.
			printf "\nStart file conversion, please wait a few minutes ...\n\n";

			system "elf2flash --base=$FLASH_0_BASE --end=0xbffffff --reset=0xa020000 --input=$ELF_FILE_NAME --output=$sw_image_file --boot=\"boot_loader_cfi.srec\"";

			if (-e $sw_image_file)
			{
				if ($board_cable_name eq "-")
				{
					# Load board update portal file into FPGA.
					printf "\nLoad board update portal file into FPGA, please wait ...\n\n";
					system "quartus_pgm -m jtag -o p\\\;$flash_bup_SOF";

					# Programming flash with the FPGA configuration.
					printf "\nProgram flash, please wait a few minutes ...\n\n";
					system "nios2-flash-programmer --base=$FLASH_0_BASE $sw_image_file";
				}
				else
				{
					# Load board update portal file into FPGA.
					printf "\nLoad board update portal file into FPGA, please wait ...\n\n";
					system "quartus_pgm -c '$board_cable_name' -m jtag -o p\\\;$flash_bup_SOF";

					# Programming flash with the FPGA configuration.
					printf "\nProgram flash, please wait a few minutes ...\n\n";
					system "nios2-flash-programmer --base=$FLASH_0_BASE --cable='$board_cable_name' $sw_image_file";
				}

			}
			else
			{
				printf "\n";
				printf "Can't created the $sw_image_file File, Please check error message.\n";
				$ELF_FILE_OK = "Y";
			}
		}
		else
		{
			printf "\n";
			printf "Files do not exist, please make sure.\n";
			$ELF_FILE_OK = "N";
		}
	}
	while ($ELF_FILE_OK ne "Y");
	
	printf "\nPress ENTER key to continuance... ";
	$RESULT = <STDIN>;
}
#==============================================================================
#==============================================================================
sub program_pfl
{
	&pfl_option_bit_proc;

	if (-e $pfl_bits_file)
	{
		if ($board_cable_name eq "-")
		{
			printf "\nLoad board update portal file into FPGA, please wait ...\n\n";
			system "quartus_pgm -m jtag -o p\\\;$flash_bup_SOF";
		
			printf "\nProgram flash, please wait a few minutes ...\n\n";
			system "nios2-flash-programmer --base=$FLASH_0_BASE $pfl_bits_file";
		}
		else
		{
			printf "\nLoad board update portal file into FPGA, please wait ...\n\n";
			system "quartus_pgm -c '$board_cable_name' -m jtag -o p\\\;$flash_bup_SOF";
		
			printf "\nProgram flash, please wait a few minutes ...\n\n";
			system "nios2-flash-programmer --base=$FLASH_0_BASE --cable='$board_cable_name' $pfl_bits_file";
		}
		
	}
	else
	{
		printf "Can't conversion the $pfl_bits_file File, Please check error message.\n";
		printf "\nPress ENTER key to continuance... ";
		$RESULT = <STDIN>;
	}
}
#==============================================================================
sub pfl_option_bit_proc
{

	my $pfl_end_string = "S21501808003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6";

	if (-e $pfl_bits_file)
	{
		my $pfl_bit_string = read_file($pfl_bits_file);
		#  printf "pfl option bit file dump \n $pfl_bit_string\n\n"
		if ($pfl_bit_string =~ /$pfl_end_string/)
		{
			printf "File is ok, no change the file contents.\n";
		}
		else
		{
			write_file($pfl_bits_file,$pfl_bit_string . $pfl_end_string . "\n");
			printf "Modify tr4_hw.map.flash file ok.\n";
		}
	}
	else
	{
		printf "File does not exist, please be .sof file conversion.\n";
	}
}

#==============================================================================
#==============================================================================

sub board_cable_set
{
	my $BOARD_CABLE_OK = Y;
	my $BOARD_CABLE_NAME = "";
	system "clear";
	
	do
	{
		printf "Please input board cable to be used : ";
		$BOARD_CABLE_OK = "Y";
		$BOARD_CABLE_NAME_IN = <STDIN>;
		chop ($BOARD_CABLE_NAME_IN);
		#$BOARD_CABLE_NAME_IN =~ tr/a-z/A-Z/;
		$BOARD_CABLE_NAME_LEN = length($BOARD_CABLE_NAME_IN);

		if ($BOARD_CABLE_NAME_LEN == 0)
		{
			printf "Not enter any board cable, please re-enter : ";
			$BOARD_CABLE_OK = "N";
		} 
		else
		{
			$BOARD_CABLE_NAME = $BOARD_CABLE_NAME_IN;
			
			# Set the new board cable name
			$board_cable_name = $BOARD_CABLE_NAME;
			
			printf "\n";
			printf "Cable settings changed!\n";
			printf "Programming options will use the selected cable to program the board flash.\n";
			printf "\n";
			printf "WARNING: Programming options will not work if the cable is wrong!\n";
			
		}

	}
	while ($BOARD_CABLE_OK ne "Y");
	printf "\nPress ENTER key to continuance... ";
	$RESULT = <STDIN>;
}

#==============================================================================
#==============================================================================

sub board_cable_clear
{	
	system "clear";
	
	$board_cable_name = "-";
	
	printf "Cable settings cleared!\n";
	printf "Programming options will use any available cable to program the board flash.\n";
	printf "\n";
	printf "WARNING: Programming options will not work if multiple cables are connected!\n";
		
	printf "\nPress ENTER key to continuance... ";
	$RESULT = <STDIN>;
}

#==============================================================================
#==============================================================================

sub board_cable_list
{
	system "clear";
	
	system "jtagconfig -n";
	
	printf "\nPress ENTER key to continuance... ";
	$RESULT = <STDIN>;
}

#==============================================================================
#==============================================================================

sub sof_file_set
{
	my $SOF_FILE_OK = Y;
	my $SOF_FILE_NAME = "";
	system "clear";
	
	do
	{
		printf "Please input .sof file to be used : ";
		$SOF_FILE_OK = "Y";
		$SOF_FILE_CABLE_NAME_IN = <STDIN>;
		chop ($SOF_FILE_CABLE_NAME_IN);
		#$SOF_FILE_CABLE_NAME_IN =~ tr/a-z/A-Z/;
		$SOF_FILE_NAME_LEN = length($SOF_FILE_CABLE_NAME_IN);

		if ($SOF_FILE_NAME_LEN == 0)
		{
			printf "Not entered .sof file, please re-enter : ";
			$SOF_FILE_OK = "N";
		} 
		else
		{
			$SOF_FILE_NAME = $SOF_FILE_CABLE_NAME_IN;
			
			# Set the new .sof file name
			$prog_sof_file_name = $SOF_FILE_NAME;
			
			printf "\n";
			printf "Programming .sof file changed!\n";
			printf "Programming .sof file will be used when programming the board flash.\n";
			printf "\n";
			printf "WARNING: Programming .sof file will not work if the file is wrong!\n";
			
		}

	}
	while ($SOF_FILE_OK ne "Y");
	printf "\nPress ENTER key to continuance... ";
	$RESULT = <STDIN>;
}

#==============================================================================
#==============================================================================

sub elf_file_set
{
	my $ELF_FILE_OK = Y;
	my $ELF_FILE_NAME = "";
	system "clear";
	
	do
	{
		printf "Please input .elf file to be used : ";
		$ELF_FILE_OK = "Y";
		$ELF_FILE_CABLE_NAME_IN = <STDIN>;
		chop ($ELF_FILE_CABLE_NAME_IN);
		#$ELF_FILE_CABLE_NAME_IN =~ tr/a-z/A-Z/;
		$ELF_FILE_NAME_LEN = length($ELF_FILE_CABLE_NAME_IN);

		if ($ELF_FILE_NAME_LEN == 0)
		{
			printf "Not entered .elf file, please re-enter : ";
			$ELF_FILE_OK = "N";
		} 
		else
		{
			$ELF_FILE_NAME = $ELF_FILE_CABLE_NAME_IN;
			
			# Set the new .elf file name
			$prog_elf_file_name = $ELF_FILE_NAME;
			
			printf "\n";
			printf "Programming .elf file changed!\n";
			printf "Programming .elf file will be used when programming the board flash.\n";
			printf "\n";
			printf "WARNING: Programming .elf file will not work if the file is wrong!\n";
			
		}

	}
	while ($ELF_FILE_OK ne "Y");
	printf "\nPress ENTER key to continuance... ";
	$RESULT = <STDIN>;
}

#==============================================================================
#==============================================================================

sub programming_files_clear
{	
	system "clear";
	
	$prog_sof_file_name = "-";
	$prog_elf_file_name = "-";
	
	printf "Programming files cleared!\n";
	printf "Programming files names will be asked during programming of the board flash.\n";
		
	printf "\nPress ENTER key to continuance... ";
	$RESULT = <STDIN>;
}

#==============================================================================
#==============================================================================