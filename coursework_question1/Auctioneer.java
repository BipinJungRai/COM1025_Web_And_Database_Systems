/**

The Auctioneer class represents an auctioneer in an auction system.
It maintains a list of cars that are for sale, a list of sold cars,
and a list of unsold cars. An auctioneer also has the ability to check if a
specific car is available for sale, place an offer on a car, end a sale of a car,
and display the list of sold cars and unsold cars.
@author Bipindra Rai
@version 1.0
*/
package coursework_question1;
import java.util.HashMap;
import java.util.Map;

public class Auctioneer {

/** The name of the auctioneer. */
protected String name;

/** A map of car adverts that are for sale and the corresponding seller. */
protected HashMap<Advert, User> carsForSale;

/** A map of sold car adverts and the corresponding buyers. */
protected HashMap<Advert, User> soldCars;

/** A map of unsold car adverts and the corresponding sellers. */
protected HashMap<Advert, User> unsoldCars;

/**

Constructs a new Auctioneer with the given name.
@param name the name of the auctioneer
*/
public Auctioneer(String name) {
this.name = name;
carsForSale = new HashMap<>();
soldCars = new HashMap<>();
unsoldCars = new HashMap<>();
}
/**

Returns true if the given car is available for sale, false otherwise.
@param car the car to check for availability
@return true if the car is available for sale, false otherwise
*/
public boolean checkExistence(Car car) {
boolean check = false;
for (Map.Entry<Advert, User> entry : carsForSale.entrySet()) {
if (entry.getKey().getCar() == car) {
check = true;
}
}
return check;
}
/**

Returns a list of the sold cars in the following format:
"SOLD CARS:\n
Car ID - Purchased by [Buyer Name] with a successful £[highest offer] bid.\n
..."
@return a list of the sold cars
*/
public String displaySoldCars() {
String output = "SOLD CARS:\n";
for (Map.Entry<Advert, User> entry : soldCars.entrySet()) {
output = output + entry.getKey().getCar().getId() + " - Purchased by " + name
+ " with a successful £"
+ String.format("%.2f", entry.getKey().getHighestOffer().getValue()) + " bid.\n";
}
return output;
}
/**

Returns a list of statistics for the auctioneer.
@return a list of statistics for the auctioneer
*/
public String displayStatistics() {
return "Statistics";
}
/**

Returns a list of the unsold cars in the following format:
"UNSOLD CARS:\n
[Advert information]\n
..."
@return a list of the unsold cars
*/
public String displayUnsoldCars() {
    String output = "UNSOLD CARS:\n";
    for (Map.Entry<Advert, User> entry : unsoldCars.entrySet()) {
    output = output + entry.getKey().toString();
    }
    return output;
    }
    /**
    
    Ends the sale of the given car advert. If the highest offer on the advert is equal to or greater
    than the price of the car, the car is considered sold and is moved to the list of sold cars.
    Otherwise, the car is considered unsold and is moved to the list of unsold cars.
    @param advert the advert for the car to end the sale of
    @throws IllegalArgumentException if the advert is null
    */
    public void endSale(Advert advert) {
    if (advert == null) {
    throw new IllegalArgumentException();
    }
    if (!carsForSale.containsKey(advert)) {
    return;
    }
    if (advert.getHighestOffer().getValue() >= advert.getCar().getPrice()) {
    soldCars.put(advert, advert.getHighestOffer().getBuyer());
    carsForSale.remove(advert);
    } else {
    unsoldCars.put(advert, carsForSale.get(advert));
    carsForSale.remove(advert);
    }
    }
    
    /**
    
    Places an offer on the given car advert for the given value. The offer will only be placed if the
    car is available for sale.
    @param carAdvert the advert for the car to place an offer on
    @param user the user placing the offer
    @param value the value of the offer
    @return true if the offer was successfully placed, false otherwise
    @throws IllegalArgumentException if the car advert or user is null
    */
    public boolean placeOffer(Advert carAdvert, User user, double value) {
    if (carAdvert == null || user == null) {
    throw new IllegalArgumentException();
    }
    if (checkExistence(carAdvert.getCar())) {
    carAdvert.placeOffer(user, value);
    return true;
    
    } else {
    return false;
    }
    }
    
    /**
    
    Registers the given car advert for sale and sets the car's colour, number of seats, gearbox type,
    and body type. The car will only be registered for sale if it is not already available for sale.
    @param carAdvert the advert for the car to register for sale
    @param user the user selling the car
    @param colour the colour of the car
    @param type the gearbox type of the car
    @param body the body type of the car
    @param noOfSeats the number of seats in the car
    @throws IllegalArgumentException if the car advert or user is null
    */
    public void registerCar(Advert carAdvert, User user, String colour, CarType type, CarBody body,
    int noOfSeats) {

        if (carAdvert == null || user == null) {
        throw new IllegalArgumentException();
        }
        carAdvert.getCar().setColour(colour);
        carAdvert.getCar().setNumberOfSeats(noOfSeats);
        carAdvert.getCar().setGearbox(type);
        carAdvert.getCar().setBody(body);
        
        if (checkExistence(carAdvert.getCar())) {
        return;
        }
        carsForSale.put(carAdvert, user);
        }
        
        }