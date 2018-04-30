conf_data = configuration_data()
conf_data.set_quoted('PROJECT_NAME', meson.project_name())
conf_data.set_quoted('GETTEXT_PACKAGE', meson.project_name())
conf_data.set_quoted('VERSION', meson.project_version())
conf_data.set_quoted('PREFIX', get_option('prefix'))
config_header = configure_file(
    input : 'config.vala.in',
    output : 'config.vala',
    configuration : conf_data
)

code_files = files(
    'Application.vala',
    'MainWindow.vala',
    'Services/Settings.vala',
    'Services/Server.vala',
    'Widgets/StackHeaderBar.vala',
    'Widgets/GoodVibesReceiver.vala'
)

executable(
    meson.project_name(),
    code_files,
    code_resources,
    config_header,
    dependencies: dependencies,
    install: true
)
