using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QuizGame;

namespace FrontOffice
{
    public partial class Quizz : System.Web.UI.Page
    {
        static Quiz _quiz = new Quiz();
        int _questionIndex = 0;

        int nbBonnesReponses = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Question.Text = _quiz.Questions[_questionIndex].Contenu;
                RadioButtonListReponses.DataSource = _quiz.Questions[_questionIndex].Reponses;
                RadioButtonListReponses.DataBind();
            }
        }

        protected void Page_Prerender(object sender, EventArgs e)
        {
            QuestionId.Text = string.Format("{0}", _questionIndex);
            QuestionTotal.Text = string.Format("{0}", _quiz.Questions.Count);
        }

        protected void NextButtonClick(object sender, EventArgs e)
        {
            // validation
            string l_id = RadioButtonListReponses.SelectedValue;

            if (string.IsNullOrEmpty(l_id))
            {
                Erreur.Text = "Veuillez sélectionner une réponse";
                return;
            }
            else
            {
                Erreur.Text = string.Empty;
            }

            if (l_id.Equals(_quiz.Questions[_questionIndex].ReponseCorrecte.Id.ToString()))
            {
                nbBonnesReponses++;
            }

            // Question suivante
            _questionIndex++;

            if (_questionIndex == _quiz.Questions.Count)
            {
                // terminé
                Next.Visible = false;

                if (nbBonnesReponses > 10)
                {
                    Summary.Text = "Bravo ! Vous avez remporté 2 ecoins !";
                }
                else
                {
                    Summary.Text = "Retentez votre chance ! Vous ferez mieux la prochaine fois !";
                }
            }
            else
            {
                Question.Text = _quiz.Questions[_questionIndex].Contenu;
                RadioButtonListReponses.DataSource = _quiz.Questions[_questionIndex].Reponses;
                RadioButtonListReponses.DataBind();
            }
        }
    }
}