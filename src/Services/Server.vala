namespace GoodVibes {

    public errordomain NullStringError {
        CODE_1A
    }

    class Vibe : Object {
        public string _id { set; get; default = ""; }
        public string vibe { set; get; default = ""; }
        public string lang { set; get; default = ""; }
        public int strikes { set; get; default = 0; }

        public Vibe () {

        }

        public delegate void VibeCallback (Vibe vibe);

        public static Vibe from_json (string? json) {
            Vibe vibe = null;
            try {
                if (json == null) {
                    throw new NullStringError.CODE_1A ("Null String");
                }
                var vibe_node = Json.from_string (json);
                vibe = (Vibe) Json.gobject_deserialize (typeof (Vibe), vibe_node);
            } catch (Error e) {
                vibe = new Vibe ();
            }
            return vibe;
        }

        public static void random_from_server (VibeCallback cb) {
            var sess = new Soup.Session ();
            var uri = new StringBuilder ();
            uri.append (GoodVibes.settings.server);
            uri.append ("/v1/en/get_vibe");
            var msg = Soup.Form.request_new ("GET", uri.str);
            sess.queue_message (msg, (sess, msg) => {
                    cb (Vibe.from_json ((string) msg.response_body.data));
                });
        }
    }
}
