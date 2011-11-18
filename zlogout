# Kill any running ssh-agent.
if [ ! -z "$SSH_AGENT_PID" ]; then
    kill $SSH_AGENT_PID >& /dev/null
    unset SSH_AUTH_SOCK
    unset SSH_AGENT_PID
fi
