namespace GoodVibes.Widgets {
    class StackHeaderBar : Gtk.HeaderBar {

        public weak GoodVibes.Widgets.GoodVibesReceiver good_vibe { get; construct; }
        public Gtk.Button report;

        private Gtk.Stack _stack;
        public Gtk.Stack stack { get {
                return _stack;
            } }

        public StackHeaderBar (GoodVibes.Widgets.GoodVibesReceiver good_vibe) {
            Object (
                good_vibe: good_vibe
            );
        }

        construct {
            set_show_close_button (true);
            _stack = new Gtk.Stack ();
            _stack.set_transition_type (Gtk.StackTransitionType.SLIDE_LEFT_RIGHT);
            var stack_switcher = new Gtk.StackSwitcher ();
            stack_switcher.set_stack (_stack);
            set_custom_title (stack_switcher);

            var label = new Gtk.Label ("test");

            _stack.add_titled (good_vibe, "good_vibe", "Receive");
            _stack.add_titled (label, "send_vibe", "Send");

            good_vibe.clicked.connect (() => {
                GoodVibes.Vibe.random_from_server ((vibe) => {
                        good_vibe.label= vibe.vibe;
                    });
            });

            report = new Gtk.Button.from_icon_name ("dialog-error-symbolic");
            report.tooltip_text = "Report Vibe";

            pack_end (report);

            _stack.add_titled (good_vibe, "good_vibe", "Receive");

            var style_context = get_style_context ();
            style_context.add_class ("default-decoration");
            style_context.add_class (Gtk.STYLE_CLASS_FLAT);

            _stack.notify["visible-child"].connect (() => {
                stack_change ();
            });
        }

        public void stack_change () {
            if (_stack.get_visible_child_name () == "good_vibe") {
                report.set_visible (true);
            } else {
                report.set_visible (false);
            }
        }
    }
}
