#Melakukan import MySQL Connector
import mysql.connector

#Melakukan percobaan koneksi
conn = mysql.connector.connect(
    host="nama host",
    user="nama username",
    password="password",
    database="nama database"
)

#Membuat object cursor sebagai penanda
cursor = conn.cursor()

#Deklarasi SQL Query untuk memasukan record ke DB (KARYAWAN)
insert_sql = (
    "INSERT INTO employee (FIRST_NAME, LAST_NAME, AGE, SEX, INCOME) "
    "VALUES (%s, %s, %d, %s, %d)"
)

values = ("Almer", "Rashad", 22, "M", 10000)

try:
    #Eksekusi SQL Command
    cursor.execute(insert_sql, values)

    #Melakukan perubahan (commit) pada DB
    conn.commit()
except Exception as e:
    #Roll Back apabila ada issue
    conn.rollback()
    print("Error:", str(e))
finally:
    #Menutup Koneksi
    cursor.close()
    conn.close()
