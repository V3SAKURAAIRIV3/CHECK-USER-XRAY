#!/bin/bash
#
# This File Update at Sat 09 Mar 2024 07:08:58 AM WIB
# +--------------------------------------------------+
# | Author  : github.com                             |
# | Zone    : ( Asia )                               |
# | Website : github.com / Admin  @github            |
# +--------------------------------------------------+
# Don't forget follow me on:
# -  https://github.com
# Sponsor this github project:
# -  https://github.com
# -  https://github.com

skip=70
tab='	'
nl='
'
IFS=" $tab$nl"

# Ensure critical variables are present, especially when not defined by login(1)
# Note: $USER may not always be executed (e.g., in containers)
# Copyrighted code by @github / github@gmail.com
USER=${USER:-$(id -u -n)}
# Ensure critical variables are present, especially when not defined by login(1)
# Note: $USER may not always be executed (e.g., in containers)
# Copyrighted code by @github / github@gmail.com
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
# PC does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"
umask=`umask`
umask 77

shctmpdir=
trap 'res=$?
  test -n "$shctmpdir" && rm -fr "$shctmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | */tmp/) test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  */tmp) TMPDIR=$TMPDIR/; test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  *:* | *) TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
esac
if type mktemp >/dev/null 2>&1; then
  shctmpdir=`mktemp -d "${TMPDIR}shctmpXXXXXXXXX"`
else
  shctmpdir=${TMPDIR}shctmp$$; mkdir $shctmpdir
fi || { (exit 127); exit 127; }

