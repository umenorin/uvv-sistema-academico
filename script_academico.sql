
CREATE TABLE public.OBRAS (
                codigo_da_obra VARCHAR(50) NOT NULL,
                editora VARCHAR(50) NOT NULL,
                nome VARCHAR(50) NOT NULL,
                CONSTRAINT codigo_da_obra PRIMARY KEY (codigo_da_obra)
);
COMMENT ON TABLE public.OBRAS IS 'Tabela onde se encontra todos os livros.';
COMMENT ON COLUMN public.OBRAS.codigo_da_obra IS 'Campo onde armazena o código da obra. É a PK desta tabela.';
COMMENT ON COLUMN public.OBRAS.editora IS 'Campo onde armazena os nomes das editoras.';
COMMENT ON COLUMN public.OBRAS.nome IS 'Campo onde armazena o nome do livro.';


CREATE TABLE public.autor (
                codigo_da_obra VARCHAR(50) NOT NULL,
                nome_do_autor VARCHAR(50) NOT NULL,
                CONSTRAINT codigo_da_obra PRIMARY KEY (codigo_da_obra, nome_do_autor)
);
COMMENT ON TABLE public.autor IS 'Tabela onde armazena todos os autores dos livros.';
COMMENT ON COLUMN public.autor.codigo_da_obra IS 'códido da obra é a PK desta tabela e a FK da tabela obras.';
COMMENT ON COLUMN public.autor.nome_do_autor IS 'Este campo se encontra o nome de cada autor.';


CREATE TABLE public.tipo (
                codigo_da_obra VARCHAR(50) NOT NULL,
                livro VARCHAR(50) NOT NULL,
                cd VARCHAR(50) NOT NULL,
                dvd VARCHAR(50) NOT NULL,
                revista VARCHAR(50) NOT NULL,
                CONSTRAINT codigo_da_obra PRIMARY KEY (codigo_da_obra)
);
COMMENT ON TABLE public.tipo IS 'Tabela onde armazena o tipo de conteúdo, livro, cd, dvd, revista.';
COMMENT ON COLUMN public.tipo.codigo_da_obra IS 'códido da obra é a PK desta tabela e a FK da tabela obras. Tabela armazena os tipos dos livros.';
COMMENT ON COLUMN public.tipo.livro IS 'Tipo do campo.';
COMMENT ON COLUMN public.tipo.cd IS 'Tipo do campo.';
COMMENT ON COLUMN public.tipo.dvd IS 'Tipo do campo.';
COMMENT ON COLUMN public.tipo.revista IS 'Tipo do campo.';


CREATE TABLE public.disciplinas (
                codigo_da_disciplina VARCHAR(50) NOT NULL,
                nome VARCHAR(50) NOT NULL,
                conteudo VARCHAR(50) NOT NULL,
                carga_horaria VARCHAR(50) NOT NULL,
                ementa VARCHAR(50) NOT NULL,
                codigo_da_obra VARCHAR(50) NOT NULL,
                CONSTRAINT codigo_da_disciplina PRIMARY KEY (codigo_da_disciplina)
);
COMMENT ON TABLE public.disciplinas IS 'Tabela onde armazena todas as disciplinas disponiveis.';
COMMENT ON COLUMN public.disciplinas.codigo_da_disciplina IS 'Campo onde informa o código da disciplina é a PK desta tabela.';
COMMENT ON COLUMN public.disciplinas.nome IS 'Campo onde informa o nome da disciplina.';
COMMENT ON COLUMN public.disciplinas.conteudo IS 'Campo onde informa o conteúdo da disciplina.';
COMMENT ON COLUMN public.disciplinas.carga_horaria IS 'Campo onde informa a carga horaria da disciplina.';
COMMENT ON COLUMN public.disciplinas.ementa IS 'Campo onde informa a ementa escolar.';
COMMENT ON COLUMN public.disciplinas.codigo_da_obra IS 'Campo onde armazena o código da obra, é a FK da tabela obras.';


