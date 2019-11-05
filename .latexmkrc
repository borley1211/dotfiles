#!/usr/bin/env perl
{
  $latex                         = 'xelatex -synctex=1 -interaction=batchmode';
  $pdflatex                      = 'pdflatex %O -synctex=1 -interaction=nonstopmode %S';
  $lualatex                      = 'lualatex %O -synctex=1 -interaction=nonstopmode %S';
  $xelatex                       = 'xelatex %O -no-pdf -synctex=1 -shell-escape -interaction=nonstopmode %S';
  $biber                         = 'biber --bblencoding=utf8 -u -U --output_safechars';
  $bibtex                        = 'pbibtex';
  $makeindex                     = 'mendex %O -o %D %S';
  $dvipdf                        = 'dvipdfmx %O -o %D %S';
  $dvips                         = 'dvips %O -z -f %S | convbkmk -u > %D';
  $ps2pdf                        = 'ps2pdf %O %S %D';
  $xdvpdf                        = 'xdvipdfmx -o %D %O %S -E';
  $pdf_mode                      = 3;
}
