project('global.goodvibes.goodvibes', 'vala', 'c', version: '0.1.0')

add_project_arguments([
    '-DGETTEXT_PACKAGE="@0@"'.format(meson.project_name())
    ],
    language: 'c',
)

gnome = import('gnome')
i18n = import('i18n')

glib_dep = dependency('glib-2.0', version: '>=2.48.2')
gio_unix_dep = dependency('gio-unix-2.0', version: '>=2.48.2')
gee_dep = dependency('gee-0.8', version: '>=0.18.0')
gtk_dep = dependency('gtk+-3.0', version: '>=3.18.9')
granite_dep = dependency('granite')
soup_dep = dependency('libsoup-2.4', version: '>=2.52.2')
json_glib_dep = dependency('json-glib-1.0', version: '>=1.1.2')
pango_dep = dependency('pango', version: '>=1.38.1')

dependencies = [
    glib_dep,
    gio_unix_dep,
    gee_dep,
    gtk_dep,
    granite_dep,
    soup_dep,
    json_glib_dep,
    pango_dep,
]

code_resources = gnome.compile_resources(
    'code=resources', 'data/' + meson.project_name() + '.gresource.xml',
    source_dir: 'data'
)

subdir('data')
subdir('src')
subdir('po')

meson.add_install_script('meson/post_install.py')
