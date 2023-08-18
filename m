From: Sean Christopherson <seanjc@google.com>
Date: Fri, 18 Aug 2023 16:01:26 -0700
Subject: [RFC PATCH v11 28/29] KVM: selftests: Add basic selftest for guest_memfd()
In-Reply-To: <diqzleem306p.fsf@ackerleytng-ctop.c.googlers.com>
References: <20230718234512.1690985-29-seanjc@google.com> <diqzleem306p.fsf@ackerleytng-ctop.c.googlers.com>
Message-ID: <ZN/4RjDsBLf0FB98@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Aug 07, 2023, Ackerley Tng wrote:
> Sean Christopherson <seanjc@google.com> writes:
> 
> > Add a selftest to verify the basic functionality of guest_memfd():
> >
> > <snip>
> 
> Here's one more test:

First off, thank you!  I greatly appreciate all the selftests work you (and
others!) have been doing.

For v2, can you please post a standalone patch?  My workflow barfs on unrelated,
inlined patches.  I'm guessing I can get b4 to play nice, but it's easier to just
yell at people :-)

> >From 72dc6836f01bdd613d64d4c6a4f2af8f2b777ba2 Mon Sep 17 00:00:00 2001
> From: Ackerley Tng <ackerleytng@google.com>
> Date: Tue, 1 Aug 2023 18:02:50 +0000
> Subject: [PATCH] KVM: selftests: Add tests - invalid inputs for
>  KVM_CREATE_GUEST_MEMFD
> 
> Test that invalid inputs for KVM_CREATE_GUEST_MEMFD, such as
> non-page-aligned page size and invalid flags, are rejected by the
> KVM_CREATE_GUEST_MEMFD with EINVAL
> 
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> ---
>  tools/testing/selftests/kvm/guest_memfd_test.c  | 17 +++++++++++++++++
>  .../selftests/kvm/include/kvm_util_base.h       | 11 +++++++++--
>  2 files changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
> index eb93c608a7e0..ad20f11b2d2c 100644
> --- a/tools/testing/selftests/kvm/guest_memfd_test.c
> +++ b/tools/testing/selftests/kvm/guest_memfd_test.c
> @@ -90,6 +90,21 @@ static void test_fallocate(int fd, size_t page_size, size_t total_size)
>  	TEST_ASSERT(!ret, "fallocate to restore punched hole should succeed");
>  }
>  
> +static void test_create_guest_memfd_invalid(struct kvm_vm *vm, size_t page_size)
> +{
> +	int fd;
> +
> +	/* Non-page-aligned page_size */

Instead of adding a comment, use the message from TEST_ASSERT() to communicate
that information to the reader *and* to anyone that encounters failures.

> +	fd = __vm_create_guest_memfd(vm, 1, 0);

ioctls() are fast.  Rather than hardcode one value, iterate over a range of
values, e.g.

	for (size = 0; size < page_size; size++) {
		r = __vm_create_guest_memfd(vm, size, 0);
		TEST_ASSERT(r && errno == EINVAL,
			    "Informative error message...);
	}
		
> +	ASSERT_EQ(errno, EINVAL);
> +
> +	/* Invalid flags */
> +	fd = __vm_create_guest_memfd(vm, page_size, 99);
> +	ASSERT_EQ(fd, -1);
> +	ASSERT_EQ(errno, EINVAL);

And then same thing here.  Then you can use the legal flags to determine what is
and isn't valid, instead of using a completely arbitrary magic number.

