### practice_3
### ptt_info_book

# ���ܼƸ�T
person.name <- c("Jiyuian", "Shawnroom", "Bigmoumou")
person.sex <- c("F", "M", "M")
person.id <- c("jiyuian520", "shawnn520", "moumou123")
person.days <- c(201, 37, 99)

# �ϥ�data.frame()�A�åH�W�z4�ӦV�q�إ�person.df
person.df = data.frame(person.name, person.sex, person.id, person.days)
  
# �ϥ�str()�d��person.df���c
str(person.df)  
  
# �ϥ�summary()�d��person.df summary
summary(person.df)  

# Turn Factor into characters(person.name & person.id)
person.df$person.name = as.character(person.df$person.name)
person.df$person.id = as.character(person.df$person.id)

# �L�Xperson.df
person.df  
  
# �L�Xperson.df�Ĥ@�C
person.df[1, ]

# �L�Xperson.df�ĤG�C�ĤT��
person.df[2, 3]

# �d��person.df��person.id���(�ϥ�$)
person.df$person.id

# �ϥ�order()�Nperson.df$person.days�Ƨǫ�, �إ�days.position
days.postion = order(person.df$person.days)
  
# �ϥ�days.postion, �Ƨ�person.df(save as different dataframe)
person.df.1 = person.df[days.postion, ]

# �ϥ�grepl()�A��Xperson.df$person.id����520�믫��
spirit.520 = grepl("520", person.df.1$person.id)

# �z��X520�a�ڪ�����
person.df.1[spirit.520, ]

# Use grep to find person.id with "520" and print them out
person.df.1[grep("520", person.df.1$person.id), ]