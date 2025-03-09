-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1515 (1911 with comment) chars
C="f"
B="I4"
A=" = "

u=false
z=true
r=screen
o=string
t=o.sub
s=r.drawText
m=r.setColor
h=output.setNumber
x=o.unpack
v=o.pack
i={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}a={}_={}y=1
b={}b.q=1
b.d=-1
b.j=-1
b.k=z
b.g=-1
function onTick()a.p=input.getNumber(y)a.n=v(C,a.p)a.c=x(B,a.n)a[1]=(a.c>>31 & 1)a[2]=(a.c>>30 & 1)a[3]=(a.c>>23 &(2^7-1))a[4]=(a.c>>16 &(2^7-1))a[5]=(a.c>>9 &(2^7-1))a[6]=(a.c &(2^9-1))f()if a[2]==0 then
if a[3]==0 then
if a[1]==0 then
f()elseif a[1]==1 then
if(a[6]>>7)==b.q and b.d==-1 then
b.d=a[6]&(2^7-1)l()else
f()end
end
elseif a[3]==1 then
b.d=-1
b.j=-1
f()elseif a[3]==10 then
if a[1]==0 then
if a[4]==b.d then
b.k=u
l()else
f()end
elseif a[1]==1 then
b.k=z
if a[5]==b.d then
if a[4]~=127 then
b.j=a[4]else
b.j=-1
end
l()else
f()end
end
else
f()end
else
l()end
if _[2]==1 then
if b.d==-1 then
_[1]=0
_[2]=0
_[3]=0
_[4]=127
_[5]=0
_[6]=b.q
elseif b.j==-1 and((b.g>30 and b.k)or(b.g>120 and b.k==u))then
b.g=0
_[1]=0
_[2]=0
_[3]=10
_[4]=b.d
_[5]=127
_[6]=1
end
end
_.c=(_[1]<<31|_[2]<<30|_[3]<<23|_[4]<<16|_[5]<<9|_[6])h(1,_.c)_.n=v(B,_.c)_.p=x(C,_.n)h(y,_.p)b.g=b.g+1
h(2,b.q)h(3,b.d)h(4,b.j)h(5,b.g)end
function onDraw()m(20,20,20)r.drawClear()m(0,255,0)local w=0
for e=1,#i,1 do
s(2,6*e-4,t(i[e],1,3)..A..a[e])end
m(255,0,0)for e=1,#i,1 do
s(2,6*e+#i*6-2,t(i[e],1,3)..A.._[e])end
m(0,0,0)w=#i*2+1
s(2,6*w,"Launcher")end
function l()_[1]=0
_[2]=1
_[3]=0
_[4]=0
_[5]=0
_[6]=0
end
function f()_[1]=a[1]_[2]=a[2]_[3]=a[3]_[4]=a[4]_[5]=a[5]_[6]=a[6]end
