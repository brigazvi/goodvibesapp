namespace GoodVibes.Widgets {
    class GoodVibesReceiver : Gtk.ScrolledWindow {

        public Gtk.Button good_vibe_button { get; set; default = new Gtk.Button (); }

        public GoodVibesReceiver () {
        }

        construct {
            var view = new Gtk.Viewport (null, null);
            add (view);
            view.add (good_vibe_button);
            good_vibe_button.set_relief (Gtk.ReliefStyle.NONE);
            var good_vibe_context = good_vibe_button.get_style_context ();
            good_vibe_context.add_class ("good-vibe");
            good_vibe_button.label = GoodVibes.Services.Vibe.from_saved_state ().vibe;

            good_vibe_button.clicked.connect (() => {
                GoodVibes.Services.Vibe.random_from_server ((vibe) => {
                    good_vibe_button.label = vibe.vibe;
                });
            });
        }
    }
}
