<span align="left">**LIBERRORS-SH(3)**</span><span align="center">Linux Programmer's Manual</span><span align="right">**LIBERRORS-SH(3)**</span>

<h3 align="center">## Lib RDT Errors for Linux</h3>

<h4 align="center">~ META-PKG ~</h4>

**Lib RDT Errors** (and the associated packages, which follow the naming convention librdterrors-* andreside in the metapackage **librdterrors(3)**) is the  RDT implementation for error checking across the entire platform. This one tool
may be the most importantof any for the well-being of the system. This is because almost all (maybe even all) of the other tools rely on it when something goes wrong. The main design goals for this package are in line with those of anyhigh use tool: that it be easy to use and be usable in the max amount of situations.

<h5 align="center">librdterrors-sh                    </h5>

<h4 align="center">Lib RDT Errors for Linux</h4>

**librdterrors-sh(3)** contains the pportion of the library that uses and is dedicated to shellscript. Currently, it consists of only of 2 functions, (but more will be added soon.) These are **throw_recoverable_error(1)** and
**throw_fatal_error(1)**.

<h5 align="center">## THROWING AN ERROR</h5>

With **liberror-sh(3)** handling errors in your scripts is made easy. Simply call the correct handler function and provide the *ERR_CODE* for the desired error type as an argument (more on *ERR_CODE* and error types, including a list of the possibilities). For example, throwing a fatal internal error should look like:

```bash
throw_fatal_error 150 
```

Here, the function is **throw_fatal_error(1)**, and *150* is the *$ERR_CODE* for the type *"Fatal_Internal_Error"*, which is the actual type name for internal errors thrown from **throw_fatal_error(1)**. It is also the value of the *$ERR_TYPE* value whenever this error is thrown (you'll find a comprehensive list of environment variables in the *ENVIRONMENT* section below as well.)

The API also defines the **throw_recoverable_error(1)** function. The syntax, environment, command line options, and the oveall procedure for using **throw_recoverable_error(1)** in your scripts are almost exactly the same as for **throw_fatal_error(1)**, except where noted in this document. The differences are minor and few, and pertain mostly, if not completely, to the end result of calling in the case of each, as described in the next section.

<h5 align="center">## FUNCTION IMPLEMENTATIONS & WHERE THEY DIFFER</h5>

You may have already guessed the functionality. The project was designed and built with simplicity at the forefront of our minds.

<h5 align="center">## DEFINING CUSTOM ERROR MSG</h5>

<h5 align="center">## ADDING ADDITIONAL OUTPUTS</h5>

<h5 align="center">## DEBUG / VERBOSE MODE</h5>

<h5 align="center">## </h5>

This is not necassary but is available if needed

<p align="center"></p><p align="center"></p><p align="center"></p><p align="center"></p>
