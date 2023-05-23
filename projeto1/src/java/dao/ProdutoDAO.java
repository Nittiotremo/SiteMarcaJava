package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLDataException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Marca;
import model.Produto;
import utils.Conexao;

public class ProdutoDAO implements DAOGenerica {

    private Connection conexao;

    public ProdutoDAO() throws SQLException, ClassNotFoundException {
        this.conexao = new Conexao().abrirConexao();
    }

    @Override
    public void gravar(Object objeto) throws SQLException {
        Produto produto = (Produto) objeto;
        if (produto.getCodigoproduto() == 0) {
            this.inserir(produto);
        } else {
            this.alterar(produto);
        }
    }

    @Override
    public void inserir(Object objeto) throws SQLException {
        Produto produto = (Produto) objeto;
        String sql = "insert into produto values (default, ?, ?)";
        PreparedStatement stmt = null;
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, produto.getNomeproduto());
            stmt.setInt(2, produto.getMarca().getCodigomarca());
            stmt.execute();
        } catch (SQLException ex) {
            throw new SQLException("Erro ao inserir produto");
        } finally {
            new Conexao().encerrarConexao(conexao, stmt);
        }
    }

    @Override
    public void alterar(Object objeto) throws SQLException {
        Produto produto = (Produto) objeto;
        String sql = "update produto set nomeproduto = ?, codigomarca = ? where codigoproduto = ?";
        PreparedStatement stmt = null;
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, produto.getNomeproduto());
            stmt.setInt(2, produto.getMarca().getCodigomarca());
            stmt.setInt(3, produto.getCodigoproduto());
            stmt.execute();
        } catch (SQLException ex) {
            throw new SQLException("Erro ao alterar produto");
        } finally {
            new Conexao().encerrarConexao(conexao, stmt);
        }
    }   

    @Override
    public Object consultar(int codigo) throws SQLException {
        String sql = "select * from produto where codigoproduto = ?";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Produto produto = null;
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, codigo);
            rs = stmt.executeQuery();
            while (rs.next()) {
                produto = new Produto(rs.getInt("codigoproduto"), rs.getString("nomeproduto"),(Marca)new MarcaDAO().consultar(rs.getInt("codigomarca")));
            }
        } catch (SQLException |ClassNotFoundException ex) {
            throw new SQLException("Erro ao consultar produto");
        } finally {
            new Conexao().encerrarConexao(conexao, stmt, rs);
        }
        return produto;
    }

    @Override
    public List<Object> listar() throws SQLException {
        String sql = "select * from produto";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Object> lista = new ArrayList<>();
        try {
            stmt = conexao.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                Produto produto= new Produto(rs.getInt("codigoproduto"), rs.getString("nomeproduto"),(Marca)new MarcaDAO().consultar(rs.getInt("codigomarca")));
                lista.add(produto);
            }
        } catch (SQLException |ClassNotFoundException ex) {
            throw new SQLException("Erro ao listar produto");
        } finally {
            new Conexao().encerrarConexao(conexao, stmt, rs);
        }
        return lista;
    }

    @Override
    public void excluir(int codigo) throws SQLException {
        String sql = "delete from produto where codigoproduto = ?";
        PreparedStatement stmt = null;
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, codigo);
            stmt.execute();
        } catch (SQLException ex) {
            throw new SQLException("Erro ao excluir produto");
        } finally {
            new Conexao().encerrarConexao(conexao, null);
        }
    }

}
