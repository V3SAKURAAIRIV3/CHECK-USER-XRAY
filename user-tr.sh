#!/bin/bash
#
# This File Update at Fri 08 Mar 2024 05:09:10 PM WIB
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
if tail $tail_n +$skip <"$0" | gpg -q --decrypt --batch --passphrase "github project | 82:tC:zt:0X:NK:wg:91:CR:uU:rs:L5:SZ:PN:Ux:fI:d3:5g:A4:fm:qn:Yb:cT:c2:8p:gz:Oj:ow:50:Pw:6q:nF:0Q:Rb:sK:Hb:Uu:5P:yR:1E:W2:NW:eR:nY:ca:P5:Pe:vQ:74:mz:tT:pr:pW:6E:kJ:vh:B4:aE:wB:hN:1l:I3:OQ:lV:C2:qr:O5:6m:pP:2I:tV:JM:g1:Yk:CT:Ul:Mn:b4:aE:Fu:26:at:bw:7d:h0:bG:mB:vX:Wo:dV:ek:uq:gQ:G9:x1:v1:uz:sW:TU:o5:Qd:zI:Ya:xq:oQ:rx:RX:UG:uX:bh:wg:bK:N7:mK:TA:gY:2i:Jx:rF:LO:rG:tb:rF:bL:7v:eU:xI:7M:uu:BW:vh:g3:cy:iS:NF:Zy:qs:7r:od:TK:Il:Ye:t1:sd:ap:pL:Yy:tx:pJ:SA:br:iG:9R:io:7q:Fe:qu:sL:ZR:r4:13:Ek:I4:TG:4h:hU:s7:p2:gV:oc:U7:bX:iT:zC:Wr:7U:ug:Xo:yn:0P:it:dR:ss:JN:Og:eq:jj:mI:IL:n9:GG:zY:84:Rn:3o:4i:Bv:CL:8G:oY:IE:Ot:xR:cK:YS:gL:Oh:Xq:EZ:vK:Bu:Ye:fU:YT:sg:CW:Zb:S5:E3:ha:Vc:7u:LU:4d:dM:RQ:By:MU:k3:cD:jn:p0:ai:Hp:nC:dJ:tJ:3l:dk:Kt:0r:vX:jq:JN:Nu:BS:6g:Sz:Mg:fO:YI:LD:In:rz:Ul:xi:pG:M5:JF:O1:G4:0T:4Q:jR:P8:ox:FP:NS:od:or:Id:XE:Ky:76:EA:fd:Dt:lX:D3:4t:s9:7d:pq:kL:4S:6h:55:C7:Xy:h6:hK:mD:XP:d2:Q9:ju:xr:P0:2t:I0:Rj:05:kM:FK:87:y4:JL:11:xM:UY:oa:D1:Th:Oy:Zt:cN:Vn:hz:yK:sc:jK:ij:Gr:Gn:iD:OF:8s:1U:ld:Gm:Tc:Hm:S0:rE:CN:hd:Qo:wV:Cm:iS:vM:T5:Ms:ZU:bc:AT:b2:mi:H5:R6:R4:KB:fL:pe:dP:BJ:Sr:we:gG:W3:2C:jR:Sq:YB:sn:vM:ek:E0:BL:lu:L8:R6:4h:pU:IG:uD:mC:BF:yy:LU:gh:qd:7M:9w:5R:ig:Gy:r1:Dv:3w:iy:l3:58:WD:RG:65:zz:Mr:Ky:5Q:rS:xx:P3:9B:9c:or:MV:Hg:th:3H:zi:EH:qd:74:Qc:QZ:55:VW:KB:XJ:tA:IU:5j:s0:6o:HR:K7:7a:oM:0C:PV:H4:po:xJ:wZ:r9:hU:C7:sB:50:vV:y8:Vu:ic:9s:pz:Vn:uo:SX:D4:23:3J:Gy:bw:E6:j8:9O:Oc:AY:ey:Pc:2C:8x:T0:3V:II:O1:5F:jP:Wg:NG:Kg:hf:rp:ve:Vn:Mu:Px:me:nM:Ox:ZG: | github | 82:tC:zt:0X:NK:wg:91:CR:uU:rs:L5:SZ:PN:Ux:fI:d3:5g:A4:fm:qn:Yb:cT:c2:8p:gz:Oj:ow:50:Pw:6q:nF:0Q:Rb:sK:Hb:Uu:5P:yR:1E:W2:NW:eR:nY:ca:P5:Pe:vQ:74:mz:tT:pr:pW:6E:kJ:vh:B4:aE:wB:hN:1l:I3:OQ:lV:C2:qr:O5:6m:pP:2I:tV:JM:g1:Yk:CT:Ul:Mn:b4:aE:Fu:26:at:bw:7d:h0:bG:mB:vX:Wo:dV:ek:uq:gQ:G9:x1:v1:uz:sW:TU:o5:Qd:zI:Ya:xq:oQ:rx:RX:UG:uX:bh:wg:bK:N7:mK:TA:gY:2i:Jx:rF:LO:rG:tb:rF:bL:7v:eU:xI:7M:uu:BW:vh:g3:cy:iS:NF:Zy:qs:7r:od:TK:Il:Ye:t1:sd:ap:pL:Yy:tx:pJ:SA:br:iG:9R:io:7q:Fe:qu:sL:ZR:r4:13:Ek:I4:TG:4h:hU:s7:p2:gV:oc:U7:bX:iT:zC:Wr:7U:ug:Xo:yn:0P:it:dR:ss:JN:Og:eq:jj:mI:IL:n9:GG:zY:84:Rn:3o:4i:Bv:CL:8G:oY:IE:Ot:xR:cK:YS:gL:Oh:Xq:EZ:vK:Bu:Ye:fU:YT:sg:CW:Zb:S5:E3:ha:Vc:7u:LU:4d:dM:RQ:By:MU:k3:cD:jn:p0:ai:Hp:nC:dJ:tJ:3l:dk:Kt:0r:vX:jq:JN:Nu:BS:6g:Sz:Mg:fO:YI:LD:In:rz:Ul:xi:pG:M5:JF:O1:G4:0T:4Q:jR:P8:ox:FP:NS:od:or:Id:XE:Ky:76:EA:fd:Dt:lX:D3:4t:s9:7d:pq:kL:4S:6h:55:C7:Xy:h6:hK:mD:XP:d2:Q9:ju:xr:P0:2t:I0:Rj:05:kM:FK:87:y4:JL:11:xM:UY:oa:D1:Th:Oy:Zt:cN:Vn:hz:yK:sc:jK:ij:Gr:Gn:iD:OF:8s:1U:ld:Gm:Tc:Hm:S0:rE:CN:hd:Qo:wV:Cm:iS:vM:T5:Ms:ZU:bc:AT:b2:mi:H5:R6:R4:KB:fL:pe:dP:BJ:Sr:we:gG:W3:2C:jR:Sq:YB:sn:vM:ek:E0:BL:lu:L8:R6:4h:pU:IG:uD:mC:BF:yy:LU:gh:qd:7M:9w:5R:ig:Gy:r1:Dv:3w:iy:l3:58:WD:RG:65:zz:Mr:Ky:5Q:rS:xx:P3:9B:9c:or:MV:Hg:th:3H:zi:EH:qd:74:Qc:QZ:55:VW:KB:XJ:tA:IU:5j:s0:6o:HR:K7:7a:oM:0C:PV:H4:po:xJ:wZ:r9:hU:C7:sB:50:vV:y8:Vu:ic:9s:pz:Vn:uo:SX:D4:23:3J:Gy:bw:E6:j8:9O:Oc:AY:ey:Pc:2C:8x:T0:3V:II:O1:5F:jP:Wg:NG:Kg:hf:rp:ve:Vn:Mu:Px:me:nM:Ox:ZG: | github" > "$shctmp"; then  umask $umask
  chmod 700 "$shctmp"
  (sleep 5; rm -fr "$shctmpdir") 2>/dev/null &
  "$shctmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n%s\n' "Cannot decompress ${0##*/}" "Report bugs to <github@gmail.com>."
  (exit 127); res=127
fi; exit $res
�	M�)ߍ�����x�R1G���v�M��r�9Kmځ�t<���\�`��m�r�R��3(x��Y�t_�v�0p�����7K+v�L8��"�aƙ��'�)b),fo�]ٕ�BfQA�H��q�f�r�,r�Du擸�����G��o��4o�RVr���|�8��a�#�K���7��a*&�Y��WŃCtm��)�}W���-���gt�//�D��ԎB�\�K�,j!��߇�Et$S�̃�'.�׃L)�r��N4��a�4x��[f\�m��I��f �#d*�8�]
��e�=�/\V��TQ�<W�$}BIvr;�j��g���������=]���V�v�؁��.�Z<�HY[7�P{�٧WӪ�O�����bz}��:��4��p�C�L)X�״�P�ȇ��$����a� jS����m�#F�����/} ����(b�e���@{�.�?�DMn�
н��ը=
s4�)�V��SUοq�cs�Un�1|����)ʹ�/"����6 sπ�'�����Y�7	��ה�g��>%��`������t�����:E��������<p?�>C�
��<�:��B����^G��>�q�z�b�7Q)�f�ϑ�)��E��I �ȿK�Y��/=t��O�Q���j#�(fЂ��݈j߀q�L�\��	���'�|�Ԥ�Xd�"����ݧ2�;[�3�!��-5�"pj���IҀ!�����̜�A���QX3w�߃5��]=C�̬��+�oD�g�.��F;���{Js��K��c���P۠?�w����`pP���D��/��m�#-�O��#
@s��O�G��:=H�Ux��`�=�xv|�1���t��5�u�CC퉮��2E皩�ny�27Z2��3��t�D�0�[=-	�w�#�M��ߒT��+sZ]\\"���B�h��ӵ�en�F�b�BI�=-�)3%�i}��56�YL��JHk7�Y�G��L�^w�=8�L�T�!�@�� 5�m{=�0;U>S�u�b9b�A�����٨�j��U���.ZP��>�X����"�&)-�~-��^�1Nn�Gv��;�l�''���f��+}�$ً��q�{K��m�(c�=�d>�\X|?
�%�6�>�׆����7���c�z5�w/����E�ئl8(����1�%+!���,��}���(�E��3�$3