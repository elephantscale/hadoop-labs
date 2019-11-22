package hi.hbase;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Connection;

/**
 * before running this, create 'MYNAME_users' table 
 * (replace MYNAME with  your username) 
 * 
 * in hbase shell: 
*      create 'MYNAME_users', 'info'
 */
public class Connect {

  public static void main(String[] args) throws Exception {
    Configuration config = HBaseConfiguration.create();
    Connection connection = ConnectionFactory.createConnection(config);
    Table htable = connection.getTable(TableName.valueOf("tim_users"));
    System.out.println ("### connected to " + htable.getTableDescriptor().getNameAsString());
    htable.close();
  }

}
