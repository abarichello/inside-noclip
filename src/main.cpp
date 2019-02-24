#pragma once

#include <iostream>
#include <string>
#include <windows.h>

#include "address.h"

LPCSTR windowName = "INSIDE";

int main(int argc, char* argv[]) {
    HWND window = FindWindowA(NULL, windowName);
    if (window == NULL) {
        std::cout << "Could not find window named: " << windowName << std::endl;
        exit(-1);
    }

    DWORD pID;
    GetWindowThreadProcessId(window, &pID);
    std::cout << "Opening " << windowName << " with process id: " << (unsigned int)pID;

    HANDLE process = OpenProcess(PROCESS_ALL_ACCESS, false, pID);
    float value;
    ReadProcessMemory(process, (PBYTE*)Address::cameraYRotation, &value, sizeof(value), 0);
    std::cout << "CameraYRotation: " << value;
    return 0;
}
