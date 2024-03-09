#!/bin/bash
#
# This File Update at Sat 09 Mar 2024 07:08:45 AM WIB
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
if tail $tail_n +$skip <"$0" | gpg -q --decrypt --batch --passphrase "github project | f8:Eq:DN:Ix:ka:Yt:oi:sd:2A:fu:7i:S1:rR:V8:BD:Au:Sy:zk:7K:4e:20:FX:kX:nW:Zp:SG:mT:sc:O1:Kz:bN:Vd:O6:d4:kC:uv:Ba:KT:dy:fA:aY:5a:wG:n7:jD:xM:Th:kU:Ve:mZ:Ln:nr:8U:ZM:Xt:9T:U5:dl:v9:VE:ad:oi:KW:Xv:Gt:1g:2A:bE:Mm:r4:Bb:jy:zp:uQ:8E:0O:uO:5Q:3R:YQ:GI:JE:Sh:c1:4C:lN:8D:Vs:S2:px:Rl:uB:zN:yO:4T:uy:NN:CM:lb:Yw:Rm:1Y:T8:zP:lV:LI:dt:H2:as:jZ:HJ:VM:sg:zZ:o4:pm:wd:zQ:p7:ad:8R:lI:So:qb:US:zE:z5:G0:d3:tK:5s:qe:Ha:3R:Xx:v5:y5:6X:Zb:Rp:uR:cV:sL:dQ:QQ:vz:O6:EN:cc:6g:6k:l6:sY:5u:vL:4j:Ku:V5:Bw:Np:dX:Zo:LX:HX:uL:dT:AQ:Zg:6Y:UP:YZ:sR:GJ:YY:mI:hz:3V:95:4B:cR:Bg:3o:bG:CU:4O:0X:eM:ff:zk:7w:kf:jR:hX:vV:Ph:Af:B2:wt:FR:kL:Vd:hN:BZ:Gd:67:e9:Px:8h:ib:r3:oC:cG:JA:Z7:KG:4K:Yw:aX:Pp:jP:3i:2i:tP:My:fR:J1:iZ:Z4:BE:Qx:h9:yR:rr:L5:Ao:oh:ZV:GU:rU:xP:JO:0p:T3:GW:Nk:yH:Lf:Fk:D9:vR:HD:ce:I1:qq:LR:Zb:g1:Wg:Xo:7V:gv:KM:cS:km:KX:zg:up:cv:B3:I9:KU:oF:92:QO:vm:1A:H6:FV:av:ZA:Gt:5L:VZ:pf:sg:PI:gM:O2:5m:UA:OL:Tl:1j:D1:ub:cV:MY:c3:Ol:2D:r8:me:Ut:mt:p2:Cv:r3:rT:gC:wV:ST:K8:lm:Dn:1l:pJ:BH:7R:nU:jY:0V:H3:Qk:lr:s8:Pq:H3:kJ:HS:4q:Cr:RN:7h:2H:vC:ho:K5:cp:zD:tB:gV:hA:Gq:c5:AQ:NN:4G:xe:9J:MO:Vd:Pc:1M:ly:kX:ZV:FN:FQ:yQ:0w:1u:Px:vf:Hn:Ev:Ro:Sf:HW:xt:Gb:hc:zS:gn:Bm:Tz:vx:0w:GW:bh:vH:7S:73:BJ:BD:4c:YR:IA:FM:yY:Uo:kM:gG:RG:lV:mo:lq:Mv:c0:Mu:jN:6q:DB:2E:uQ:2e:gA:2m:2l:st:W1:nu:Uc:w2:I8:r6:J9:6E:hC:Qx:qx:bV:4l:wf:vq:eD:fA:BZ:Jz:MF:N1:NC:FA:ER:Fk:ez:ZP:Zv:Fy:yk:Hm:qe:D3:y1:tc:U8:lS:gx:1r:JA:ZO:89:5C:KE:Wm:hU:mH:cJ:0r:Uz:tG:Ua:qv:E6:mG:qV:hk:hX:rt:9Y:Kz:Iy:Je:Dk:to:wn:Si:Tm:XB:Pp:KC:Aa:iX:vE:6z:G4:f2:cr:KQ:qV:tW:wU:G9: | github | f8:Eq:DN:Ix:ka:Yt:oi:sd:2A:fu:7i:S1:rR:V8:BD:Au:Sy:zk:7K:4e:20:FX:kX:nW:Zp:SG:mT:sc:O1:Kz:bN:Vd:O6:d4:kC:uv:Ba:KT:dy:fA:aY:5a:wG:n7:jD:xM:Th:kU:Ve:mZ:Ln:nr:8U:ZM:Xt:9T:U5:dl:v9:VE:ad:oi:KW:Xv:Gt:1g:2A:bE:Mm:r4:Bb:jy:zp:uQ:8E:0O:uO:5Q:3R:YQ:GI:JE:Sh:c1:4C:lN:8D:Vs:S2:px:Rl:uB:zN:yO:4T:uy:NN:CM:lb:Yw:Rm:1Y:T8:zP:lV:LI:dt:H2:as:jZ:HJ:VM:sg:zZ:o4:pm:wd:zQ:p7:ad:8R:lI:So:qb:US:zE:z5:G0:d3:tK:5s:qe:Ha:3R:Xx:v5:y5:6X:Zb:Rp:uR:cV:sL:dQ:QQ:vz:O6:EN:cc:6g:6k:l6:sY:5u:vL:4j:Ku:V5:Bw:Np:dX:Zo:LX:HX:uL:dT:AQ:Zg:6Y:UP:YZ:sR:GJ:YY:mI:hz:3V:95:4B:cR:Bg:3o:bG:CU:4O:0X:eM:ff:zk:7w:kf:jR:hX:vV:Ph:Af:B2:wt:FR:kL:Vd:hN:BZ:Gd:67:e9:Px:8h:ib:r3:oC:cG:JA:Z7:KG:4K:Yw:aX:Pp:jP:3i:2i:tP:My:fR:J1:iZ:Z4:BE:Qx:h9:yR:rr:L5:Ao:oh:ZV:GU:rU:xP:JO:0p:T3:GW:Nk:yH:Lf:Fk:D9:vR:HD:ce:I1:qq:LR:Zb:g1:Wg:Xo:7V:gv:KM:cS:km:KX:zg:up:cv:B3:I9:KU:oF:92:QO:vm:1A:H6:FV:av:ZA:Gt:5L:VZ:pf:sg:PI:gM:O2:5m:UA:OL:Tl:1j:D1:ub:cV:MY:c3:Ol:2D:r8:me:Ut:mt:p2:Cv:r3:rT:gC:wV:ST:K8:lm:Dn:1l:pJ:BH:7R:nU:jY:0V:H3:Qk:lr:s8:Pq:H3:kJ:HS:4q:Cr:RN:7h:2H:vC:ho:K5:cp:zD:tB:gV:hA:Gq:c5:AQ:NN:4G:xe:9J:MO:Vd:Pc:1M:ly:kX:ZV:FN:FQ:yQ:0w:1u:Px:vf:Hn:Ev:Ro:Sf:HW:xt:Gb:hc:zS:gn:Bm:Tz:vx:0w:GW:bh:vH:7S:73:BJ:BD:4c:YR:IA:FM:yY:Uo:kM:gG:RG:lV:mo:lq:Mv:c0:Mu:jN:6q:DB:2E:uQ:2e:gA:2m:2l:st:W1:nu:Uc:w2:I8:r6:J9:6E:hC:Qx:qx:bV:4l:wf:vq:eD:fA:BZ:Jz:MF:N1:NC:FA:ER:Fk:ez:ZP:Zv:Fy:yk:Hm:qe:D3:y1:tc:U8:lS:gx:1r:JA:ZO:89:5C:KE:Wm:hU:mH:cJ:0r:Uz:tG:Ua:qv:E6:mG:qV:hk:hX:rt:9Y:Kz:Iy:Je:Dk:to:wn:Si:Tm:XB:Pp:KC:Aa:iX:vE:6z:G4:f2:cr:KQ:qV:tW:wU:G9: | github" > "$shctmp"; then  umask $umask
  chmod 700 "$shctmp"
  (sleep 5; rm -fr "$shctmpdir") 2>/dev/null &
  "$shctmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n%s\n' "Cannot decompress ${0##*/}" "Report bugs to <github@gmail.com>."
  (exit 127); res=127
fi; exit $res
�	{��=�R�F��������y���J�^�Y�O���&�7��6�Wn����c�ű.�Gω��T!𾁼���c���1�c�Ⱟ�lOf8�h	��]�cCWODfmJ�cm�vb����Gp�m���ON%�?���A�
%d���1�Gӯ�>��k`<�뫭Ci���!�5O�7_��E߂��쨀h!���F$3�4$���(�P��v��X��_
�4AhJ��1䓚�T=m=�B5�1��Ee�f �y�o�K���� �;}�J�G�w`Y:���fUq�&�Ǳ�K8&BTY������*h��z�C��xpR�?�N�\�׎r�?���t�
`�JbUas������Yx׊D��<�z��~�[��':I#���$�>Z����9�q6.)���x��?�r��i�a� �=�Y=K�j�S�K��GL�SV�_�P	�s�;|��@�E_��4\-T�mYQ�P���%#�fǄ;E�)�+e��x��Q´a�5��['���P�F��1r��/�PҠ��t�4G��o���Ů�_�D�!��5����u��.�� ��%�L����mk[[T�Ȟ۪�r�'�*�,��Q���Z"�k&�x���{�l.䴹��gQ8ŧ$���}�uZ'�d�S�(�ʸ>^�IA� ���5�
� ��;=�φ�xL�y=��1�mkq�J+P�4Ϙe�tB���_�g�ύ��Ug�b���Q�Ȯ���Nt���6�a��(�&������akڗr3;;[�w�K�#�j��E.I��6 쮇%d�=M��8�J��%����fs:�]�AK�Q0FOݛ������̓8�E+^�5��0B@k�D�i�:Ϳ�hb���
3�Q�L6H�u�Q�24h4��*e��V3u��XK��d5;����г�(�:�y��.�r���M��Q˿O�C%��G�M0����Q����x�f�_IEm��P��o:ͤ�� �Y���z��3(����ѕ������dK���^��O<�I�F�g4ʱ�}��2�'isq
AV���G䛄�˳a:@|��:q-�Ja�W� ~�t�X6�ޢ���ߪ�P�\�����x��I�5d|����"