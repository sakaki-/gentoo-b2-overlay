# gentoo-b2-overlay
Gentoo overlay for the Excito B2 miniserver.

## List of ebuilds

<img src="https://raw.githubusercontent.com/sakaki-/resources/master/excito/b2/Excito_b2.jpg" alt="Excito B2, aka Bubba|TWO" width="250px" align="right"/>

* **sys-kernel/gentoo-b2-sources** [patch](https://github.com/sakaki-/gentoo-b2-kernel-patches)
 * Provides a full set of Linux kernel sources, with both Gentoo and Excito B2 patches applied.
* **sys-kernel/buildkernel-b2** [source](https://github.com/sakaki-/buildkernel-b2)
 * Provides a script (**buildkernel-b2**(8)) to build a bootable Gentoo Linux kernel for the Excito B2, targeting either HDD or USB deployment. Can be used on the B2 directly, or on a Gentoo PC (when cross-compiling via `crossdev`). A manpage is included.

## Installation

**gentoo-b2-overlay** is best installed (on Gentoo) via **layman**(8); it supplies a repository named **gentoo-b2**.

The following are short form instructions. If you haven't already installed **layman**(8), do so first:

    emerge --ask --verbose app-portage/layman
    echo 'source "/var/lib/layman/make.conf"' >> /etc/portage/make.conf

Make sure the `git` USE flag is set for the **app-portage/layman** package (it should be by default).

Next, create a custom layman entry for the **gentoo-b2** overlay, so **layman**(8) can find it on GitHub. Fire up your favourite editor:

    nano -w /etc/layman/overlays/gentoo-b2.xml

and put the following text in the file:

    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE repositories SYSTEM "/dtd/repositories.dtd">
    <repositories xmlns="" version="1.0">
        <repo priority="50" quality="experimental" status="unofficial">
    	    <name>gentoo-b2</name>
    	    <description>Gentoo overlay for the Excito B2 miniserver.</description>
    	    <homepage>https://github.com/sakaki-/gentoo-b2-overlay</homepage>
    	    <owner>
    		    <email>sakaki@deciban.com</email>
    		    <name>sakaki</name>
            </owner>
    	    <source type="git">https://github.com/sakaki-/gentoo-b2-overlay.git</source>
        </repo>
    </repositories>


Then run:

    layman --sync-all
    layman --add="gentoo-b2"

If you are running on the stable branch by default, allow **~ppc** keyword files from this repository:

    echo '*/*::gentoo-b2 ~ppc' >> /etc/portage/package.accept_keywords
    
Now you can install packages from the overlay. For example:

    emerge --ask --verbose =sys-kernel/gentoo-b2-sources-3.18.2

## Maintainers

* [sakaki](mailto:sakaki@deciban.com)
