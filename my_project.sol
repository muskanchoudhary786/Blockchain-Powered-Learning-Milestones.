// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LearningMilestones {
    // Structure to represent a student
    struct Student {
        uint id;
        string name;
        uint[] milestones;
    }

    // Mapping from student ID to student details
    mapping(uint => Student) public students;
    uint public studentCount;

    // Event to be emitted when a new student is added
    event StudentAdded(uint id, string name);

    // Event to be emitted when a milestone is achieved
    event MilestoneAchieved(uint id, uint milestone);

    // Function to add a new student
    function addStudent(string memory _name) public {
        studentCount++;
        students[studentCount] = Student(studentCount, _name, new uint[](0));
        emit StudentAdded(studentCount, _name);
    }

    // Function to add a milestone to a student's record
    function addMilestone(uint _studentId, uint _milestone) public {
        require(_studentId > 0 && _studentId <= studentCount, "Invalid student ID");
        students[_studentId].milestones.push(_milestone);
        emit MilestoneAchieved(_studentId, _milestone);
    }

    // Function to get milestones of a student
    function getMilestones(uint _studentId) public view returns (uint[] memory) {
        require(_studentId > 0 && _studentId <= studentCount, "Invalid student ID");
        return students[_studentId].milestones;
    }
}
