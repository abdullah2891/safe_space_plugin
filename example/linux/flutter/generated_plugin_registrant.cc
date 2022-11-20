//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <safe_space_plugin/safe_space_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) safe_space_plugin_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "SafeSpacePlugin");
  safe_space_plugin_register_with_registrar(safe_space_plugin_registrar);
}
