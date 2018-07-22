import sys
import os
import re
import random

l = list(["🤔", "🍣", "🙀", "🦄", "🌈", "🔥"])

if '--mem' in sys.argv:
  for line in os.popen('cat /proc/meminfo').read().split('\n'):
    if 'MemAvailable' in line:
      line = line.strip()
      # デフォルトではKB表現だから、メガバイトで表現する
      mem  = re.split(r'\s{1,}', line)[-2]
      mem  = 'Mem:%dMB'%(int(mem)//1000)
      print( mem )
      break

if '--vmstat' in sys.argv:
  buff = os.popen('vmstat').read().split('\n')
  keys = re.split(r'\s{1,}', buff[1])
  vals = re.split(r'\s{1,}', buff[2])
  obj  = dict( zip(keys, vals) )
  ucpu = '💻 ={0:03d}%'.format( int(obj['us']) )
  print( ucpu )

if '--emoji' in sys.argv:
    emoji = random.choice(l)
    print( emoji )
