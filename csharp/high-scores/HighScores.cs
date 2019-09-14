using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;

public class HighScores
{
  private readonly ReadOnlyCollection<int> scores;

  public HighScores(List<int> list)
  {
    scores = list.AsReadOnly();
  }

  public List<int> Scores()
  {
    return scores.ToList();
  }

  public int Latest()
  {
    return scores.Last();
  }

  public int PersonalBest()
  {
    return scores.Max();
  }

  public List<int> PersonalTopThree()
  {
    return scores.OrderBy(n => -n).Take(3).ToList();
  }
}
