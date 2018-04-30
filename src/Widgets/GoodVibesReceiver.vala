namespace GoodVibes.Widgets {
    class GoodVibesReceiver : Gtk.Button {

        public GoodVibesReceiver () {
            Object ();
        }

        construct {
            label = "Click me";
            set_relief (Gtk.ReliefStyle.NONE);
            var style_context = get_style_context ();
            style_context.add_class ("good-vibe");

        }
    }
}
