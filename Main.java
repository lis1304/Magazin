package Magazin;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;

public class Main {
    public static final String URL = "jdbc:mysql://localhost:3306/autobd?useSSL=false&serverTimezone=UTC";
    public static final String USER = "root";
    public static final String PASSWORD = "root";
    public static final int IDUSER = 3;//работаем в режиме покупателя
    public static BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in));


    public static void main(String[] args) throws IOException {
        //BufferedReader bufferedreader = new BufferedReader(new InputStreamReader(System.in));
        boolean flagMenu = true;
        int choice=0;
        System.out.println("Добро пожаловать в интернет магазин автомобилей ВАЗ и РЕНО");
        while (flagMenu) {

            System.out.println("1 - Показать список товаров");
            System.out.println("2 - Поиск товара");
            System.out.println("3 - Добавить товар в корзину");
            System.out.println("4 - Корзина");
            System.out.println("5 - Очистить корзину");
            System.out.println("0 - Выход");

            System.out.print("Выберите действие_");

            choice = Integer.parseInt(bufferedReader.readLine());

            if (choice == 1) {
                Auto.printAuto(null);
            } else if (choice == 2) {
                System.out.println("Искать по ");
                System.out.println("   1 - Марка");
                System.out.println("   2 - Модель");
                System.out.println("   3 - Цвет");
                System.out.println("   4 - Тип трансмиссии");
                System.out.println("   Сделайте выбор_");
                int findChoice = Integer.parseInt(bufferedReader.readLine());
                FindAuto.findChoice(findChoice);
            } else if (choice == 3) {
                Cart.addToCart();
            } else if (choice == 4) {
                Cart.showCart();
            } else if (choice == 5) {
                Cart.clearCart();
            } else {
                flagMenu=false;
            }
        }

    }
}
