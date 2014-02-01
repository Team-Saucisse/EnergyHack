using System; 
using System.Windows;
using System.Web.Script.Serialization;
using TheSaucisseFactory.Camel.Model;
using TheSaucisseFactory.Camel.Helper;
using TheSaucisseFactory.Camel;
using System.Threading;

namespace TheSaucisseFactory.Ecoinizer
{
	/// <summary>
	/// Interaction logic for MainWindow.xaml
	/// </summary>
	public partial class MainWindow : Window
	{
		public MainWindow()
		{
			InitializeComponent();
		}

		private void RunImport()
		{
			ImportMecanism import = new ImportMecanism(this);
			import.Run();
		}

        /// <summary>
        /// Synchronisation Camel
        /// </summary>
        private void OnSynchronizeClick(object sender, RoutedEventArgs e)
        {
            ThreadStart ts = new ThreadStart(RunImport);
            Thread thread = new Thread(ts);
            thread.Start();
        }

        /// <summary>
        /// Calcul des EnergyCoin
        /// </summary>
        private void OnProcessClick(object sender, RoutedEventArgs e) 
        {
            Ecoinizer.EnergyCoinEngine l_engine = new EnergyCoinEngine();
            l_engine.Save();
        }
	}
}
