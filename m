From: Sean Christopherson <seanjc@google.com>
Date: Wed, 8 May 2024 06:47:03 -0700
Subject: [PATCH v2 0/5] Define _GNU_SOURCE for sources using
In-Reply-To: <20240507214254.2787305-1-edliaw@google.com>
References: <20240507214254.2787305-1-edliaw@google.com>
Message-ID: <ZjuA3aY_iHkjP7bQ@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, May 07, 2024, Edward Liaw wrote:
> 809216233555 ("selftests/harness: remove use of LINE_MAX") introduced
> asprintf into kselftest_harness.h, which is a GNU extension and needs
> _GNU_SOURCE to either be defined prior to including headers or with the
> -D_GNU_SOURCE flag passed to the compiler.
> 
> v1: https://lore.kernel.org/linux-kselftest/20240430235057.1351993-1-edliaw at google.com/
> v2: add -D_GNU_SOURCE to KHDR_INCLUDES so that it is in a single
> location.  Remove #define _GNU_SOURCE from source code to resolve
> redefinition warnings.
> 
> Edward Liaw (5):
>   selftests: Compile kselftest headers with -D_GNU_SOURCE
>   selftests/sgx: Include KHDR_INCLUDES in Makefile
>   selftests: Include KHDR_INCLUDES in Makefile
>   selftests: Drop define _GNU_SOURCE
>   selftests: Drop duplicate -D_GNU_SOURCE

Can you rebase this on top of linux-next?  I have a conflicting fix[*] for the
KVM selftests queued for 6.10, and I would prefer not to drop that commit at
this stage as it would require a rebase of a pile of other commits.

And I doubt KVM is the only subsystem that has a targeted fix for the _GNU_SOURCE
mess.

If we want/need to get a fix into 6.9, then IMO we should just revert 809216233555
("selftests/harness: remove use of LINE_MAX"), as that came in quite late in the
6.9 cycle, and I don't think it's feasible to be 100% confident that globally
defining _GNU_SOURCE works for all selftests, i.e. we really should have a full
cycle for folks to test.

[*] https://github.com/kvm-x86/linux/commit/730cfa45b5f4

