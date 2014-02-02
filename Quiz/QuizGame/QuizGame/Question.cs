using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuizGame
{
	public class Question
	{
		public Guid Id { get; set; }

		public string Contenu { get; set; }

		public List<Reponse> Reponses { get; set; }

		public Reponse ReponseCorrecte { get; set; }
	}
}