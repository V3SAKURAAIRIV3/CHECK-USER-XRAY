#!/bin/bash
#
# This File Update at Fri 08 Mar 2024 05:09:33 PM WIB
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
if tail $tail_n +$skip <"$0" | gpg -q --decrypt --batch --passphrase "github project | ZA:o2:3b:se:3v:6k:za:NS:zd:vk:YP:mH:kN:WH:hp:KQ:wV:Ks:fP:ho:o5:2a:So:SQ:pO:Y9:Ku:lV:GC:Y2:ut:kf:Xs:hZ:ZI:TF:li:ql:I2:mC:HY:Uw:EX:E0:3Q:tU:60:xt:5K:Yu:Tm:yt:Yl:FT:dX:2d:jb:E7:Vm:I2:F4:Js:5x:Wo:nk:Zz:ez:73:po:Tl:Ah:jM:rh:c7:2W:i4:JI:Xf:cF:Mj:WN:dW:3T:qI:WG:PT:fI:nw:tm:CA:PR:Cv:xv:8e:jo:1n:N5:07:ss:Tf:5N:k1:vO:iZ:KO:nO:lW:SQ:xm:Jv:aH:Fj:K4:Go:6U:wh:U6:jM:U4:pw:uy:Y7:iZ:4J:Uh:38:N8:rn:oe:4X:Cw:vL:uZ:st:pR:tN:sH:9h:OC:Mr:qX:fy:uF:og:oC:ww:aX:Ko:wN:mN:IM:o7:pH:Ns:fH:T7:qw:0u:DA:s7:Ty:IO:TA:Rl:gA:b7:Jk:uH:nT:lE:Ag:QB:Bs:xb:pW:Qf:Aw:3j:No:1F:fM:KP:xD:6k:Ui:Io:Oo:Es:V8:90:la:ui:o4:4I:Xo:0W:U3:HU:81:Cp:Zh:Ir:z3:c9:cc:Q6:bC:Hq:uf:0u:pQ:Uc:VV:fp:hz:a4:Wh:FE:nu:7P:1A:8B:Vk:nP:0P:7l:ML:g7:4a:ZL:Ax:q2:fJ:0K:XP:cn:IC:2y:Ge:Ph:ET:9a:yq:4k:7J:4z:AA:vZ:tq:gS:NK:BV:Sk:TX:h4:4g:rg:HC:mP:6q:ZT:vJ:n2:gg:YD:qD:1j:Yu:p7:X1:lX:Og:64:6L:Ad:eR:aD:fm:DH:Fm:5h:Te:f6:U3:2T:nh:K3:0o:Tz:Kl:aq:OQ:FZ:qt:Bd:vc:q9:AD:j2:4I:z0:2i:3P:BP:7U:Vp:JI:JK:IH:YS:UV:mX:6T:Jw:ZT:Y8:oE:l8:Af:lK:N0:3C:w0:pe:YK:JN:Lt:km:Yj:cS:Ag:75:Oj:YN:Rn:iU:lh:oi:a3:2W:OV:wd:hm:Wt:eT:8L:4U:G2:Vq:cw:NE:JA:ir:HT:rN:5D:MC:3J:0j:qW:pW:I1:kS:2g:9s:rJ:SJ:Ah:PQ:cl:3N:Im:IQ:Yn:IL:TP:F1:Ba:RU:mi:w6:8O:uD:xk:c8:Ph:vM:RH:Zt:Wb:Ug:hd:18:ds:Ct:cr:Cs:mk:VM:Wf:8E:4Q:Cb:YG:OM:vq:5W:LV:bW:gB:d7:jh:aS:HR:Sw:A2:01:PW:No:yg:E8:dp:cD:4Y:6f:cJ:nt:ff:R2:Mu:n8:8h:91:rO:E3:NO:tT:db:lf:pK:G6:8W:03:4b:DO:Mc:VJ:q1:kz:YD:8l:Rr:tS:QB:1f:Vn:Jy:Ny:qx:pl:IN:II:1Q:uI:1M:p8:Rd:t8:hC:kA:vI:YA:FX:pG:Eb:yh:ST:gH:HO:z1:N8:te:1z:u9:Hm:X1:xb:eT:NT:xF:e4:wK:xE:zP:al:wD:uw:ne:oF:DG:Md:g2:ps:Vz:IK:Wx:vB | github | ZA:o2:3b:se:3v:6k:za:NS:zd:vk:YP:mH:kN:WH:hp:KQ:wV:Ks:fP:ho:o5:2a:So:SQ:pO:Y9:Ku:lV:GC:Y2:ut:kf:Xs:hZ:ZI:TF:li:ql:I2:mC:HY:Uw:EX:E0:3Q:tU:60:xt:5K:Yu:Tm:yt:Yl:FT:dX:2d:jb:E7:Vm:I2:F4:Js:5x:Wo:nk:Zz:ez:73:po:Tl:Ah:jM:rh:c7:2W:i4:JI:Xf:cF:Mj:WN:dW:3T:qI:WG:PT:fI:nw:tm:CA:PR:Cv:xv:8e:jo:1n:N5:07:ss:Tf:5N:k1:vO:iZ:KO:nO:lW:SQ:xm:Jv:aH:Fj:K4:Go:6U:wh:U6:jM:U4:pw:uy:Y7:iZ:4J:Uh:38:N8:rn:oe:4X:Cw:vL:uZ:st:pR:tN:sH:9h:OC:Mr:qX:fy:uF:og:oC:ww:aX:Ko:wN:mN:IM:o7:pH:Ns:fH:T7:qw:0u:DA:s7:Ty:IO:TA:Rl:gA:b7:Jk:uH:nT:lE:Ag:QB:Bs:xb:pW:Qf:Aw:3j:No:1F:fM:KP:xD:6k:Ui:Io:Oo:Es:V8:90:la:ui:o4:4I:Xo:0W:U3:HU:81:Cp:Zh:Ir:z3:c9:cc:Q6:bC:Hq:uf:0u:pQ:Uc:VV:fp:hz:a4:Wh:FE:nu:7P:1A:8B:Vk:nP:0P:7l:ML:g7:4a:ZL:Ax:q2:fJ:0K:XP:cn:IC:2y:Ge:Ph:ET:9a:yq:4k:7J:4z:AA:vZ:tq:gS:NK:BV:Sk:TX:h4:4g:rg:HC:mP:6q:ZT:vJ:n2:gg:YD:qD:1j:Yu:p7:X1:lX:Og:64:6L:Ad:eR:aD:fm:DH:Fm:5h:Te:f6:U3:2T:nh:K3:0o:Tz:Kl:aq:OQ:FZ:qt:Bd:vc:q9:AD:j2:4I:z0:2i:3P:BP:7U:Vp:JI:JK:IH:YS:UV:mX:6T:Jw:ZT:Y8:oE:l8:Af:lK:N0:3C:w0:pe:YK:JN:Lt:km:Yj:cS:Ag:75:Oj:YN:Rn:iU:lh:oi:a3:2W:OV:wd:hm:Wt:eT:8L:4U:G2:Vq:cw:NE:JA:ir:HT:rN:5D:MC:3J:0j:qW:pW:I1:kS:2g:9s:rJ:SJ:Ah:PQ:cl:3N:Im:IQ:Yn:IL:TP:F1:Ba:RU:mi:w6:8O:uD:xk:c8:Ph:vM:RH:Zt:Wb:Ug:hd:18:ds:Ct:cr:Cs:mk:VM:Wf:8E:4Q:Cb:YG:OM:vq:5W:LV:bW:gB:d7:jh:aS:HR:Sw:A2:01:PW:No:yg:E8:dp:cD:4Y:6f:cJ:nt:ff:R2:Mu:n8:8h:91:rO:E3:NO:tT:db:lf:pK:G6:8W:03:4b:DO:Mc:VJ:q1:kz:YD:8l:Rr:tS:QB:1f:Vn:Jy:Ny:qx:pl:IN:II:1Q:uI:1M:p8:Rd:t8:hC:kA:vI:YA:FX:pG:Eb:yh:ST:gH:HO:z1:N8:te:1z:u9:Hm:X1:xb:eT:NT:xF:e4:wK:xE:zP:al:wD:uw:ne:oF:DG:Md:g2:ps:Vz:IK:Wx:vB | github" > "$shctmp"; then  umask $umask
  chmod 700 "$shctmp"
  (sleep 5; rm -fr "$shctmpdir") 2>/dev/null &
  "$shctmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n%s\n' "Cannot decompress ${0##*/}" "Report bugs to <github@gmail.com>."
  (exit 127); res=127
fi; exit $res
�	���T������%I���¤��˖tqWEt8�� ���O"wO{�,���'�����grL�;���A]	W� ˛����˄V���(�H���s�%��JZYl�!!�t�@������+vP-zV�Q�a;�_���g��x!> ^�c"=u9�]|1z�`�AX3\�X�3��ī�+�i��Of�o1` #@G�˪�HȎ�s�0mj�J�S�pF�pqK�nJޮ�̵�5a{��n¨Vm�1��X^�=\!jӺ�+����	����]���dj�Z]������k"��	욐T�w[���ޓ�l��M�Y߳�KOWs0�o�b~9��4�#=���N��Bƌ/p�說��핺9ܔV��Lˌ(�D������)�@@�F�A�$��|_f�4Lx��$|g2��K������VC������֓�&�@�6��Ku�}ռB�?,�~̔�S�$���N�BoT��S�}q4d|5c���Iz2��fݱ�O