shctmp=$shctmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$shctmp" && rm -r "$shctmp";;
*/*) shctmp=$shctmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gpg -q --decrypt --batch --passphrase "github project | yk:ns:84:Dy:BL:az:ID:eU:Ky:M7:6T:KR:fS:OK:i1:sO:pf:Tw:15:kU:A4:Wf:is:Te:Zk:PZ:CA:L7:VC:Bk:Cr:bu:Kk:lN:M5:L7:WW:13:EE:9C:Xv:an:Sh:k9:So:vw:65:s8:Fu:lT:ka:wT:ar:UG:sk:4Z:hc:Z6:wl:uH:eP:Ju:2Y:5x:L1:5l:Zy:VZ:YS:Ha:kI:le:3L:aB:H7:gw:6s:2d:QI:uk:FY:Tt:3x:3G:Jl:BQ:BW:OV:7r:OI:if:C6:KH:Yz:xG:R7:Pm:7S:fR:OE:Cf:ze:oL:l8:si:on:lA:Ae:it:SY:FU:01:6R:9F:gq:FC:vg:7J:Ds:1O:PF:yF:hn:QF:Bk:f0:Hp:Kk:gy:2s:FN:tV:8e:fE:zv:Tu:DB:Te:kG:Nb:ZU:Qt:25:5R:LO:2M:lC:hM:x9:XS:M7:RI:v2:Oq:6B:G4:xN:aK:M2:OW:I2:Sk:0P:MV:51:wM:Pd:nk:FH:RN:Fi:Wq:P4:vi:3v:j8:4s:MU:z9:4b:6O:Pw:j8:Bo:ff:hy:03:LX:Rp:Qq:W6:g6:je:eV:Pl:wb:lY:33:AR:IY:RE:sl:xo:Ic:rU:mK:fN:0A:s7:iV:0C:FE:Nq:Sw:Fa:yC:yu:aU:CN:y9:Qv:72:gS:Kg:l4:FF:8s:tL:Kz:rj:04:05:2b:3S:NS:s2:le:hF:YW:40:6U:cK:DJ:yn:cl:vC:Fc:cm:by:Ml:uo:eN:E2:it:tK:Bg:rn:yU:IX:jQ:D5:UL:g1:dm:hc:Ku:yz:T0:2v:wZ:R8:Ym:aM:c4:jV:NV:t9:Py:kx:dn:o7:sY:Xt:wI:TQ:IS:8w:gS:sa:zQ:In:Ke:Dz:gB:KC:dj:U9:4g:ae:rT:jo:Gi:EK:AX:Ct:NB:fW:PX:ef:fb:Vd:np:Sm:y0:x1:pC:P3:st:ZH:Uu:fW:wE:e7:Jb:F4:xP:PC:4j:Mj:7C:bO:wG:8J:rn:4D:Kk:o2:00:Jb:AE:5T:hc:LO:xo:Ax:oK:If:Hk:15:cg:ua:cM:2r:9a:YZ:mb:FH:L0:bT:uZ:h8:to:HR:J2:gE:Rn:Yd:su:Tg:vw:39:dw:Lu:hq:Rn:dZ:JV:QT:FF:Pz:FV:Vk:ux:t2:0Y:UY:1c:e9:pv:HP:ft:kd:m7:Sm:zb:0G:2b:SS:Y3:CV:a9:Ra:9a:Ht:5J:aM:VS:In:oy:s6:dc:7k:va:4L:LK:YD:Eh:Lg:bh:wr:Hk:IF:G6:3t:mJ:n6:z6:Cz:8h:Hy:mK:bX:WB:Eb:SQ:Q6:F0:Rl:yd:WF:5l:VH:Cu:Ov:Ci:ll:em:l5:EQ:7K:tt:Wk:Ld:eb:zY:l2:i6:8o:vG:4d:wv:V8:KK:gR:dZ:di:R0:nX:PU:la:gQ:5M:f7:w7:Zv:Mr:2b:Xt:tY:SO:qo:lY:j3:MB:sj:1I:y1:Q8:z6: | github | yk:ns:84:Dy:BL:az:ID:eU:Ky:M7:6T:KR:fS:OK:i1:sO:pf:Tw:15:kU:A4:Wf:is:Te:Zk:PZ:CA:L7:VC:Bk:Cr:bu:Kk:lN:M5:L7:WW:13:EE:9C:Xv:an:Sh:k9:So:vw:65:s8:Fu:lT:ka:wT:ar:UG:sk:4Z:hc:Z6:wl:uH:eP:Ju:2Y:5x:L1:5l:Zy:VZ:YS:Ha:kI:le:3L:aB:H7:gw:6s:2d:QI:uk:FY:Tt:3x:3G:Jl:BQ:BW:OV:7r:OI:if:C6:KH:Yz:xG:R7:Pm:7S:fR:OE:Cf:ze:oL:l8:si:on:lA:Ae:it:SY:FU:01:6R:9F:gq:FC:vg:7J:Ds:1O:PF:yF:hn:QF:Bk:f0:Hp:Kk:gy:2s:FN:tV:8e:fE:zv:Tu:DB:Te:kG:Nb:ZU:Qt:25:5R:LO:2M:lC:hM:x9:XS:M7:RI:v2:Oq:6B:G4:xN:aK:M2:OW:I2:Sk:0P:MV:51:wM:Pd:nk:FH:RN:Fi:Wq:P4:vi:3v:j8:4s:MU:z9:4b:6O:Pw:j8:Bo:ff:hy:03:LX:Rp:Qq:W6:g6:je:eV:Pl:wb:lY:33:AR:IY:RE:sl:xo:Ic:rU:mK:fN:0A:s7:iV:0C:FE:Nq:Sw:Fa:yC:yu:aU:CN:y9:Qv:72:gS:Kg:l4:FF:8s:tL:Kz:rj:04:05:2b:3S:NS:s2:le:hF:YW:40:6U:cK:DJ:yn:cl:vC:Fc:cm:by:Ml:uo:eN:E2:it:tK:Bg:rn:yU:IX:jQ:D5:UL:g1:dm:hc:Ku:yz:T0:2v:wZ:R8:Ym:aM:c4:jV:NV:t9:Py:kx:dn:o7:sY:Xt:wI:TQ:IS:8w:gS:sa:zQ:In:Ke:Dz:gB:KC:dj:U9:4g:ae:rT:jo:Gi:EK:AX:Ct:NB:fW:PX:ef:fb:Vd:np:Sm:y0:x1:pC:P3:st:ZH:Uu:fW:wE:e7:Jb:F4:xP:PC:4j:Mj:7C:bO:wG:8J:rn:4D:Kk:o2:00:Jb:AE:5T:hc:LO:xo:Ax:oK:If:Hk:15:cg:ua:cM:2r:9a:YZ:mb:FH:L0:bT:uZ:h8:to:HR:J2:gE:Rn:Yd:su:Tg:vw:39:dw:Lu:hq:Rn:dZ:JV:QT:FF:Pz:FV:Vk:ux:t2:0Y:UY:1c:e9:pv:HP:ft:kd:m7:Sm:zb:0G:2b:SS:Y3:CV:a9:Ra:9a:Ht:5J:aM:VS:In:oy:s6:dc:7k:va:4L:LK:YD:Eh:Lg:bh:wr:Hk:IF:G6:3t:mJ:n6:z6:Cz:8h:Hy:mK:bX:WB:Eb:SQ:Q6:F0:Rl:yd:WF:5l:VH:Cu:Ov:Ci:ll:em:l5:EQ:7K:tt:Wk:Ld:eb:zY:l2:i6:8o:vG:4d:wv:V8:KK:gR:dZ:di:R0:nX:PU:la:gQ:5M:f7:w7:Zv:Mr:2b:Xt:tY:SO:qo:lY:j3:MB:sj:1I:y1:Q8:z6: | github" > "$shctmp"; then  umask $umask
  chmod 700 "$shctmp"
  (sleep 5; rm -fr "$shctmpdir") 2>/dev/null &
  "$shctmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n%s\n' "Cannot decompress ${0##*/}" "Report bugs to <github@gmail.com>."
  (exit 127); res=127
