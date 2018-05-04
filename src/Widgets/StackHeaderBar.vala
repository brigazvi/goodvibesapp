namespace GoodVibes.Widgets {
    class StackHeaderBar : Gtk.HeaderBar {

        public weak GoodVibes.MainWindow window { get; construct; }
        public weak GoodVibes.Widgets.GoodVibesReceiver good_vibe { get; construct; }
        public weak GoodVibes.Widgets.GoodVibesSender new_vibe { get; construct; }
        public Gtk.Button send_button { get; private set; default = new Gtk.Button.with_label (_("Send")); }

        private Gtk.Stack _stack;
        public Gtk.Stack stack { get {
                return _stack;
            } }

        public StackHeaderBar (GoodVibes.MainWindow window,
                GoodVibes.Widgets.GoodVibesReceiver good_vibe,
                GoodVibes.Widgets.GoodVibesSender new_vibe) {
            Object (
                window: window,
                good_vibe: good_vibe,
                new_vibe: new_vibe,
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

            pack_end (send_button);
            var send_button_context = send_button.get_style_context ();
            send_button_context.add_class ("send_button");
            send_button.clicked.connect (() => {
                var vibe = new GoodVibes.Services.Vibe ();
                vibe.vibe = new_vibe.new_vibe_text_view.buffer.text;
                vibe.send_vibe_to_server (new_vibe);
            });

            _stack.add_titled (good_vibe, "good_vibe", _("Receive"));
            _stack.add_titled (new_vibe, "send_vibe", _("Send"));

            var style_context = get_style_context ();
            style_context.add_class ("default-decoration");
            style_context.add_class (Gtk.STYLE_CLASS_FLAT);
            style_context.add_class ("good-vibe-window");
            _stack.notify["visible-child"].connect (() => {
                stack_change ();
            });
        }

        private void stack_change () {
            switch (_stack.get_visible_child_name ()) {
                case "good_vibe":
                    send_button.set_visible (false);
                    break;
                case "send_vibe":
                    send_button.set_visible (true);
                    break;
            }
        }
    }
}
