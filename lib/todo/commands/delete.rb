class Todo::Commands::Delete < Todo::Commands::Command
  HELP_MESSAGE = <<~TEXT.freeze
    Usage:
      todo delete <id>...
      todo delete -h | --help
    
    Options:
      -h --help  Show this message
  TEXT

  private attr_reader :arguments, :output, :error_output

  def run(repository:)
    if arguments.empty?
      error_output.puts(HELP_MESSAGE)
      exit 1
    end

    if arguments.first == "-h" || arguments.first == "--help"
      output.puts(HELP_MESSAGE)
      return
    end

    repository.delete(ids: arguments.map(&:to_i))

    todos = repository.list
    print_todos(todos, indent_width: 2)
  end
end
