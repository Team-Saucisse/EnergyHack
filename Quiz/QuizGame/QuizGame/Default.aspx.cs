using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuizGame
{
	public partial class _Default : System.Web.UI.Page
	{
		static Quiz _quiz = new Quiz();
		static int _questionIndex = 0;

		protected void Page_Load(object sender, EventArgs e)
		{
			Question.Text = _quiz.Questions[_questionIndex].Contenu;
			Reponses.DataSource = _quiz.Questions[_questionIndex].Reponses;
			Reponses.DataBind();
		}

		protected void ResponseOnItemDataBound(object sender, RepeaterItemEventArgs e)
		{
			if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
			{
				Label label = (Label)e.Item.FindControl("ContenuRep");
				label.Text = (e.Item.DataItem as Reponse).Contenu;
			}
		}

		protected void NextButtonClick(object sender, EventArgs e)
		{
			_questionIndex++;

			Question.Text = _quiz.Questions[_questionIndex].Contenu;
			Reponses.DataSource = _quiz.Questions[_questionIndex].Reponses;
			Reponses.DataBind();
		}
	}
}
