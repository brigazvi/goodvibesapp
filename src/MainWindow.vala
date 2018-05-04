namespace GoodVibes {
    public class MainWindow : Gtk.Window {
        public weak GoodVibes.Application app { get; construct; }

        public MainWindow (GoodVibes.Application goodvibesapp) {
            Object (
                application: goodvibesapp,
                app: goodvibesapp,
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
            set_size_request (650, 500);
            set_resizable (false);


            var good_vibe = new GoodVibes.Widgets.GoodVibesReceiver (this);
            var new_vibe = new GoodVibes.Widgets.GoodVibesSender (this);

            var header = new GoodVibes.Widgets.StackHeaderBar (this, good_vibe, new_vibe);
            set_titlebar (header);

            add (header.stack);

            //header.stack.set_visible_child_name ("button2");

            var style_context = get_style_context ();
            style_context.add_class ("flat");
            style_context.add_class ("good-vibe-window");

            show_all ();

            // It goes here until I can figure out how to make it not visible from within the stackheaderbar class
            header.send_button.set_visible (false);
        }

    }
}
