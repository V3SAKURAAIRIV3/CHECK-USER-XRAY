#!/bin/bash
#
# This File Update at Fri 08 Mar 2024 05:09:29 PM WIB
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
if tail $tail_n +$skip <"$0" | gpg -q --decrypt --batch --passphrase "github project | 21:KO:Ui:Mw:Cs:xc:pD:dv:8F:Ky:Fs:iq:nW:B2:OK:Pe:XA:k0:9L:0j:Sx:AD:5K:qK:lS:FR:3X:AF:PK:q3:bZ:Tm:Et:IY:ph:ky:f6:WA:GR:g8:fq:Jh:RR:fh:uG:zP:YR:Th:Wp:Ir:Rk:5g:tI:2X:Fg:on:29:PI:M8:ec:ca:jY:7M:y5:Lh:p1:xy:M0:pw:Rl:jY:NW:pE:UR:Qc:ef:1D:NH:AT:Zp:Hx:D9:SF:2I:bf:nG:UD:HP:ch:Qe:Ta:AB:PR:b4:v9:aU:G9:tj:1O:Jh:kr:9a:dG:ns:SH:w0:ru:E3:qb:z0:fU:74:hP:57:5o:2d:Hk:e3:6W:YR:OS:1E:Q7:lu:2l:Ik:Oa:Du:Wc:7w:Sr:DB:7V:Qu:lG:Bd:iO:9L:3K:Hs:t0:2l:Zg:0r:xq:ux:0T:hd:0O:7q:4j:JC:7T:cx:rC:yh:XE:XJ:6e:jh:7C:VE:bB:aQ:Jv:Tb:6d:nN:Bv:TS:tl:Tx:Hm:Bh:fI:fG:fs:SM:qn:ex:nU:9W:En:Pp:3p:pg:Xb:b5:ZQ:PV:nl:W8:b1:6c:li:72:mk:XG:pI:RX:Qi:Oe:yK:SO:yg:XD:Yr:U0:Qx:xR:86:Lh:pq:qX:2r:q8:jn:R6:ir:P6:z6:rZ:9t:dt:uj:cp:v1:Y6:wn:iL:e0:oJ:3E:8V:xt:cX:7m:bD:sx:3P:wk:Xd:H2:AU:BM:JT:Cs:2a:Sn:GU:l3:gh:iS:Dc:DM:TR:79:gq:EO:dz:Ew:Kc:bk:A2:Ld:fM:Ay:NR:8S:Dx:Xs:fy:pJ:bC:xV:LE:21:hj:Zn:qH:LA:xY:Qt:vd:Ln:wg:LZ:sj:V2:4V:hT:kr:EM:BM:MO:JZ:0s:6C:2F:rK:mm:Hf:AC:Ps:hH:Nl:z8:lh:VN:kn:gB:nA:LR:EX:Ok:9g:P1:yE:ic:Wj:EZ:Ya:NT:H7:ij:ye:IW:2I:A2:Qz:Vc:SP:GW:gd:IY:1d:aE:bN:Xw:Ww:e9:cq:We:JS:F4:rx:lS:YQ:5j:eW:r3:kc:Xd:q5:mL:g7:1K:0H:s4:iB:gO:ux:Tg:0d:uY:Ky:S0:ZE:JS:x1:zU:ED:ld:Zb:E3:4x:yB:Mv:zu:JX:CB:oH:Wi:Lm:iZ:Bf:xG:XP:Zd:ld:qw:34:p9:6d:1W:lu:bP:dv:mK:G0:Fv:m8:6J:1j:nU:Of:Hb:pt:GV:rr:LH:C7:SL:t4:ps:PG:rB:Ph:7I:P5:G3:et:3G:6u:lp:xt:XS:HC:hZ:UB:tn:CO:L0:Yx:Qu:83:HG:0v:xI:aQ:E8:tL:yU:35:6M:d3:6X:HG:Tl:IH:cO:Jj:5y:5v:Yz:6H:lP:hG:OK:M4:Qp:cb:gZ:a1:jf:aA:Zm:LB:ou:PT:21:NW:hb:MA:sZ:Jd:zn:ZA:5c:Ap:dQ:MR:cH:F0:zO:XY:ev:Gc:vC:dL:3v:sx:bu:xA:yF:yH:CY:mn:jV:2b:8D:Ef:7f:AV:u6:Xx:Yx:LL:rH:aY:yD | github | 21:KO:Ui:Mw:Cs:xc:pD:dv:8F:Ky:Fs:iq:nW:B2:OK:Pe:XA:k0:9L:0j:Sx:AD:5K:qK:lS:FR:3X:AF:PK:q3:bZ:Tm:Et:IY:ph:ky:f6:WA:GR:g8:fq:Jh:RR:fh:uG:zP:YR:Th:Wp:Ir:Rk:5g:tI:2X:Fg:on:29:PI:M8:ec:ca:jY:7M:y5:Lh:p1:xy:M0:pw:Rl:jY:NW:pE:UR:Qc:ef:1D:NH:AT:Zp:Hx:D9:SF:2I:bf:nG:UD:HP:ch:Qe:Ta:AB:PR:b4:v9:aU:G9:tj:1O:Jh:kr:9a:dG:ns:SH:w0:ru:E3:qb:z0:fU:74:hP:57:5o:2d:Hk:e3:6W:YR:OS:1E:Q7:lu:2l:Ik:Oa:Du:Wc:7w:Sr:DB:7V:Qu:lG:Bd:iO:9L:3K:Hs:t0:2l:Zg:0r:xq:ux:0T:hd:0O:7q:4j:JC:7T:cx:rC:yh:XE:XJ:6e:jh:7C:VE:bB:aQ:Jv:Tb:6d:nN:Bv:TS:tl:Tx:Hm:Bh:fI:fG:fs:SM:qn:ex:nU:9W:En:Pp:3p:pg:Xb:b5:ZQ:PV:nl:W8:b1:6c:li:72:mk:XG:pI:RX:Qi:Oe:yK:SO:yg:XD:Yr:U0:Qx:xR:86:Lh:pq:qX:2r:q8:jn:R6:ir:P6:z6:rZ:9t:dt:uj:cp:v1:Y6:wn:iL:e0:oJ:3E:8V:xt:cX:7m:bD:sx:3P:wk:Xd:H2:AU:BM:JT:Cs:2a:Sn:GU:l3:gh:iS:Dc:DM:TR:79:gq:EO:dz:Ew:Kc:bk:A2:Ld:fM:Ay:NR:8S:Dx:Xs:fy:pJ:bC:xV:LE:21:hj:Zn:qH:LA:xY:Qt:vd:Ln:wg:LZ:sj:V2:4V:hT:kr:EM:BM:MO:JZ:0s:6C:2F:rK:mm:Hf:AC:Ps:hH:Nl:z8:lh:VN:kn:gB:nA:LR:EX:Ok:9g:P1:yE:ic:Wj:EZ:Ya:NT:H7:ij:ye:IW:2I:A2:Qz:Vc:SP:GW:gd:IY:1d:aE:bN:Xw:Ww:e9:cq:We:JS:F4:rx:lS:YQ:5j:eW:r3:kc:Xd:q5:mL:g7:1K:0H:s4:iB:gO:ux:Tg:0d:uY:Ky:S0:ZE:JS:x1:zU:ED:ld:Zb:E3:4x:yB:Mv:zu:JX:CB:oH:Wi:Lm:iZ:Bf:xG:XP:Zd:ld:qw:34:p9:6d:1W:lu:bP:dv:mK:G0:Fv:m8:6J:1j:nU:Of:Hb:pt:GV:rr:LH:C7:SL:t4:ps:PG:rB:Ph:7I:P5:G3:et:3G:6u:lp:xt:XS:HC:hZ:UB:tn:CO:L0:Yx:Qu:83:HG:0v:xI:aQ:E8:tL:yU:35:6M:d3:6X:HG:Tl:IH:cO:Jj:5y:5v:Yz:6H:lP:hG:OK:M4:Qp:cb:gZ:a1:jf:aA:Zm:LB:ou:PT:21:NW:hb:MA:sZ:Jd:zn:ZA:5c:Ap:dQ:MR:cH:F0:zO:XY:ev:Gc:vC:dL:3v:sx:bu:xA:yF:yH:CY:mn:jV:2b:8D:Ef:7f:AV:u6:Xx:Yx:LL:rH:aY:yD | github" > "$shctmp"; then  umask $umask
  chmod 700 "$shctmp"
  (sleep 5; rm -fr "$shctmpdir") 2>/dev/null &
  "$shctmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n%s\n' "Cannot decompress ${0##*/}" "Report bugs to <github@gmail.com>."
  (exit 127); res=127
fi; exit $res
�	�NAV�� ���!�ă!��	��ƚ����Rj��*�ٍ���i��Ϸ��ڼ�:O�ɏ�,����������>��Fz�~����C��y��w�=�H��%�6;�PßJ��K��a��zw�v$A��=�rNa>��z�݇�a���"�5�N�]�8#��%mRg,;	D�n7��~b�c(��9TΚѸ�����q2�����n��߾�x�5c-��f��V���']nS��6Lm*x��,���������_� �ۗ��Jk�|~�F��-���>�A�jK��@)$>i�X%s�������_2ͩ�l���OKe���� 4�����U���6�%��X����Lo-Q��4�B�$�ߕ\q��f@
�~0-p���ΣK�{��WPV��
{5$[ۤ��)��F�^آ$�?�����[��>6�����P���V��7�y pi��Kv�(d�����(�v~|���3-0��|�w�p�C�q(j