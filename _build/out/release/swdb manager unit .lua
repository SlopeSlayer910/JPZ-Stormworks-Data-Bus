-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1773 (2169 with comment) chars
I="I4"
H="f"
G=" = "

y=nil
p=pairs
n=false
t=screen
r=string
x=r.sub
q=t.drawText
k=t.setColor
l=output.setNumber
z=r.unpack
A=r.pack
h={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}_={}a={}B=1
b={}b.d=2
b.e=-1
g={E={s=n,d=0,F={}}}u={[0]={},{"mainType","subType"}}function onTick()_.o=input.getNumber(B)_.m=A(H,_.o)_.f=z(I,_.m)_[1]=(_.f>>31 & 1)_[2]=(_.f>>30 & 1)_[3]=(_.f>>23 &(2^7-1))_[4]=(_.f>>16 &(2^7-1))_[5]=(_.f>>9 &(2^7-1))_[6]=(_.f &(2^9-1))j()if _[2]==0 then
if _[3]==0 then
if _[1]==0 then
j()elseif _[1]==1 then
if(_[6]>>7)==b.d and b.e==-1 then
b.e=_[6]&(2^7-1)for c=1,62,1 do
g[b.e-c]={s=n,d="none"}end
v()else
j()end
end
elseif _[3]==1 then
b.e=-1
j()elseif _[3]==2 then
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
g[_[4]].s=true
if(_[6]>>7 & 2^2-1)==0 then
g[_[4]].d="weapon"
w(g[_[4]])g[_[4]].D=(_[6]>>4 & 2^3-1)g[_[4]].C=(_[6]& 2^4-1)end
end
elseif _[1]==1 then
if _[4]==b.e then
g[_[5]].s=n
g[_[5]].d=0
w(g[_[5]])v()else
j()end
end
else
j()end
else
v()end
if a[2]==1 then
if b.e==-1 then
a[1]=0
a[2]=0
a[3]=0
a[4]=127
a[5]=0
a[6]=b.d
end
end
a.f=(a[1]<<31|a[2]<<30|a[3]<<23|a[4]<<16|a[5]<<9|a[6])l(1,a.f)a.m=A(I,a.f)a.o=z(H,a.m)l(B,a.o)l(2,b.d)l(3,b.e)end
function onDraw()k(20,20,20)t.drawClear()k(0,255,0)local c=0
for h,i in p(h)do
c=c+1
q(2,(6*c)-4,x(i,1,3)..G.._[i])end
k(255,0,0)for h,i in p(h)do
c=c+1
q(2,(6*c)-2,x(i,1,3)..G..a[i])end
k(0,0,0)c=c+1
q(2,(6*c),"Unit Manager")end
function v()a[1]=0
a[2]=1
a[3]=0
a[4]=0
a[5]=0
a[6]=0
end
function j()a[1]=_[1]a[2]=_[2]a[3]=_[3]a[4]=_[4]a[5]=_[5]a[6]=_[6]end
function w(b)for h,i in p(u)do
if b[h]~=y then
b[h]=y
end
end
b[b.d]={}for c=1,#u[b.d],1 do
b[b.d][u[b.d][c]]=""
end
end
