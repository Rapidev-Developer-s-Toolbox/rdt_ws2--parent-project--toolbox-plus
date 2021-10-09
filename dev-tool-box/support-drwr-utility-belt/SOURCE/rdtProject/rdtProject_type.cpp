#include <iostream>
#include <stdexcept>
#include <stdio.h>
#include <string>
#include <type_traits>
#include <unistd.h>
#include <vector>
#include <sys/types.h>
#include <sys/stat.h>
#include <cstring>





using namespace std;

class prDirectory {

  public:

    

    string prDirName;
    // the Linux id. Directory is represented by an int which is stored here
    const char * prDirPath;
    __mode_t prDirMode;
    int prDirIdentifier;
    // each value refers to the identifier of a prDirectory
    vector<int> prDirChildren;

    prDirectory (int id, string name, string path, __mode_t mode) {
      this->prDirMode = mode;
      this->prDirPath = path.c_str();
      this->prDirName = name;
      this->prDirIdentifier = mkdir(this->prDirPath, prDirMode);
      this->prDirChildren = {};

    };

    prDirectory (int id, string name, string path, __mode_t mode, vector<string> children,  __mode_t childMode) {

      this->prDirMode = mode;
      this->prDirPath = path.c_str();
      this->prDirName = name;
      this->prDirIdentifier = mkdir(this->prDirPath, prDirMode);
      this->prDirChildren = mk_children_rtn_ids(prDirPath, children, childMode);

    };

  private:

    vector<int> mk_children_rtn_ids(const char * parentPath, vector<string> v, __mode_t mode) 
    {
      vector<int> children;
      for (const string i : v) {
        string last_char = to_string(i[i.length()-1]);
        // negation (! of) returns true if comparison is equal
        int inequality = last_char.compare("/");

        // if equal. in other words, if i ends with "/"
        if (!inequality){
          string childPath = parentPath + i;
          int childId = mkdir(childPath.c_str(), mode);
          children.push_back(childId);
        }else{
          string slash = "/";
          string childPath = parentPath + slash + i;
          int childId = mkdir(childPath.c_str(), mode);
          children.push_back(childId);
        } 
      }
      return children;
    };

     /*
      *  To build a dirstring from a folder tree
      *
      *  from the base
      *
      *                       X
      *                      /  \
      *                     X     \
      *                   / | \     \ 
      *                  /  |   \     X
      *                 /   X     X   |
      *               X    / \    |   |
      *              / |  |   \   |   |
      *             |  |  |   |   |   |                    
      *             X  X  X   X   X   X
    
    */

};/home/ntolb/CODING_PROJECTS/C_workspaces/c-rapidev_ws2/dev-tool-box/support-drwr-utility-belt/SOURCE/rdtProject

class prProject {

  public:

    string base_dir;
    int size = 0;
    
    int add_child_dir (string dirname, int permissions) {

      // int n = dirname.length();
      const char * c_dirname = dirname.c_str();
      int dir = mkdir(c_dirname, permissions);
      return dir;
    }

};

class breaker_string_t {

  public:

    bool loaded = false;
    string breaker_string;


    breaker_string_t () {

    };

    breaker_string_t (string bs) 
    {
      this->breaker_string = bs;
      this->check_for_load();
      if (this->loaded == false) {
        breaker_string = nullptr;
      } else {

        

      }
    };

    ~breaker_string_t () 
    {

    };

  private:

    int load (string st) 
    {
      if (loaded == true) {
        cerr << "already loaded" << endl;
        return 1;
      }
      bool res = parse ();
      return res;
    };

    // gives true if bs is not null
    bool check_for_load () 
    {
      // if null return 1, if loaded return 0
      if (!(breaker_string.compare(nullptr))) {
        this->loaded = 0;
        return 1;
      }else{
        this->loaded = 1;
        return 0;
      }
    };



    //check syntax in breaker_string for validity
    int parse ()
    {
      bool nospaces = check_nospaces();
      bool braceseven = check_braceseven();
      return 0;
    };

    bool check_nospaces () 
    {


      return 0;

    };


    bool check_braceseven ()
    {
      return 0;

    };

    vector<char> str_to_charv (string s) 
    {
      const char * str = s.c_str();
      vector<char> br_str_chars;
      for (size_t i = 0; i < sizeof(str); i++) 
      {
        if (&str[i] != NULL) {
          br_str_chars.push_back(str[i]);
        }
      }
      return br_str_chars;
    };
    
};