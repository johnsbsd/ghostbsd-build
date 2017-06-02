#!/bin/sh

base_overrides()
{
    cp -Rf extra/common-base-setting/override/* ${BASEDIR}/
}


patch_etc_files()
{
  cat extra/common-base-setting/patches/boot/loader.conf.extra >> ${BASEDIR}/boot/loader.conf
  cat extra/common-base-setting/patches/etc/profile.extra >> ${BASEDIR}/etc/profile
  cat extra/common-base-setting/patches/etc/devfs.rules.extra >> ${BASEDIR}/etc/devfs.rules
  cat extra/common-base-setting/patches/etc/make.conf.extra >> ${BASEDIR}/etc/make.conf
  cat extra/common-base-setting/patches/etc/rc.conf.extra >> ${BASEDIR}/etc/rc.conf
  cat extra/common-base-setting/patches/etc/devd.conf.extra >> ${BASEDIR}/etc/devd.conf
  cat extra/common-base-setting/patches/etc/sysctl.conf.extra >> ${BASEDIR}/etc/sysctl.conf
}

packages_settings()
{
    #set htmlview alternative to firefox for cups
    if [ -e ${BASEDIR}/usr/local/bin/firefox ] ; then
        update-alternatives --altdir ${BASEDIR}/usr/local/etc/alternatives --install ${BASEDIR}/usr/local/bin/htmlview htmlview ${BASEDIR}/usr/local/bin/firefox 50
    fi
}

# copy files from override to FreeBSD base system
freebsd_overrides
# patch files from etc
patch_etc_files
# apply packages settings
#packages_settings

