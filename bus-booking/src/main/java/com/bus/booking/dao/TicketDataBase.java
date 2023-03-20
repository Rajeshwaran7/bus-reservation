package com.bus.booking.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.bus.booking.dto.Bus;
import com.bus.booking.dto.Ticket;

public class TicketDataBase {
	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/bus";
	private static final String USER = "root";
	private static final String PASSWORD = "tiger";

	public boolean addTicket(Ticket ticket) {

		Connection con = null;
		PreparedStatement pstm = null;
		try {
			Class.forName(DRIVER);

			try {
				con = DriverManager.getConnection(URL, USER, PASSWORD);
				String query = "INSERT INTO bus.ticket_generate (ticket_id,bus_name,frm_place,to_place,seats,amount_total,user_name,age,gender) VALUES(?,?,?,?,?,?,?,?,?)";
				pstm = con.prepareStatement(query);
				pstm.setInt(1, ticket.getTicketId());
				pstm.setString(2, ticket.getBusName());
				pstm.setString(3, ticket.getFromPlace());
				pstm.setString(4, ticket.getToPlace());
				pstm.setInt(5, ticket.getSeats());
				pstm.setDouble(6,ticket.getTotalAmount());
				pstm.setString(7, ticket.getUserName());
				pstm.setInt(8, ticket.getAge());
				pstm.setString(9, ticket.getGender());

				int rowAffected = pstm.executeUpdate();

				return rowAffected != 0;
			} catch (SQLException e) {
				// TODO Auto-generated catch block

				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (pstm != null) {
				try {
					pstm.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return false;

	}


}
