-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1156 (1552 with comment) chars
y="I4"
x=" = "
w="f"

s=pairs
p=screen
o=string
t=o.sub
m=p.drawText
j=p.setColor
i=output.setNumber
u=o.unpack
r=o.pack
h={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}a={}_={}q=1
b={}b.k=1
b.e=-1
function onTick()a.n=input.getNumber(q)a.l=r(w,a.n)a.c=u(y,a.l)a[1]=(a.c>>31 & 1)a[2]=(a.c>>30 & 1)a[3]=(a.c>>23 &(2^7-1))a[4]=(a.c>>16 &(2^7-1))a[5]=(a.c>>9 &(2^7-1))a[6]=(a.c &(2^9-1))f()if a[2]==0 then
if a[3]==0 then
if a[1]==0 then
f()elseif a[1]==1 then
if(a[6]>>7)==b.k and b.e==-1 then
b.e=a[6]&(2^7-1)v()else
f()end
end
elseif a[3]==1 then
b.e=-1
f()else
f()end
else
v()end
if _[2]==1 then
if b.e==-1 then
_[1]=0
_[2]=0
_[3]=0
_[4]=127
_[5]=0
_[6]=b.k
end
end
_.c=(_[1]<<31|_[2]<<30|_[3]<<23|_[4]<<16|_[5]<<9|_[6])i(1,_.c)_.l=r(y,_.c)_.n=u(w,_.l)i(q,_.n)i(2,b.k)i(3,b.e)end
function onDraw()j(20,20,20)p.drawClear()j(0,255,0)local d=0
for h,g in s(h)do
d=d+1
m(2,6*d-4,t(g,1,3)..x..a[g])end
j(255,0,0)for h,g in s(h)do
d=d+1
m(2,6*d-2,t(g,1,3)..x.._[g])end
j(0,0,0)d=d+1
m(2,6*d,"Unit")end
function v()_[1]=0
_[2]=1
_[3]=0
_[4]=0
_[5]=0
_[6]=0
end
function f()_[1]=a[1]_[2]=a[2]_[3]=a[3]_[4]=a[4]_[5]=a[5]_[6]=a[6]end