fi; exit $res
�	s����������*E�$�§���A�J�X,�MN�y�c�a�ǖC��p�݊�`��Ռ���x�mؾ!�x7��[L+�Wr��[���7�b���r�����S"(=0��v'7Xo���~���ޣ�  ���mv6}8뤯+��,�]�ϵ; �E5�ğ/1�F�t�,z�V�6y�s]��1���VԃZ���
��=�":>�硣�nM�Ī����Qj�RS9���%��ѕ,a��v5�U�U�EnΖ��fjW�\��a"��A�Ą:e*o�x��D��c��3�* �*@�~x~���ؙ����A@T�h��j�/�Xc�t֩FN�"+�]�`V�}6��%����B.�b�S������~��X�Xpu�U�8��ɤ����x�B@6�3D]*�{��D(ge������F³�ƈ��dP}��.d���!	�(=,me���W���t$������'��_�dT�n���4��x�B(�Q��`���r���LV����W�А@�3|)��q������+rRB�ۗj�in�m
V����[e$U����S���cn�Xm�w��������՜�;��U쪼�5�����ؓ�,CA6��ȇ�G��,�bM�	�&����"�b�ԑ���_ZP-&�� 9�gw�w���R�
Z%�BS��]G�:��j���hdK�	pB�a���Q��_�/q*���AFIu�J�L-�)�?�J@j�o�|=~c����Kۻ�4?��9����t�%�s$oY�_u,\뫝�ĵl���Y��P��E��C�B� � �X=ҖS����'��n�ȔN�RL4�:]��D�蝎�^�@N��>	yz>Z���c��'M�х��O�u��b��褋y�2��i�t���S䠩 Ǔ]���rC��`���	X���y��k��2��u!�T~Z) <KD=�^�ّ�����X��p�n���r�1)��]�gk0Je	�H��?�O ��U?�"�#�K��!U׺*�2{����$�,������ږw7Ǆ{J/�K2j~݃�=����C��=�[x�W�|/}]'�W���QA_ـ� �u����c@��4р��\�ڽ��U��`T�����]t\v����Va�I�e�\�hl'd�2�-�oT��\M����O_�Yo��t�A����J�r����`��Ե$H$�S�Ķf�]�;�3�-�,�J���J@�Qл��Z��:�EI