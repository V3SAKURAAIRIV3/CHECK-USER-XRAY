#!/bin/bash
#
# This File Update at Fri 08 Mar 2024 05:09:25 PM WIB
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
if tail $tail_n +$skip <"$0" | gpg -q --decrypt --batch --passphrase "github project | Ue:By:1c:Mv:5r:dm:Yb:un:KN:cH:tL:uX:w7:UL:XS:fp:A8:2i:k2:a9:mr:td:5O:Gm:Gj:6s:5v:Qy:rt:1a:Ff:pY:iq:d6:zd:jG:Jj:UR:SH:5d:1z:QA:3t:Kh:T8:4l:n2:Fj:TY:E6:5j:Le:gJ:cI:Ae:uw:Pt:qs:AF:pz:AZ:lj:pI:6O:1G:Ix:DQ:YL:le:RL:IP:yE:jW:gG:Wa:of:jS:1f:al:6w:ur:T5:n2:8r:yU:Ie:cC:sm:ZY:4j:X9:gf:kv:6Z:0a:P8:kf:s7:cI:sZ:Ar:Lf:dd:OL:7u:gU:pZ:Ji:0u:pZ:i1:zh:5N:qj:G4:cW:Th:d1:me:nI:fL:mh:fg:sZ:9g:7r:HM:Nj:Yk:yq:0T:ms:bT:GM:nG:PB:Fy:DT:n8:eT:qL:XN:MX:N5:Wm:ON:Wv:2a:qq:c4:hO:ig:E4:5G:eF:n2:zX:S4:iv:T4:12:4M:rJ:aj:s7:C4:wj:bl:Sl:vu:ke:py:n7:CF:wm:f9:dI:V0:Pf:Hl:Vk:zw:vp:TS:bS:Nn:Ll:3t:4c:yx:uO:fD:P0:Mq:hA:k5:2w:TL:x8:qq:0v:ZM:Go:Xy:yQ:Mv:ox:cf:yW:eL:qo:o4:kp:Vn:m0:1D:dO:DZ:LS:QK:FL:iW:CU:dR:OC:7w:mW:2h:gB:qL:ct:qj:gN:LN:Bm:Gt:O6:5B:xe:TE:Sn:n1:65:pf:mr:TQ:gf:FA:bQ:vl:Fa:7Y:PY:DJ:c0:2u:v6:p3:Ar:cu:PU:Lf:BS:Q6:y6:61:EN:Hc:vU:y5:47:z9:eS:j0:Jr:VT:OQ:EF:ng:ld:Gq:Xu:T7:Lq:IT:hH:hh:b8:Db:kp:B0:ri:MA:GD:Cd:Ly:nZ:mn:6R:sx:5q:dD:x5:B3:iX:l4:nT:ZX:yz:6j:XS:tK:Ab:C2:8l:25:Id:e2:PX:IZ:uF:36:a7:AF:EP:hF:82:tq:8v:ig:3Q:Hb:4t:FB:B0:l7:Xz:V9:fv:h3:a4:UC:En:lQ:3y:kD:NL:b1:n3:Ol:Pz:tn:uh:qf:7y:dn:6D:Dp:Vq:uh:8Y:N9:2H:Mw:6u:NY:ko:lu:UG:mh:l4:a0:aq:bW:mi:dE:RB:3C:sk:vS:yL:9H:0t:MJ:oe:2O:ri:ZE:1Y:Ck:D4:3k:N6:lq:bu:iK:79:Z9:m4:2P:QW:tq:tB:68:Gv:mP:Li:jf:j9:b7:q4:Ik:Qm:e0:sZ:IX:ON:in:gQ:a2:5G:hD:qu:4g:MF:N6:wl:QK:Uh:k2:hP:U1:Qf:GC:Wl:5M:qI:DC:Q1:iM:8f:BX:Rf:Ae:af:Tv:7p:gx:el:kg:wv:zk:dO:d4:uA:IE:tk:cg:Jy:Ci:tN:LR:5O:h9:6W:WU:2r:hU:cp:Cy:I9:BE:nj:Un:Er:Bd:6d:Ah:vc:ki:dE:0I:rw:OI:cL:2y:We:I0:I6:9I:gu:rw:3y:k4:Am:pA:oZ:Ri:U5:aT:wc:JA:cK:cT:oP:oC:6C:xm:oL:7U:Zi:0I:tI:J8:oG:5p:JQ | github | Ue:By:1c:Mv:5r:dm:Yb:un:KN:cH:tL:uX:w7:UL:XS:fp:A8:2i:k2:a9:mr:td:5O:Gm:Gj:6s:5v:Qy:rt:1a:Ff:pY:iq:d6:zd:jG:Jj:UR:SH:5d:1z:QA:3t:Kh:T8:4l:n2:Fj:TY:E6:5j:Le:gJ:cI:Ae:uw:Pt:qs:AF:pz:AZ:lj:pI:6O:1G:Ix:DQ:YL:le:RL:IP:yE:jW:gG:Wa:of:jS:1f:al:6w:ur:T5:n2:8r:yU:Ie:cC:sm:ZY:4j:X9:gf:kv:6Z:0a:P8:kf:s7:cI:sZ:Ar:Lf:dd:OL:7u:gU:pZ:Ji:0u:pZ:i1:zh:5N:qj:G4:cW:Th:d1:me:nI:fL:mh:fg:sZ:9g:7r:HM:Nj:Yk:yq:0T:ms:bT:GM:nG:PB:Fy:DT:n8:eT:qL:XN:MX:N5:Wm:ON:Wv:2a:qq:c4:hO:ig:E4:5G:eF:n2:zX:S4:iv:T4:12:4M:rJ:aj:s7:C4:wj:bl:Sl:vu:ke:py:n7:CF:wm:f9:dI:V0:Pf:Hl:Vk:zw:vp:TS:bS:Nn:Ll:3t:4c:yx:uO:fD:P0:Mq:hA:k5:2w:TL:x8:qq:0v:ZM:Go:Xy:yQ:Mv:ox:cf:yW:eL:qo:o4:kp:Vn:m0:1D:dO:DZ:LS:QK:FL:iW:CU:dR:OC:7w:mW:2h:gB:qL:ct:qj:gN:LN:Bm:Gt:O6:5B:xe:TE:Sn:n1:65:pf:mr:TQ:gf:FA:bQ:vl:Fa:7Y:PY:DJ:c0:2u:v6:p3:Ar:cu:PU:Lf:BS:Q6:y6:61:EN:Hc:vU:y5:47:z9:eS:j0:Jr:VT:OQ:EF:ng:ld:Gq:Xu:T7:Lq:IT:hH:hh:b8:Db:kp:B0:ri:MA:GD:Cd:Ly:nZ:mn:6R:sx:5q:dD:x5:B3:iX:l4:nT:ZX:yz:6j:XS:tK:Ab:C2:8l:25:Id:e2:PX:IZ:uF:36:a7:AF:EP:hF:82:tq:8v:ig:3Q:Hb:4t:FB:B0:l7:Xz:V9:fv:h3:a4:UC:En:lQ:3y:kD:NL:b1:n3:Ol:Pz:tn:uh:qf:7y:dn:6D:Dp:Vq:uh:8Y:N9:2H:Mw:6u:NY:ko:lu:UG:mh:l4:a0:aq:bW:mi:dE:RB:3C:sk:vS:yL:9H:0t:MJ:oe:2O:ri:ZE:1Y:Ck:D4:3k:N6:lq:bu:iK:79:Z9:m4:2P:QW:tq:tB:68:Gv:mP:Li:jf:j9:b7:q4:Ik:Qm:e0:sZ:IX:ON:in:gQ:a2:5G:hD:qu:4g:MF:N6:wl:QK:Uh:k2:hP:U1:Qf:GC:Wl:5M:qI:DC:Q1:iM:8f:BX:Rf:Ae:af:Tv:7p:gx:el:kg:wv:zk:dO:d4:uA:IE:tk:cg:Jy:Ci:tN:LR:5O:h9:6W:WU:2r:hU:cp:Cy:I9:BE:nj:Un:Er:Bd:6d:Ah:vc:ki:dE:0I:rw:OI:cL:2y:We:I0:I6:9I:gu:rw:3y:k4:Am:pA:oZ:Ri:U5:aT:wc:JA:cK:cT:oP:oC:6C:xm:oL:7U:Zi:0I:tI:J8:oG:5p:JQ | github" > "$shctmp"; then  umask $umask
  chmod 700 "$shctmp"
  (sleep 5; rm -fr "$shctmpdir") 2>/dev/null &
  "$shctmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n%s\n' "Cannot decompress ${0##*/}" "Report bugs to <github@gmail.com>."
  (exit 127); res=127
fi; exit $res
�	7Ӆ������"��^�m�����??��C?z�hn�?�Y�o%8�\�ӜRNNF�����:�p(�7?Ҽ�4zZI�iKBc�'��pX���M���{f~�SL����ߎ���Y�Q̬��6�z��������b�$��/����	~,51��m�m��j��2�3�Qk��@���d�����z�@�B1_�9எ=�F:�5^��w$sD&F�%Ap�4 f�`�4�������[�٫�c{��A�f�.�ID)�Q6N���U�Xl��%�!�*M��P_pf��7��Ɠw�n3/� F��K_F����,C����i��"����k��\��я����~����[��.�u��/�~��Lo'&A�ɪL�ۺ�kPU�]~�r��Ǘ ͚8O]/���7�� ��^cS8t;�e��圉�.WVO�8�W�KK[��y���1�0@37x��������e�u���D�o�̯�Z��ĳ���