#!/usr/bin/env perl
use warnings; #sed replacement for -w perl parameter

# This script removes special symbols from the transcriptions.

while (<STDIN>) {
  @A = split(" ", $_);
  for ($n = 0; $n < @A; $n++) {
    $a = $A[$n];
    $tmp = $a;
    $tmp =~ s:Ａ:A:g;
    $tmp =~ s:Ｂ:B:g;
    $tmp =~ s:Ｋ:K:g;
    $tmp =~ s:Ｄ:D:g;
    $tmp =~ s:Ｎ:N:g;
    $tmp =~ s:Ｗ:W:g;
    $tmp =~ s:Ｇ:G:g;
    $tmp =~ s:Ｓ:S:g;
    $tmp =~ s:Ｔ:T:g;
    $tmp =~ s:Ｖ:V:g;
    $tmp =~ s:％::g;
    $tmp =~ s:Ⅱ::g;
    $tmp =~ s:＋::g;
    $tmp =~ s:－::g;
    $tmp =~ s:．::g;
    $tmp =~ s:０:0:g;
    $tmp =~ s:１:1:g;
    $tmp =~ s:２:2:g;
    $tmp =~ s:３:3:g;
    $tmp =~ s:４:4:g;
    $tmp =~ s:５:5:g;
    $tmp =~ s:６:6:g;
    $tmp =~ s:７:7:g;
    $tmp =~ s:８:8:g;
    $tmp =~ s:９:9:g;
    $tmp =~ s:；::g;
    $tmp =~ s:＜::g;
    $tmp =~ s:＞::g;
    $tmp =~ s:　::g;
    $tmp =~ s:、::g;
    $tmp =~ s:】::g;
    $tmp =~ s:·::g;
    $tmp =~ s:〉::g;
    $tmp =~ s:〈::g;
    $tmp =~ s:《::g;
    $tmp =~ s:》::g;
    $tmp =~ s:"::g;
    $tmp =~ s:‘::g;
    $tmp =~ s:’::g;
    $tmp =~ s:“::g;
    $tmp =~ s:”::g;
    $tmp =~ s:：::g;
    $tmp =~ s:（::g;
    $tmp =~ s:）::g;
    $tmp =~ s:…::g;
    $tmp =~ s:!::g;
    $tmp =~ s:\?::g;
    $tmp =~ s:-::g;
    $tmp =~ s:@::g;
    $tmp =~ s:‰::g;
    $tmp =~ s:—::g;
    $tmp =~ s:○::g;
    $tmp =~ s:,::g;
    $tmp =~ s:・::g;
    $tmp =~ s:;::g;
    $tmp =~ s:\:::g;
    $tmp =~ s:\(::g;
    $tmp =~ s:\)::g;
    $tmp =~ s:□::g;
    $tmp =~ s: ::g;
    $tmp =~ s:＂::g;
    $tmp =~ s:＃::g;
    $tmp =~ s:＊::g;
    $tmp =~ s:／::g;
    $tmp =~ s:Ｅ::g;
    $tmp =~ s:Ｈ::g;
    $tmp =~ s:Ｍ::g;
    $tmp =~ s:Ｘ::g;
    $tmp =~ s:［::g;
    $tmp =~ s:］::g;
    $tmp =~ s:～::g;
    $tmp =~ s:￣::g;
    $tmp =~ s:￥::g;
    $tmp =~ s:？::g;
    $tmp =~ s:。::g;
    $tmp =~ s:！::g;
    $tmp =~ s:，::g;
    $tmp =~ s:§::g;
    $tmp =~ s:¨::g;
    $tmp =~ s:°::g;
    $tmp =~ s:±::g;
    $tmp =~ s:×::g;
    $tmp =~ s:÷::g;
    $tmp =~ s:ā::g;
    $tmp =~ s:ǎ::g;
    $tmp =~ s:ˉ::g;
    $tmp =~ s:Ι::g;
    $tmp =~ s:Υ::g;
    $tmp =~ s:Φ::g;
    $tmp =~ s:Χ::g;
    $tmp =~ s:α::g;
    $tmp =~ s:β::g;
    $tmp =~ s:γ::g;
    $tmp =~ s:ε::g;
    $tmp =~ s:μ::g;
    $tmp =~ s:π::g;
    $tmp =~ s:ρ::g;
    $tmp =~ s:τ::g;
    $tmp =~ s:φ::g;
    $tmp =~ s:χ::g;
    $tmp =~ s:ψ::g;
    $tmp =~ s:ω::g;
    $tmp =~ s:А::g;
    $tmp =~ s:Б::g;
    $tmp =~ s:В::g;
    $tmp =~ s:Г::g;
    $tmp =~ s:Ж::g;
    $tmp =~ s:З::g;
    $tmp =~ s:И::g;
    $tmp =~ s:Л::g;
    $tmp =~ s:М::g;
    $tmp =~ s:Н::g;
    $tmp =~ s:О::g;
    $tmp =~ s:П::g;
    $tmp =~ s:С::g;
    $tmp =~ s:Ш::g;
    $tmp =~ s:Э::g;
    $tmp =~ s:а::g;
    $tmp =~ s:―::g;
    $tmp =~ s:′::g;
    $tmp =~ s:″::g;
    $tmp =~ s:※::g;
    $tmp =~ s:℃::g;
    $tmp =~ s:Ⅰ::g;
    $tmp =~ s:Ⅲ::g;
    $tmp =~ s:Ⅳ::g;
    $tmp =~ s:Ⅴ::g;
    $tmp =~ s:Ⅵ::g;
    $tmp =~ s:Ⅶ::g;
    $tmp =~ s:Ⅷ::g;
    $tmp =~ s:Ⅸ::g;
    $tmp =~ s:Ⅹ::g;
    $tmp =~ s:→::g;
    $tmp =~ s:∏::g;
    $tmp =~ s:√::g;
    $tmp =~ s:∮::g;
    $tmp =~ s:∶::g;
    $tmp =~ s:≈::g;
    $tmp =~ s:≤::g;
    $tmp =~ s:≥::g;
    $tmp =~ s:⊥::g;
    $tmp =~ s:⌒::g;
    $tmp =~ s:①::g;
    $tmp =~ s:②::g;
    $tmp =~ s:③::g;
    $tmp =~ s:④::g;
    $tmp =~ s:⑤::g;
    $tmp =~ s:⑥::g;
    $tmp =~ s:⑦::g;
    $tmp =~ s:⑧::g;
    $tmp =~ s:⑨::g;
    $tmp =~ s:⑩::g;
    $tmp =~ s:⑴::g;
    $tmp =~ s:⒈::g;
    $tmp =~ s:⒉::g;
    $tmp =~ s:⒒::g;
    $tmp =~ s:─::g;
    $tmp =~ s:━::g;
    $tmp =~ s:│::g;
    $tmp =~ s:┄::g;
    $tmp =~ s:┅::g;
    $tmp =~ s:┘::g;
    $tmp =~ s:┼::g;
    $tmp =~ s:╃::g;
    $tmp =~ s:■::g;
    $tmp =~ s:△::g;
    $tmp =~ s:◆::g;
    $tmp =~ s:●::g;
    $tmp =~ s:☆::g;
    $tmp =~ s:〃::g;
    $tmp =~ s:「::g;
    $tmp =~ s:」::g;
    $tmp =~ s:【::g;
    $tmp =~ s:〓::g;
    $tmp =~ s:〔::g;
    $tmp =~ s:〕::g;
    $tmp =~ s:〖::g;
    $tmp =~ s:〗::g;
    $tmp =~ s:ぃ::g;
    if ($tmp =~ /[^.]{0,}\.+/) {$tmp =~ s:\.:点:g;}
    if ($tmp =~ /[a-zA-Z]/) {$tmp=uc($tmp);}
    print "$tmp ";
  }
  print "\n";
}