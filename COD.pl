use warnings;
use strict;

package Node;

sub new {
    my ($class, $val) = @_;
    my $self = {
        value => $val,
        left => undef,
        rigth => undef
    };
    return bless $self, $class;
}

package BST;

sub new {
    my ($class) = @_;
    my $self = {
        root => undef,
    };
    return bless $self, $class;
}

sub add{
    my ($self,$value) = @_;
    if (defined $self -> {root}){
        $self ->_add_recursive($value,$self->{root});
    }else{
        $self-> {root} = Node->new ($value);
    }
}


sub _add_recursive {
    my ($self, $value, $tmp) = @_;
    if ($value < $tmp -> {value}) {
        if (defined $tmp->{left}) {
            $self->_add_recursive($value, $tmp->{left});
        } else {
            $tmp->{left} = Node->new($value);
        }
    } else {
        if (defined $tmp->{right}) {
            $self->_add_recursive($value, $tmp->{right});
        } else {
            $tmp->{right} = Node->new($value);
        }
    }
}

sub preorder {
    my ($self, $tmp) = @_;
    if (defined $tmp) {
        print "$tmp->{value} ";
        $self->preorder($tmp->{left});
        $self->preorder($tmp->{right});
    }
}

sub inorder {
    my ($self , $tmp) = @_;
    if (defined $tmp){
        $self -> inorder ($tmp->{left});
        print "$tmp {value}";
        $self -> inorder($tmp->{right});
    }
}

sub postorder{
    my ($self , $tmp) = @_;
    if (defined $tmp){
        $self -> postorder ($tmp->{left});
        $self -> postorder ($tmp->{right});
        print "$tmp {value}";
    }

}

sub levelorder{
    my ($self , $tmp) = @_;
    
    my @queue;
    push @queue , $tmp;

}




