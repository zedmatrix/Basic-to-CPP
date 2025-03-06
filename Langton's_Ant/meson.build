# qbasic_to_cpp23/meson.build

project('langtons_ant', 'cpp',
  version : '0.1',
  default_options : ['cpp_std=c++23']
)

dependency_sfml = [
  dependency('sfml-graphics', method: 'pkg-config'),
  dependency('sfml-window', method: 'pkg-config'),
  dependency('sfml-system', method: 'pkg-config')
]

executable('langtons_ant', 'langtons_ant.cpp',
  dependencies : dependency_sfml
)
