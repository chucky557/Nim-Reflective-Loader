# Nim-reflective-Loader

This is a simple loader that downloads a DLL from target and directly injects it's code as bytes in memory. This then allows an attacker to directly invoke an exported function. This is meant to bypass antivirus that performs file based analysis. It's advantageous as your payload doesn't touch the disk.
However, this is not like some hero (like Zoro in one piece) that seems to have it all figured. Enthusiastic blueteamers may still get the payload if they know how.

Lets be ethical, Happy Hacking

# Getting Started
> 1. Cloning
Clone this repo from github using and get into its directory:
```git clone https://github.com/chucky557/Nim-Reflective-Loader && cd Nim-Reflective-Loader```


> 2. compilation
This was done on linux, BlackArch to be specific. So the first bit is on how to compile on Linux then the second is on windows.

1. LOADER
```
nim c -d:mingw --os:windows --cpu:amd64 --gcc.exe:/usr/bin/x86_64-w64-mingw32-gcc --gcc.linkerexe:/usr/bin/x86_64-w64-mingw32-gcc --passL: "-static-libgcc -static-libstdc++ -static"  loader1.nim
```
> Windows

```
nim c --cpu:amd64 --cc:gcc -d:release loader1.nim
```

2. DLL

```
nim c --os:windows --cpu:amd64 --cc:gcc --app:lib --noMain --nomain   --gcc.exe:/usr/bin/x86_64-w64-mingw32-gcc --gcc.linkerexe:/usr/bin/x86_64-w64-mingw32-gcc --passL:"-luser32" --passL:"-Wl,-e_DllMain -static-libgcc -static-libstdc++ -static" -d:mingw -d:release --threads: off --out:mydll.dll mydll.nim
```

> Windows

```
nim c --cpu:amd64 --cc:gcc --app:lib --noMain --nomain --passL:"-luser32" --passL:"-wl, -e_DllMain" -d:mingw -d:release --threads: off --out:mydll.dll mydll.nim
```

# Test
1. To use the loader, download it onto a target 
2. Run it on target

[Watch a demo video](demo.mp4)

# NOTE
First, I stole the bare framework of this code from a guy named Helixo and fixed it. I kinda shared with him the fix but got no response.
Second, I didnt test those windows commands since my windows is never connected to the internet so I can't install some nim libraries. I actually asked AI then added a couple f switches where it seemed necessary, like in the DLL commnd (beware).
If you encounter a haddle just say. I will be happy to help.

# Appreciation
I would really love to appreciate:
	1. Mr.Helixo @Helixo32 for the loader code that I happen to be fixing
	2. Offensive Nim repo (creating dll and pushing me to love nim more)
	3. Microsoft for the awesome documentation and 0xRick (0xrick.github.io/win-internals)
	4. The many Youtubers whose videos helped me understand reflective injection.
  5. [Red Team Notes](https://ired.team) - mostly on the loader side
	6. Anyone and everyone who shall use this responsibly and without sharing with virustotal

Lets be ethical
> | Happy Hacking
