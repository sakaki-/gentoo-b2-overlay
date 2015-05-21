# gentoo-b2-overlay
Gentoo overlay for the Excito B2 miniserver.

## List of ebuilds

<img src="https://raw.githubusercontent.com/sakaki-/resources/master/excito/b2/Excito_b2.jpg" alt="Excito B2, aka Bubba|TWO" width="250px" align="right"/>

* **sys-kernel/gentoo-b2-sources** [patch](https://github.com/sakaki-/gentoo-b2-kernel-patches)
 * Provides a full set of Linux kernel sources, with both Gentoo and Excito B2 patches applied.
* **sys-kernel/buildkernel-b2** [source](https://github.com/sakaki-/buildkernel-b2)
 * Provides a script (**buildkernel-b2**(8)) to build a bootable Gentoo Linux kernel for the Excito B2, targeting either HDD or USB deployment. Can be used on the B2 directly, or on a Gentoo PC (when cross-compiling via `crossdev`). A manpage is included.
* **sys-apps/b2-init-scripts** [source](https://github.com/sakaki-/gentoo-b2-overlay/tree/master/sys-apps/b2-init-scripts/files)
 * Provides a set of simple init scripts for the B2 (to turn on the LED on boot, copy across network settings when booting etc.).

## Installation

As of version >= 2.2.16 of Portage, **gentoo-b2-overlay** is best installed (on Gentoo) via the [new plug-in sync system](https://wiki.gentoo.org/wiki/Project:Portage/Sync). It will supply a repository named **gentoo-b2**

The following are short form instructions. If you haven't already installed **git**(1), do so first:

    # emerge --ask --verbose dev-vcs/git 

Next, create a custom `/etc/portage/repos.conf` entry for the **gentoo-b2** overlay, so Portage knows what to do. Make sure that `/etc/portage/repos.conf` exists, and is a directory. Then, fire up your favourite editor:

    # nano -w /etc/portage/repos.conf/gentoo-b2.conf

and put the following text in the file:
```
[gentoo-b2]

# Gentoo overlay for the Excito B2 miniserver
# Maintainer: sakaki (sakaki@deciban.com)
 
location = /usr/local/portage/gentoo-b2
sync-type = git
sync-uri = https://github.com/sakaki-/gentoo-b2-overlay.git
priority = 50
auto-sync = yes
```

Then run:

    # emaint sync --repo gentoo-b2

If you are running on the stable branch by default, allow **~ppc** keyword files from this repository. Make sure that `/etc/portage/package.accept_keywords` exists, and is a directory. Then issue:

    # echo "*/*::gentoo-b2 ~ppc" >> /etc/portage/package.accept_keywords/gentoo-b2-repo
    
Now you can install packages from the overlay. For example:

    # emerge --ask --verbose =sys-kernel/gentoo-b2-sources-3.18.2

## Maintainers

* [sakaki](mailto:sakaki@deciban.com)
