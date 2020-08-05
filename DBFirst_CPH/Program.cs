using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DBFirst_CPH
{
    class Program
    {
        static void Main(string[] args)
        {

            using (var context = new CPHAirport_DBFirstEntities())
            {
                var airlinesQuery = context.Airlines;

                Console.WriteLine("Airlines:");
                Console.WriteLine("_________________");
                foreach (var airline in airlinesQuery)
                {
                    Console.WriteLine(airline.Name);
                    if (airline.Routes.Any())
                    {
                        foreach (var route in airline.Routes)
                        {
                            Console.WriteLine("----Route: " + route.DestinationStart + " - " + route.DestinationEnd);
                        }
                    }
                    else
                    {
                        Console.WriteLine("----No available routes.");
                    }
                    
                    Console.WriteLine();
                    Console.WriteLine();
                }


                Console.WriteLine("Airports:");
                Console.WriteLine("_________________");
                foreach (var airport in context.Airports)
                {
                    Console.WriteLine($"IATA    : {airport.IATA}");
                    Console.WriteLine($"Name    : {airport.CommonName}");
                    Console.WriteLine($"Country : {airport.Country.Country1} - {airport.Country.CountryCode}");


                    Console.WriteLine();
                }


                Console.Read();
            }

        }
    }
}
