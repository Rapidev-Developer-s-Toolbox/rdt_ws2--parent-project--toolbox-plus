# ABOUT RAPIDEV DEVELOPER'S TOOLBOX

_Setting up... the easy way!_

## MISSION STATEMENT

The purpose of this open-source software suite is to give software developers a quick and
easy way to ensure that 

  1.) their development environment is set up and tuned for their development tasks,
  1.) they have all of the tools they need for a development project, and
  2.) those tools are properly configured in just the the right way. 
  
The easiest way to put it is to say that:

> The goal of Rapidev is to instantly turn any linux system into the ideal development machine 
> with a single command, and when your work is done, to turn it back again with another.

## THE ISSUE

For example, imagine that you have a huge deadline in the morning. You are just finishing up
when your laptop crashes! You go to reboot and.. nothing happens. The battery is fried. Luckily, 
the project is saved to an online repository. Still, you'll need a computer if you are going to 
finish your work.

Your wife tells you that you can use hers if you want, but it isn't a development machine. Sure, it 
could be a dev machine, but that requires a lot of work, and work takes time. You will have to 
download and install an IDE or text editor and set up a build environment with interpreters and/or 
compilers, libraries, etc. You'll need to set up a workspace for your project, you will need to set a slew of 
environment variables, you'll need to configure everything, and...

By that time it will be tomorrow morning and youll be late for work, still with no project. If
only there was a way to do it all in one step..

Enter Rapidev. Rapidev is that step.

## PROJECT GOALS

The core goal of the Rapidev Developer's Toolbox project is to build a software package that provides 
those features mentioned in the mission statement, but that is not it's only goal. We have other 
functionality related goals that compliment them. These goals are as follows:

  - the Rapidev Toolbox is modular
  - Users have access to any or all of it's functionalities
  - all tools in the set will be easy to use
  - The tools will have relatively quick run times
  - The naming schemes and abstractions will be consistent across the board
  - The RDT is, and always will be, open-source software

This list of goals is not comprehensive. These goals only relate to the functionalities 
that the RDT exposes. We have goals that relate to other aspects of the Software and project as 
well. These will be included below.

## INSTALLATION

### DISCLAIMER: TARGET ENVIRONMENTS

Currently, RDT is only available on linux. However, this contradicts the goals and purpose of the software, 
and so it will change very soon. As soon as the software is deployed as a linux package, the porting processes
for Mac and Windows will begin. Whether the initial builds for each of these two targets will happen concurrently
or one at a time depends on factors outside the scope of the project itself, and so it is TBD for now. 

For more details on these two platforms, see the **BUILD SCHEDULE** section below.

### LINUX

The recommended method of install on Linux, if possible, is via your distro's primary package management 
system. It should provide for installation of the most recent stable version of the software. If this is not possible,
you should be able to grab a make-ready tarball from our website at 

```
https://download.rapidev.org/
```

This will also contain newer expirimental versions including our nightly build.

## BUILD SCHEDULE & ENVIRONMENT-SPECIFIC DETAILS

### LINUX

The RDT software package will be provided to Linux users primarily through their system's default 
package manager. Our main goal on the Linux Installation front is to make RDT available 
on as many package managers as possible. We will start with Apt and move outward 
from there.  

### WINDOWS

As I mentioned above, at first the RDT will be Linux-only software. However, once we have a "complete" 
Linux solution, we will start development for Windows and Mac systems. 

The Windows package will be distributed in the form of a .zip file containing the required installer for the
Windows operating system. The build will almost certainly be targeting 64 bit architectures, as this is all that 
Windows itself supports.

### MAC

If circumstances do not allow for builds for  both  targets to happen concurrently, then Mac will be the first of 
the two to get a package. It will be distributed via the Homebrew package manager.  

To learn more, see the other text documents provided in the same directory as this
one.

## AUTHORS

Original creator / developer: Nathan Tolbert