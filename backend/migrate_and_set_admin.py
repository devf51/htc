"""
Migration: Add is_super_admin, update role enum, create upgrade_requests table,
and set 67219010003@htc.ac.th as super_admin
"""
import sys
sys.path.insert(0, '.')
from database import engine
from sqlalchemy import text

TARGET_EMAIL = "67219010003@htc.ac.th"

with engine.connect() as conn:
    # 1. Update role enum to include 'external'
    try:
        conn.execute(text(
            "ALTER TABLE users MODIFY COLUMN role ENUM('student','admin','external') DEFAULT 'student'"
        ))
        conn.commit()
        print("Updated role enum: student | admin | external")
    except Exception as e:
        print(f"role enum: {e}")

    # 2. Create upgrade_requests table
    try:
        conn.execute(text("""
            CREATE TABLE IF NOT EXISTS upgrade_requests (
                id INT AUTO_INCREMENT PRIMARY KEY,
                user_id INT NOT NULL,
                student_id VARCHAR(50),
                department VARCHAR(100),
                phone VARCHAR(20),
                reason TEXT,
                status ENUM('pending','approved','rejected') DEFAULT 'pending',
                created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                FOREIGN KEY (user_id) REFERENCES users(id)
            )
        """))
        conn.commit()
        print("upgrade_requests table ready")
    except Exception as e:
        print(f"upgrade_requests: {e}")

    # 3. Set target user as admin + super_admin
    result = conn.execute(text(
        "UPDATE users SET role='admin', is_super_admin=TRUE WHERE email=:email"
    ), {"email": TARGET_EMAIL})
    conn.commit()

    if result.rowcount > 0:
        print(f"Updated {result.rowcount} row(s) - {TARGET_EMAIL} is now Super Admin")
    else:
        print(f"User '{TARGET_EMAIL}' not found in DB - Login with Google first then run again")

    # 4. Verify
    row = conn.execute(text(
        "SELECT id, email, name, role, is_super_admin FROM users WHERE email=:email"
    ), {"email": TARGET_EMAIL}).fetchone()

    if row:
        print(f"Verified: id={row[0]}, email={row[1]}, name={row[2]}, role={row[3]}, is_super_admin={row[4]}")
    else:
        print(f"{TARGET_EMAIL} not in DB yet")

print("Done.")
