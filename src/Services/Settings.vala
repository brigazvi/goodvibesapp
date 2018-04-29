namespace GoodVibes {

    public class Settings : Granite.Services.Settings {

        public string server { set; get; }

        public Settings () {
            base (Constants.PROJECT_NAME + ".settings");
        }
    }
}
