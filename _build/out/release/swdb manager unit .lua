-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1761 (2157 with comment) chars
J=" = "
I="f"
H="I4"

u=nil
l=false
m=screen
o=string
v=o.sub
n=m.drawText
j=m.setColor
k=output.setNumber
B=o.unpack
w=o.pack
i={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}_={}a={}z=1
b={}b.c=2
b.e=-1
f={C={s=l,c=0,D={}}}r={[0]={},{"mainType","subType"}}function onTick()_.t=input.getNumber(z)_.p=w(I,_.t)_.g=B(H,_.p)_[1]=(_.g>>31 & 1)_[2]=(_.g>>30 & 1)_[3]=(_.g>>23 &(2^7-1))_[4]=(_.g>>16 &(2^7-1))_[5]=(_.g>>9 &(2^7-1))_[6]=(_.g &(2^9-1))h()if _[2]==0 then
if _[3]==0 then
if _[1]==0 then
h()elseif _[1]==1 then
if(_[6]>>7)==b.c and b.e==-1 then
b.e=_[6]&(2^7-1)for d=1,62,1 do
f[b.e-d]={s=l,c="none"}end
q()else
h()end
end
elseif _[3]==1 then
b.e=-1
h()elseif _[3]==2 then
if _[1]==0 then
if b.e==-1 then
a[1]=1
a[2]=0
a[3]=2
a[4]=127
a[5]=_[4]a[6]=127
else
a[1]=1
a[2]=0
a[3]=2
a[4]=b.e
a[5]=_[4]a[6]=0
f[_[4]].s=true
if(_[6]>>7 & 2^2-1)==0 then
f[_[4]].c="weapon"
A(f[_[4]])f[_[4]].E=(_[6]>>4 & 2^3-1)f[_[4]].F=(_[6]& 2^4-1)end
end
elseif _[1]==1 then
if _[4]==b.e then
f[_[5]].s=l
f[_[5]].c=0
A(f[_[5]])q()else
h()end
end
else
h()end
else
q()end
if a[2]==1 then
if b.e==-1 then
a[1]=0
a[2]=0
a[3]=0
a[4]=127
a[5]=0
a[6]=b.c
end
end
a.g=(a[1]<<31|a[2]<<30|a[3]<<23|a[4]<<16|a[5]<<9|a[6])k(1,a.g)a.p=w(H,a.g)a.t=B(I,a.p)k(z,a.t)k(2,b.c)k(3,b.e)end
function onDraw()j(20,20,20)m.drawClear()j(0,255,0)local y=0
for d=1,#i,1 do
n(2,6*d-4,v(i[d],1,3)..J.._[d])end
j(255,0,0)for d=1,#i,1 do
n(2,6*d+#i*6-2,v(i[d],1,3)..J..a[d])end
j(0,0,0)y=#i*2+1
n(2,6*y,"Unit Manager")end
function q()a[1]=0
a[2]=1
a[3]=0
a[4]=0
a[5]=0
a[6]=0
end
function h()a[1]=_[1]a[2]=_[2]a[3]=_[3]a[4]=_[4]a[5]=_[5]a[6]=_[6]end
function A(b)for x,G in pairs(r)do
if b[x]~=u then
b[x]=u
end
end
b[b.c]={}for d=1,#r[b.c],1 do
b[b.c][r[b.c][d]]=""
end
end
