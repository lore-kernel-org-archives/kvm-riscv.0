From: Ackerley Tng <ackerleytng@google.com>
Date: Mon, 07 Aug 2023 23:20:15 +0000
Subject: [RFC PATCH v11 28/29] KVM: selftests: Add basic selftest for guest_memfd()
In-Reply-To: <20230718234512.1690985-29-seanjc@google.com> (message from Sean
 Christopherson on Tue, 18 Jul 2023 16:45:11 -0700)
Message-ID: <diqzo7ji30eo.fsf@ackerleytng-ctop.c.googlers.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Sean Christopherson <seanjc@google.com> writes:

> Add a selftest to verify the basic functionality of guest_memfd():
>
> + file descriptor created with the guest_memfd() ioctl does not allow
>   read/write/mmap operations
> + file size and block size as returned from fstat are as expected
> + fallocate on the fd checks that offset/length on
>   fallocate(FALLOC_FL_PUNCH_HOLE) should be page aligned
>

> <snip>

> +
> +static void test_fallocate(int fd, size_t page_size, size_t total_size)
> +{
> +	int ret;
> +
> +	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE, 0, total_size);
> +	TEST_ASSERT(!ret, "fallocate with aligned offset and size should succeed");
> +
> +	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE,
> +			page_size - 1, page_size);
> +	TEST_ASSERT(ret, "fallocate with unaligned offset should fail");
> +
> +	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE, total_size, page_size);
> +	TEST_ASSERT(ret, "fallocate beginning at total_size should fail");
> +
> +	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE, total_size + page_size, page_size);
> +	TEST_ASSERT(ret, "fallocate beginning at total_size should fail");

This should be

TEST_ASSERT(ret, "fallocate beginning after total_size should fail");

> +
> +	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE,
> +			total_size, page_size);
> +	TEST_ASSERT(!ret, "fallocate(PUNCH_HOLE) at total_size should succeed");
> +
> +	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE,
> +			total_size + page_size, page_size);
> +	TEST_ASSERT(!ret, "fallocate(PUNCH_HOLE) after total_size should succeed");
> +
> +	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE,
> +			page_size, page_size - 1);
> +	TEST_ASSERT(ret, "fallocate with unaligned size should fail");
> +
> +	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE,
> +			page_size, page_size);
> +	TEST_ASSERT(!ret, "fallocate(PUNCH_HOLE) with aligned offset and size should succeed");
> +
> +	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE, page_size, page_size);
> +	TEST_ASSERT(!ret, "fallocate to restore punched hole should succeed");
> +}

> <snip>

