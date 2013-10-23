using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Web;
using System.ServiceModel.Web;

// NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service" in code, svc and config file together.
public class Service : IService
{
	public void DoWork()
	{
	}
        
        private readonly HttpContext context;
        public Service()
        {
            context = HttpContext.Current;
        }

    [WebInvoke(Method = "POST",
 BodyStyle = WebMessageBodyStyle.Wrapped,
 ResponseFormat = WebMessageFormat.Json)]
        public bool Play(string sName, string sGame, int sPoint, string sValue)
        {
            try
            {
                List<Games> StoredGames = null;
                Games Game = new Games(sGame);
                bool isFirstPlay = true;
                int index = 0;

                if (context.Session["GamesPlayed"] != null)
                {
                    StoredGames = (List<Games>)context.Session["GamesPlayed"];
                }
                else
                    StoredGames = new List<Games>();


                foreach (Games item in StoredGames)
                {
                    if (item.NameOfGame.Trim().ToLower() == sName.Trim().ToLower())
                    {
                        // Plays Play = new Plays();

                        Game.PlayerName1 = item.PlayerName1;
                        Game.PlayerName2 = item.PlayerName2;
                        Game.PlayerTurn = item.PlayerTurn;
                        Game.Plays = item.Plays;
                        isFirstPlay = false;
                        break;
                    }
                    index++;
                }

                if (isFirstPlay)
                {
                    Game.PlayerName1 = sName;
                    Game.PlayerName2 = "";
                    Game.PlayerTurn = "";
                    Game.Plays =new List<Plays>();
                    Game.Plays.Add(new Plays(sPoint, sValue));

                    StoredGames.Add(Game);

                }
                else
                {
                    if (Game.PlayerTurn == Game.PlayerName1)
                        Game.PlayerTurn = Game.PlayerName2;
                    else
                        Game.PlayerTurn = Game.PlayerName1;

                    Game.Plays.Add(new Plays(sPoint, sValue));
                    StoredGames[index] = Game;

                    

                }
                context.Session["GamesPlayed"] = StoredGames;

                return true;

            }
            catch { return false; }

        }

    [WebInvoke(Method = "GET",
 BodyStyle = WebMessageBodyStyle.Wrapped,
 ResponseFormat = WebMessageFormat.Json)]
        public Games GetLatestMove(string sName, string sGame)
        {
            Games Game = new Games(sGame);
           // List<Plays> Plays = new List<Plays>();

            if (context.Session["GamesPlayed"] != null)
            {
                List<Games> StoredGames = (List<Games>)context.Session["GamesPlayed"];
                foreach (Games item in StoredGames)
                {
                    if (item.NameOfGame.Trim().ToLower() == sName.Trim().ToLower())
                    {
                        // Plays Play = new Plays();

                        Game.PlayerName1 = item.PlayerName1;
                        Game.PlayerName2 = item.PlayerName2;
                        Game.PlayerTurn = item.PlayerTurn;
                        Game.Plays = item.Plays;
                        break;
                    }
                }
            }

            return Game;

        }
}
