namespace GoodVibes.Widgets {
    class GoodVibesReceiver : Gtk.ScrolledWindow {

        public Gtk.Button good_vibe_button { get; private set; default = new Gtk.Button (); }
        public Gtk.Label good_vibe_label { get; private set; default = new Gtk.Label (""); }
        public Gtk.Menu good_vibe_context_menu { get; private set; default = new Gtk.Menu (); }
        public weak GoodVibes.MainWindow window { get; construct; }

        public GoodVibesReceiver (GoodVibes.MainWindow window) {
            Object (
                window: window
            );
        }

        construct {
            var view = new Gtk.Viewport (null, null);
            view.set_size_request (700, 500);
            add (view);
            view.add (good_vibe_button);
            good_vibe_button.set_relief (Gtk.ReliefStyle.NONE);
            var good_vibe_context = good_vibe_button.get_style_context ();
            good_vibe_context.add_class ("good-vibe");
            good_vibe_button.add (good_vibe_label);

            var good_vibe_copy = new Gtk.MenuItem.with_label (_("Copy"));
            good_vibe_context_menu.append (good_vibe_copy);
            good_vibe_context_menu.show_all ();

            good_vibe_copy.activate.connect (() => {
                var display = window.get_display ();
                var clipboard = Gtk.Clipboard.get_for_display (display, Gdk.SELECTION_CLIPBOARD);
                clipboard.set_text (good_vibe_label.label, -1);
            });

            button_press_event.connect ((event) => {
                if (event.type == Gdk.EventType.BUTTON_PRESS && event.button == 3) {
                    good_vibe_context_menu.popup (null, null, null, event.button, event.time);
                }
            });
            good_vibe_label.label = GoodVibes.Services.Vibe.from_saved_state ().vibe;
            var good_vibe_label_context = good_vibe_button.get_style_context ();
            good_vibe_label_context.add_class ("good-vibe");
            good_vibe_label.max_width_chars = 39;
            good_vibe_label.wrap = true;
            good_vibe_label.wrap_mode = Pango.WrapMode.WORD;


            good_vibe_button.clicked.connect (() => {
                GoodVibes.Services.Vibe.random_from_server ((vibe) => {
                    good_vibe_label.label = vibe.vibe;
                });
            });
        }
    }
}
