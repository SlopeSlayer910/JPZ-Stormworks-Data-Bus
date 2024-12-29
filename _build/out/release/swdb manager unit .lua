-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1770 (2166 with comment) chars
K="I4"
J=" = "
I="f"

C=nil
z=true
q=false
o=screen
p=string
A=p.sub
t=o.drawText
j=o.setColor
k=output.setNumber
B=p.unpack
y=p.pack
i={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}_={}a={}u=1
b={}b.c=2
b.g=-1
e={D={n=q,c=0,F={}}}l={[0]={},{"mainType","subType"}}function onTick()_.s=input.getNumber(u)_.m=y(I,_.s)_.f=B(K,_.m)_[1]=(_.f>>31 & 1)_[2]=(_.f>>30 & 1)_[3]=(_.f>>23 &(2^7-1))_[4]=(_.f>>16 &(2^7-1))_[5]=(_.f>>9 &(2^7-1))_[6]=(_.f &(2^9-1))h()if _[2]==0 then
if _[3]==0 then
if _[1]==0 then
h()elseif _[1]==1 then
if(_[6]>>7)==b.c and b.g==-1 then
b.g=_[6]&(2^7-1)for d=1,62,1 do
e[b.g-d]={n=q,c="none"}end
r()else
h()end
end
elseif _[3]==1 then
b.g=-1
h()elseif _[3]==2 then
if _[1]==0 then
if b.g==-1 or z then
a[1]=1
a[2]=0
a[3]=2
a[4]=127
a[5]=_[4]a[6]=127
else
a[1]=1
a[2]=0
a[3]=2
a[4]=b.g
a[5]=_[4]a[6]=0
e[_[4]].n=z
if(_[6]>>7 & 2^2-1)==0 then
e[_[4]].c="weapon"
w(e[_[4]])e[_[4]].E=(_[6]>>4 & 2^3-1)e[_[4]].G=(_[6]& 2^4-1)end
end
elseif _[1]==1 then
if _[4]==b.g then
e[_[5]].n=q
e[_[5]].c=0
w(e[_[5]])r()else
h()end
end
else
h()end
else
r()end
if a[2]==1 then
if b.g==-1 then
a[1]=0
a[2]=0
a[3]=0
a[4]=127
a[5]=0
a[6]=b.c
end
end
a.f=(a[1]<<31|a[2]<<30|a[3]<<23|a[4]<<16|a[5]<<9|a[6])k(1,a.f)a.m=y(K,a.f)a.s=B(I,a.m)k(u,a.s)k(2,b.c)k(3,b.g)end
function onDraw()j(20,20,20)o.drawClear()j(0,255,0)local x=0
for d=1,#i,1 do
t(2,6*d-4,A(i[d],1,3)..J.._[d])end
j(255,0,0)for d=1,#i,1 do
t(2,6*d+#i*6-2,A(i[d],1,3)..J..a[d])end
j(0,0,0)x=#i*2+1
t(2,6*x,"Unit Manager")end
function r()a[1]=0
a[2]=1
a[3]=0
a[4]=0
a[5]=0
a[6]=0
end
function h()a[1]=_[1]a[2]=_[2]a[3]=_[3]a[4]=_[4]a[5]=_[5]a[6]=_[6]end
function w(b)for v,H in pairs(l)do
if b[v]~=C then
b[v]=C
end
end
b[b.c]={}for d=1,#l[b.c],1 do
b[b.c][l[b.c][d]]=""
end
end
