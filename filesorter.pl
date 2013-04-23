#!/usr/bin/perl
use File::Copy qw(move);
my $directory = shift;
my $startname = shift;
my $depth = shift || 1;

mysort($directory,$startname,$depth);
sub mysort {
    my $path = shift;
    my $file = shift;
    my $depth = shift;
    
    if ($depth <= 0) {
        return
    }
    print "Sorting $path/$file* at depth: $depth\n";
    my $dir = $path;
    for (my $i = 0; $i < 10; $i++) {
            mkdir $dir ."/" . $i or print "Could not create folder $dir/$i: $!\n";
    }

    opendir(my $dh, $dir) || die;
    while(readdir $dh) {
        my $f = $_;
        if ($f =~ /^\Q$file\E([0-9])/) {
            my $new = $dir ."/" . $1;
            my $forig = $dir . "/" . $f;
            if (!(move $forig, $new)) {
                print "Failed to move $forig: $!\n";
            } else {
                print "Moved $forig to $new\n";
            }
        }
        
    }
    closedir $dh;
    for (my $i = 0; $i < 10; $i++) {
        mysort($dir ."/" . $i, $file . $i,$depth-1);
    }
}
