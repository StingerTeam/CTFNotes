
import base64
# ����Ԫ
from gmpy2 import invert
x= invert(11,26) #x=19Ϊ��Ԫ

c = 'welcylk'
m=''
for i in c:
    s = ord(i)-97
    q = chr((((s-6)*x) % 26)+97)
    m+=q

print(m)
print(base64.b64encode(m.encode('utf-8')))
