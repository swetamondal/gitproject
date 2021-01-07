

showversion(){
echo v0.1.0
}

if [[ "$@" == "--version" ]]
then
showversion
fi

gethelp(){
cat h.txt
}
if [[ "$@" == "--help" ]]
then
gethelp
fi

getcpuinfo(){
cat lscpu.txt
}
if [[ "$@" == "cpu_getinfo" ]]
then
getcpuinfo
fi

getmem(){
free
}
if [[ "$@" == "memory info" ]]
then
getmem
fi

user(){
read username
sudo adduser "$username"
}

if [[ "$@" == "user create" ]]
then
user
fi

userno(){
cat /etc/passwd
}
if [[ "$@" == "user list" ]]
then
userno
fi

sudou(){
getent group sudo
}

if [[ "$@" == "user list sudo-only" ]]
then
sudou
fi

read file
if [[ "$@" == "file getinfo --size" ]]
then
ls -s $file
elif [[ "$@" == "file getinfo --permissions" ]]
then
stat -c '%a' $file
elif [[ "$a" == "file getinfo --owner" ]]
then
stat -c '%U' $file
elif [[ "$@" == "file getinfo --last-modified" ]]
then
stat -c '%y' $file
else
if [[ "$@" == "file getinfo" ]]
then
echo "File :$file"
s=$(stat -c '%U' $file)
echo "Access:" ${s%$file*}
s=$( ls -s $file)
echo "SIZE(B):" ${s%$file*}
s=$(stat -c '%U' $file)
echo "owner:" ${s%$file*}
s=$(stat -c '%y' $file)
echo "modify:"  ${s%$file*}
fi
fi

