import os
import re
import sublime
import sublime_plugin

class FjtOpenFileCommand(sublime_plugin.TextCommand):
    def parse_include_stat(self, string):
        fileName = re.compile("\s*#include\s*<(.+)>.*").match(string).group(1)
        HeaderDirectories = ["c:/home", "c:/"]
        for headerDir in HeaderDirectories:
            path = os.path.join(headerDir, fileName)
            if os.path.exists(path):
                return path
        return ""

    def generate_path(self, string):
        if string.find("#include") != -1:
            return self.parse_include_stat(string)
        return string

    def run(self, edit):
        for region in self.view.sel():
            # get line contents
            line = self.view.line(region)
            lineContents = self.view.substr(line)
            # open file
            path = self.generate_path(lineContents)
            if os.path.exists(path):
                self.view.window().open_file(path)

# abcdefg
# xyz
