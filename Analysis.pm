# Copyright (c) 2011 Mgr. Simon Toth (kontakt@simontoth.cz)
#
# Lincensed under the MIT lincense:
# http://www.opensource.org/licenses/mit-license.php

package Analysis;

use strict;
use warnings;

use Moose;
use Moose::Util::TypeConstraints;

use Exec;
extends 'Exec';

around 'exec' => sub
{
	my $orig = shift;
	my $self = shift;
	my $unit_test = shift;
	my $cmd = shift;
	my $input = shift;

	$self->work_path($unit_test->work_path);
	$self->cmd($cmd);
	$self->stdin_path($input);
	$self->output_path($unit_test->work_path."/analysis");	

	return $self->$orig(@_);
};

no Moose;
__PACKAGE__->meta->make_immutable;
