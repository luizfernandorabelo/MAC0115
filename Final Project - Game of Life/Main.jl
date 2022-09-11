include("Constants.jl")
include("Grid.jl")
include("Menu.jl")


function main()
    
    while true

        print_functionalities_menu()
        functionality_option = readline()
        functionality_option = parse(Int64, functionality_option)

        if functionality_option == RUN_GAME
            run_game_option()
        elseif functionality_option == ABOUT_GAME
            about_game_option()
        elseif functionality_option == ABOUT_DEVELOPING
            about_developing_option()
        elseif functionality_option == QUIT_GAME
            run(`clear`);
            break
        else
            print("\nOpção inválida!")
            sleep(1)
        end

        println()

    end

end


main()
