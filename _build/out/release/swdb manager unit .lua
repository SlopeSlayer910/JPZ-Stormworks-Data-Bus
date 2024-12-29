-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1761 (2157 with comment) chars
J="I4"
I=" = "
H="f"

x=nil
p=false
m=screen
n=string
w=n.sub
l=m.drawText
k=m.setColor
j=output.setNumber
A=n.unpack
B=n.pack
i={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}_={}a={}y=1
b={}b.d=2
b.g=-1
e={C={r=p,d=0,E={}}}t={[0]={},{"mainType","subType"}}function onTick()_.s=input.getNumber(y)_.q=B(H,_.s)_.f=A(J,_.q)_[1]=(_.f>>31 & 1)_[2]=(_.f>>30 & 1)_[3]=(_.f>>23 &(2^7-1))_[4]=(_.f>>16 &(2^7-1))_[5]=(_.f>>9 &(2^7-1))_[6]=(_.f &(2^9-1))h()if _[2]==0 then
if _[3]==0 then
if _[1]==0 then
h()elseif _[1]==1 then
if(_[6]>>7)==b.d and b.g==-1 then
b.g=_[6]&(2^7-1)for c=1,62,1 do
e[b.g-c]={r=p,d="none"}end
o()else
h()end
end
elseif _[3]==1 then
b.g=-1
h()elseif _[3]==2 then
if _[1]==0 then
if b.g==-1 then
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
e[_[4]].r=true
if(_[6]>>7 & 2^2-1)==0 then
e[_[4]].d="weapon"
u(e[_[4]])e[_[4]].G=(_[6]>>4 & 2^3-1)e[_[4]].D=(_[6]& 2^4-1)end
end
elseif _[1]==1 then
if _[4]==b.g then
e[_[5]].r=p
e[_[5]].d=0
u(e[_[5]])o()else
h()end
end
else
h()end
else
o()end
if a[2]==1 then
if b.g==-1 then
a[1]=0
a[2]=0
a[3]=0
a[4]=127
a[5]=0
a[6]=b.d
end
end
a.f=(a[1]<<31|a[2]<<30|a[3]<<23|a[4]<<16|a[5]<<9|a[6])j(1,a.f)a.q=B(J,a.f)a.s=A(H,a.q)j(y,a.s)j(2,b.d)j(3,b.g)end
function onDraw()k(20,20,20)m.drawClear()k(0,255,0)local v=0
for c=1,#i,1 do
l(2,6*c-4,w(i[c],1,3)..I.._[c])end
k(255,0,0)for c=1,#i,1 do
l(2,6*c+#i*6-2,w(i[c],1,3)..I..a[c])end
k(0,0,0)v=#i*2+1
l(2,6*v,"Unit Manager")end
function o()a[1]=0
a[2]=1
a[3]=0
a[4]=0
a[5]=0
a[6]=0
end
function h()a[1]=_[1]a[2]=_[2]a[3]=_[3]a[4]=_[4]a[5]=_[5]a[6]=_[6]end
function u(b)for z,F in pairs(t)do
if b[z]~=x then
b[z]=x
end
end
b[b.d]={}for c=1,#t[b.d],1 do
b[b.d][t[b.d][c]]=""
end
end