CREATE TABLE public.alunos (
                codigo_da_pessoa VARCHAR(50) NOT NULL,
                matricula VARCHAR(50) NOT NULL,
                CONSTRAINT alunos_pk PRIMARY KEY (codigo_da_pessoa)
);
COMMENT ON TABLE public.alunos IS 'Tabela onde se armazena as informações dos alunos.';
COMMENT ON COLUMN public.alunos.codigo_da_pessoa IS 'Campo onde armazena o código dos alunos, é a PK desta tabela.';


CREATE TABLE public.professores (
                codigo_da_pessoa VARCHAR(50) NOT NULL,
                CONSTRAINT professores_pk PRIMARY KEY (codigo_da_pessoa)
);
COMMENT ON TABLE public.professores IS 'Tabela onde onde informa o código dos professores, é a PK desta tabela.';
COMMENT ON COLUMN public.professores.codigo_da_pessoa IS 'Campo código da pessoa é a PK desta tabela.';


CREATE TABLE public.pessoas (
                codigo_da_pessoa VARCHAR(50) NOT NULL,
                nome VARCHAR(50) NOT NULL,
                data_cadastro DATE NOT NULL,
                email VARCHAR(50) NOT NULL,
                CONSTRAINT pessoas_pk PRIMARY KEY (codigo_da_pessoa)
);
COMMENT ON TABLE public.pessoas IS 'Tabela que irá armazenar os dados de todas as pessoas';


CREATE TABLE public.Endereco (
                codigo_da_pessoa VARCHAR(50) NOT NULL,
                logradouro VARCHAR(50) NOT NULL,
                numero INTEGER NOT NULL,
                compelmento VARCHAR(50),
                bairro VARCHAR(50) NOT NULL,
                cidade VARCHAR(50) NOT NULL,
                uf VARCHAR(2) NOT NULL,
                cep VARCHAR(8) NOT NULL,
                CONSTRAINT endereco_pk PRIMARY KEY (codigo_da_pessoa)
);
COMMENT ON TABLE public.Endereco IS 'tabela onde irá armazenar os dados dos endereços das pessoas';


CREATE TABLE public.telefone_pessoa (
                codigo_da_pessoa VARCHAR(50) NOT NULL,
                telefone INTEGER NOT NULL,
                CONSTRAINT telefone_pessoa_pk PRIMARY KEY (codigo_da_pessoa, telefone)
);
COMMENT ON TABLE public.telefone_pessoa IS 'Tabela que irá armazenar os telefones de cada pessoa';


CREATE TABLE public.pos_graduacao (
                codigo_da_pessoa VARCHAR(50) NOT NULL,
                codigo_pos_graduacao VARCHAR(50) NOT NULL,
                CONSTRAINT pos_graduacao_pk PRIMARY KEY (codigo_da_pessoa)
);
COMMENT ON TABLE public.pos_graduacao IS 'Tabela relacionada aos cursos de  pós graduação e os alunos que se encontram neste requisito.';
COMMENT ON COLUMN public.pos_graduacao.codigo_da_pessoa IS 'Código da pessoa que esta matriculada em algum curso de pós graduação.';


CREATE TABLE public.ofertas (
                codigo_da_oferta VARCHAR(50) NOT NULL,
                codigo_da_pessoa VARCHAR(50) NOT NULL,
                semestre INTEGER NOT NULL,
                quantidade_minima_alunos INTEGER NOT NULL,
                quantidade_maxima_alunos INTEGER NOT NULL,
                CONSTRAINT ofertas_pk PRIMARY KEY (codigo_da_oferta)
);
COMMENT ON TABLE public.ofertas IS 'Tabela relacionada as matérias disponiveis ao periodo.';
COMMENT ON COLUMN public.ofertas.codigo_da_oferta IS 'Campo onde armazena o código da oferta, é a PK desta tabela.';
COMMENT ON COLUMN public.ofertas.codigo_da_pessoa IS 'Campo onde informa o código da pessoa ligada a oferta, é a FK desta tabela.';
COMMENT ON COLUMN public.ofertas.semestre IS 'Campo onde informa o semestre desejado.';
COMMENT ON COLUMN public.ofertas.quantidade_minima_alunos IS 'Campo onde informa a quantidade minima de alunos na disciplina.';
COMMENT ON COLUMN public.ofertas.quantidade_maxima_alunos IS 'Campo onde informa a quantidade máxima de alunos na disciplina.';


