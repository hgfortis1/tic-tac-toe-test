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
        
        //private readonly HttpContext context;
        //public Service()
        //{
        //   // context = HttpContext.Current;
        //}
    private static List<Games> StoredGames;// = new List<Games>()

    [WebInvoke(Method = "GET", UriTemplate = "Play?sName={sName}&sGame={sGame}&sPoint={sPoint}&sValue={sValue}",
 BodyStyle = WebMessageBodyStyle.Wrapped,
 ResponseFormat = WebMessageFormat.Json)]
        public bool Play(string sName, string sGame, int sPoint, string sValue)
        {
            try
            {
               // List<Games> StoredGames = null;
                Games Game = new Games(sGame);
                bool isFirstPlay = true;
                int index = 0;

                if (StoredGames == null)
                {
                    StoredGames = new List<Games>();
                }
                   


                foreach (Games item in StoredGames)
                {
                    if (item.NameOfGame != null)
                    {
                        if (item.NameOfGame.Trim().ToLower() == sGame.Trim().ToLower())
                        {
                            // Plays Play = new Plays();

                            Game.PlayerName1 = item.PlayerName1;
                            Game.PlayerName2 = item.PlayerName2;
                            Game.PlayerTurn = item.PlayerTurn;
                            Game.Plays = item.Plays;
                            Game.LastPlayed = item.LastPlayed;
                            isFirstPlay = false;
                            break;
                        }
                    }
                    index++;
                }

                if (isFirstPlay)
                {
                    Game.PlayerName1 = sName;
                    Game.PlayerName2 = "";
                    Game.PlayerTurn = "";
                    Game.Plays = new List<Plays>();
                    Game.Plays.Add(new Plays(sPoint, sValue));
                   // Game.Plays.Add(new Plays(sPoint, sValue));
                    Game.LastPlayed = sValue;
                    StoredGames.Add(Game);

                }
                else
                {
                    if (Game.PlayerName1.ToLower() != sName.ToLower())
                    {
                        if(Game.PlayerName2 == "")
                            Game.PlayerName2 = sName;
                    }
                    if (Game.PlayerTurn == Game.PlayerName1)
                        Game.PlayerTurn = Game.PlayerName2;
                    else
                        Game.PlayerTurn = Game.PlayerName1;

                    Game.Plays.Add(new Plays(sPoint, sValue));
                    Game.LastPlayed = sValue;
                    StoredGames[index] = Game;

                    

                }
               // HttpContext.Current.Session["GamesPlayed"] = StoredGames;

                return true;

            }
            catch { return false; }

        }

    [WebInvoke(Method = "GET", UriTemplate = "GetLatestMove?sName={sName}&sGame={sGame}",
 BodyStyle = WebMessageBodyStyle.Wrapped,
 ResponseFormat = WebMessageFormat.Json)]
        public Games GetLatestMove(string sName, string sGame)
        {
            Games Game = new Games(sGame);
           // List<Plays> Plays = new List<Plays>();

            if ( StoredGames != null)
            {
               // List<Games> StoredGames = (List<Games>)HttpContext.Current.Session["GamesPlayed"];
                int index = 0;
                foreach (Games item in StoredGames)
                {
                    if (item.NameOfGame != null)
                    {
                        if (item.NameOfGame.Trim().ToLower() == sGame.Trim().ToLower())
                        {
                            // Plays Play = new Plays();

                            Game.PlayerName1 = item.PlayerName1;
                            Game.PlayerName2 = item.PlayerName2;
                            if (Game.PlayerName1.ToLower() != sName.ToLower())
                            {
                                if (Game.PlayerName2 == "")
                                {
                                    Game.PlayerName2 = sName;
                                }
                            }

                            Game.PlayerTurn = item.PlayerTurn;
                            Game.LastPlayed = item.LastPlayed;
                            Game.Plays = item.Plays;

                            StoredGames[index] = Game;
                            break;
                        }
                    }
                    index++;
                }

               
            }

            return Game;

        }
}
