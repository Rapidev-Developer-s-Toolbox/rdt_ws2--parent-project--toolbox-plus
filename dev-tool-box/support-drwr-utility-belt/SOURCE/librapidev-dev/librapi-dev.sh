# ENVIRONMENT VARIABLES FOR ntolb
export MYCODE=~/CODING_PROJECTS
export MYSH=$MYCODE/bash_workspaces/
export MYSH1=$MYSH/bash_ws1/
export MYSH2=$MYSH/bash_ws2/
export MYSH3=$MYSH/bash_ws3/
export MYSH_CP=$MYCODE/bash_workspaces/snippets
export MYSH_XTRA=$MYCODE/bash_workspaces/scratch
export MYPY=$MYCODE/python_workspaces/
export MYPY1=$MYCODE/python_workspaces/_ws1
export MYPY2=$MYCODE/python_workspaces/_ws2
export MYPY3=$MYCODE/python_workspaces/_ws3
export MYPY4=$MYCODE/python_workspaces/
export MYPY_CP=$MYCODE/python_workspaces/snippets
export MYPY_XTRA=$MYCODE/python_workspaces/scratch
export MYCPP=$MYCODE/C++_workspaces/
export MYCPP1=$MYCODE/C++_workspaces/_ws1
export MYCPP2=$MYCODE/C++_workspaces/_ws2
export MYCPP3=$MYCODE/C++_workspaces/_ws3
export MYCPP4=$MYCODE/C++_workspaces/
export MYCPP_CP=$MYCODE/C++_workspaces/snippets
export MYCPP_XTRA=$MYCODE/C++_workspaces/scratch
export MYJAVA=$MYCODE/java_workspaces/
export MYJAVA1=$MYCODE/java_workspaces/_ws1
export MYJAVA2=$MYCODE/java_workspaces/_ws2
export MYJAVA3=$MYCODE/java_workspaces/_ws3
export MYJAVA4=$MYCODE/java_workspaces/
export MYJAVA_CP=$MYCODE/java_workspaces/snippets
export MYJAVA_XTRA=$MYCODE/java_workspaces/scratch
export MYC=$MYCODE/C_workspaces
export MYC1=$MYCODE/C_workspaces/C_ws1
export MYC2=$MYCODE/C_workspaces/C_ws2
export MYC3=$MYCODE/C_workspaces/C_ws3
# export MYC4=$MYCODE/C_workspaces/C
export MYC_CP=$MYCODE/bash_workspaces/C_workspaces/snippets
export MYC_XTRA=$MYCODE/bash_workspaces/C_workspaces/scratch
export MYMD02=$MYCODE/hybrid_workspaces/md-web-app_micros_ws1
export MYCFS=$MYCPP/CodeforcesProblems
export MYCFS1=$MYCPP/CodeforcesProblems
export MYCFS_A=$MYCPP/CodeforcesProblems/A
export MYCFS_B=$MYCPP/CodeforcesProblems/B
export MYCFS_C=$MYCPP/CodeforcesProblems/C
export MYCFS_D=$MYCPP/CodeforcesProblems/D
export MYCFS_E=$MYCPP/CodeforcesProblems/E
export MYCFS_F=$MYCPP/CodeforcesProblems/F
export MYCFS_XTRA=$MYCPP/CodeforcesProblems/scratch
export MYCFS_CP=$MYCPP/snippets/cforces-snips
export CONFS=$HOME/.config
export MYRAP1=$MYCODE/C_workspaces/c-rapidev_ws1
export MYRAP2=$MYCODE/C_workspaces/c-rapidev_ws2
export MYRAP3=$MYCODE/C_workspaces/c-rapidev_ws3


# COMMON CONFIGS
export SWAYCFG_MSTR=~/etc/sway/config
export SWAYCFG_1=~/.config/sway/config
export SWAYCFG_2=~/.config/sway/config2

# RESET SYSTEM VARIABLES HERE WHEN NEEDED

export TERM=screen-256color
export EDITOR=nvim


# PREDEFINED FUNCTIONS

# Set up the windows in a Sway workspace into Vim IDE formation #1

function rpdv-mktool {
# ensure that the first arg  points to a directory
# if not, output an error message and return -1
breakWithErr=0
isdir=[[ -d $1 ]]
if [ isdir -ne 0 ]
then
    echo "ERROR: First argument must be a directory. Unrecoverable condition. Exiting.." >> STERR
    breakWithErr=1
    break
elif
fi
}

function setbasedir{
    export RAPIDEV_BASE_DIRECTORY=$1 
}

function getbasedir{
    if [ -d  RAPIDEV_BASE_DIRECTORY ];then
        echo RAPIDEV_BASE_DIRECTORY
    elif [ $(test -e $1) != 0 ];then
        echo "WARNING: base directory not set! Set with \'setbasedir \< directory \> \'. "
    fi
}

function amiinbasedir{

}

function isargbasedir
