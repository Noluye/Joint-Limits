#pragma once
extern "C"
{
#include "raylib.h"
#include "raymath.h"
#include "raygui.h"
}

#if defined(PLATFORM_WEB)
#include <emscripten/emscripten.h>
#endif

#include <initializer_list>
#include <vector>
#include <functional>

#include "common.h"
