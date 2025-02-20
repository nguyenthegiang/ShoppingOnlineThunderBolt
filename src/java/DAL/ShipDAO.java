/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import entity.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class ShipDAO extends BaseDAO<Account> {

    PreparedStatement ps = null; 
    ResultSet rs = null; 

    /**
     * get every shipping orders
     * @return list of ship
     */
    public List<Ship> getAllShip() {
        List<Ship> list = new ArrayList<>();
        String query = "SELECT * FROM Ship";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Ship(rs.getInt("id"),rs.getString("CityName"), rs.getInt("ShipPrice")));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    /**
     * get a shipping price from db using cityName
     * @param cityName
     * @return an int number 
     */
    public int getShipPriceByCityName(String cityName) {
        String query = "SELECT ShipPrice FROM Ship WHERE CityName = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, cityName);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }
    
    /**
     * get a shipping price from db using the id
     * @param id
     * @return an int number 
     */
    public int getShipPriceByCId(int id) {
        String query = "SELECT ShipPrice FROM Ship WHERE id = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();          
       }
        return 0;
    }
    
    /**
     * get a shipping price from db using the id
     * @param id
     * @return an int number 
     */
    public Ship getCityByCId(int cityId) {
        String query = "SELECT * FROM Ship WHERE id = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, cityId);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Ship(
                        rs.getInt("id"),
                        rs.getString("CityName"),
                        rs.getInt("ShipPrice")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();          
       }
        return null;
    }

    public static void main(String[] args) {
        ShipDAO ShipDAO = new ShipDAO();
        
        /*---------Test Case for getAllShip() method---------*/
//        List<Ship> list = ShipDAO.getAllShip();
//        for (Ship ship : list) {
//            System.out.println(ship);
//        }
        
        /*---------Test Case for getShipPriceByCityName() method---------*/
        System.out.println(ShipDAO.getShipPriceByCityName("Hà Nội"));
    }
}
