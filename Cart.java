package Magazin;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Cart {
    public static void showCart(){


        String sql = " Select mo.name_model,bo.type_body,co.name_color,tr.type_kpp,mo.price "+
                     " from cart ca join auto au ON ca.id_auto = au.id_auto "+
                     " join model mo ON au.id_model = mo.id_model "+
                     " join body bo ON au.id_body = bo.id_body "+
                     " join color co on au.id_color = co.id_color "+
                     " join transmission tr on au.id_kpp = tr.id_kpp "+
                     " join brend br on mo.id_brend = br.id_brend ";

        Auto.printAuto(sql);

    }

    public static void clearCart() throws IOException {
        String sql = "delete from cart where id_user = ? ";

        System.out.println("Удалить данные из корзины? (1-да, 2-отмена)");
        int deleteChoice = Integer.parseInt(Main.bufferedReader.readLine());


        if (deleteChoice == 1) {
            try (Connection connection = DriverManager.getConnection(Main.URL, Main.USER, Main.PASSWORD);
                 PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, Main.IDUSER);
                statement.executeUpdate();
                System.out.println("Корзина очищена");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else{
            System.out.println("Удаление отменено");
        }
    }

    public static void addToCart(){
        int ii = 0, autoToCart=0;
        List<Integer> listToCart = new ArrayList<>();
        String str = "   ";
        String sql = " SELECT " +
                " au.id_auto, mo.name_model,bo.type_body,co.name_color,tr.type_kpp,mo.price " +
                " FROM autobd.auto au join model mo ON au.id_model = mo.id_model " +
                " join body bo ON au.id_body = bo.id_body " +
                " join color co on au.id_color = co.id_color " +
                " join transmission tr on au.id_kpp = tr.id_kpp "+
                " and not exists (select 1 from cart ca where ca.id_auto = au.id_auto) ";
        try (Connection connection = DriverManager.getConnection(Main.URL,Main.USER,Main.PASSWORD);
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery(sql)){

            while (rs.next()){
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append(++ii).append(str);
                stringBuilder.append(rs.getString("name_model")).append(str);
                stringBuilder.append(rs.getString("type_body")).append(str);
                stringBuilder.append(rs.getString("name_color")).append(str);
                stringBuilder.append(rs.getString("type_kpp")).append(str);
                stringBuilder.append(rs.getInt("price")).append(str);
                System.out.println(stringBuilder.toString());
                listToCart.add(rs.getInt("id_auto"));

            }
            System.out.print("Укажите номер товара для перемещения в корзину_");
            autoToCart = Integer.parseInt(Main.bufferedReader.readLine());
            insertToCart(listToCart,autoToCart-1);

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void insertToCart(List<Integer> list, int choice){
        String sql = "insert into cart (id_auto, status, id_user) values (?,?,?) ";
        try (Connection connection = DriverManager.getConnection(Main.URL, Main.USER, Main.PASSWORD);
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, list.get(choice));
            statement.setString(2, "в корзине");
            statement.setInt(3, Main.IDUSER);
            statement.executeUpdate();
            System.out.println("Автомобиль добавлен в корзину");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
