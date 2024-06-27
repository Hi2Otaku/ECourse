/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import java.util.*;
import Models.*;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.sql.*;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

/**
 *
 * @author hi2ot
 */
public class UserDAO {

    private List<User> ul;
    private Connection con;
    private String status = "OK";
    public static UserDAO INS = new UserDAO();

    public List<User> getUl() {
        return ul;
    }

    public void setUl(List<User> ul) {
        this.ul = ul;
    }

    private UserDAO() {
        if (INS == null) {
            try {
                con = new DBContext().getConnection();
            } catch (Exception e) {
                status = "Error at Connection" + e.getMessage();
            }
        } else {
            INS = this;
        }
    }

    public void load() {
        String sql = "Select * From [User]";
        ul = new Vector<User>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int UserID = rs.getInt("UserID");
                String UserName = rs.getString("UserName");
                String salt = rs.getString("salt");
                String Password = rs.getString("Password");
                String Mail = rs.getString("Mail");
                String FullName = rs.getString("FullName");
                java.sql.Date DoB = rs.getDate("DoB");
                int SecurityQuestionID = rs.getInt("SecurityQuestionID");
                String Answer = rs.getString("Answer");
                int Role = rs.getInt("Role");
                ul.add(new User(UserID, UserName, salt, Password, Mail, FullName, DoB, SecurityQuestionID, Answer, Role));
            }
        } catch (SQLException e) {
            status = "Error at load User" + e.getMessage();
        }
    }

    public Vector<Course> loadUserOwnCourse(int UserID) {
        String sql = "Select c.CourseID, c.CourseName, c.Price, c.Description, c.CreateDate, c. From [OwnCourse] oc Join [Course] c On oc.CourseID = c.CourseID Where oc.UserID = ?";
        Vector<Course> course = new Vector<Course>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, UserID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int CourseID = rs.getInt("CourseID");
                String CourseName = rs.getString("CourseName");
                float Price = rs.getFloat("Price");
                String Description = rs.getString("Description");
                java.sql.Date CreateDate = rs.getDate("CreateDate");
                UserID = rs.getInt("UserID");
                course.add(new Course(CourseID, CourseName, Price, Description, CreateDate, UserID));
            }
        } catch (SQLException e) {
            status = "Error at loadUserOwnCourse " + e.getMessage();
        }
        return course;
    }

    public int checkOwnCourse(int UserID, int CourseID) {
        String sql = "Select * From [OwnCourse] Where UserID = ? And CourseID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, UserID);
            ps.setInt(2, CourseID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return 1;
            }
        } catch (SQLException e) {
            status = "Error at checkOwnCourse " + e.getMessage();
        }
        return 0;
    }

    public Vector<Attempt> loadUserQuizAttempt(int UserID, int CourseID, int LessonID, int QuizID) {
        String sql = "Select * From [Attempt] Where UserID = ? And CourseID = ? And LessonID = ? And QuizID = ?";
        Vector<Attempt> list = new Vector<Attempt>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, UserID);
            ps.setInt(2, CourseID);
            ps.setInt(3, LessonID);
            ps.setInt(4, QuizID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int AttemptID = rs.getInt("AttemptID");
                java.sql.Timestamp AttemptDate = rs.getTimestamp("AttemptDate");
                java.sql.Timestamp SubmittedDate = rs.getTimestamp("SubmittedDate");
                int Finished = rs.getInt("Finished");
                list.add(new Attempt(UserID, CourseID, LessonID, QuizID, AttemptID, AttemptDate, SubmittedDate, Finished));
            }
        } catch (SQLException e) {
            status = "Error at loadUserQuizAttempt " + e.getMessage();
        }
        return list;
    }

    public Attempt createNewUserQuizAttempt(int UserID, int CourseID, int LessonID, int QuizID) {
        String sql = "Insert Into [Attempt] Values (?,?,?,?,?,?,?,?)";
        Vector<Attempt> list = loadUserQuizAttempt(UserID, CourseID, LessonID, QuizID);
        java.util.Date date = new java.util.Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.SECOND, QuizDAO.INS.getQuizTimeLimt(CourseID, LessonID, QuizID));
        java.sql.Timestamp tmp = new java.sql.Timestamp(date.getTime());
        java.util.Date date2 = calendar.getTime();
        java.sql.Timestamp tmp2 = new java.sql.Timestamp(date2.getTime());
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, UserID);
            ps.setInt(2, CourseID);
            ps.setInt(3, LessonID);
            ps.setInt(4, QuizID);
            ps.setInt(5, list.size() + 1);
            ps.setTimestamp(6, tmp);
            ps.setTimestamp(7, tmp2);
            ps.setInt(8, 0);
            ps.execute();
        } catch (SQLException e) {
            status = "Error at createUserQuizAttempt " + e.getMessage();
        }
        return new Attempt(UserID, CourseID, LessonID, QuizID, list.size() + 1, tmp, tmp2, 0);
    }

    public Vector<Question> createNewQuestionList(int UserID, int CourseID, int LessonID, int QuizID, int AttemptID) {
        String sql = "Select * From [Question] Where CourseID = ? And LessonID = ? And QuizID = ?";
        Vector<Question> QuestionList = new Vector<Question>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, CourseID);
            ps.setInt(2, LessonID);
            ps.setInt(3, QuizID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int QuestionID = rs.getInt("QuestionID");
                String Question = rs.getString("Question");
                String Explaination = rs.getString("Explaination");
                QuestionList.add(new Question(CourseID, LessonID, QuizID, QuestionID, Question, Explaination));
            }
        } catch (SQLException e) {
            status = "Error at createNewQuestionList " + e.getMessage();
        }
        for (Question x : QuestionList) {
            sql = "Insert Into [UserAnswer] Values (?,?,?,?,?,?,-1)";
            try {
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, UserID);
                ps.setInt(2, AttemptID);
                ps.setInt(3, CourseID);
                ps.setInt(4, LessonID);
                ps.setInt(5, QuizID);
                ps.setInt(6, x.getQuestionID());
                ps.execute();
            } catch (SQLException e) {
                status = "Error at addNewUserAnswer " + e.getMessage();
            }
        }
        return QuestionList;
    }

    public Vector<Question> getListQuestionOnAttempt(int UserID, int CourseID, int LessonID, int QuizID, int AttemptID) {
        String sql = "Select * From [UserAnswer] ua"
                + "\nWhere ua.UserID = ? and ua.CourseID = ? and ua.LessonID = ? and ua.QuizID = ? and ua.AttemptID = ?";
        List<Number> question = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, UserID);
            ps.setInt(2, CourseID);
            ps.setInt(3, LessonID);
            ps.setInt(4, QuizID);
            ps.setInt(5, AttemptID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int QuestionID = rs.getInt("QuestionID");
                question.add(QuestionID);
            }
        } catch (SQLException e) {
            status = "Error at getListQuestionOnAttempt " + e.getMessage();
        }

        sql = "Select * From [Question] Where QuestionID = ? And CourseID = ? And LessonID = ? And QuizID = ?";
        Vector<Question> QuestionList = new Vector<Question>();
        for (Number num : question) {
            int x = (int) num;
            try {
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, x);
                ps.setInt(2, CourseID);
                ps.setInt(3, LessonID);
                ps.setInt(4, QuizID);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    int QuestionID = rs.getInt("QuestionID");
                    String Question = rs.getString("Question");
                    String Explaination = rs.getString("Explaination");
                    QuestionList.add(new Question(CourseID, LessonID, QuizID, QuestionID, Question, Explaination));
                }
            } catch (SQLException e) {
                status = "Error at getListQuestionOnAttempt " + e.getMessage();
            }
        }
        return QuestionList;
    }

    public int getAttemptMark(int UserID, int CourseID, int LessonID, int QuizID, int AttemptID) {
        String sql = "Select * From [UserAnswer] ua"
                + "\nJoin [Answer] a On ua.CourseID = a.CourseID and ua.LessonID = a.LessonID and ua.QuizID = a.QuizID and ua.QuestionID = a.QuestionID And ua.AnswerID = a.AnswerID"
                + "\nWhere a.[Role] = 2 And ua.UserID = ? and ua.CourseID = ? and ua.LessonID = ? and ua.QuizID = ? and ua.AttemptID = ?";
        int cnt = 0;
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, UserID);
            ps.setInt(2, CourseID);
            ps.setInt(3, LessonID);
            ps.setInt(4, QuizID);
            ps.setInt(5, AttemptID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cnt++;
            }
        } catch (SQLException e) {
            status = "Error at getAttemptMark " + e.getMessage();
        }
        return cnt;
    }

    public void updateUserAnswer(int UserID, int AttemptID, int CourseID, int LessonID, int QuizID, int QuestionID, int AnswerID) {
        String sql = "Update [UserAnswer]"
                + "\nSet AnswerID = ?"
                + "\nWhere UserID = ? And AttemptID = ? And CourseID = ? And LessonID = ? And QuizID = ? And QuestionID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, AnswerID);
            ps.setInt(2, UserID);
            ps.setInt(3, AttemptID);
            ps.setInt(4, CourseID);
            ps.setInt(5, LessonID);
            ps.setInt(6, QuizID);
            ps.setInt(7, QuestionID);
            ps.execute();
        } catch (SQLException e) {
            status = "Error at updateUserAnswer " + e.getMessage();
        }
    }

    public User getUserByName(String UserName) {
        INS.load();
        for (User x : ul) {
            if (x.getUserName().equals(UserName)) {
                return x;
            }
        }
        return null;
    }

    public Attempt getNewestAttempt(int UserID, int CourseID, int LessonID, int QuizID) {
        String sql = "Select Top 1 * From [Attempt] Where UserID = ? And CourseID = ? And LessonID = ? And QuizID = ? Order By AttemptDate desc";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, UserID);
            ps.setInt(2, CourseID);
            ps.setInt(3, LessonID);
            ps.setInt(4, QuizID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int AttemptID = rs.getInt("AttemptID");
                java.sql.Timestamp AttemptDate = rs.getTimestamp("AttemptDate");
                java.sql.Timestamp SubmittedDate = rs.getTimestamp("SubmittedDate");
                int Finished = rs.getInt("Finished");
                return new Attempt(UserID, CourseID, LessonID, QuizID, AttemptID, AttemptDate, SubmittedDate, Finished);
            }
        } catch (SQLException e) {
            status = "Error at getNewestAttempt " + e.getMessage();
        }
        return null;
    }

    public void updateSubmittedTime(int UserID, int CourseID, int LessonID, int QuizID, int AttemptID, java.util.Date Time) {
        Attempt atm = INS.getNewestAttempt(UserID, CourseID, LessonID, QuizID);
        String sql = "Update [Attempt] Set SubmittedDate = ?, Finished = 1 Where UserID = ? And CourseID = ? And LessonID = ? And QuizID = ? And AttemptID = ?";
        java.sql.Timestamp tmp = new java.sql.Timestamp(Time.getTime());
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setTimestamp(1, tmp);
            ps.setInt(2, UserID);
            ps.setInt(3, CourseID);
            ps.setInt(4, LessonID);
            ps.setInt(5, QuizID);
            ps.setInt(6, AttemptID);
            ps.execute();
        } catch (SQLException e) {
            status = "Error at updateSubmittedTime " + e.getMessage();
        }

    }

    public String LoginCheck(String UserName, String Password) throws NoSuchAlgorithmException, InvalidKeySpecException {
        String sql = "Select * From [User] Where UserName = ?";
        String ssalt = "";
        String uPassword = "";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, UserName);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ssalt = rs.getString("salt");
                uPassword = rs.getString("Password");
            }
        } catch (Exception e) {
            status = "Error at loadSalt " + e.getMessage();
        }

        if (ssalt == null) {
            return "No Username Exist!";
        } else {
            Base64.Decoder dnc = Base64.getDecoder();
            byte[] salt = dnc.decode(ssalt);
            KeySpec spec = new PBEKeySpec(Password.toCharArray(), salt, 65536, 128);
            SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
            byte[] hash = factory.generateSecret(spec).getEncoded();
            Base64.Encoder enc = Base64.getEncoder();
            System.out.println(uPassword);
            System.out.println(enc.encodeToString(hash));
            if (!enc.encodeToString(hash).equals(uPassword)) {
                return "Wrong Password!";
            }
            return null;
        }
    }

    public void addUser(String username, String password, String salt, String mail, String fullname, String dob, int sq, String answer, int role) {
        INS.load();
        String sql = "Insert Into [User] Values(?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, INS.getUl().size() + 1);
            ps.setString(2, username);
            ps.setString(4, password);
            ps.setString(3, salt);
            ps.setString(5, mail);
            ps.setString(6, fullname);
            ps.setString(7, dob);
            ps.setInt(8, sq);
            ps.setString(9, answer);
            ps.setInt(10, role);
            ps.setInt(11, 1);
            ps.execute();
        } catch (SQLException e) {
            status = "Error at addUser " + e.getMessage();
        }
    }

    public ArrayList<Course> loadUserCart(int UserID) {
        ArrayList<Course> CourseList = new ArrayList<>();
        String sql = "Select ce.* From [Cart] c  Join Course ce On c.CourseID = ce.CourseID Where c.UserID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, UserID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int CourseID = rs.getInt("CourseID");
                String CourseName = rs.getString("CourseName");
                float Price = rs.getFloat("Price");
                String Description = rs.getString("Description");
                java.sql.Date CreateDate = rs.getDate("CreateDate");
                UserID = rs.getInt("UserID");
                CourseList.add(new Course(CourseID, CourseName, Price, Description, CreateDate, UserID));
            }

        } catch (SQLException e) {
            status = "Error at loadUserCart " + e.getMessage();
        }
        return CourseList;
    }

    public void deleteCartCourse(int UserID, int CourseID) {
        String sql = "Delete From [Cart] Where UserID = ? And CourseID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, UserID);
            ps.setInt(2, CourseID);
            ps.execute();
        } catch (SQLException e) {
            status = "Error at deleteCartCourse " + e.getMessage();
        }
    }

    public void addUserOwnCourse(int UserID, int CourseID, int OrderID) {
        INS.deleteCartCourse(UserID, CourseID);
        String sql = "Insert Into [OwnCourse] Values(?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, CourseID);
            ps.setInt(2, UserID);
            ps.setInt(3, OrderID);
            ps.execute();
        } catch (SQLException e) {
            status = "Error at addUserOwnCourse " + e.getMessage();
        }
    }

    public void addUserCart(int UserID, int CourseID) {
        String sql = "Insert Into [Cart] Values(?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, UserID);
            ps.setInt(2, CourseID);
            ps.execute();
        } catch (SQLException e) {
            status = "Error at addUserCart " + e.getMessage();
        }
    }
    
        public int checkIfCourseinCart(int UserID, int CourseID) {
        String sql = "Select * From [Cart] Where UserID = ? And CourseID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, UserID);
            ps.setInt(2, CourseID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return 1;
            }
        } catch (SQLException e) {
            status = "Error at checkIfCourseinCart " + e.getMessage();
        }
        return 0;
    }

    public static void main(String agrs[]) throws NoSuchAlgorithmException, InvalidKeySpecException {
        INS.addUser("hi2otaku", "GsOpy/dpdR4kwix0FSVDIA==", "SVkAglOUIb6osRs8zi5IOQ==", "hi2otaku@gmail.com", "PQH", "04/04/2004", 2, "Food", 4);
        System.out.println(INS.status);
    }
}
