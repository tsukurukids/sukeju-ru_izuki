        function addTask() {
            const timeVal = document.getElementById('task-time').value;
            const titleVal = document.getElementById('task-title').value;
            
            // スケジュールが15個以上にならないようにチェックする魔法だよ！
            if (tasks.length >= 15) {
                alert("スケジュールは1日に15個までだよ。どれか消してから追加してね！");
                return; // 15個以上なら、ここでストップして追加しないよ
            }

            if (timeVal && titleVal) {
                tasks.push({ time: timeVal, title: titleVal, notified: false });
                tasks.sort((a, b) => a.time.localeCompare(b.time));
                saveTasks();
                renderSchedule();
                
                // 入力したあと、文字を消してスッキリさせるよ
                document.getElementById('task-title').value = '';
            }
        }
