include("Constants.jl")


function print_functionalities_menu()
    run(`clear`);
    println("+-----------------------------+")
    println("|       MENU DE OPÇÕES        |")
    println("+-----------------------------+")
    print("| (")
    print(RUN_GAME)
    println(") Executar jogo           |")
    print("| (")
    print(ABOUT_GAME)
    println(") Sobre o jogo            |")
    print("| (")
    print(ABOUT_DEVELOPING)
    println(") Sobre o desenvolvimento |")
    print("| (")
    print(QUIT_GAME)
    println(") Finalizar execução      |")
    println("+-----------------------------+")
    print("\nDigite sua opção: ")
end


function print_grid_menu()
    run(`clear`);
    println("+------------------------+")
    println("|      TIPO DE GRID      |")
    println("+------------------------+")
    print("| (")
    print(RANDOM_GRID)
    println(") Grid aleatório     |")
    print("| (")
    print(PULSAR_GRID)
    println(") Grid pulsante      |")
    print("| (")
    print(DECATHLON_GRID)
    println(") Grid decathlon     |")
    print("| (")
    print(CLOCK_GRID)
    println(") Grid relógio       |")
    print("| (")
    print(GALAXY_GRID)
    println(") Grid galáxia       |")
    print("| (")
    print(USER_GRID)
    println(") Grid personalizado |")
    println("+------------------------+")
    print("\nDigite o tipo de grid: ")
end


function select_grid()

    print_grid_menu()
    grid_type = parse(Int64, readline())

    if grid_type == RANDOM_GRID
        return create_random_grid(DEFAULT_GRID_HEIGHT, DEFAULT_GRID_WIDTH, DEFAULT_ALIVE_CELL_PROBABILITY)
    elseif grid_type == PULSAR_GRID
        return create_pulsar_grid()
    elseif grid_type == DECATHLON_GRID
        return create_decathlon_grid()
    elseif grid_type == CLOCK_GRID
        return create_clock_grid()
    elseif grid_type == GALAXY_GRID
        return create_galaxy_grid()
    elseif grid_type == USER_GRID
        return create_user_grid()
    end

    print("\nTipo de grid inválido!")
    sleep(1)
    return select_grid()
end


function run_game_option()

    grid = select_grid()

    quit_option = ""
    @async quit_option = readline()

    while quit_option != "q" && quit_option != "Q"
        print_grid(grid)
        print("\nDigite a letra 'q' para finalizar: ")
        sleep(DEFAULT_DELAY)
        grid = apply_rules(grid)
    end

end


function about_game_option()
    run(`clear`);
    println("+----------------------------------------------------------------------+")
    println("|                         SOBRE O JOGO DA VIDA                         |")
    println("+----------------------------------------------------------------------+")
    println("|    O jogo da vida é um autómato celular desenvolvido pelo matemático |")
    println("| britânico John Horton Conway em 1970. É o exemplo mais bem conhecido |")
    println("| de autômato celular. O jogo foi criado de modo a reproduzir, através |")
    println("| de regras simples, as alterações e mudanças em grupos de seres vivos |")
    println("| ,tendo aplicações em diversas áreas da ciência.  As regras definidas |")
    println("| são aplicadas a cada nova geração; assim, a partir de uma  imagem em |")
    println("| um  tabuleiro bi-dimensional definida pelo jogador,  são  percebidas |")
    println("| mudanças muitas vezes inesperadas e belas a cada nova geração, o que |")
    println("| variando de padrões fixos a caóticos.                                |")
    println("+----------------------------------------------------------------------+")
    println("                       fonte: https://pt.wikipedia.org/wiki/Jogo_da_vida\n")
    println("Digite ENTER para continuar")
    readline()
end


function about_developing_option()
    run(`clear`);
    println("+--------------------------------------------------+")
    println("|            SOBRE O DESENVOLVIMENTO               |")
    println("+--------------------------------------------------+")
    println("|  - Disciplina: MAC0115 Introdução a Computação   |")
    println("|  - Aluno:      Luiz Fernando Rabelo (11796893)   |")
    println("|  - Professor:  Alfredo Goldman                   |")
    println("|  - Monitor:    Eduardo Verone                    |")
    println("+--------------------------------------------------+\n")
    println("Digite ENTER para continuar")
    readline()
end
