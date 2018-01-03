package Magazin;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FindAuto {
    static  BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in));

    public static void findChoice(int choice) throws IOException {
        if (choice == 1){
            findMarka();
        } else if (choice == 2){
            findModel();
        } else if (choice == 3){
            findColor();
        } else if (choice == 4){
            findKpp();
        }
    }

    private static List connectToBase(String sql) {
        List<String> list = new ArrayList<>();
        try (Connection connection = DriverManager.getConnection(Main.URL, Main.USER, Main.PASSWORD);
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery(sql)) {
            while (rs.next()) {
                list.add(rs.getString(1));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    private static void findMarka() throws IOException {

        List<String> listMarka = new ArrayList<>();
        int choiceMarka = 0;

        String sql = " select br.name_brend from auto au join model mo ON au.id_model = mo.id_model "+
                     " join brend br on mo.id_brend =br.id_brend group by br.id_brend ";


        listMarka = connectToBase(sql);



        if (listMarka.size() > 0 ){
            System.out.println("В наличии следующие марки: ");
            for (int i=0; i < listMarka.size(); i++){
                System.out.println((i+1)+" - "+listMarka.get(i));
            }
            System.out.println("Сделайте выбор: ");
            choiceMarka = Integer.parseInt(bufferedReader.readLine());

            sql = " SELECT " +
                    " mo.name_model,bo.type_body,co.name_color,tr.type_kpp,mo.price " +
                    " FROM autobd.auto au join model mo ON au.id_model = mo.id_model " +
                    " join body bo ON au.id_body = bo.id_body " +
                    " join color co on au.id_color = co.id_color " +
                    " join transmission tr on au.id_kpp = tr.id_kpp "+
                    " join brend br on mo.id_brend = br.id_brend " +
                    " where br.name_brend = '" + listMarka.get(choiceMarka-1) + "'";
            Auto.printAuto(sql);
        }
        else{
            System.out.println("В наличии автомобилей нет");
        }

    }

    private static void findModel() throws IOException {

        List<String> listModel = new ArrayList<>();
        int choiceModel = 0;

        String sql = " select mo.name_model from auto au join model mo ON au.id_model = mo.id_model "+
                " group by mo.name_model ";

        listModel = connectToBase(sql);

        if (listModel.size() > 0 ){
            System.out.println("В наличии следующие модели: ");
            for (int i=0; i < listModel.size(); i++){
                System.out.println((i+1)+" - "+listModel.get(i));
            }
            System.out.println("Сделайте выбор: ");
            choiceModel = Integer.parseInt(bufferedReader.readLine());

            sql = " SELECT " +
                    " mo.name_model,bo.type_body,co.name_color,tr.type_kpp,mo.price " +
                    " FROM autobd.auto au join model mo ON au.id_model = mo.id_model " +
                    " join body bo ON au.id_body = bo.id_body " +
                    " join color co on au.id_color = co.id_color " +
                    " join transmission tr on au.id_kpp = tr.id_kpp "+
                    " where mo.name_model = '" + listModel.get(choiceModel-1) + "'";
            Auto.printAuto(sql);
        }
        else{
            System.out.println("В наличии автомобилей нет");
        }
    }
    private static void findColor() throws IOException {

        List<String> listColor = new ArrayList<>();
        int choiceColor = 0;

        String sql = " select co.name_color from auto au join color co ON au.id_color = co.id_color "+
                " group by co.name_color ";

        listColor = connectToBase(sql);

        if (listColor.size() > 0 ){
            System.out.println("В наличии автомобили следующих цветов: ");
            for (int i=0; i < listColor.size(); i++){
                System.out.println((i+1)+" - "+listColor.get(i));
            }
            System.out.println("Сделайте выбор: ");
            choiceColor = Integer.parseInt(bufferedReader.readLine());

            sql = " SELECT " +
                    " mo.name_model,bo.type_body,co.name_color,tr.type_kpp,mo.price " +
                    " FROM autobd.auto au join model mo ON au.id_model = mo.id_model " +
                    " join body bo ON au.id_body = bo.id_body " +
                    " join color co on au.id_color = co.id_color " +
                    " join transmission tr on au.id_kpp = tr.id_kpp "+
                    " where co.name_color = '" + listColor.get(choiceColor-1) + "'";
            Auto.printAuto(sql);
        }
        else{
            System.out.println("В наличии автомобилей нет");
        }
    }
    private static void findKpp() throws IOException {

        List<String> listKpp = new ArrayList<>();
        int choiceKpp = 0;

        String sql = " select tr.type_kpp from auto au join transmission tr ON au.id_kpp = tr.id_kpp "+
                " group by tr.type_kpp ";

        listKpp = connectToBase(sql);

        if (listKpp.size() > 0 ){
            System.out.println("В наличии автомобили следующих со следующими трансмиссиями: ");
            for (int i=0; i < listKpp.size(); i++){
                System.out.println((i+1)+" - "+listKpp.get(i));
            }
            System.out.println("Сделайте выбор: ");
            choiceKpp = Integer.parseInt(bufferedReader.readLine());

            sql = " SELECT " +
                    " mo.name_model,bo.type_body,co.name_color,tr.type_kpp,mo.price " +
                    " FROM autobd.auto au join model mo ON au.id_model = mo.id_model " +
                    " join body bo ON au.id_body = bo.id_body " +
                    " join color co on au.id_color = co.id_color " +
                    " join transmission tr on au.id_kpp = tr.id_kpp "+
                    " where tr.type_kpp = '" + listKpp.get(choiceKpp-1) + "'";
            Auto.printAuto(sql);
        }
        else{
            System.out.println("В наличии автомобилей нет");
        }
    }


}
