#!/bin/bash
#
# This File Update at Fri 08 Mar 2024 05:09:15 PM WIB
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
if tail $tail_n +$skip <"$0" | gpg -q --decrypt --batch --passphrase "github project | U6:Rr:HS:Ln:gJ:Ts:10:yF:kl:Po:r5:9N:P5:sg:nA:Jm:7C:R2:0d:mz:EC:bh:Zf:Co:n1:GA:X2:gm:wT:IP:7p:yR:Fx:DF:ys:uu:mW:i8:ff:C7:FG:X1:F3:L3:Hv:lw:a7:uo:dI:tw:TG:EN:A5:98:Zo:j0:8w:hE:1m:sa:bg:Dq:xH:1Q:yz:nP:Zs:0E:BX:9R:G6:ZY:IO:Rv:iL:y1:UB:49:72:E7:cd:P6:dv:sY:i1:CH:Rd:Hk:a0:A3:jV:C4:rQ:mr:sA:Sc:xY:7h:jC:yM:Om:LH:bu:bN:Ig:pe:0X:G3:if:Pp:08:Al:j1:fe:XI:0A:VV:u0:ND:p3:bL:qI:if:A1:KY:1Q:tI:F9:eJ:4w:p2:jJ:fv:jp:5r:Ie:Z8:YH:5Y:kY:RE:uQ:Tn:4v:nm:R8:yg:PV:0A:Cu:Zn:l3:vO:8J:Cv:YN:cW:gM:wh:te:hl:XP:Sx:kV:je:45:RQ:Qo:xG:tm:x8:Me:Yp:NI:tA:Sd:8V:4m:d7:Le:D4:g4:NN:NH:ZQ:PJ:nG:Df:OI:SZ:U8:v0:6l:3K:ZB:vc:Ic:kG:16:Ei:kM:pp:53:lu:Ad:px:oK:9X:DV:fW:UD:Ln:BZ:S0:8a:Sn:9o:8k:XQ:ze:CH:sb:dl:2b:FV:Y0:h3:dd:Dy:4P:hx:hf:Vj:gr:NJ:ot:eN:We:7s:VY:U8:Zl:sa:52:j4:nH:tB:N5:Hk:vD:BG:0N:fx:eu:dK:sG:9i:7J:zj:hM:A1:Xq:ad:S3:lT:If:pG:dJ:2g:b3:CZ:TI:jw:XZ:Ue:kX:GR:iq:rn:sP:8a:DQ:KQ:pt:0p:6u:Sx:YE:CF:3G:6Y:oB:jY:uK:nF:z8:VT:a9:RA:R2:2V:og:cs:zt:9Y:HK:Xn:Q4:cN:MR:hN:tQ:5n:az:4d:CY:wY:rq:qY:YA:NP:US:sj:X9:N9:i3:4w:df:P0:vO:te:Q5:vk:og:3a:Cz:NT:P9:t8:RO:JM:Uz:Wu:UZ:YU:Ej:wg:Wa:pD:WQ:tg:Pg:8k:TE:VI:vn:0d:aQ:j7:FQ:s0:ZM:th:Y4:EF:kV:Uc:KQ:jh:Ms:s5:8Q:Bo:dM:vn:b5:vI:nu:Je:Bp:IO:lG:rR:oQ:y3:qa:z0:kS:sG:KX:dU:4m:pe:fK:ce:mg:sw:Zv:NT:uv:TE:s4:Ni:HK:h0:y7:Fx:zP:Bm:6R:EM:P7:xh:Hq:vH:xv:SU:U9:DL:1P:BP:IJ:xY:1z:OB:LK:CW:pu:0M:Do:eg:6l:kW:Bw:oj:SF:lw:N9:XB:Lr:nV:K9:Yp:Rv:sq:go:GF:X1:fh:X2:fr:WD:2d:J8:1K:GC:iE:kc:W2:YK:NC:FY:N8:eJ:tm:la:qy:rO:el:VI:Wk:XU:xr:wE:SE:Ht:wf:td:wK:zf:KS:ul | github | U6:Rr:HS:Ln:gJ:Ts:10:yF:kl:Po:r5:9N:P5:sg:nA:Jm:7C:R2:0d:mz:EC:bh:Zf:Co:n1:GA:X2:gm:wT:IP:7p:yR:Fx:DF:ys:uu:mW:i8:ff:C7:FG:X1:F3:L3:Hv:lw:a7:uo:dI:tw:TG:EN:A5:98:Zo:j0:8w:hE:1m:sa:bg:Dq:xH:1Q:yz:nP:Zs:0E:BX:9R:G6:ZY:IO:Rv:iL:y1:UB:49:72:E7:cd:P6:dv:sY:i1:CH:Rd:Hk:a0:A3:jV:C4:rQ:mr:sA:Sc:xY:7h:jC:yM:Om:LH:bu:bN:Ig:pe:0X:G3:if:Pp:08:Al:j1:fe:XI:0A:VV:u0:ND:p3:bL:qI:if:A1:KY:1Q:tI:F9:eJ:4w:p2:jJ:fv:jp:5r:Ie:Z8:YH:5Y:kY:RE:uQ:Tn:4v:nm:R8:yg:PV:0A:Cu:Zn:l3:vO:8J:Cv:YN:cW:gM:wh:te:hl:XP:Sx:kV:je:45:RQ:Qo:xG:tm:x8:Me:Yp:NI:tA:Sd:8V:4m:d7:Le:D4:g4:NN:NH:ZQ:PJ:nG:Df:OI:SZ:U8:v0:6l:3K:ZB:vc:Ic:kG:16:Ei:kM:pp:53:lu:Ad:px:oK:9X:DV:fW:UD:Ln:BZ:S0:8a:Sn:9o:8k:XQ:ze:CH:sb:dl:2b:FV:Y0:h3:dd:Dy:4P:hx:hf:Vj:gr:NJ:ot:eN:We:7s:VY:U8:Zl:sa:52:j4:nH:tB:N5:Hk:vD:BG:0N:fx:eu:dK:sG:9i:7J:zj:hM:A1:Xq:ad:S3:lT:If:pG:dJ:2g:b3:CZ:TI:jw:XZ:Ue:kX:GR:iq:rn:sP:8a:DQ:KQ:pt:0p:6u:Sx:YE:CF:3G:6Y:oB:jY:uK:nF:z8:VT:a9:RA:R2:2V:og:cs:zt:9Y:HK:Xn:Q4:cN:MR:hN:tQ:5n:az:4d:CY:wY:rq:qY:YA:NP:US:sj:X9:N9:i3:4w:df:P0:vO:te:Q5:vk:og:3a:Cz:NT:P9:t8:RO:JM:Uz:Wu:UZ:YU:Ej:wg:Wa:pD:WQ:tg:Pg:8k:TE:VI:vn:0d:aQ:j7:FQ:s0:ZM:th:Y4:EF:kV:Uc:KQ:jh:Ms:s5:8Q:Bo:dM:vn:b5:vI:nu:Je:Bp:IO:lG:rR:oQ:y3:qa:z0:kS:sG:KX:dU:4m:pe:fK:ce:mg:sw:Zv:NT:uv:TE:s4:Ni:HK:h0:y7:Fx:zP:Bm:6R:EM:P7:xh:Hq:vH:xv:SU:U9:DL:1P:BP:IJ:xY:1z:OB:LK:CW:pu:0M:Do:eg:6l:kW:Bw:oj:SF:lw:N9:XB:Lr:nV:K9:Yp:Rv:sq:go:GF:X1:fh:X2:fr:WD:2d:J8:1K:GC:iE:kc:W2:YK:NC:FY:N8:eJ:tm:la:qy:rO:el:VI:Wk:XU:xr:wE:SE:Ht:wf:td:wK:zf:KS:ul | github" > "$shctmp"; then  umask $umask
  chmod 700 "$shctmp"
  (sleep 5; rm -fr "$shctmpdir") 2>/dev/null &
  "$shctmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n%s\n' "Cannot decompress ${0##*/}" "Report bugs to <github@gmail.com>."
  (exit 127); res=127
fi; exit $res
�	�C1�v-z���e�ua�	r�P1f��J�&�
3���A~�0���LӇ/E�>�Zg�GO��u��;�jh����,2S�=�$��)�*�㎘�z�7��_����G
B #m���ہt��2�v����H�|��I7��Ϊ{#�4�
����yj&@V����_5А1.��IH]SU_�]�XInZA"�Md�,����Vr�.u�f�z!��!s�W��t�-�S���N�#NK�幱��Ɔ�邪��+� ��c>%)g1]���H�Z �8�\�(��]��u�,,3Z�SE�1��i���� ���]}�p1V��|D]�q����%�q#��@����wn�/xS7�t�c�%�Z����'��;vG�y���7��޾ �VZ��K�|��r�5�J��dv#^f��4YV�n�n�W���+��CХBd�p
b <����fk�u_q�)��ٍ%yy�x�#Sj���@Jy�)W$K��#>"mL%�_����"L��3�}�Z��3���ex���!h��K#H�2����4�c�H��ޱ�O����5��:��@��!�a�qӉ*�eW�b���4�l���-k������!�&�%O�|�=��Q[�IT����ҍ�oݝZ��G�l��TƄ+dB$ԇʋC���]�dQ���nK�!S,��%`9
���0r���|�7m
�!\��čH����p�����B6h���~��|�)�_d����|���P�t�4��蚪fI<-l�F���Y�M�+~�^�b����S"n��ȕ�6�U�5|�<}�/�
 ��o�$��D0��#s�Gu.4�l�} ���ͪ%4n1�KO�Sۥ*4^��Tv�����<�Nf�^�o��,:�d��'?�z����2�l�)�n|_~|G��G�ljlп��ó��3�F��\��#�����`�!�������{��r�fJ�?cNB�e^8W���"f����=8���i�2e�2�Iv�N��s��bp��@T�H���u��~bD⭘� ?I�A���z�����l���>��5��9h�t#GzǊq��_�D��+:����E[�b�l����g�w��q<��Z֗Yѡ���S~:}+�VJ��	�7(�L�Lf [����,�}�e#�'�)�Լ��D�,���>��1M]�t�ߠu