#get jero
jeroURL=`curl benito49.blogspot.com.es 2>/dev/null| grep JERO | head -1 | awk '{print $2}' FS="'"`
image64=`curl $jeroURL 2>/dev/null| grep data:image | awk '{print $2}' FS="'" | awk '{print $2}' FS="," | head -1`
curl $jeroURL 2>/dev/null | grep -i "comment-content" | sed "s/comment-content\x27>/\nSOL/g" | grep SOL | sed 's/SOL//' |awk '{print $1}' FS="</p" > jero_respuesta.txt

python -c "
import cStringIO,Image
k='$image64'
img=Image.open(cStringIO.StringIO(k.decode('base64')))
img.save('jero.pdf','pdf')"
