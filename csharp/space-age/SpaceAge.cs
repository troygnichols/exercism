using System;

public class SpaceAge
{
  private const double EarthOrbitalPeriodSeconds = 31557600.0,
          EarthOrbitRatio   = 1.0,
          MercuryOrbitRatio = 0.2408467,
          VenusOrbitRatio   = 0.61519726,
          MarsOrbitRatio    = 1.8808158,
          JupiterOrbitRatio = 11.862615,
          SaturnOrbitRatio  = 29.447498,
          UranusOrbitRatio  = 84.016846,
          NeptuneOrbitRatio = 164.79132;

  private int seconds;

  public SpaceAge(int seconds) => this.seconds = seconds;

  public double OnEarth() => OnPlanetWithRatio(EarthOrbitRatio);

  public double OnMercury() => OnPlanetWithRatio(MercuryOrbitRatio);

  public double OnVenus() => OnPlanetWithRatio(VenusOrbitRatio);

  public double OnMars() => OnPlanetWithRatio(MarsOrbitRatio);

  public double OnJupiter() => OnPlanetWithRatio(JupiterOrbitRatio);

  public double OnSaturn() => OnPlanetWithRatio(SaturnOrbitRatio);

  public double OnUranus() => OnPlanetWithRatio(UranusOrbitRatio);

  public double OnNeptune() => OnPlanetWithRatio(NeptuneOrbitRatio);

  private double OnPlanetWithRatio(double ratio) =>
    this.seconds / EarthOrbitalPeriodSeconds / ratio;
}
