using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

// NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService" in both code and config file together.
[ServiceContract]
public interface IService
{
    [OperationContract]
    void DoWork();

    
        [OperationContract]
        bool Play(string sName, string sGame, int sPoint, string sValue);

        [OperationContract]
        Games GetLatestMove(string sName, string sGame);


    


   
}

// Use a data contract as illustrated in the sample below to add composite types to service operations.
[DataContract]
public class Plays
{
    //bool boolValue = true;
    int iPosition;
    string sPositionValue = "";
    

    public Plays(int iPosition, string sPositionValue)
    {
        this.iPosition = iPosition;
        this.sPositionValue = sPositionValue;
    }

    [DataMember]
    public int Position
    {
        get { return iPosition; }
        set { iPosition = value; }
    }

    [DataMember]
    public string PositionValue
    {
        get { return sPositionValue; }
        set { sPositionValue = value; }
    }

    
}


[DataContract]
public class Games
{
    string sNameOfGame = "";
    string sPlayerTurn = "";
    string sPlayerName1 = "";
    string sPlayerName2 = "";
    string sLastPlayed = "";
    List<Plays> colPlays;

    public Games(string NameOfGame)
    {
        this.sNameOfGame = NameOfGame;
    }

    [DataMember]
    public string LastPlayed
    {
        get { return sLastPlayed; }
        set { sLastPlayed = value; }
    }

    //[DataMember]
    //public bool BoolValue
    //{
    //    get { return boolValue; }
    //    set { boolValue = value; }
    //}

    [DataMember]
    public string PlayerName1
    {
        get { return sPlayerName1; }
        set { sPlayerName1 = value; }
    }

    [DataMember]
    public string PlayerName2
    {
        get { return sPlayerName2; }
        set { sPlayerName2 = value; }
    }

    [DataMember]
    public string PlayerTurn
    {
        get { return sPlayerTurn; }
        set { sPlayerTurn = value; }
    }

    [DataMember]
    public string NameOfGame
    {
        get { return sNameOfGame; }
        set { sNameOfGame = value; }
    }

    [DataMember]
    public List<Plays> Plays
    {
        get { return colPlays; }
        set { colPlays = value; }
    }

}
