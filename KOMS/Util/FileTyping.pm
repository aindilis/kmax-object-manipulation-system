package KOMS::Util::FileTyping;

use Data::Dumper;

use Class::MethodMaker
  new_with_init => 'new',
  get_set       =>
  [

   qw /  /

  ];

sub init {
  my ($self,%args) = @_;
  $self->Attribute($args{Attribute} || "");
}

sub GetFileType {
  my ($self,%args) = @_;
  my $file = $args{File};
  my $type;
  if ($file =~ /\.pdf$/) {	# use MIME tests here
    # it's a PDF, find out whether it is text, image, or image w/ text
    # for now, just return searchable PDF
    my $quotedpdffile = shell_quote("$file");
    my $res2 = `pdftotext $quotedpdffile -`;
    if ($res2 =~ /\w/) {
      # it's a searchable
      $type = "SearchablePDF";
    } else {
      $type = "ImagePDF";
    }
  }
  if (defined $type) {
    return {
	    Success => 1,
	    Class => "SearchablePDF",
	   };
  } else {
    return {
	    Success => 0,
	   };
  }
}

1;
