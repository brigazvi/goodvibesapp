namespace GoodVibes {
    public class MainWindow : Gtk.Window {
        public weak GoodVibes.Application app { get; construct; }

        public MainWindow (GoodVibes.Application goodvibes_app) {
            Object (
                application: goodvibes_app,
                app: goodvibes_app,
                title: _("GoodVibes")
            );
        }

        static construct {
            var provider = new Gtk.CssProvider ();
            provider.load_from_resource ("global/goodvibes/goodvibes/Application.css");
            Gtk.StyleContext.add_provider_for_screen (Gdk.Screen.get_default (), provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);
        }

        construct {
            init_layout ();
        }

        private void init_layout () {
            set_default_size (600, 400);

            show_all ();
        }

    }
}
