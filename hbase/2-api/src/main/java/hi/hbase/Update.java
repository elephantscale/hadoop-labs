package hi.hbase;

import java.io.IOException;


import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.util.Bytes;

/**
 * HBase JavaDocs :
 * http://hbase.apache.org/0.94/apidocs/index.html?overview-summary.html
 *
 * before running this, create 'MYNAME_users' table 
 * (replace MYNAME with your username)
 *
 * in hbase shell: 
 *  > create 'MYNAME_users', 'info'
 */
public class Update {

  // TODO : update the table name with your username
  static String tableName = "MYNAME_users";
  static String familyName = "info";

  public static void main(String[] args) throws Exception {
    Configuration config = HBaseConfiguration.create();
    Connection connection = ConnectionFactory.createConnection(config);
    Table htable = connection.getTable(TableName.valueOf(tableName));

    int id = 10; // random id
    String userid = "user-" + id;
    String newEmail = "user-" + id + "@gmail.com";

    // TODO : create a Put using rowkey userid
    // Put put = .....

    // TODO : add email to put

    try {
      long t1 = System.currentTimeMillis();
      // TODO : finally persist the Put in htable
      // htable....
      long t2 = System.currentTimeMillis();
      System.out.println("update took " + (t2 - t1) + " ms");
    } catch (Exception e) {
      e.printStackTrace();
    }

    htable.close();

  }

}
