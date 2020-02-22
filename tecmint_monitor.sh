#! /bin/bash
while getopts ivh name
do
    case $name in
        i)iopt=1;;
        v)vopt=1;;
        h)hopt=1;;
        *)echo "Invalid arg";;
    esac
done

if [[ ! -z $iopt ]]
then
{
wd=$(pwd)
basename "$(test -L "$0" && readlink "$0" || echo "$0")" > /tmp/scriptname
scriptname=$(echo -e -n $wd/ && cat /tmp/scriptname)
su -c "cp $scriptname /usr/bin/monitor" root && echo "Congratulations! Script I nstalled, now run monitor Command" || echo "Installation failed"
}
fi

if [[ ! -z $vopt ]]
then
{
echo -e "tecmint_monitor version 0.1\nReleased Under Apache 2.0 License"
}
fi

if [[ ! -z $hopt ]]
then
{
echo -e " -i                  Install script"
echo -e " -v                  Print version information and exit"
echo -e " -h                  Print help (this information) and exit"
}
fi

clear

unset tecreset os architecture kernelrelease internalip externalip nameserver

tecreset=$(tput sgr0)

ping -c 1 www.baidu.com &> /dev/null && echo -e '\E[32m'"Internet: $tecreset Connected" || echo -e '\E[32m'"Internet: $tecreset Disconnected]"

os=$(uname -o)
echo -e ' \E[32m'"Operating System Type :" $tecreset $os


###############################
OS=`uname -s`
REV=`uname -r`
MACH=`uname -m`

GetVersionFromFile()
{
   VERSION=`cat $1 |tr "\n" ' ' | sed s/.*VERSION.*=\
}

if [ "${OS}" = "SunOS" ] ; then
    OS=Solaris
    ARCH=`uname -p`
    OSSTR="${OS} ${REV}(${ARCH} `uname -v`)"
elif [ "${OS}" = "AIX" ] ; then
    OSSTR="${OS} `oslevel` (`oslevel -r`)"
elif [ "${OS}" = "Linux" ] ; then
    KERNEL=`uname -r`
    if [ -f /etc/redhat-release ] ; then
        DIST='RedHat'
        PSUEDONAME=`cat /etc/redhat-release | sed s/.*\(// | sed s/\)//`
        REV=`cat /etc/redhat-release | sed s/.*release\ // | sed s\ .*//`

    elif [ -f /etc/SuSE-release ] ; then
        DIST=`cat /etc/SuSE-release | tr "\n" ' '| sed s/VERSION.*//`
        REV=`cat /etc/SuSE-release | tr "\n" ' ' | sed s/.*=\ //`
    elif [ -f /etc/mandrake-release ] ; then
        DIST='Mandrake'
        PSUEDONAME=`cat /etc/mandrake-release | sed s/.*\(// | sed s/\)//`
        REV=`cat /etc/mansrake-release | sed s/.*release\ // | sed s/\ .*//`
    elif [ -f /etc/debian_version ] ; then
        DIST="Debian `cat /etc/debian_version`"
        DEV=""

    fi
    if ${OSSTR} [ -f /etc/UnitedLinux-release ] ; then
        DIST="${DIST}[`cat /etc/UnitedLinux-release | tr "\n" ' ' | sed s/VERSION.*//`]"
    fi
    OSSTR="${OS} ${DIST} ${REV} (${PSUEDONAME} ${KERNEL} ${MACH})"
   
fi

echo -e '\E[32m'"OS Version :" $tecreset $OSSTR

achitecture=$(uname -m)
echo -e '\E[32m'""Kernel Release :" $tecreset $architecture

kernelrelease=$(uname -r)
echo -e '\E[32m'"Kernel Release :" $tecreset $kernelrelease


echo -e '\E[32m'"Hostname :" $tecreset $HOSTNAME


internalip=$(ostname -I)
echo -e '\E[32m'"Internal IP :" $ecreset $internalip


externalip=$(curl -s ipecho.net/plain;echo)
echo -e '\E[32m'"External IP : $tecreset "$externalip


nameservers=$(cat /etc/resolv.conf | sed '1 d' | awk '{print $2}')
echo -e '\E[32m'"Name Servers :" $tecreset $nameservers

who>/tmp/who
echo -e '\E[32m'"Loged In users :" $tecreset 

