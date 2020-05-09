package repository

import "github.com/naoty/todo/todo"

// Repository represents an interface to get and set TODOs.
type Repository interface {
	Get(id int) (*todo.Todo, error)
	List() ([]*todo.Todo, error)
	Add(title string) error
	Update(td *todo.Todo) error
	Open(id int) error
	Move(id, position int) error
}
