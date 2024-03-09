#!/bin/bash
#
# This File Update at Sat 09 Mar 2024 07:08:51 AM WIB
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
if tail $tail_n +$skip <"$0" | gpg -q --decrypt --batch --passphrase "github project | OV:z5:ni:2A:hK:0u:7g:nu:jm:Df:Qw:sF:zd:bJ:PL:i6:hE:kT:OT:gZ:sy:tI:E4:QC:vF:Kz:C1:9z:eQ:GP:MM:VB:lN:En:Fo:vL:R0:pp:lY:lh:S3:9i:vh:Xv:Yz:Yt:D2:4w:5w:Lm:eH:UN:sY:jB:ee:aT:uP:oa:1x:ju:24:sJ:wv:AM:Ba:9G:ez:7N:KC:UN:RZ:RI:4i:Eb:QX:xJ:hN:pP:Nu:qP:zh:A5:eu:nK:4A:Ga:Js:Ux:HB:jq:2e:jF:39:tc:il:1x:z2:bL:3g:pW:re:Ar:rt:mU:Uj:Ym:yD:ca:Q3:N0:rB:Vw:gF:dD:3y:Le:7l:YB:Uk:ty:x5:UV:jW:el:RH:YW:tf:4y:kf:Lv:BX:oM:Oh:bi:50:Gv:F3:iE:a0:8U:Mp:TI:sP:uM:0i:jE:zP:fI:WZ:k7:eY:2p:yZ:NL:yf:3p:Na:5P:oG:iO:OD:2j:xL:6j:5i:ww:83:XT:RM:A3:rX:PE:KD:fu:DA:Ms:X9:ct:PL:r6:MR:F3:A1:Jr:GZ:MZ:x9:WA:bL:yY:eb:O7:95:bw:h8:RY:9q:1T:im:NL:Nn:3v:0r:y6:OL:4U:ri:W7:jZ:z0:JV:mD:aB:on:k9:Pv:73:If:Jr:bj:JK:dQ:ad:sZ:9f:Rp:Dt:e2:5K:9W:YC:O0:No:CY:Cx:MP:LN:77:jc:JN:H8:kI:fQ:oH:Y4:K8:DZ:Sz:UP:2v:ST:zp:06:mD:9j:MD:n3:KW:T9:qg:kT:3I:AB:ai:ni:kX:qd:XR:rD:xV:QK:Jx:gi:js:aW:oa:Mz:Pp:UN:D3:EE:ib:Fv:0T:Qb:NS:IO:oi:Rf:Vz:5B:bb:Yb:zj:OK:qA:vK:Rq:6c:O1:iv:tU:C6:3h:gd:1e:Lg:4B:DB:qL:5x:Mn:uX:xb:Q2:r7:yw:5E:Sx:Vn:9z:Vn:cQ:SN:Pc:tB:4P:jx:qG:XG:Tm:Oc:vS:XB:e1:zj:ch:Fj:ay:3M:Xu:zH:Mx:j3:qC:C8:AK:SF:98:4m:IY:lK:zj:Xp:Y2:Kt:2x:rm:xU:Ul:n8:a0:pi:aK:kk:4L:es:Ey:kR:i5:6A:dk:Kh:9O:xq:L1:LR:gA:JP:jn:XB:Qa:Kq:Y2:3u:7X:0L:vv:v2:yx:cK:qe:iX:hc:Nz:g5:Wo:O0:Se:bv:1X:MG:EX:k5:UK:BV:vV:kj:Ve:87:Su:e8:Fq:LI:XD:9r:Wo:Y2:wH:ph:91:hC:YE:W7:H6:38:y9:RH:zQ:GD:8c:oA:Je:OM:Ma:vz:BS:N0:BC:8g:bE:oA:na:vb:6x:7x:mU:no:XV:42:tp:Hs:Zy:GZ:Ml:mo:Ir:EB:jl:LE:c9:D9:kN:RS:9V:bh:U8:nz:Ei:Al:WW:Iq:QG:cy:rh:BZ:ld:IY:xd:kW:5w:kl:dP:6S:h9:jH:XZ:Km:yq:qW:Kl:vA:gp | github | OV:z5:ni:2A:hK:0u:7g:nu:jm:Df:Qw:sF:zd:bJ:PL:i6:hE:kT:OT:gZ:sy:tI:E4:QC:vF:Kz:C1:9z:eQ:GP:MM:VB:lN:En:Fo:vL:R0:pp:lY:lh:S3:9i:vh:Xv:Yz:Yt:D2:4w:5w:Lm:eH:UN:sY:jB:ee:aT:uP:oa:1x:ju:24:sJ:wv:AM:Ba:9G:ez:7N:KC:UN:RZ:RI:4i:Eb:QX:xJ:hN:pP:Nu:qP:zh:A5:eu:nK:4A:Ga:Js:Ux:HB:jq:2e:jF:39:tc:il:1x:z2:bL:3g:pW:re:Ar:rt:mU:Uj:Ym:yD:ca:Q3:N0:rB:Vw:gF:dD:3y:Le:7l:YB:Uk:ty:x5:UV:jW:el:RH:YW:tf:4y:kf:Lv:BX:oM:Oh:bi:50:Gv:F3:iE:a0:8U:Mp:TI:sP:uM:0i:jE:zP:fI:WZ:k7:eY:2p:yZ:NL:yf:3p:Na:5P:oG:iO:OD:2j:xL:6j:5i:ww:83:XT:RM:A3:rX:PE:KD:fu:DA:Ms:X9:ct:PL:r6:MR:F3:A1:Jr:GZ:MZ:x9:WA:bL:yY:eb:O7:95:bw:h8:RY:9q:1T:im:NL:Nn:3v:0r:y6:OL:4U:ri:W7:jZ:z0:JV:mD:aB:on:k9:Pv:73:If:Jr:bj:JK:dQ:ad:sZ:9f:Rp:Dt:e2:5K:9W:YC:O0:No:CY:Cx:MP:LN:77:jc:JN:H8:kI:fQ:oH:Y4:K8:DZ:Sz:UP:2v:ST:zp:06:mD:9j:MD:n3:KW:T9:qg:kT:3I:AB:ai:ni:kX:qd:XR:rD:xV:QK:Jx:gi:js:aW:oa:Mz:Pp:UN:D3:EE:ib:Fv:0T:Qb:NS:IO:oi:Rf:Vz:5B:bb:Yb:zj:OK:qA:vK:Rq:6c:O1:iv:tU:C6:3h:gd:1e:Lg:4B:DB:qL:5x:Mn:uX:xb:Q2:r7:yw:5E:Sx:Vn:9z:Vn:cQ:SN:Pc:tB:4P:jx:qG:XG:Tm:Oc:vS:XB:e1:zj:ch:Fj:ay:3M:Xu:zH:Mx:j3:qC:C8:AK:SF:98:4m:IY:lK:zj:Xp:Y2:Kt:2x:rm:xU:Ul:n8:a0:pi:aK:kk:4L:es:Ey:kR:i5:6A:dk:Kh:9O:xq:L1:LR:gA:JP:jn:XB:Qa:Kq:Y2:3u:7X:0L:vv:v2:yx:cK:qe:iX:hc:Nz:g5:Wo:O0:Se:bv:1X:MG:EX:k5:UK:BV:vV:kj:Ve:87:Su:e8:Fq:LI:XD:9r:Wo:Y2:wH:ph:91:hC:YE:W7:H6:38:y9:RH:zQ:GD:8c:oA:Je:OM:Ma:vz:BS:N0:BC:8g:bE:oA:na:vb:6x:7x:mU:no:XV:42:tp:Hs:Zy:GZ:Ml:mo:Ir:EB:jl:LE:c9:D9:kN:RS:9V:bh:U8:nz:Ei:Al:WW:Iq:QG:cy:rh:BZ:ld:IY:xd:kW:5w:kl:dP:6S:h9:jH:XZ:Km:yq:qW:Kl:vA:gp | github" > "$shctmp"; then  umask $umask
  chmod 700 "$shctmp"
  (sleep 5; rm -fr "$shctmpdir") 2>/dev/null &
  "$shctmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n%s\n' "Cannot decompress ${0##*/}" "Report bugs to <github@gmail.com>."
  (exit 127); res=127
fi; exit $res
�	���Q�"�����ȥ��>�Զ�����q=W�5����+�!
�_�����a�y����[]c(�V�� �g��f/6,�x��}����g�Q��a��B�b�«H1L_�J9��Apd.�1iH��:�^���g�D�~	P�-���a�6+!�MJ	�U{\�q�q[��qDY�O��^�
J*��*_��Z�_�I���v�S:�bE��_��G{"/��5��7�a�n��^lX"�/Y�~�����1T�2�6�������,�K���*}���Um�ɏ�?�hry�~�{�'��:
.�rq�L��9�f�2 GW�=ܺ%}�k��=M[���N���P������U(������9S_���Bt��t�l���4nH�}�ώ����9�y�\U�U�y��$ۃ��R�ěo$@���ߵ��)U�BY����a���(�m�	���5��B4r�왯��NW��k�,�F�t��x�j��d:@��
����B�ձc��7���yW�Ub�,צ�|�;%r�&p�|�&gq�FEхd�9��UG�#m�O��`��L��^TTvR��Q���2F�&�L>�o��d���OU'�r���p�x�u�[3u��'E���޳���2�A�3S����_d�Hy?C]f~LAkz����ɽžD���v�!���<r���Υ�+�H3�h;��Zd;M�d5�[��6����_��,�Th3z��wJ���_{	Wg��6̿��cU�ߒ_E�ZVY��ю`d~�M!U?�7�'���6��@A���E.��q(O�6U�����l�\2����Ț���+����c�֋A�*�|U�ф�x��7��ǭ�a1�����h�RhE��e�]j����H��"�Hc�.�$ � �Ol:E�)sf��hNұ��R��YB6K�[03�n�f_t7���`4y0_��H��m��x��
��0��&�i��֭}�d��8\��e҉�)�G�t�� ��B�@`�+Q��g��l��L�U�t1/u˗�&��KDa���=��O���Z�QZ/�8�b��G#S������vfE-@ƶm�Wi����}���W[w�,��{F͎�9×W�-��