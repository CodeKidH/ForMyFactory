package dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import logic.Item;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcTemplate;
import org.springframework.jdbc.core.support.AbstractLobCreatingPreparedStatementCallback;
import org.springframework.jdbc.support.lob.LobCreator;
import org.springframework.jdbc.support.lob.LobHandler;
import org.springframework.stereotype.Repository;

@Repository
public class ItemDaoImpl implements ItemDao {

	@Autowired
	private LobHandler lobHandler;

	private SimpleJdbcTemplate template;

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.template = new SimpleJdbcTemplate(dataSource);
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	private static final String SELECT_ALL = "SELECT page_no, title, author,contents, today FROM linux";

	public List<Item> findAll() {
		RowMapper<Item> mapper = new BeanPropertyRowMapper<Item>(Item.class);
		return this.template.query(ItemDaoImpl.SELECT_ALL, mapper);
	}

	private static final String SELECT_BY_PRIMARY_KEY = "SELECT page_no, title, author,contents,picture,today FROM linux WHERE page_no = ?";

	public Item findByPrimaryKey(Integer itemId) {
		RowMapper<Item> mapper = new BeanPropertyRowMapper<Item>(Item.class);
		return this.template.queryForObject(SELECT_BY_PRIMARY_KEY, mapper, itemId);
	}
	
	private static final String SELECT_BY_ITEM_NAME = "SELECT page_no, title, author,contents, today FROM linux WHERE title LIKE ?";

	public List<Item> findByItemName(String itemName) {
		RowMapper<Item> mapper = new BeanPropertyRowMapper<Item>(Item.class);
		return this.template.query(ItemDaoImpl.SELECT_BY_ITEM_NAME, mapper, itemName + "%");
	}

	private static final String INSERT = "INSERT INTO linux(title, contents, author,picture) values (?, ?, ?,?)";

	public void create(final Item item) {
		this.jdbcTemplate.execute(INSERT, new AbstractLobCreatingPreparedStatementCallback(lobHandler) {
			@Override
			protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException,
					DataAccessException {
				int index = 0;
				ps.setString(++index, item.getTitle());
				ps.setString(++index, item.getContents());
				ps.setString(++index, item.getAuthor());
				try {
					lobCreator.setBlobAsBytes(ps, ++index, item.getPicture().getBytes());
				} catch (IOException e) {
					throw new RuntimeException(e);
				}
				
			}
		});
	}
	
	public void delete(Integer itemId) {
		this.template.update("DELETE FROM linux where page_no = ?", itemId);
	}
	
	private static final String UPDATE = "UPDATE linux SET title = ?, contents = ?, author = ? WHERE page_no = ?";

	public void udpate(final Item item) {
		this.jdbcTemplate.execute(UPDATE, new AbstractLobCreatingPreparedStatementCallback(lobHandler) {
			@Override
			protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException,
					DataAccessException {
				int index = 0;
				ps.setString(++index, item.getTitle());
				ps.setString(++index, item.getContents());
				ps.setString(++index, item.getAuthor());
				/*try {
					lobCreator.setBlobAsBytes(ps, ++index, item.getPicture().getBytes());
				} catch (IOException e) {
					throw new RuntimeException(e);
				}*/
				ps.setInt(++index, item.getPageNo().intValue());
			}
		});
	}
	
	public InputStream getPicture(Integer itemId) {
		return this.template.queryForObject("SELECT picture FROM linux WHERE page_no = ?", new RowMapper<InputStream>() {
			public InputStream mapRow(ResultSet rs, int i) throws SQLException {
				return lobHandler.getBlobAsBinaryStream(rs, "picture");
			}
		}, itemId);
	}
}