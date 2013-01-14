class ParticleSystem
{
  ArrayList particles = new ArrayList();
   
  ParticleSystem(){}
   
  void add(Particle p)
  {
    particles.add(p);
  }
   
  void removeAll()
  {
    particles.clear();
  }
   
   
  void run()
  {
    for(int i = 0; i < particles.size(); i++)
    {
      Particle p = (Particle)particles.get(i);
      p.run();
    }
  }
}