CREATE TABLE public.graduacao (
                codigo_da_pessoa VARCHAR(50) NOT NULL,
                codigo_da_graduacao VARCHAR(50) NOT NULL,
                CONSTRAINT graduacao_pk PRIMARY KEY (codigo_da_pessoa, codigo_da_graduacao)
);
COMMENT ON TABLE public.graduacao IS 'Tabela relacionada aos cursos de graduação e os alunos que se encontram neste requisito.';
COMMENT ON COLUMN public.graduacao.codigo_da_pessoa IS 'Código da pessoa que esta matriculada em algum curso de graduação.';


CREATE TABLE public.volumes (
                codigo_da_obra VARCHAR(50) NOT NULL,
                codigo_do_volume VARCHAR(50) NOT NULL,
                edicao VARCHAR(50),
                ano_de_publicacao VARCHAR(50),
                CONSTRAINT volumes_pk PRIMARY KEY (codigo_da_obra, codigo_do_volume)
);
COMMENT ON TABLE public.volumes IS 'Tabela que armazena cada exemplar de um livro.';
COMMENT ON COLUMN public.volumes.codigo_da_obra IS 'códido da obra é a PK desta tabela e a FK da tabela obras. Tabela armazena os códigos dos títulos dos livros.';
COMMENT ON COLUMN public.volumes.codigo_do_volume IS 'códido do volume é a PK desta tabela e a FK da tabela obras.
Tabela que armazena a quantidade dos volumes.';


CREATE TABLE public.emprestimos (
                data_do_inicio_do_emprestimo DATE NOT NULL,
                codigo_da_obra VARCHAR(50) NOT NULL,
                codigo_do_volume VARCHAR(50) NOT NULL,
                codigo_da_pessoa VARCHAR(50) NOT NULL,
                data_do_fim_do_emprestimo DATE NOT NULL,
                data_devolucao DATE NOT NULL,
                CONSTRAINT emprestimos_pk PRIMARY KEY (data_do_inicio_do_emprestimo, codigo_da_obra, codigo_do_volume, codigo_da_pessoa)
);
COMMENT ON TABLE public.emprestimos IS 'Tabela onde armazena todos os emprestimos dos livros.';
COMMENT ON COLUMN public.emprestimos.data_do_inicio_do_emprestimo IS 'Data onde informa a data do inicio do emprestimo, é a PK desta tabela.';
COMMENT ON COLUMN public.emprestimos.codigo_da_obra IS 'Campo onde informa o código da obra, é a PK desta tabela e a PK da tabela volumes.';
COMMENT ON COLUMN public.emprestimos.codigo_do_volume IS 'Campo onde informa o código do volume, é a PK desta tabela e a PK da tabela volumes.';
COMMENT ON COLUMN public.emprestimos.data_do_fim_do_emprestimo IS 'Data onde informa o fim do imprestimo.';


CREATE TABLE public.curso (
                codigo_do_curso VARCHAR(50) NOT NULL,
                nome VARCHAR(50) NOT NULL,
                data_de_inicio DATE NOT NULL,
                CONSTRAINT curso_pk PRIMARY KEY (codigo_do_curso)
);
COMMENT ON TABLE public.curso IS 'Tabela onde armazena todos os cursos.';
COMMENT ON COLUMN public.curso.codigo_do_curso IS 'Campo onde informa o código dos cursos, é a PK desta tabela.';
COMMENT ON COLUMN public.curso.nome IS 'Campo onde informa o nome dos cursos.';
COMMENT ON COLUMN public.curso.data_de_inicio IS 'Campo onde informa a data inicio de cada curso.';


