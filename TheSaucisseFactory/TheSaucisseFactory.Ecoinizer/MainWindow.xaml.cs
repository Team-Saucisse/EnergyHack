﻿using System; 
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
			MessageBoxResult l_result = MessageBox.Show("Etes-vous sur de réimporter ?", "Attention", MessageBoxButton.YesNo);

			if (l_result == MessageBoxResult.Yes)
			{
				ThreadStart ts = new ThreadStart(RunImport);
				Thread thread = new Thread(ts);
				thread.Start();
			}
        }

        /// <summary>
        /// Calcul des EnergyCoin
        /// </summary>
        private void OnProcessClick(object sender, RoutedEventArgs e) 
        {
			MessageBoxResult l_result = MessageBox.Show("RAZ des ecoins ?", "Attention", MessageBoxButton.YesNo);

			if (l_result == MessageBoxResult.Yes)
			{
				ThreadStart ts = new ThreadStart(RunEngin);
				Thread thread = new Thread(ts);
				thread.Start();
			}
        }

		private void RunEngin()
		{
			Ecoinizer.EnergyCoinEngine l_engine = new EnergyCoinEngine(this);
			l_engine.Save();
		}
	}
}
