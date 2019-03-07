pragma solidity ^0.5.0;

contract TodoList {
  uint public taskCount = 0;
  event TaskCreated(
  uint id,
  string content,
  bool completed
  );
  event TaskCompleted(
  uint id,
  bool completed
  );
  struct Task{
  uint id;
  string content;
  bool completed;
  }
  mapping(uint=>Task) public tasks;

  constructor() public  {
  createTask("Buy Food");
  }
  function createTask(string memory _content) public{
  taskCount++;
  tasks[taskCount]=Task(taskCount,_content,false);
  emit TaskCreated(taskCount,_content,false);
  }
  function toggleCompleted(uint _id) public{
  Task memory _task=tasks[_id];	//_task is the variable of type Task(struct)
  _task.completed=!_task.completed;	//toggle state
  tasks[_id]=_task;	//struct _task is the new struct on that id
  emit TaskCompleted(_id,_task.completed);
  }
}
