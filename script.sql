CREATE TABLE usuario (
  idUsuario INT NOT NULL AUTO_INCREMENT,
  nomeUsuario VARCHAR(50) NOT NULL,
  sobrenomeUsuario VARCHAR(50) NOT NULL,
  emailUsuario VARCHAR(50) NOT NULL,
  senhaUsuario VARCHAR(255) NOT NULL,
  CPFUsuario VARCHAR(50) NOT NULL,
  celularUsuario VARCHAR(50) NOT NULL,
  tokenCartaoUsuario VARCHAR(255) NOT NULL,
  nascimentoUsuario DATE NOT NULL,
  PRIMARY KEY (idUsuario)
)

CREATE TABLE endereco (
  idEndereco INT NOT NULL AUTO_INCREMENT,
  ruaEndereco VARCHAR(50) NOT NULL,
  logradouroEndereco VARCHAR(50) NOT NULL,
  complementoEndereco VARCHAR(50) NOT NULL,
  estadoEndereco VARCHAR(50) NOT NULL,
  cidadeEndereco VARCHAR(50) NOT NULL,
  numeroEndereco INT NOT NULL,
  CEPEndereco INT NOT NULL,
  idUsuario INT NOT NULL,
  FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario),
  PRIMARY KEY (idEndereco)
)

CREATE TABLE dadosBancario (
  idDadosBancario INT NOT NULL AUTO_INCREMENT,
  contaDadosBancario INT NOT NULL,
  agenciaDadosBancario INT NOT NULL,
  tipoDocumentoDadosBancario VARCHAR(4),
  documentoDadosBancario INT NOT NULL,
  PRIMARY KEY (idDadosBancario)
)

CREATE TABLE prestador (
  idPrestador INT NOT NULL AUTO_INCREMENT,
  latitudePrestador BIGINT,
  longitudePrestador BIGINT,
  idUsuario INT NOT NULL,
  idEndereco INT NOT NULL,
  idDadosBancario INT NOT NULL,
  FOREIGN KEY (idDadosBancario) REFERENCES dadosBancario(idDadosBancario),
  FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario),
  FOREIGN KEY (idEndereco) REFERENCES endereco(idEndereco),
  PRIMARY KEY (idPrestador)
)

CREATE TABLE categoria (
  idCategoria INT NOT NULL AUTO_INCREMENT,
  nomeCategoria VARCHAR(50) NOT NULL,
  PRIMARY KEY (idCategoria)
)

CREATE TABLE servico (
  idServico INT NOT NULL AUTO_INCREMENT,
  descricaoServico VARCHAR(255) NOT NULL,
  precoServico DECIMAL(15,2) NOT NULL,
  idPrestador INT NOT NULL,
  idCategoria INT NOT NULL,
  FOREIGN KEY (idPrestador) REFERENCES prestador(idPrestador),
  FOREIGN KEY (idCategoria) REFERENCES categoria(idCategoria),
  PRIMARY KEY (idServico)
)

CREATE TABLE avaliacao (
  idAvaliacao INT NOT NULL AUTO_INCREMENT,
  pontualidadeAvaliacao INT NOT NULL,
  qualidadeAvaliacao INT NOT NULL,
  precoAvaliacao INT NOT NULL,
  idUsuario INT NOT NULL,
  idPrestador INT NOT NULL,
  FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario),
  FOREIGN KEY (idPrestador) REFERENCES prestador(idPrestador),
  PRIMARY KEY (idAvaliacao)
)

CREATE TABLE anuncio (
  idAnuncio INT NOT NULL AUTO_INCREMENT,
  tituloAnuncio VARCHAR(50) NOT NULL,
  descricaoAnuncio VARCHAR(255) NOT NULL,
  idUsuario INT NOT NULL,
  FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario),
  PRIMARY KEY (idAnuncio)
)

CREATE TABLE transacao (
  idTransacao INT NOT NULL AUTO_INCREMENT,
  idUsuario INT NOT NULL,
  idPrestador INT NOT NULL,
  valor DECIMAL(15,2),
  FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario),
  FOREIGN KEY (idPrestador) REFERENCES prestador(idPrestador),
  PRIMARY KEY (idTransacao)
)

CREATE TABLE pedido (
  idPedido INT NOT NULL AUTO_INCREMENT,
  idUsuario INT NOT NULL,
  statusUsuario VARCHAR(50) NOT NULL,
  idPrestador INT NOT NULL,
  FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario),
  FOREIGN KEY (idPrestador) REFERENCES prestador(idPrestador),
  PRIMARY KEY (idPedido)
)

CREATE TABLE itemPedido (
  idItemPedido INT NOT NULL AUTO_INCREMENT,
  idPedido INT NOT NULL,
  idServico INT NOT NULL,
  FOREIGN KEY (idPedido) REFERENCES pedido(idPedido),
  FOREIGN KEY (idServico) REFERENCES servico(idServico),
  PRIMARY KEY (idItemPedido)
)