namespace GoodVibes.Widgets {
    class StackHeaderBar : Gtk.HeaderBar {

        public weak GoodVibes.MainWindow window { get; construct; }
        public weak GoodVibes.Widgets.GoodVibesReceiver good_vibe { get; construct; }

        private Gtk.Stack _stack;
        public Gtk.Stack stack { get {
                return _stack;
            } }

        public StackHeaderBar (GoodVibes.MainWindow window, GoodVibes.Widgets.GoodVibesReceiver good_vibe) {
            Object (
                window: window,
                good_vibe: good_vibe,
                show_close_button: true,
                has_subtitle: false
            );
        }

        construct {
            _stack = new Gtk.Stack ();
            _stack.set_transition_type (Gtk.StackTransitionType.SLIDE_LEFT_RIGHT);
            var stack_switcher = new Gtk.StackSwitcher ();
            stack_switcher.set_stack (_stack);
            set_custom_title (stack_switcher);
            var stack_switcher_context = stack_switcher.get_style_context ();
            stack_switcher_context.add_class ("stack");

            var label = new Gtk.Label ("test");

            _stack.add_titled (good_vibe, "good_vibe", "Receive");
            _stack.add_titled (label, "send_vibe", "Send");

            _stack.add_titled (good_vibe, "good_vibe", "Receive");

            var style_context = get_style_context ();
            style_context.add_class ("default-decoration");
            style_context.add_class (Gtk.STYLE_CLASS_FLAT);
            style_context.add_class ("good-vibe-window");
        }
    }
}
