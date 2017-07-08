class Commander
  def robot
    @robot ||= Robot.new
  end

  def commands
    {
      place: 3,
      move: 0,
      left: 0,
      right: 0
    }
  end

  def help
    commands.inject("Commands:") { |acc, (command, arrity)| acc << "\n - #{command.upcase} with #{arrity} arguments" }
  end

  def execute command, args = []
    if length = commands[command]
      if !robot.placed? && command != :place
        return 'Place the robot first'
      end
      robot.public_send(command, *args.first(length))
      'OK'
    else
      "Invalid command\n\n#{help}"
    end
  end
end
