package com.example.demo.controller;

import com.example.demo.model.Task;
import com.example.demo.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;

import java.util.List;

@Controller
public class MainController {

    @Autowired
    private TaskService taskService;

    @RequestMapping(method = RequestMethod.GET,value = "/")
    public String index(Model model) {
        List<Task> tasks = taskService.getAllTasks();
        model.addAttribute("tasks", tasks);
        return "main";
    }
    @PostMapping("/addTask")
    public String addTask(@RequestParam("text") String text,Model model) {
        // Создаем объект Task и выполняем нужные операции
        Task newTask = new Task(text);
        taskService.createTask(newTask);
        List<Task> tasks = taskService.getAllTasks();
        model.addAttribute("tasks", tasks);
        return "redirect:/"; // Перенаправляем на другую страницу
    }
    @RequestMapping(method = RequestMethod.POST,value = "/deleteTask")
    public String deleteTask(@RequestParam("id") Long id) {
        taskService.deleteTaskById(id);
        return "redirect:/";
    }
}
