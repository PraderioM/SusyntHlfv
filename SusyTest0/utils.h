#ifndef SUSYTEST0_UTILS_H
#define SUSYTEST0_UTILS_H
/*
  Generic utility functions

  davide.gerbaudo@gmail.com
  Aug 2013
 */
#include <fstream>
#include <string>

bool endswith(const std::string &s, const std::string &end) {
  //http://stackoverflow.com/questions/874134/find-if-string-endswith-another-string-in-c
  if(s.length()<end.length()) return false;
  else return (0==s.compare(s.length() - end.length(), end.length(), end));
}

bool fileExists(const std::string &filename)
{
  std::ifstream file(filename.c_str());
  bool doesExists = file;
  file.close();
  return doesExists;
}
#endif
