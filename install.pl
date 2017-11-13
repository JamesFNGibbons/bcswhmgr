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
    # Install the apache2 web server.
    my $output = system("bin/install_httpd.sh");
    if($output ne "1"){
        die("Installation of httpd has failed.");
    }
    else{
        print "Installed HTTP !OK! \n";
    }

    # Install php.
    my $php_install = system("bin/install_php.sh");
    if($php_install ne "1"){
        die("Installation of php has failed.");
    }
    else{
        print "Installed PHP !OK!";
    }
}

print "The installation has completed.";
exit;
