# Security Policy

  ## SUPPORTED VERSIONS

    | Version | Supported          |
    | ------- | ------------------ |
    | 0.x.x   | :white_check_mark: |

    Currently, all versions are supported **on Ubuntu**. We will do our best to help with issues on other Debian-based systems, but no guarantees. Regardless, if ANY 
    security-compromising issues are brought to our attention, no matter how small or insignificant, if it is known to compromise the integrity of the end-user's system 
    in any way, then patching of the issue is automatically supported for all systems. For these cases, there exists a community-wide protocol. -2 
    then the top priority of our entire community (i.e. everyone involved with the RapidevDT project as al fi will 
7
## RapidevDT POLICY FOR THE HANDLING OF SECURITY THREATS & VULNERABILITIES: 
  ## Reporting a Vulnerability

  To report security vulnerabilities, please use the following process:

    - Navigate to [main](https://github.com/Rapidev-Developer-s-Toolbox/) hub on GitHub.
    - click on the **issues** tab at the top of the window
    - Before starting a new issue, check to see if the issue has been reported.
        - if it has been reported in another issue, leave a comment on that issue's thread saying "still an issue:" followed by the version. If you are not using the 
          newest version, the issue is likely patched in a newer version from the one you are using. Check that this is not the case.
        - if the issue is yet unreported, proceed to the next step.
    - Title the issue as _"type: version: summary"_ where _type_ is either BUG or ISSUE (we will use this to add the appropriate tag, so it is properly handled), 
      _version_ is the version you are using, and _summary_ is a summary of your problem in less than 10 words.
    - The body needs to be as descriptive as possible. Include the following sections: DESCRIPTION, MY_SPECS, REPRODUCE, CONTACT_INFO
        - DESCRIPTION: Write out a summary of what happened to cause the issue and a summary of exactly what the issue is.
        - MY_SPECS: Include your pc specs along with OS type. (NOTE: at this point, only ubuntu is supported. If you are using another Debian-based Linux system, go 
          ahead and include the OS type and submit. We will see what we can do...)
        - REPRODUCE: In this section, leave a bulletpoint list of steps we need to follow to cause the issue on our machines.
        - CONTACT_INFO: Give us some way to get ahold of you. If this section is omitted, then we will use the issue's _reply_ function.
    - Alternatively, if you possess the knowledge / abilities needed to patch, or otherwise fix, the vulnerability, by all means, be our guest. The source code can be 
      forked from any of its public git-ssh hosts (we currently maintain repositories at GitHub, GitLab, and BitBucket.)