-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1544 (1940 with comment) chars
E="f"
D="I4"
C=" = "

g=false
p=true
n=screen
o=string
z=o.sub
m=n.drawText
k=n.setColor
i=output.setNumber
y=o.unpack
x=o.pack
h={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}a={}_={}v=1
c={}c.A=0
c.r=0
c.j=0
f={}f[0]={type=0,e=p}for b=1,125,1 do
f[b]={type=1,e=g}end
f[63]={type=2,e=g}f[126]={type=2,e=g}f[127]={type=3,e=p}function onTick()a.s=input.getNumber(v)a.l=x(E,a.s)a.d=y(D,a.l)a[1]=(a.d>>31 & 1)a[2]=(a.d>>30 & 1)a[3]=(a.d>>23 &(2^7-1))a[4]=(a.d>>16 &(2^7-1))a[5]=(a.d>>9 &(2^7-1))a[6]=(a.d &(2^9-1))q()if a[2]==0 then
if a[3]==0 then
if a[1]==0 then
_[1]=1
_[2]=0
_[3]=0
_[4]=0
_[5]=127
_[6]=a[6]<<7
for B,u in pairs(f)do
if u.e==g and u.type==a[6]then
_[6]=_[6]|B
u.e=p
break
end
end
elseif a[1]==1 then
local r=a[6]&(2^7-1)f[r].e=g
t()end
elseif a[3]==1 then
for b=1,126 do
f[b].e=g
end
t()elseif a[3]==2 then
if a[1]==0 then
_[1]=1
_[2]=0
_[3]=2
_[4]=127
_[5]=a[4]_[6]=0
elseif a[1]==1 then
q()end
else
q()end
else
t()end
if _[2]==1 then
if g and c.j>60 then
c.j=0
_[1]=0
_[2]=0
_[3]=1
_[4]=0
_[5]=127
_[6]=0
end
end
_.d=(_[1]<<31|_[2]<<30|_[3]<<23|_[4]<<16|_[5]<<9|_[6])i(1,_.d)_.l=x(D,_.d)_.s=y(E,_.l)i(v,_.s)c.j=c.j+1
i(2,c.A)i(3,c.r)i(4,c.j)end
function onDraw()k(20,20,20)n.drawClear()k(0,255,0)local w=0
for b=1,#h,1 do
m(2,6*b-4,z(h[b],1,3)..C..a[b])end
k(255,0,0)for b=1,#h,1 do
m(2,6*b+#h*6-2,z(h[b],1,3)..C.._[b])end
k(0,0,0)w=#h*2+1
m(2,6*w,"Master Unit")end
function t()_[1]=0
_[2]=1
_[3]=0
_[4]=0
_[5]=0
_[6]=0
end
function q()_[1]=a[1]_[2]=a[2]_[3]=a[3]_[4]=a[4]_[5]=a[5]_[6]=a[6]end
