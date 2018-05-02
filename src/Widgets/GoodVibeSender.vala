namespace GoodVibes.Widgets {
    class GoodVibesSender : Gtk.ScrolledWindow {

        public Gtk.TextView new_vibe_text_view { get; private set; default = new Gtk.TextView ();}
        public weak GoodVibes.MainWindow window { get; construct; }

        public GoodVibesSender (GoodVibes.MainWindow window) {
            Object (
                window: window
            );
        }

        construct {
            add (new_vibe_text_view);
            new_vibe_text_view.wrap_mode = Gtk.WrapMode.WORD;
            var new_vibe_text_view_context = new_vibe_text_view.get_style_context ();
            new_vibe_text_view_context.add_class ("new-vibe");
        }
    }
}