CREATE TABLE public.curso_aluno (
                codigo_da_pessoa VARCHAR(50) NOT NULL,
                codigo_do_curso VARCHAR(50) NOT NULL,
                CONSTRAINT curso_aluno__pk PRIMARY KEY (codigo_da_pessoa, codigo_do_curso)
);
COMMENT ON TABLE public.curso_aluno IS 'Tabela onde se encontra a relação cursos e alunos.';
COMMENT ON COLUMN public.curso_aluno.codigo_da_pessoa IS 'Campo informa o código da pessoa que esta direcionada ao determinado curso, é a PK desta tabela e a PK da tabela alunos.';
COMMENT ON COLUMN public.curso_aluno.codigo_do_curso IS 'Campo informa o código do curso que o aluno esta direcionado, é a PK desta tabela e a PK da tabela cursos.';


CREATE TABLE public.compoe (
                codigo_da_disciplina VARCHAR(50) NOT NULL,
                codigo_do_curso VARCHAR(50) NOT NULL,
                CONSTRAINT compoe_pk PRIMARY KEY (codigo_da_disciplina, codigo_do_curso)
);
COMMENT ON TABLE public.compoe IS 'Tabela onde relaciona os cursos e disciplinas.';
COMMENT ON COLUMN public.compoe.codigo_da_disciplina IS 'Campo código da disciplina é a PK desta tabela e a PK da tabela disciplinas.';
COMMENT ON COLUMN public.compoe.codigo_do_curso IS 'Campo código do curso é a PK desta tabela e a PK da tabela cursos.';


CREATE TABLE public.envolvem (
                codigo_da_oferta VARCHAR(50) NOT NULL,
                codigo_da_disciplina VARCHAR(50) NOT NULL,
                CONSTRAINT envolvem_pk PRIMARY KEY (codigo_da_oferta, codigo_da_disciplina)
);
COMMENT ON TABLE public.envolvem IS 'Tabela onde armazena o código da oferta e o código da disciplina.';
COMMENT ON COLUMN public.envolvem.codigo_da_oferta IS 'Campo código da oferta é a PK desta tabela e a PK da tabela disciplinas.';
COMMENT ON COLUMN public.envolvem.codigo_da_disciplina IS 'Campo código da disciplina é a PK desta tabela e a PK da tabela disciplinas.';


CREATE TABLE public.reservas (
                codigo_da_obra VARCHAR(50) NOT NULL,
                codigo_da_pessoa VARCHAR(50) NOT NULL,
                data_de_inicio_da_reserva DATE NOT NULL,
                codigo_do_volume VARCHAR(50) NOT NULL,
                data_de_fim_da_reserva DATE NOT NULL,
                CONSTRAINT reservas_pk PRIMARY KEY (codigo_da_obra, codigo_da_pessoa, data_de_inicio_da_reserva, codigo_do_volume)
);
COMMENT ON TABLE public.reservas IS 'Tabela onde armazena a reserva dos livros.';
COMMENT ON COLUMN public.reservas.codigo_da_obra IS 'Campo onde armazena o código da obra. É a PK desta tabela e a PK da tabela obras.';
COMMENT ON COLUMN public.reservas.codigo_da_pessoa IS 'Campo onde armazena o cóodigo de da pessoa que esta reservando o livro, é a PK desta tabela.';
COMMENT ON COLUMN public.reservas.data_de_inicio_da_reserva IS 'Data de inicio da reserva dos livros.';
COMMENT ON COLUMN public.reservas.codigo_do_volume IS 'Campo onde informa o volume de livros, é a PK desta tabela e a PK da tabela volumes.';
COMMENT ON COLUMN public.reservas.data_de_fim_da_reserva IS 'Data onde informa o fim da reserva.';


