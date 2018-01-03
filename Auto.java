package Magazin;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Auto {

    public static void printAuto(String sql){
        String str = "   ";
        if (sql == null){
         sql = " SELECT " +
                " mo.name_model,bo.type_body,co.name_color,tr.type_kpp,mo.price " +
                " FROM autobd.auto au join model mo ON au.id_model = mo.id_model " +
                " join body bo ON au.id_body = bo.id_body " +
                " join color co on au.id_color = co.id_color " +
                " join transmission tr on au.id_kpp = tr.id_kpp ";
        }
        try (Connection connection = DriverManager.getConnection(Main.URL,Main.USER,Main.PASSWORD);
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery(sql)){

            while (rs.next()){
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append(rs.getString("name_model")).append(str);
                stringBuilder.append(rs.getString("type_body")).append(str);
                stringBuilder.append(rs.getString("name_color")).append(str);
                stringBuilder.append(rs.getString("type_kpp")).append(str);
                stringBuilder.append(rs.getInt("price")).append(str);
                System.out.println(stringBuilder.toString());

            }



        } catch (SQLException e) {
            e.printStackTrace();
        }



    }
}
