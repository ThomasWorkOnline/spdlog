project "spdlog"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "Off"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"src/**.cpp"
	}

	includedirs
	{
		"include"
	}

	defines
	{
		"SPDLOG_COMPILED_LIB"
	}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		runtime "Release"
		optimize "On"
		symbols "Off"

		flags
		{
			"LinkTimeOptimization"
		}

	filter "configurations:Dist"
		runtime "Release"
		optimize "On"
		symbols "Off"

		flags
		{
			"LinkTimeOptimization"
		}
