class Commander
  def robot
    @robot ||= Robot.new
  end

  def commands
    {
      place: 3,
      move: 0,
      left: 0,
      right: 0,
      report: 0
    }
  end

  def help
    commands.inject("Commands:") { |acc, (command, arrity)| acc << "\n - #{command.upcase} with #{arrity} arguments" }
  end

  def execute command, args = []
    command = command.to_s.downcase.to_sym
    length = commands[command]

    if length == args.length
      robot.public_send(command, *args)
    end
  end
end
