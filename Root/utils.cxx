#include "SusyTest0/utils.h"

#include <algorithm>    // std::copy
#include <cstdlib> // strtol
#include <iterator>     // std::ostream_iterator
#include <sstream>      // std::ostringstream
#include <sys/stat.h>
#include <sys/types.h>

std::string basedir(const std::string &path)
{
  size_t found = path.find_last_of('/');
  return path.substr(0, found+1);
}

// from : http://stackoverflow.com/questions/675039/how-can-i-create-directory-tree-in-c-linux
std::string mkdirIfNeeded(const std::string &dirname)
{
  using std::string;
  if(dirname.length()<1) return string("");
  typedef struct stat Stat;
  Stat st;
  int status;
  bool doesnotExist(stat(dirname.c_str(), &st) != 0);
  if(doesnotExist) {
    status = mkdir(dirname.c_str(), S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH);
    bool success(status==0);
    return success ? dirname : string("");
  } else {
    bool isDir(S_ISDIR(st.st_mode));
    return isDir ? dirname : string("");
  }
}


// http://stackoverflow.com/questions/874134/find-if-string-endswith-another-string-in-c
bool endswith(const std::string &s, const std::string &end) {
  if(s.length()<end.length()) return false;
  else return (0==s.compare(s.length() - end.length(), end.length(), end));
}

// http://stackoverflow.com/questions/2844817/how-do-i-check-if-a-c-string-is-an-int
bool isInt(const std::string &s)
{
  // DG 2013-09-17: we might want to strip the leading/trailing whitespaces (now returns false)
  if(s.empty() || ((!isdigit(s[0])) && (s[0] != '-') && (s[0] != '+'))) return false ;
  char * p ;
  strtol(s.c_str(), &p, 10) ;
  return (*p == 0) ;
}

bool fileExists(const std::string &filename)
{
  std::ifstream file(filename.c_str());
  bool doesExists = file;
  file.close();
  return doesExists;
}

std::string vdouble2str(const std::vector<double> &v)
{
  std::ostringstream oss;
  std::ostream_iterator<double> it (oss,", ");
  std::copy(v.begin(), v.end(), it);
  return oss.str();
}
