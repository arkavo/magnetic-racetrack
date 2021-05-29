import subprocess as sp

sp.call(["nvcc","./racetrack.cu","-o","rct"])
sp.call(["./rct.exe","70"])