package Magazin;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;

public class Main {
    public static final String URL = "jdbc:mysql://localhost:3306/autobd?useSSL=false&serverTimezone=UTC";
    public static final String USER = "root";
    public static final String PASSWORD = "root";


    public static void main(String[] args) throws IOException {
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        int choice=0;
        System.out.println("\"1\"");
        System.out.println("Добро пожаловать в интернет магазин автомобилей ВАЗ и РЕНО");
        System.out.println("1 - Показать список товаров");
        System.out.println("2 - Поиск товара");

        System.out.print("Выберите действие_");

        choice = Integer.parseInt(reader.readLine());

        if (choice == 1){
            Auto.printAuto(null);
        }
        else if (choice == 2){
            System.out.println("Искать по ");
            System.out.println("   1 - Марка");
            System.out.println("   2 - Модель");
            System.out.println("   3 - Цвет");
            System.out.println("   4 - Тип трансмиссии");
            int findChoice = Integer.parseInt(reader.readLine());
            FindAuto.findChoice(findChoice);
        }


    }
}
