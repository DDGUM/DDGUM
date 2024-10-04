document.addEventListener('DOMContentLoaded', () => {
    const studentForm = document.getElementById('student-form');
    const studentList = document.getElementById('student-list');
    let students = [];
    let currentId = 1;

    // Thêm sinh viên
    studentForm.addEventListener('submit', (e) => {
        e.preventDefault();
        const id = currentId++;
        const name = document.getElementById('student-name').value;
        const age = document.getElementById('student-age').value;
        const gender = document.getElementById('student-gender').value;
        const student = { id, name, age, gender };
        students.push(student);
        renderStudentList();
    });

    // Hiển thị danh sách sinh viên
    function renderStudentList() {
        studentList.innerHTML = '';
        students.forEach((student, index) => {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${index + 1}</td>
                <td>SV${student.id}</td>
                <td>${student.name}</td>
                <td>${student.age}</td>
                <td>${student.gender}</td>
                <td>
                    <button class="btn btn-warning btn-sm">Sửa</button>
                    <button class="btn btn-danger btn-sm">Xóa</button>
                </td>
            `;
            studentList.appendChild(row);
        });
    }
});
