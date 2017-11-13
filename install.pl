#! dist/perl
use strict;
use warnings;

# Clear the screen
system("clear");

# Check that the program has been run as sudo
my $login = (getpwuid $>);
if($login ne 'root'){
    die("Please run this installer as root.");
}

print "Welcome to the BCS WHMGR Installer. \n";
print "This application should be run on a clean version of CentOS \n";
print "You are running as ROOT.\n";
print "Notice:! This may change the core of the OS.\n";

# Check that the user wants to continue.
print "===============================================\n";
print "Would you like to continue? (Y/N) --> ";
my $continue = <>;
if($continue == 'y' || $continue == 'Y'){
 run_install();  
}
else{
    die("Goodbye.");
    exit;
}

sub run_install {
    # The array of items to install.
    my @to_install = (
        "httpd",
        "php",
        "ruby"
    );
    foreach $to_inst (@to_install){
        print "Attempting to install $to_inst";
        system("yum install $to_inst");
        print "Done installing $to_inst";
    }
}

print "The installation has completed.";
exit;
