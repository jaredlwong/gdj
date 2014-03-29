NB. J profile
NB. JFE sets BINPATH_z_ and ARGV_z_
NB. add your sentences in startup.ijs

systype=. 9!:12''
jpathsep_z_=: '/'&(('\' I.@:= ])}) NB. convert to / separator
BINPATH_z_=: jpathsep BINPATH_z_

NB. create SystemFolders
bin=.     BINPATH
install=. (bin i: '/'){.bin
addons=.  install,'/addons'
system=.  install,'/system'
tools=.   install,'/tools'
home=.    >(systype-5){(2!:5'HOME');2!:5'USERPROFILE'

userx=.   '\j',('64-'#~16={:$3!:3[2),'701-user'
user=.    home,userx
break=.   user,'/break'
snap=.    user,'/snap'
temp=.    user,'/temp'
config=.  user,'/config'
ids=: ;:'addons bin break config home install snap system tools temp user'
NB. ids=. ;:'addons bin break config home install snap system tools temp user'

0!:0 :: ] <jpathsep bin,'/profilex.ijs' NB. override

ids,.jpathsep@".&.>ids
NB. SystemFolders_j_=: ids,.jpathsep@".&.>ids

NB. md=. 3 : 0 NB. recursive makedir
NB. a=. jpathsep y,'/'
NB. if. -.#1!:0 }:a do.
NB.  for_n. I. a='/' do. 1!:5 :: [ <n{.a end.
NB. end.
NB. )
NB. 
NB. NB. try to ensure user folders exist
NB. md user,'/projects'
NB. md temp
NB. md break
NB. md config
NB. md snap
NB. 
NB. NB. boot up J and load startup.ijs if it exists
NB. 0!:0 <jpathsep system,'/util/boot.ijs'
