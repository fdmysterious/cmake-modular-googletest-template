#include <gtest/gtest.h>
#include <boo/boo.h>

TEST(BOO_HelloTest, BasicAssertions) {
	struct MyStruct st;
	boo_mystruct_init(&st);

	EXPECT_EQ(st.a, 24);
	EXPECT_EQ(st.b, 38);
}
