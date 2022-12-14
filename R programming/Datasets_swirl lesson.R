#swirl Lesson 
library(swirl)
swirl()

  #Workspace and Files
list.files() #读取当前文件目录
dir()
args(list.files) #解释函数应该填什么
old.dir <- getwd() #更换工作目录时，记得把就目录保存
dir.create("testdir") #创建新目录
setwd("testdir") #设置新目录为工作目录
file.create("mytest.R") #创建文件
file.exists("mytest.R") #确定文件存在
file.info("mytest.R") #文件信息
file.rename("mytest.R","mytest2.R") #文件改名
file.copy("mytest2.R","mytest3.R") #文件复制
dir.create("testdir2", recursive = TRUE) #新建文件夹
dir.create(file.path("testdir2", "testdir3"), recursive = TRUE) #在指定文件夹新建文件夹

  #Sequences of Numbers
seq(1,20) #新建数列,默认整数
seq(1,10, by=0.5) #设置数列的区分值
my_seq <- seq(5,10, length = 30) #设定区间与长度，电脑算
seq_along(my_seq) #用上面设立的长度建立数列
rep(0, times = 40) #通过复制建立数列
rep(c(0, 1, 2), times = 10) #复制数列
rep(c(0, 1, 2), each = 10) #依次复制

  #Vectors
num_vect <- c(0.5, 55, -10, 6)
my_char <- c("My", "name", "is")
tf <- num_vect < 1 #记过为逻辑运算
A | B # logical 'or' 
A & B # logical 'and'
!A # A = false
paste(my_char, collapse = " ") #粘贴字符串， collapse是为了去除“”
paste("Hello","world!", sep = " ") #合并两个字符
paste(1:3, c("X", "Y", "Z"), sep = "") #合并两个数列
paste(LETTERS, 1:4, sep = "-") #通过-合并，并且一边不够的会进行循环

  #Missing Values
y <- rnorm(1000)
z <- rep(NA, 1000)
my_data <- sample(c(y, z), 100)
my_na <- is.na(my_data)
my_na
sum(my_na) # TURE=1 FALSE=0

  #Subsetting Vectors
x[1:10] #1-10
x[is.na(x)] #返回包含NA的值
y <- x[!is.na(x)] #返回没有NA的值，即去空值
y[y > 0] #返回大于0的值,NA 会在
x[!is.na(x) & x > 0] #前一半去NA，下一半加判断
x[c(3, 5, 7)] # x的第几位
x[c(-2, -10)] # -相当于减号，去掉第二个和第十个的所有
x[-c(2, 10)] #跟上面一样
vect <- c(foo = 11, bar = 2, norf = NA) #给命名，我觉得相当于表头
vect2 <- c(11, 2, NA)
names(vect2) <- c("foo", "bar", "norf") #给变量命名
vect["bar"]
  
  #Matrices and Data Frames
#you don't need the c() function when using `:`
my_vector <- 1:20
dim(my_vector) #就是几行几列
dim(my_vector) <- c(4, 5) #通过dim将vector转为matrix
class(my_vector)
matrix2 <- matrix(data = 1:20, nrow = 4, ncol =5) #新建矩阵
patients <- c("Bill", "Gina", "Kelly", "Sean")
cbind(patients, my_matrix) #合并列，前面的在前,但是会都变成字符
my_data <- data.frame(patients, my_matrix) #这个可以有多种class
class(my_data)
cnames <- c("patient", "age", "weight", "bp", "rating", "test")
colnames(my_data) <- cnames #加表头

  #Logic 
TRUE & c(TRUE, FALSE, FALSE) # return TRUE FALSE FALSE
TRUE && c(TRUE, FALSE, FALSE) #return TRUE
TRUE | c(TRUE, FALSE, FALSE) #return TRUE TRUE TRUE
TRUE || c(TRUE, FALSE, FALSE) # return TRUE
isTRUE(6 > 4) # return TRUE
identical('twins', 'twins') # return TRUE ;two R objects passed to it as arguments are identical
xor(5 == 6, !FALSE) #return TRUE ;one FALSE one TRUE
ints <- sample(10) #crate vector
which(ints > 7) # return 2  7 10 ; numbers
all(ints > 0) #return TRUE
any(ints < 0)  #return FALSE

  #Functions  
"%p%" <- function(left, right){ # example:'I' %p% 'love' %p% 'R!' > "I love R!"
  paste(left, right, sep = " ") 
}

evaluate <- function(func, dat){
    # Write your code here!
    # Remember: the last expression evaluated will be returned! 
    func(dat)
}
evaluate(function(x){c(x+4, x, x-4)}, 4) #rturn 8 4 0
evaluate(function(x){x[length(x)]}, c(8, 4, 0)) #return 0
evaluate(function(x){x[1]}, c(8, 4, 0)) #return 8

telegram <- function(...){
  paste("START", ..., "STOP")
}
telegram(1, 2, 3, 4) #return "START 1 2 3 4 STOP"

mad_libs <- function(...){
  # Do your argument unpacking here!
  args <- list(...)
  place <- args[["place"]]
  adjective <- args[["adjective"]]
  noun <- args[["noun"]]
  paste("News from", place, "today where", adjective, "students took to the streets in protest of the new", noun, "being installed on campus.")
} #text replace

mad_libs() #return "News from  today where  students took to the streets in protest of the new  being installed on campus."

#Dates and Times
d1 <- Sys.Date()
unclass(d1) #to see what d1 looks like internally
d2 <- as.Date("1969-01-01")
t1 <- Sys.time()
class(t1) #"POSIXct" "POSIXt" 
t2 <- as.POSIXlt(Sys.time()) # "2022-10-27 19:56:25 CST"
class(t2) #"POSIXlt" "POSIXt" 
t2$min # 56
t3  <- "October 17, 1986 08:24"
t4 <- strptime(t3, "%B %d, %Y %H:%M")
Sys.time() > t1 #TRUE
Sys.time() - t1 #Time difference of 7.400876 mins