// dllmain.cpp : Defines the entry point for the DLL application.
#include "pch.h"
#pragma warning(disable : 4996)

extern "C" __declspec(dllexport) int TestMultuplyBy10(int a);
extern "C" __declspec(dllexport) int TestCallbackWithInt(int a, int (*fnint)(int b));
extern "C" __declspec(dllexport) const char *TestCallbackWithString(const char *(*fnstring)(const char* inputToPharoString));

__declspec(dllexport) int TestMultuplyBy10(int a) {
    return a * 10;
}

__declspec(dllexport) int TestCallbackWithInt(int inputFromPharo, int (*callPharoInt)(int inputToPharoInt)) {
    int result = callPharoInt(inputFromPharo);
    result = result + result; 
    return result;
}

__declspec(dllexport) const char *TestCallbackWithString(const char *inputFromPharo, const char *(*callPharoString)(const char *inputToPharoString)) {
    const char *result = callPharoString(inputFromPharo); 

    size_t bufferSize = strlen(result) * 2 + 1;
    char *concatString = new char[bufferSize];

    strcpy(concatString, result);
    strcat(concatString, result);

    return concatString;
}


BOOL APIENTRY DllMain( HMODULE hModule,
                       DWORD  ul_reason_for_call,
                       LPVOID lpReserved
                     )
{
    switch (ul_reason_for_call)
    {
    case DLL_PROCESS_ATTACH: 
    case DLL_THREAD_ATTACH: 
    case DLL_THREAD_DETACH:
    case DLL_PROCESS_DETACH:
        break;
    }
    return TRUE;
}

