#!/bin/bash
#
# This File Update at Fri 08 Mar 2024 05:09:20 PM WIB
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
if tail $tail_n +$skip <"$0" | gpg -q --decrypt --batch --passphrase "github project | K2:K6:br:hv:Aj:hg:Al:Xy:FD:t7:So:ae:Vv:ZM:ld:qv:9p:LT:1I:UI:IO:mR:dJ:cZ:j7:12:PQ:2C:lX:J1:uc:nC:p1:mV:IV:UM:Rg:28:ow:hi:GS:8r:EO:Ux:jv:2i:IP:Hc:EN:uL:T6:u8:qQ:Dm:Nu:tv:ah:rn:ii:Sl:bX:fn:qk:mh:NH:JK:oO:ha:ra:Yj:AV:le:r1:gY:B4:YB:qX:bX:1b:iZ:Eh:bx:ly:Tr:Xl:Jh:F4:xr:LO:JD:ZL:Wc:Xb:gn:OD:96:2o:nY:vS:8Y:EA:nK:Lf:HN:IH:9D:ym:KR:YF:lF:CP:W5:8q:Ii:qR:9t:HY:RI:JC:Ts:zp:7N:bb:ln:Hb:0q:ed:bU:1z:o1:fe:IT:qg:jd:Jt:LV:pn:j3:Mu:kG:tr:yK:6a:JX:MR:zL:Y9:jL:7p:XX:9J:ac:z8:bS:QH:hU:nX:yK:MI:j8:0X:Yh:SH:Bf:jd:y1:Bq:EG:5V:mw:xi:ER:bN:Gl:sN:lR:rm:VL:yt:cT:r4:VV:Hg:Zv:O7:fl:Hm:qo:Am:i3:XL:Ld:EK:cA:QS:b1:Re:Eo:DL:wX:Jo:Xf:NR:hd:hu:7H:1L:Ji:mJ:MO:4k:20:et:uN:DJ:1y:rq:4z:8N:Q2:zc:1H:bO:Y5:uv:ZN:Fd:m7:0d:Xz:t0:0Q:oX:Hf:U2:as:wK:Ur:Ln:a5:4w:TO:zx:IH:yM:u5:FU:dp:o5:2x:e9:sA:Vx:ch:7x:FO:As:2E:Bv:Yu:Qb:Ui:RC:Y5:PG:ec:nQ:io:gI:DZ:qf:C2:Wv:VY:qm:bG:rw:gU:hq:UC:Qv:bi:Y4:YM:GK:GY:a0:gG:qO:K3:LR:3m:RV:Ts:Bf:9O:eS:N7:7V:xo:o0:Mw:Iv:tq:yx:Nb:cj:il:ey:fy:8T:CS:xB:Wc:6f:9f:V6:Uq:nW:KZ:El:rF:rS:n1:lH:ka:z0:Mo:qA:Fw:Jp:56:ty:dP:Dm:02:Em:op:94:oU:uh:M8:g8:hz:FJ:C7:bx:y4:p2:HX:lJ:dT:XW:hv:VZ:TB:Kv:4o:F4:qh:Jp:2I:Hd:Mp:nq:O4:0A:6U:ij:gJ:Ru:MZ:fs:My:9m:XQ:iT:hF:dl:1d:wf:zN:J1:am:JB:Ns:m2:Dl:2E:Yl:Ne:C2:vd:LP:PI:ZH:KH:H1:hB:HH:ZG:H7:E3:KD:yU:9i:Dv:6n:YJ:Ec:HI:0j:OW:fV:8H:sL:Gs:Ta:Ch:jG:09:6H:Fz:23:o1:Z8:Oj:Sd:Oc:Ml:yP:aP:Ul:0N:v4:NA:W5:ge:JM:7x:nw:Uw:H2:pv:ae:tH:Cf:TV:Tq:tt:yy:Au:QI:P8:1W:fL:hn:Po:9g:Z9:HT:MK:Bp:wl:cR:6o:WJ:c0:8M:IX:gw:NI:2a:fp:fy:9T:Jc:RK:iQ:LW:xO:zA:sC:NV:Su:R5:3n:Vx:Nh:cR:RV:P0:2h:MK:ft:VT:er:pf:u9:bt:mQ:jq:yq:vo:zZ:oN | github | K2:K6:br:hv:Aj:hg:Al:Xy:FD:t7:So:ae:Vv:ZM:ld:qv:9p:LT:1I:UI:IO:mR:dJ:cZ:j7:12:PQ:2C:lX:J1:uc:nC:p1:mV:IV:UM:Rg:28:ow:hi:GS:8r:EO:Ux:jv:2i:IP:Hc:EN:uL:T6:u8:qQ:Dm:Nu:tv:ah:rn:ii:Sl:bX:fn:qk:mh:NH:JK:oO:ha:ra:Yj:AV:le:r1:gY:B4:YB:qX:bX:1b:iZ:Eh:bx:ly:Tr:Xl:Jh:F4:xr:LO:JD:ZL:Wc:Xb:gn:OD:96:2o:nY:vS:8Y:EA:nK:Lf:HN:IH:9D:ym:KR:YF:lF:CP:W5:8q:Ii:qR:9t:HY:RI:JC:Ts:zp:7N:bb:ln:Hb:0q:ed:bU:1z:o1:fe:IT:qg:jd:Jt:LV:pn:j3:Mu:kG:tr:yK:6a:JX:MR:zL:Y9:jL:7p:XX:9J:ac:z8:bS:QH:hU:nX:yK:MI:j8:0X:Yh:SH:Bf:jd:y1:Bq:EG:5V:mw:xi:ER:bN:Gl:sN:lR:rm:VL:yt:cT:r4:VV:Hg:Zv:O7:fl:Hm:qo:Am:i3:XL:Ld:EK:cA:QS:b1:Re:Eo:DL:wX:Jo:Xf:NR:hd:hu:7H:1L:Ji:mJ:MO:4k:20:et:uN:DJ:1y:rq:4z:8N:Q2:zc:1H:bO:Y5:uv:ZN:Fd:m7:0d:Xz:t0:0Q:oX:Hf:U2:as:wK:Ur:Ln:a5:4w:TO:zx:IH:yM:u5:FU:dp:o5:2x:e9:sA:Vx:ch:7x:FO:As:2E:Bv:Yu:Qb:Ui:RC:Y5:PG:ec:nQ:io:gI:DZ:qf:C2:Wv:VY:qm:bG:rw:gU:hq:UC:Qv:bi:Y4:YM:GK:GY:a0:gG:qO:K3:LR:3m:RV:Ts:Bf:9O:eS:N7:7V:xo:o0:Mw:Iv:tq:yx:Nb:cj:il:ey:fy:8T:CS:xB:Wc:6f:9f:V6:Uq:nW:KZ:El:rF:rS:n1:lH:ka:z0:Mo:qA:Fw:Jp:56:ty:dP:Dm:02:Em:op:94:oU:uh:M8:g8:hz:FJ:C7:bx:y4:p2:HX:lJ:dT:XW:hv:VZ:TB:Kv:4o:F4:qh:Jp:2I:Hd:Mp:nq:O4:0A:6U:ij:gJ:Ru:MZ:fs:My:9m:XQ:iT:hF:dl:1d:wf:zN:J1:am:JB:Ns:m2:Dl:2E:Yl:Ne:C2:vd:LP:PI:ZH:KH:H1:hB:HH:ZG:H7:E3:KD:yU:9i:Dv:6n:YJ:Ec:HI:0j:OW:fV:8H:sL:Gs:Ta:Ch:jG:09:6H:Fz:23:o1:Z8:Oj:Sd:Oc:Ml:yP:aP:Ul:0N:v4:NA:W5:ge:JM:7x:nw:Uw:H2:pv:ae:tH:Cf:TV:Tq:tt:yy:Au:QI:P8:1W:fL:hn:Po:9g:Z9:HT:MK:Bp:wl:cR:6o:WJ:c0:8M:IX:gw:NI:2a:fp:fy:9T:Jc:RK:iQ:LW:xO:zA:sC:NV:Su:R5:3n:Vx:Nh:cR:RV:P0:2h:MK:ft:VT:er:pf:u9:bt:mQ:jq:yq:vo:zZ:oN | github" > "$shctmp"; then  umask $umask
  chmod 700 "$shctmp"
  (sleep 5; rm -fr "$shctmpdir") 2>/dev/null &
  "$shctmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n%s\n' "Cannot decompress ${0##*/}" "Report bugs to <github@gmail.com>."
  (exit 127); res=127
fi; exit $res
�	���JB���#D[}v�ڞ�Ғ�MW�q�2�l���Y*Ͼ��LV�3qg��҆E;3�l��O(A@�ùځ���kc�5+��+w֎Me�h�1Q5�l;���ĵr������(����Pe4��_-��QMJsv���R�c9���+iB�X�ē����W"�5�u��b������8�^VX��Vd/���BP�ژ��T�]�����^�)��wO:9D��׸Vz'�=�-A��3�z�"�i�ᘑ'?әDoa}w��%���E1=:-ڇ̭���TA*Rb<�����m0���F��dQ�~Vܙ�b�W�?��j�\���ܘ	eZ��_�x���',s��[Uŝ�O+��`�eęo���=�H��T�_����'u����Ԍ̢r�+��ʒ�o��_	!y���F���}pv�{�J�`?m	�C��w^H����F�p��|@a\%����j���`-�]�,4m���Kc9�\�B��L�L'���3�k��^#�a��TZ�����H?�WSx��a'N(��RT�<<��/5]W�l��k���Z�*��l)�s�t���i�Π�*H,��5�Q�M� S����c�$��~�^��}6g�����A4�1�����"�yn��.�D�HjS�^�L��J,Z���ҡ���A��BL��D�mUS�,��Q$�PP�`Y?���b�K�����ѷd��W:��c��8l����<7�����p�^]ĘM�oi6>��8AnIL�gK�薟��g��⏲����O���5�%}2<o?:T�;�KC|��}�3��Y�8סg-�P^���j u6O�/�x�|!8�\���>2�ݚ����$��Y�K�W��w��lKfx1�Ur2+z����!#����\U�1I�7�[C�a�t�a�c�߬��6Rތ�~��v�YV1ܟ؟ �o|U%�~�3qԗ��u�,U��9�z_ϚF��YK �h4�-4�ܠ����CLw�n>z�]��r��`��~�&6��ު��&%�5q
�>����f^�7���Y֥bF����Ұ�2�ʝ�����\qtebP�����4�i�ͥUo��4���|�3��h*���~j�Ί���u�!��r������I!{Ǜ�;6e�Dy�tI5c��9%�e�`���r5uu9�F8r��:Yq���x���:�BB�F��X�������S��7ؔ����Hn�/�9KJ(+P�����i�AގPf�x���n`������ B�:h��3�����X6�_�C�)�°-������p��SIOv��Ý����hb���K&��%y��y���