package com.example.demo.service;

import com.example.demo.model.Task;
import org.springframework.stereotype.Service;

import java.util.List;

public interface TaskService {
    Task createTask(Task task);

    List<Task> getAllTasks();

    void update(Task task);

    void getTaskById(Long id);

    void deleteTaskById(Long id);

}
