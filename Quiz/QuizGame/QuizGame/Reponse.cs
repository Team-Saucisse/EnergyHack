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

		// override object.Equals
		public override bool Equals(object obj)
		{
			if (obj == null || GetType() != obj.GetType())
			{
				return false;
			}

			return (obj as Reponse).Id == Id;
		}

		// override object.GetHashCode
		public override int GetHashCode()
		{
			return Id.GetHashCode();
		}
	}
}