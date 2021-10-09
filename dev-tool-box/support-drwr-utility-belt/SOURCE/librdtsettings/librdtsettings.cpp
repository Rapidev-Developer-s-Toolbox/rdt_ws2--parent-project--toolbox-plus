#include <cstddef>
#include <iostream>
#include <vector>
#include <string>

using namespace std;

struct soption_int_t
{
  string* name;
  string* desc;
  bool req;
  int lowval;
  int highval;
  int val;
  string* i_question; // the question to display in interactive mode when getting the value 
};

struct soption_bool_t
{
  string* name;
  string* desc;
  bool req;
  bool val;
  string* i_question; // the question to display in interactive mode when getting the value 
};

class Settings 
{

public:
  //The sobarr array contains all bool options defined so far, in the order that they appear in the list.
  // struct  soption_bool_t * sobarr[25];
  // int barr_currentsize = 0;
  vector<soption_bool_t> sopt_bool_vec;
  // ''' int opts ''' 
  // struct  soption_int_t * soiarr[25];
  // int iarr_currentsize = 0;
  vector<soption_int_t> sopt_int_vec;

  // Corresponds to the order of option types for this settings list. 
  // If value = true, type = soption_bool_t. If false, soption_int_t  
  vector<bool> readorder;
  // represents the index of the next opt to be acted on.  
  int cursor = 0;

  soption_bool_t create_bool_option (string * pname, string * pdesc, bool preq, bool pval, string * pqstn)
  {

    soption_bool_t opt ={
      pname,
      pdesc,
      preq,
      pval,
      pqstn
    };
    return opt;

  };

  int add_bool_option (struct soption_bool_t opt, vector<soption_bool_t> vec)
  {
    int sizebefore = readorder.size();
    readorder.push_back(true);
    if (readorder.size() != sizebefore) {
      vec.push_back(opt);
      return 0;
    }else{
      return 1;
    }
  };

  soption_int_t create_int_option (string * pname, string * pdesc, bool preq, int plowval, int phighval, int pval, string * pqstn)
  {
    soption_int_t opt =
    {
      pname,
      pdesc,
      preq,
      plowval,
      phighval,
      pval,
      pqstn
    };
  };





  int add_int_option (struct soption_int_t opt, vector<soption_int_t> vec)
  {
    int sizebefore = readorder.size();
    readorder.push_back(true);
    if (readorder.size() != sizebefore) {
      vec.push_back(opt);
      return 0;
    }else{
      return 1;
    }
  };


  int a;



  int get_all_options () 
  {
    if (readorder.size() > 0)
    {
      vector<string> optslist;
      string val = nullptr; 
      
      for (int i = 0; i < readorder.size(); i++)
      {
        // next index to be loaded for each
        size_t barr_ndx = 0;
        size_t iarr_ndx = 0;
        if (readorder[i] == true) // if the current option is a bool..
        {        
          struct soption_bool_t current_opt = sopt_bool_vec[barr_ndx];
          val = "id: " + to_string(i+1);
          optslist.push_back(val);
          
          for (int j = 0; j < 7; j++)
          {
            val = "";
            optslist.push_back(val);

          }
          val = "";

        }   
      }
    }
    return 1;
  } 

private:

  vector<string> sopt_to_soptstring () 
  {

    

  };



};


