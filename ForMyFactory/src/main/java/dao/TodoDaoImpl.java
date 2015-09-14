package dao;

import java.io.IOException;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import logic.Item;
import logic.Todo;

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
public class TodoDaoImpl implements TodoDao{
	
	@Autowired
	private LobHandler lobHandler;
	
	private SimpleJdbcTemplate template;

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.template = new SimpleJdbcTemplate(dataSource);
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	private static final String FIND_ALL = "select * from todo";
	
	public List<Todo> findAll(){
		RowMapper<Todo> mapper = new BeanPropertyRowMapper<Todo>(Todo.class);
		sqlBatch(batch);
		return this.jdbcTemplate.query(TodoDaoImpl.FIND_ALL,mapper);
		
		
	}
	
	private static final String INSERT = "INSERT INTO todo(note) values (?)";

	public void create(final Todo todo) {
		this.jdbcTemplate.execute(INSERT, new AbstractLobCreatingPreparedStatementCallback(lobHandler) {
			@Override
			protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException,
					DataAccessException {
				int index = 0;
				ps.setString(++index, todo.getNote());
			}
		});
	}
	
	private static final String batch [] = {"ALTER TABLE todo AUTO_INCREMENT = 1","SET @COUNT = 0","UPDATE todo SET todo.num = @COUNT:=@COUNT+1"};
	
	public void sqlBatch(final String[] sql){
		jdbcTemplate.batchUpdate(sql);
	}
	
	public void delete(int list) {
		jdbcTemplate.update("DELETE FROM todo where num = ?", list);
		sqlBatch(batch);
	}
	
	private static final String UPDATE = "UPDATE todo SET rate = ? WHERE num = ?";

	public void rateUpdate(final int param, final int rate) {
		this.jdbcTemplate.execute(UPDATE, new AbstractLobCreatingPreparedStatementCallback(lobHandler) {
			@Override
			protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException,
					DataAccessException {
				int index = 0;
				ps.setInt(++index, rate);
				ps.setInt(++index, param);
			}
		});
	}

}
