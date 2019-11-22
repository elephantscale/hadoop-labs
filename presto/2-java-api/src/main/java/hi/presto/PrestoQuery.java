package hi.presto;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class PrestoQuery {
  private static final String URL = "jdbc:presto://localhost:8080/hive/default";
  private static final String SOCKS_PROXY = "localhost:1080";
  private static final String USER = "user";
  private static final String QUERY =
      "select count(*) as count from chicago_taxi_trips_parquet where trip_miles > 50";

  public static void main(String[] args) {
    try {
      Properties properties = new Properties();
      properties.setProperty("user", USER);
      properties.setProperty("socksProxy", SOCKS_PROXY);
      Connection connection = DriverManager.getConnection(URL, properties);
      try (Statement stmt = connection.createStatement()) {
        ResultSet rs = stmt.executeQuery(QUERY);
        while (rs.next()) {
          int count = rs.getInt("count");
          System.out.println("The number of long trips: " + count);
        }
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }
}
