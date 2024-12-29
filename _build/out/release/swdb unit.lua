-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1156 (1552 with comment) chars
y="f"
x="I4"
w=" = "

u=pairs
m=screen
l=string
s=l.sub
k=m.drawText
j=m.setColor
i=output.setNumber
r=l.unpack
v=l.pack
h={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}a={}_={}q=1
b={}b.p=1
b.f=-1
function onTick()a.n=input.getNumber(q)a.o=v(y,a.n)a.c=r(x,a.o)a[1]=(a.c>>31 & 1)a[2]=(a.c>>30 & 1)a[3]=(a.c>>23 &(2^7-1))a[4]=(a.c>>16 &(2^7-1))a[5]=(a.c>>9 &(2^7-1))a[6]=(a.c &(2^9-1))e()if a[2]==0 then
if a[3]==0 then
if a[1]==0 then
e()elseif a[1]==1 then
if(a[6]>>7)==b.p and b.f==-1 then
b.f=a[6]&(2^7-1)t()else
e()end
end
elseif a[3]==1 then
b.f=-1
e()else
e()end
else
t()end
if _[2]==1 then
if b.f==-1 then
_[1]=0
_[2]=0
_[3]=0
_[4]=127
_[5]=0
_[6]=b.p
end
end
_.c=(_[1]<<31|_[2]<<30|_[3]<<23|_[4]<<16|_[5]<<9|_[6])i(1,_.c)_.o=v(x,_.c)_.n=r(y,_.o)i(q,_.n)i(2,b.p)i(3,b.f)end
function onDraw()j(20,20,20)m.drawClear()j(0,255,0)local d=0
for h,g in u(h)do
d=d+1
k(2,6*d-4,s(g,1,3)..w..a[g])end
j(255,0,0)for h,g in u(h)do
d=d+1
k(2,6*d-2,s(g,1,3)..w.._[g])end
j(0,0,0)d=d+1
k(2,6*d,"Unit")end
function t()_[1]=0
_[2]=1
_[3]=0
_[4]=0
_[5]=0
_[6]=0
end
function e()_[1]=a[1]_[2]=a[2]_[3]=a[3]_[4]=a[4]_[5]=a[5]_[6]=a[6]end
