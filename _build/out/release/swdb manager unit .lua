-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1790 (2186 with comment) chars
K="f"
J=" = "
I="I4"

u=nil
w=true
k=false
q=screen
s=string
v=s.sub
p=q.drawText
m=q.setColor
l=output.setNumber
B=s.unpack
A=s.pack
i={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}_={}a={}z=1
b={}b.c=2
b.f=-1
e={E={j=k,c=0,D={}}}n={[0]={},{"mainType","subType"}}function onTick()_.t=input.getNumber(z)_.o=A(K,_.t)_.g=B(I,_.o)_[1]=(_.g>>31 & 1)_[2]=(_.g>>30 & 1)_[3]=(_.g>>23 &(2^7-1))_[4]=(_.g>>16 &(2^7-1))_[5]=(_.g>>9 &(2^7-1))_[6]=(_.g &(2^9-1))h()if _[2]==0 then
if _[3]==0 then
if _[1]==0 then
h()elseif _[1]==1 then
if(_[6]>>7)==b.c and b.f==-1 then
b.f=_[6]&(2^7-1)for d=1,62,1 do
e[b.f-d]={j=k,c="none"}end
r()else
h()end
end
elseif _[3]==1 then
b.f=-1
e={E={j=k,c=0,D={}}}h()elseif _[3]==2 then
if _[1]==0 then
if b.f==-1 or w then
a[1]=1
a[2]=0
a[3]=2
a[4]=127
a[5]=_[4]a[6]=127
else
a[1]=1
a[2]=0
a[3]=2
a[4]=b.f
a[5]=_[4]a[6]=0
e[_[4]].j=w
if(_[6]>>7 & 2^2-1)==0 then
e[_[4]].c="weapon"
x(e[_[4]])e[_[4]].H=(_[6]>>4 & 2^3-1)e[_[4]].F=(_[6]& 2^4-1)end
end
elseif _[1]==1 then
if _[4]==b.f then
e[_[5]].j=k
e[_[5]].c=0
x(e[_[5]])r()else
h()end
end
else
h()end
else
r()end
if a[2]==1 then
if b.f==-1 then
a[1]=0
a[2]=0
a[3]=0
a[4]=127
a[5]=0
a[6]=b.c
end
end
a.g=(a[1]<<31|a[2]<<30|a[3]<<23|a[4]<<16|a[5]<<9|a[6])l(1,a.g)a.o=A(I,a.g)a.t=B(K,a.o)l(z,a.t)l(2,b.c)l(3,b.f)end
function onDraw()m(20,20,20)q.drawClear()m(0,255,0)local y=0
for d=1,#i,1 do
p(2,6*d-4,v(i[d],1,3)..J.._[d])end
m(255,0,0)for d=1,#i,1 do
p(2,6*d+#i*6-2,v(i[d],1,3)..J..a[d])end
m(0,0,0)y=#i*2+1
p(2,6*y,"Unit Manager")end
function r()a[1]=0
a[2]=1
a[3]=0
a[4]=0
a[5]=0
a[6]=0
end
function h()a[1]=_[1]a[2]=_[2]a[3]=_[3]a[4]=_[4]a[5]=_[5]a[6]=_[6]end
function x(b)for C,G in pairs(n)do
if b[C]~=u then
b[C]=u
end
end
b[b.c]={}for d=1,#n[b.c],1 do
b[b.c][n[b.c][d]]=""
end
end
