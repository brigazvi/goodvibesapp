namespace GoodVibes {
    //public SavedState saved_state;
    public Settings settings;

    public class Application : Granite.Application {
        public string app_cmd_name { get {return _app_cmd_name; } }
        private static string _app_cmd_name;

        construct {
            program_name = app_cmd_name;
            exec_name = Constants.PROJECT_NAME;
            app_launcher = exec_name = Constants.PROJECT_NAME + ".desktop";
            application_id = exec_name = Constants.PROJECT_NAME;
        }

        public Application () {
            Granite.Services.Logger.initialize ("GoodVibes");

            //saved_state = new SavedState ();
            settings = new Settings ();
        }

        public static Application _instance = null;

        public static Application instance {
            get {
                if(_instance == null) {
                    _instance = new Application ();
                }
                return _instance;
            }
        }

        protected override void activate () {
            var window = get_last_windows ();
            if (window == null) {
                window = this.new_window ();
                window.show ();
            } else {
                window.present ();
            }
        }

        public MainWindow? get_last_windows () {
            unowned List<weak Gtk.Window> windows = get_windows ();
            return windows.length () > 0 ? windows.last ().data as MainWindow : null;
        }

        public MainWindow new_window () {
            return new MainWindow (this);
        }

        public static int main (string[] args) {
            _app_cmd_name = "GoodVibes";
            Application app = Application.instance;
            return app.run (args);
        }
    }
}
