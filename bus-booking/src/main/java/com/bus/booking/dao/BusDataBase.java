package com.bus.booking.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bus.booking.dto.Bus;
import com.bus.booking.dto.User;

public class BusDataBase {
	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/bus";
	private static final String USER = "root";
	private static final String PASSWORD = "tiger";

	public List<Bus> searchBus(String p1, String p2) {

		List<Bus> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		try {
			Class.forName(DRIVER);
			try {
				con = DriverManager.getConnection(URL, USER, PASSWORD);
				String query = "SELECT * FROM bus.bus_booking WHERE frm_place = ? and to_place = ?";
				pstm = con.prepareStatement(query);
				pstm.setString(1, p1);
				pstm.setString(2, p2);
				rs = pstm.executeQuery();
				while (rs.next()) {
					Bus bus = new Bus();

					int i = rs.getInt(1);
					String name = rs.getString(2);
					String from = rs.getString(3);
					String to = rs.getString(4);
					int seats = rs.getInt(5);
					Double ticket = rs.getDouble(6);
					bus.setBusId(i);
					bus.setFrom(from);
					bus.setTo(to);
					bus.setName(name);
					bus.setSeats(seats);
					bus.setTicketRate(ticket);
					list.add(bus);
				}

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
				if (pstm != null) {
					try {
						pstm.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}
		return list;

	}

	public boolean updateSeat(int seat, int id) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstm = null;
		try {
			Class.forName(DRIVER);
			try {
				con = DriverManager.getConnection(URL, USER, PASSWORD);
				String query = "UPDATE bus_booking SET seats = ? WHERE bus_id =?";
				pstm = con.prepareStatement(query);

				pstm.setInt(1, seat);
				pstm.setInt(2, id);

				int rowAffected = pstm.executeUpdate();

				return rowAffected != 0;

			} catch (SQLException e) {
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
				if (pstm != null) {
					try {
						pstm.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}
		return false;
	}

	public boolean updateBus(String name, String from, String to, int seat, double ticket, int id) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstm = null;
		try {
			Class.forName(DRIVER);
			try {
				con = DriverManager.getConnection(URL, USER, PASSWORD);
				String query = "UPDATE bus_booking SET bus_name = ?,frm_place = ?,to_place = ?,seats = ?,ticket_rate = ? WHERE bus_id =?";
				pstm = con.prepareStatement(query);

				pstm.setString(1, name);
				pstm.setString(2, from);
				pstm.setString(3, to);
				pstm.setInt(4, seat);
				pstm.setDouble(5, ticket);
				pstm.setInt(6, id);

				int rowAffected = pstm.executeUpdate();

				return rowAffected != 0;

			} catch (SQLException e) {
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
				if (pstm != null) {
					try {
						pstm.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}
		return false;
	}

	public boolean addUser(User user) {

		Connection con = null;
		PreparedStatement pstm = null;
		try {
			Class.forName(DRIVER);

			try {
				con = DriverManager.getConnection(URL, USER, PASSWORD);
				String query = "INSERT INTO bus.user (user_name,email,password,age,gender,mobile) VALUES(?,?,?,?,?,?)";
				pstm = con.prepareStatement(query);
				pstm.setString(1, user.getUserName());
				pstm.setString(2, user.getEmail());
				pstm.setString(3, user.getPwd());
				pstm.setInt(4, user.getAge());
				pstm.setString(5, user.getGender());
				pstm.setLong(6, user.getMobile());

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

	public boolean addBus(Bus bus) {

		Connection con = null;
		PreparedStatement pstm = null;
		try {
			Class.forName(DRIVER);

			try {
				con = DriverManager.getConnection(URL, USER, PASSWORD);
				String query = "INSERT INTO bus.bus_booking (bus_name,frm_place,to_place,seats,ticket_rate) VALUES(?,?,?,?,?)";
				pstm = con.prepareStatement(query);
				pstm.setString(1, bus.getName());
				pstm.setString(2, bus.getFrom());
				pstm.setString(3, bus.getTo());
				pstm.setInt(4, bus.getSeats());
				pstm.setDouble(5, bus.getTicketRate());

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

	public List<Bus> getRoutes() {

		List<Bus> busList = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		try {
			Class.forName(DRIVER);
			try {
				con = DriverManager.getConnection(URL, USER, PASSWORD);
				String query = "SELECT * FROM bus.bus_booking";
				pstm = con.prepareStatement(query);
				rs = pstm.executeQuery();
				while (rs.next()) {
					Bus bus = new Bus();

					int i = rs.getInt(1);
					String name = rs.getString(2);
					String from = rs.getString(3);
					String to = rs.getString(4);
					int seats = rs.getInt(5);
					double ticket = rs.getDouble(6);
					bus.setBusId(i);
					bus.setName(name);
					bus.setFrom(from);
					bus.setTo(to);
					bus.setSeats(seats);
					bus.setTicketRate(ticket);
					busList.add(bus);
				}

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
				if (pstm != null) {
					try {
						pstm.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}
		return busList;

	}

	public Bus getBus(int id) {

		Connection con = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Bus bus = new Bus();

		try {
			Class.forName(DRIVER);
			try {
				con = DriverManager.getConnection(URL, USER, PASSWORD);
				String query = "SELECT * FROM bus.bus_booking WHERE bus_id = ?";
				pstm = con.prepareStatement(query);
				pstm.setInt(1, id);
				rs = pstm.executeQuery();
				while (rs.next()) {
					int i = rs.getInt(1);
					String name = rs.getString(2);
					String from = rs.getString(3);
					String to = rs.getString(4);
					int seats = rs.getInt(5);
					double ticket = rs.getDouble(6);
					bus.setBusId(i);
					bus.setFrom(from);
					bus.setTo(to);
					bus.setName(name);
					bus.setSeats(seats);
					bus.setTicketRate(ticket);
				}

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
				if (pstm != null) {
					try {
						pstm.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}
		return bus;

	}

	public void deleteBus(int id) {
		// TODO Auto-generated method stub

		Connection con = null;
		PreparedStatement pstm = null;
		try {
			Class.forName(DRIVER);

			try {
				con = DriverManager.getConnection(URL, USER, PASSWORD);

				String query = "DELETE FROM bus.bus_booking WHERE bus_id=?";
				pstm = con.prepareStatement(query);
				pstm.setInt(1, id);

				int rowAffected = pstm.executeUpdate();

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

	}

	public List<Bus> searchBus(String busName) {

		List<Bus> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		try {
			Class.forName(DRIVER);
			try {
				con = DriverManager.getConnection(URL, USER, PASSWORD);
				String query = "SELECT * FROM bus.bus_booking WHERE bus_name = ? ";
				pstm = con.prepareStatement(query);
				pstm.setString(1, busName);
				rs = pstm.executeQuery();
				while (rs.next()) {
					Bus bus = new Bus();

					int i = rs.getInt(1);
					String name = rs.getString(2);
					String from = rs.getString(3);
					String to = rs.getString(4);
					int seats = rs.getInt(5);
					Double ticket = rs.getDouble(6);
					bus.setBusId(i);
					bus.setFrom(from);
					bus.setTo(to);
					bus.setName(name);
					bus.setSeats(seats);
					bus.setTicketRate(ticket);
					list.add(bus);
				}

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
				if (pstm != null) {
					try {
						pstm.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}
		return list;

	}

}
