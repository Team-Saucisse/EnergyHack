using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuizGame
{
	public class Reponse
	{
		public Guid Id { get; set; }

		public string Contenu { get; set; }

		public Question Question { get; set; }
	}
}