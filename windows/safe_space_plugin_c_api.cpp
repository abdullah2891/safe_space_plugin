#include "include/safe_space_plugin/safe_space_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "safe_space_plugin.h"

void SafeSpacePluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  safe_space_plugin::SafeSpacePlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
