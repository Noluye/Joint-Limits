workspace "JointLimits"
	configurations { "Debug", "Release", "Dist" }
	platforms "x64"
	architecture "x86_64"
	startproject "JointLimits"

	filter "configurations:Debug"
		defines { "DEBUG" }
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines { "NDEBUG" }
		runtime "Release"
		optimize "on"
		symbols "off"

	filter "configurations:Dist"
		defines { "NDEBUG" }
		runtime "Release"
		optimize "on"
		symbols "off"

	outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
	----------------------------------------------------------------
	-- Projects
	group "Dependencies"
		include "vendor/raylib"
	group ""

project "JointLimits"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++20"
	staticruntime "On"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	defines{ "_CRT_SECURE_NO_WARNINGS" }
	linkoptions { "-IGNORE:4099" }

	files { "src/**.c", "src/**.h", "src/**.cpp", "premake5.lua" }

	includedirs
	{
		"src",
		"vendor/raylib/src",
		"vendor/raylib/src/external/glfw/include",
		"vendor/raygui/src"
	}
	-------------------------------------------------------------------
	-- raylib
	links { "raylib" }

	filter "system:windows"
		systemversion "latest"
		libdirs {"vendor/raylib/bin/" .. outputdir .. "/raylib"}
		dependson { "raylib" }
		links { "raylib.lib" }
	-------------------------------------------------------------------