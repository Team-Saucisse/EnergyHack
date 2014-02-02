using System;
using System.Collections.Generic;

namespace QuizGame
{
	public class Quiz
	{
		public List<Question> Questions = new List<Question>();

		public Quiz()
		{
			Question question = new Question();
			question.Id = Guid.NewGuid();
			question.Contenu = "Une ampoule à économie d’énergie dure jusqu’à"; //!!

			question.Reponses = new List<Reponse>(4);

			Reponse reponse = new Reponse();
			reponse.Id = Guid.NewGuid();
			reponse.Question = question;
			reponse.Contenu = "2 fois plus longtemps qu’une ampoule classique"; //!!
			question.Reponses.Add(reponse);

			reponse = new Reponse();
			reponse.Id = Guid.NewGuid();
			reponse.Question = question;
			reponse.Contenu = "5 fois"; //!!
			question.Reponses.Add(reponse);

			reponse = new Reponse();
			reponse.Id = Guid.NewGuid();
			reponse.Question = question;
			reponse.Contenu = "10 fois"; //!!
			question.Reponses.Add(reponse);

			question.ReponseCorrecte = reponse; // à mettre juste après la création de la bonne réponse

			Questions.Add(question);
			// fin à reprendre

			// début à repndre
			question = new Question();
			question.Id = Guid.NewGuid();
			question.Contenu = "Il vaut mieux ouvrir la fenêtre que de baisser le chauffage"; //!!

			question.Reponses = new List<Reponse>(4);

			reponse = new Reponse();
			reponse.Id = Guid.NewGuid();
			reponse.Question = question;
			reponse.Contenu = "Vrai"; //!!
			question.Reponses.Add(reponse);

			reponse = new Reponse();
			reponse.Id = Guid.NewGuid();
			reponse.Question = question;
			reponse.Contenu = "Faux"; //!!
			question.Reponses.Add(reponse);

			question.ReponseCorrecte = reponse; // à mettre juste après la création de la bonne réponse

			Questions.Add(question);
			// fin à reprendre

			// début à reprendre
			question = new Question();
			question.Id = Guid.NewGuid();
			question.Contenu = "Pour décongeler des aliments quel est le moyen le plus économique?"; //!!

			question.Reponses = new List<Reponse>(4);

			reponse = new Reponse();
			reponse.Id = Guid.NewGuid();
			reponse.Question = question;
			reponse.Contenu = "Passer l’aliment congelé au micro-ondes"; //!!
			question.Reponses.Add(reponse);

			reponse = new Reponse();
			reponse.Id = Guid.NewGuid();
			reponse.Question = question;
			reponse.Contenu = "Placer l’aliment dans le réfrigérateur"; //!!
			question.Reponses.Add(reponse);

			question.ReponseCorrecte = reponse; // à mettre juste après la création de la bonne réponse

			Questions.Add(question);
			// fin à reprendre

			// début à repndre
			question = new Question();
			question.Id = Guid.NewGuid();
			question.Contenu = "Pour des économies d’eau, faut-il préférer"; //!!

			question.Reponses = new List<Reponse>(4);

			reponse = new Reponse();
			reponse.Id = Guid.NewGuid();
			reponse.Question = question;
			reponse.Contenu = "La douche"; //!!
			question.Reponses.Add(reponse);

			question.ReponseCorrecte = reponse; // à mettre juste après la création de la bonne réponse

			reponse = new Reponse();
			reponse.Id = Guid.NewGuid();
			reponse.Question = question;
			reponse.Contenu = "Le bain"; //!!
			question.Reponses.Add(reponse);

			Questions.Add(question);
			// fin à reprendre

			// début à repndre
			question = new Question();
			question.Id = Guid.NewGuid();
			question.Contenu = "Pour diminuer ma facture de chauffage de 7%, je dois diminuer ma température de "; //!!

			question.Reponses = new List<Reponse>(4);

			reponse = new Reponse();
			reponse.Id = Guid.NewGuid();
			reponse.Question = question;
			reponse.Contenu = "1°C"; //!!
			question.Reponses.Add(reponse);

			question.ReponseCorrecte = reponse; // à mettre juste après la création de la bonne réponse

			reponse = new Reponse();
			reponse.Id = Guid.NewGuid();
			reponse.Question = question;
			reponse.Contenu = "2°C"; //!!
			question.Reponses.Add(reponse);

			reponse = new Reponse();
			reponse.Id = Guid.NewGuid();
			reponse.Question = question;
			reponse.Contenu = "3°C"; //!!
			question.Reponses.Add(reponse);

			Questions.Add(question);
			// fin à reprendre

			// début à repndre
			question = new Question();
			question.Id = Guid.NewGuid();
			question.Contenu = "Pendant l’aération d’une pièce, il faut"; //!!

			question.Reponses = new List<Reponse>(4);

			reponse = new Reponse();
			reponse.Id = Guid.NewGuid();
			reponse.Question = question;
			reponse.Contenu = "Couper le chauffage"; //!!
			question.Reponses.Add(reponse);

			question.ReponseCorrecte = reponse; // à mettre juste après la création de la bonne réponse

			reponse = new Reponse();
			reponse.Id = Guid.NewGuid();
			reponse.Question = question;
			reponse.Contenu = "Augmenter le chauffage"; //!!
			question.Reponses.Add(reponse);

			Questions.Add(question);
			// fin à reprendre

			// début à repndre
			question = new Question();
			question.Id = Guid.NewGuid();
			question.Contenu = "Que peut-on fermer la nuit pour se protéger du froid et utiliser moins de chauffage : "; //!!

			question.Reponses = new List<Reponse>(4);

			reponse = new Reponse();
			reponse.Id = Guid.NewGuid();
			reponse.Question = question;
			reponse.Contenu = "Les volets"; //!!
			question.Reponses.Add(reponse);

			reponse = new Reponse();
			reponse.Id = Guid.NewGuid();
			reponse.Question = question;
			reponse.Contenu = "Les rideaux"; //!!
			question.Reponses.Add(reponse);

			reponse = new Reponse();
			reponse.Id = Guid.NewGuid();
			reponse.Question = question;
			reponse.Contenu = "Les volets et les rideaux"; //!!
			question.Reponses.Add(reponse);

			question.ReponseCorrecte = reponse; // à mettre juste après la création de la bonne réponse

			Questions.Add(question);
			// fin à reprendre

			// début à repndre
			question = new Question();
			question.Id = Guid.NewGuid();
			question.Contenu = "Dans l’habitat, le poste le plus gourmand en électricité est"; //!!

			question.Reponses = new List<Reponse>(4);

			reponse = new Reponse();
			reponse.Id = Guid.NewGuid();
			reponse.Question = question;
			reponse.Contenu = "Réfrigérateur/congélateur"; //!!
			question.Reponses.Add(reponse);

			question.ReponseCorrecte = reponse; // à mettre juste après la création de la bonne réponse

			reponse = new Reponse();
			reponse.Id = Guid.NewGuid();
			reponse.Question = question;
			reponse.Contenu = "Eclairage"; //!!
			question.Reponses.Add(reponse);

			reponse = new Reponse();
			reponse.Id = Guid.NewGuid();
			reponse.Question = question;
			reponse.Contenu = "Lave-Linge"; //!!
			question.Reponses.Add(reponse);

			Questions.Add(question);
			// fin à reprendre

			// début à repndre
			question = new Question();
			question.Id = Guid.NewGuid();
			question.Contenu = "A partir de 4cm de givre, la consommation du congélateur"; //!!

			question.Reponses = new List<Reponse>(4);

			reponse = new Reponse();
			reponse.Id = Guid.NewGuid();
			reponse.Question = question;
			reponse.Contenu = "Double"; //!!
			question.Reponses.Add(reponse);

			question.ReponseCorrecte = reponse; // à mettre juste après la création de la bonne réponse

			reponse = new Reponse();
			reponse.Id = Guid.NewGuid();
			reponse.Question = question;
			reponse.Contenu = "Triple"; //!!
			question.Reponses.Add(reponse);

			reponse = new Reponse();
			reponse.Id = Guid.NewGuid();
			reponse.Question = question;
			reponse.Contenu = "Quadruple"; //!!
			question.Reponses.Add(reponse);

			Questions.Add(question);
			// fin à reprendre

			// début à repndre
			question = new Question();
			question.Id = Guid.NewGuid();
			question.Contenu = "Mettre un couvercle sur une casserole permet de chauffer les aliments plus vite"; //!!

			question.Reponses = new List<Reponse>(4);

			reponse = new Reponse();
			reponse.Id = Guid.NewGuid();
			reponse.Question = question;
			reponse.Contenu = "Vrai"; //!!
			question.Reponses.Add(reponse);

			question.ReponseCorrecte = reponse; // à mettre juste après la création de la bonne réponse

			reponse = new Reponse();
			reponse.Id = Guid.NewGuid();
			reponse.Question = question;
			reponse.Contenu = "Faux"; //!!
			question.Reponses.Add(reponse);

			Questions.Add(question);
			// fin à reprendre

			// début à repndre
			question = new Question();
			question.Id = Guid.NewGuid();
			question.Contenu = "On peut éteindre son four 5 minutes avant la fin de la cuisson et utiliser la chaleur résiduelle"; //!!

			question.Reponses = new List<Reponse>(4);

			reponse = new Reponse();
			reponse.Id = Guid.NewGuid();
			reponse.Question = question;
			reponse.Contenu = "Vrai"; //!!
			question.Reponses.Add(reponse);

			question.ReponseCorrecte = reponse; // à mettre juste après la création de la bonne réponse

			reponse = new Reponse();
			reponse.Id = Guid.NewGuid();
			reponse.Question = question;
			reponse.Contenu = "Faux"; //!!
			question.Reponses.Add(reponse);

			Questions.Add(question);
			// fin à reprendre

			// début à repndre
			question = new Question();
			question.Id = Guid.NewGuid();
			question.Contenu = "Laisser ses appareils en veille plutôt que de les éteindre économise l’énergie"; //!!

			question.Reponses = new List<Reponse>(4);

			reponse = new Reponse();
			reponse.Id = Guid.NewGuid();
			reponse.Question = question;
			reponse.Contenu = "Vrai"; //!!
			question.Reponses.Add(reponse);

			reponse = new Reponse();
			reponse.Id = Guid.NewGuid();
			reponse.Question = question;
			reponse.Contenu = "Faux"; //!!
			question.Reponses.Add(reponse);

			question.ReponseCorrecte = reponse; // à mettre juste après la création de la bonne réponse

			Questions.Add(question);
			// fin à reprendre

			// début à repndre
			question = new Question();
			question.Id = Guid.NewGuid();
			question.Contenu = "Quel est le poids moyen de l’éclairage sur votre facture d’électricité ?"; //!!

			question.Reponses = new List<Reponse>(4);

			reponse = new Reponse();
			reponse.Id = Guid.NewGuid();
			reponse.Question = question;
			reponse.Contenu = "5%"; //!!
			question.Reponses.Add(reponse);

			reponse = new Reponse();
			reponse.Id = Guid.NewGuid();
			reponse.Question = question;
			reponse.Contenu = "10%"; //!!
			question.Reponses.Add(reponse);

			reponse = new Reponse();
			reponse.Id = Guid.NewGuid();
			reponse.Question = question;
			reponse.Contenu = "15%"; //!!
			question.Reponses.Add(reponse);

			question.ReponseCorrecte = reponse; // à mettre juste après la création de la bonne réponse

			Questions.Add(question);
			// fin à reprendre

			// début à repndre
			question = new Question();
			question.Id = Guid.NewGuid();
			question.Contenu = " Un cycle de lave linge à 40° consomme combien de fois moins d’énergie qu’un cycle à 90° ?"; //!!

			question.Reponses = new List<Reponse>(4);

			reponse = new Reponse();
			reponse.Id = Guid.NewGuid();
			reponse.Question = question;
			reponse.Contenu = "2 fois"; //!!
			question.Reponses.Add(reponse);

			reponse = new Reponse();
			reponse.Id = Guid.NewGuid();
			reponse.Question = question;
			reponse.Contenu = "3 fois"; //!!
			question.Reponses.Add(reponse);

			question.ReponseCorrecte = reponse; // à mettre juste après la création de la bonne réponse

			reponse = new Reponse();
			reponse.Id = Guid.NewGuid();
			reponse.Question = question;
			reponse.Contenu = "5 fois"; //!!
			question.Reponses.Add(reponse);

			Questions.Add(question);
			// fin à reprendre
		}
	}
}