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

            //Hacky but works for now
            var label = new Gtk.Label ("Write your story, send some good vibes\nto others!");

            new_vibe_text_view.add (label);
            var label_context = label.get_style_context ();
            label_context.add_class ("new-vibe");
            label_context.add_class ("new-vibe-placeholder");

            new_vibe_text_view.key_press_event.connect ((event) => {
                if (event.str != "" && event.str != "\b") {
                    label.visible = false;
                }
                return false;
            });

            new_vibe_text_view.key_release_event.connect (() => {
                if (new_vibe_text_view.buffer.text == "") {
                    label.visible = true;
                } else {
                    label.visible = false;
                }
                return false;
            });
        }
    }
}
