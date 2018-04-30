namespace GoodVibes.Services {

    public class SavedState : Granite.Services.Settings {

        public string lastvibe { set; get; }

        public SavedState () {
            base (Constants.PROJECT_NAME + ".saved-state");
        }
    }

    public class Settings : Granite.Services.Settings {

        public string server { set; get; }

        public Settings () {
            base (Constants.PROJECT_NAME + ".settings");
        }
    }
}
