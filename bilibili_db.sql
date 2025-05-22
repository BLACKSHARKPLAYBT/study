
CREATE TABLE `article`  (
  `a_id` int NOT NULL,
  `a_title` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `a_content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `a_cover` char(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`a_id`) USING BTREE,
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;


CREATE TABLE `collection`  (
  `c_order` int NOT NULL,
  `uid` int NOT NULL,
  `c_name` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `c_cover` char(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `c_desc` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `c_right` int NOT NULL,
  PRIMARY KEY (`uid`) USING BTREE,
  CONSTRAINT `collection_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;


CREATE TABLE `comments`  (
  `c_id` int NOT NULL,
  `c_content` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `c_pub` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `c_date` date NULL DEFAULT NULL,
  `c_uid` int NOT NULL,
  `c_reply` int NULL DEFAULT NULL,
  PRIMARY KEY (`c_id`, `c_uid`) USING BTREE,
  INDEX `c_uid`(`c_uid` ASC) USING BTREE,
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`c_uid`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;


CREATE TABLE `dan`  (
  `b_id_v` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `b_id_s` int NOT NULL,
  `d_time` char(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `d_type` int NOT NULL,
  `d_content` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`b_id_v`, `b_id_s`) USING BTREE,
  INDEX `b_id_s`(`b_id_s` ASC) USING BTREE,
  CONSTRAINT `dan_ibfk_1` FOREIGN KEY (`b_id_v`) REFERENCES `video` (`BV`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `dan_ibfk_2` FOREIGN KEY (`b_id_s`) REFERENCES `stream` (`Room_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;


CREATE TABLE `following`  (
  `F_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Description` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `F_ammount` int NOT NULL DEFAULT 0,
  `uid` int NOT NULL,
  INDEX `F_Userid`(`uid` ASC) USING BTREE,
  INDEX `F_UserNAME`(`F_name` ASC) USING BTREE,
  CONSTRAINT `F_Userid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `F_UserNAME` FOREIGN KEY (`F_name`) REFERENCES `user` (`c_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;


CREATE TABLE `history_vid`  (
  `h_id` int NOT NULL,
  `h_bv` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `h_date` date NOT NULL,
  PRIMARY KEY (`h_id`, `h_bv`) USING BTREE,
  INDEX `h_bv`(`h_bv` ASC) USING BTREE,
  CONSTRAINT `history_vid_ibfk_1` FOREIGN KEY (`h_id`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `history_vid_ibfk_2` FOREIGN KEY (`h_bv`) REFERENCES `video` (`BV`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;


CREATE TABLE `stream`  (
  `uid` int NOT NULL,
  `Room_id` int NOT NULL,
  `Online_amount` int NULL DEFAULT 0,
  `Sector` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Ranks` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`, `Room_id`) USING BTREE,
  UNIQUE INDEX `UQ_Room_ID`(`Room_id` ASC) USING BTREE,
  CONSTRAINT `Stream_User_uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;


CREATE TABLE `user`  (
  `uid` int NOT NULL,
  `c_name` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `c_time` date NOT NULL,
  `level` int NOT NULL,
  `member` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `c_avatar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `live` int NOT NULL,
  `followed` int NOT NULL,
  `follower` int NOT NULL,
  `collection` int NOT NULL,
  PRIMARY KEY (`uid`, `live`, `followed`, `follower`, `collection`, `c_avatar`, `c_name`) USING BTREE,
  UNIQUE INDEX `uc_user_cname`(`c_name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;


CREATE TABLE `video`  (
  `uid` int NOT NULL,
  `definition` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Play_count` int NOT NULL DEFAULT 0,
  `publish_time` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sector` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `BV` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `SanLian_count` int NULL DEFAULT 0,
  `Description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Label` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Comments` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`BV`) USING BTREE,
  INDEX `user_uid`(`uid` ASC) USING BTREE,
  CONSTRAINT `user_uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;


CREATE TABLE `watch_later`  (
  `w_order` int NOT NULL,
  `w_id` int NOT NULL,
  `w_bv` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`w_id`, `w_bv`) USING BTREE,
  INDEX `w_bv`(`w_bv` ASC) USING BTREE,
  CONSTRAINT `watch_later_ibfk_1` FOREIGN KEY (`w_id`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `watch_later_ibfk_2` FOREIGN KEY (`w_bv`) REFERENCES `video` (`BV`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;