ALTER TABLE public.disciplinas ADD CONSTRAINT obras_disciplinas_fk
FOREIGN KEY (codigo_da_obra)
REFERENCES public.OBRAS (codigo_da_obra)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.autor ADD CONSTRAINT obras_autor_fk
FOREIGN KEY (codigo_da_obra)
REFERENCES public.OBRAS (codigo_da_obra)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.tipo ADD CONSTRAINT obras_tipo_fk
FOREIGN KEY (codigo_da_obra)
REFERENCES public.OBRAS (codigo_da_obra)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.volumes ADD CONSTRAINT obras_volumes_fk
FOREIGN KEY (codigo_da_obra)
REFERENCES public.OBRAS (codigo_da_obra)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.envolvem ADD CONSTRAINT disciplinas_envolvem_fk
FOREIGN KEY (codigo_da_disciplina)
REFERENCES public.disciplinas (codigo_da_disciplina)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.compoe ADD CONSTRAINT disciplinas_compoe_fk
FOREIGN KEY (codigo_da_disciplina)
REFERENCES public.disciplinas (codigo_da_disciplina)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.curso_aluno ADD CONSTRAINT alunos_cursos_alunos__fk
FOREIGN KEY (codigo_da_pessoa)
REFERENCES public.alunos (codigo_da_pessoa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pessoas ADD CONSTRAINT alunos_pessoas_fk
FOREIGN KEY (codigo_da_pessoa)
REFERENCES public.alunos (codigo_da_pessoa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.graduacao ADD CONSTRAINT professores_graduacao_fk
FOREIGN KEY (codigo_da_pessoa)
REFERENCES public.professores (codigo_da_pessoa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ofertas ADD CONSTRAINT professores_ofertas_fk
FOREIGN KEY (codigo_da_pessoa)
REFERENCES public.professores (codigo_da_pessoa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pos_graduacao ADD CONSTRAINT professores_pos_graduacao_fk
FOREIGN KEY (codigo_da_pessoa)
REFERENCES public.professores (codigo_da_pessoa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pessoas ADD CONSTRAINT professores_pessoas_fk
FOREIGN KEY (codigo_da_pessoa)
REFERENCES public.professores (codigo_da_pessoa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.telefone_pessoa ADD CONSTRAINT pessoas_telefone_pessoa_fk
FOREIGN KEY (codigo_da_pessoa)
REFERENCES public.pessoas (codigo_da_pessoa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.reservas ADD CONSTRAINT pessoas_reservas_fk
FOREIGN KEY (codigo_da_pessoa)
REFERENCES public.pessoas (codigo_da_pessoa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.emprestimos ADD CONSTRAINT pessoas_emprestimos_fk
FOREIGN KEY (codigo_da_pessoa)
REFERENCES public.pessoas (codigo_da_pessoa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Endereco ADD CONSTRAINT pessoas_endereco_fk
FOREIGN KEY (codigo_da_pessoa)
REFERENCES public.pessoas (codigo_da_pessoa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.envolvem ADD CONSTRAINT ofertas_envolvem_fk
FOREIGN KEY (codigo_da_oferta)
REFERENCES public.ofertas (codigo_da_oferta)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.emprestimos ADD CONSTRAINT volumes_emprestimos_fk
FOREIGN KEY (codigo_da_obra, codigo_do_volume)
REFERENCES public.volumes (codigo_da_obra, codigo_do_volume)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.reservas ADD CONSTRAINT volumes_reservas_fk
FOREIGN KEY (codigo_da_obra, codigo_do_volume)
REFERENCES public.volumes (codigo_da_obra, codigo_do_volume)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.compoe ADD CONSTRAINT cursos_compoe_fk
FOREIGN KEY (codigo_do_curso)
REFERENCES public.curso (codigo_do_curso)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.curso_aluno ADD CONSTRAINT cursos_cursos_alunos__fk
FOREIGN KEY (codigo_do_curso)
REFERENCES public.curso (codigo_do_curso)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;