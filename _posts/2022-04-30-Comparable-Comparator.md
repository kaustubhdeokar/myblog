## Comparable vs Comparator

> Any class implementing a comparable interface, implements a compareTo method, where it specifies the logic for ordering it's elements. 

```

import java.util.Comparator;

public class Laptop implements Comparable<Laptop> {

    private String name;
    private int price;

    public Laptop(String name, int price) {
        this.name = name;
        this.price = price;
    }
    //getters.

    @Override
    public int compareTo(Laptop laptop) {
        return Integer.compare(this.price, laptop.price);
    }

    public Comparator<Laptop> comparePrices(Laptop laptop) {

        Comparator<Laptop> comparator = (l1, l2) -> Integer.compare(l1.price, l2.price);
        return comparator;
    }

}

```
> Now any list of laptops, when sorted by default will use that comparison logic. 

> But now, the questions arises that , what is we want to sort it by a different way ? A customer has a  new field requirement and is added to the laptop class, - RAM size (int), now we want to factor in this too, while sorting. Hence without distrubing the original compareTo method, that can be done as follows. 

```
        Collections.sort(laptopList, (l1, l2) -> {
            int priceSort = Integer.compare(l1.getPrice(), l2.getPrice());
            if (priceSort == 0)
                return Integer.compare(l1.getRam(), l2.getRam());
            return priceSort;
        });
```