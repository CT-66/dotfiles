from __future__ import (absolute_import, division, print_function)

from ranger.api.commands import *

from collections import deque
import os
import re

class emptytrash(Command):
    """:empty

    Empties the trash
    """

    def execute(self):
        HOME = os.environ['HOME']
        self.fm.run(f'trash-empty')

# https://github.com/arburty/ranger-sxiv-compatibility

class save_sorted_files_buffer(Command):
    """:save_sorted_files_buffer

    Save the sorted file buffer to datadir/copy_sorted_files
    """
    copy_sorted_filename = 'copy_sorted_files'

    def execute(self):
        import sys
        fname = None
        fname = self.fm.datapath(self.copy_sorted_filename)
        unwritable = IOError if sys.version_info[0] < 3 else OSError
        try:
            fobj = open(fname, 'w')
        except unwritable:
            return self.fm.notify("Cannot open %s" %
                                  (fname or self.copy_sorted_filename), bad=True)

        startfile=self.fm.thisfile.path
        listoffiles = self.fm.thisdir.files
        filenum=0
        for o in listoffiles:
            filenum += 1
            if str(o.path) == startfile:
                break

        fobj.write(str(filenum) + "\n")
        fobj.write("\n".join(fobj.path for fobj in listoffiles))
        fobj.close()
        return None
